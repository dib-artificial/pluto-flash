import 'dart:ui';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:typed_data';

class BluetoothScreen extends StatefulWidget {
  const BluetoothScreen({super.key});

  @override
  State<BluetoothScreen> createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  static const _chatHistoryKey = 'pluto_chat_history';
  static const _projectUrl = 'https://github.com/dib-artificial/pluto-flash/';

  String _translatedResult = "";
  bool _isLoading = false;
  bool _isAwaitingResponse = false;
  final List<_ChatMessage> _chatMessages = [];

  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  BluetoothConnection? connection;
  String _receivedData = "";
  final TextEditingController _textController = TextEditingController();
  StreamSubscription? _inputSubscription;

  bool get isConnected => connection != null && connection!.isConnected;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _loadChatHistory();

    FlutterBluetoothSerial.instance.state.then((state) {
      if (mounted) setState(() => _bluetoothState = state);
    });

    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      if (mounted) setState(() => _bluetoothState = state);
    });
  }

  Future<void> _requestPermissions() async {
    final statuses = await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.locationWhenInUse,
    ].request();

    if (!mounted) return;

    if (statuses[Permission.bluetoothScan]!.isDenied ||
        statuses[Permission.bluetoothConnect]!.isDenied) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Need Bluetooth Permission")),
        );
      }
    }
  }

  void _showDeviceList() async {
    try {
      final devices = await FlutterBluetoothSerial.instance.getBondedDevices();
      if (!mounted) return;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Your BT Device"),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  final device = devices[index];
                  return ListTile(
                    title: Text(device.name ?? "Unknown"),
                    subtitle: Text(device.address),
                    onTap: () {
                      Navigator.pop(context);
                      _connectToDevice(device);
                    },
                  );
                },
              ),
            ),
          );
        },
      );
    } catch (e) {
      print("Error getting bonded devices: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Connect Error : $e")),
        );
      }
    }
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    try {
      final conn = await BluetoothConnection.toAddress(device.address);

      if (!mounted) {
        conn.dispose();
        return;
      }

      // old connection clean
      connection?.dispose();
      _inputSubscription?.cancel();

      connection = conn;
      setState(() {});

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Connect → ${device.name ?? 'Device'}")),
        );
      }

      _inputSubscription = conn.input!.listen(
        (Uint8List data) {
          if (!mounted || connection == null) return;
          try {
            final received = utf8.decode(data, allowMalformed: true).trim();
            var shouldSaveHistory = false;
            setState(() {
              _receivedData = received;
              if (received.isNotEmpty) {
                final pendingIndex = _chatMessages.lastIndexWhere(
                  (message) => !message.isUser && message.isPending,
                );
                if (pendingIndex >= 0) {
                  _chatMessages[pendingIndex].text = _receivedData;
                  _chatMessages[pendingIndex].isPending = false;
                } else {
                  _chatMessages.add(
                    _ChatMessage(text: _receivedData, isUser: false),
                  );
                }
                _receivedData = "";
                _isAwaitingResponse = false;
                shouldSaveHistory = true;
              }
            });
            if (shouldSaveHistory) unawaited(_saveChatHistory());
          } catch (e) {
            print("Decode error: $e");
          }
        },
        onError: (error) {
          print("Input stream error: $error");
          _handleDisconnection();
        },
        onDone: () {
          print("Input stream done (connection closed)");
          _handleDisconnection();
        },
        cancelOnError: false,
      );
    } catch (e) {
      print("Connection failed: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Connection fail: $e")),
        );
      }
    }
  }

  void _handleDisconnection() {
    if (!mounted) return;

    connection?.dispose();
    connection = null;
    _inputSubscription?.cancel();
    _inputSubscription = null;

    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Connection fail")),
    );
  }

  Future<void> _sendData(String text) async {
    final conn = connection;
    if (conn == null || !conn.isConnected) {
      print("No active connection");
      if (mounted) {
        setState(() {
          _isAwaitingResponse = false;
          if (_chatMessages.isNotEmpty && _chatMessages.last.isPending) {
            _chatMessages.last
              ..text = "Bluetooth is not connected."
              ..isPending = false;
          }
        });
        unawaited(_saveChatHistory());
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No BT Connection")),
        );
      }
      return;
    }

    try {
      final message = "$text\r\n";
      final bytes = utf8.encode(message);

      conn.output.add(Uint8List.fromList(bytes));
      await conn.output.allSent;

      print("Sent successfully: $message");

      if (mounted) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("Send Data: $text")),
        // );
      }
    } catch (e, stack) {
      print("Send failed: $e\n$stack");
      if (mounted) {
        setState(() {
          _isAwaitingResponse = false;
          if (_chatMessages.isNotEmpty && _chatMessages.last.isPending) {
            _chatMessages.last
              ..text = "Failed to send message."
              ..isPending = false;
          }
        });
        unawaited(_saveChatHistory());
      }
      _handleDisconnection();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Fail: $e")),
        );
      }
    }
  }

  Future<void> _loadChatHistory() async {
    final preferences = await SharedPreferences.getInstance();
    final savedHistory = preferences.getString(_chatHistoryKey);
    if (savedHistory == null) return;

    try {
      final decoded = jsonDecode(savedHistory) as List<dynamic>;
      final messages = decoded
          .map((item) => _ChatMessage.fromJson(item as Map<String, dynamic>))
          .toList();
      var hadPendingMessage = false;
      for (final message in messages) {
        if (message.isPending) {
          message
            ..text = 'No response received.'
            ..isPending = false;
          hadPendingMessage = true;
        }
      }

      if (!mounted) return;
      setState(() => _chatMessages.addAll(messages));
      if (hadPendingMessage) unawaited(_saveChatHistory());
    } catch (error) {
      debugPrint('Could not load chat history: $error');
    }
  }

  Future<void> _saveChatHistory() async {
    final preferences = await SharedPreferences.getInstance();
    final encoded = jsonEncode(
      _chatMessages.map((message) => message.toJson()).toList(),
    );
    await preferences.setString(_chatHistoryKey, encoded);
  }

  Future<void> _confirmDeleteChatHistory() async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete chat history?'),
        content: const Text('This will permanently delete saved messages.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (shouldDelete != true) return;

    setState(() {
      _chatMessages.clear();
      _isAwaitingResponse = false;
    });
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_chatHistoryKey);
  }

  void _showSettingsDialog() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Settings'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Manage your chat history and project link.',
              style: TextStyle(fontSize: 13, color: Color(0xFF69716C)),
            ),
            const SizedBox(height: 12),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.delete_outline),
              title: const Text('Delete chat history'),
              onTap: () {
                Navigator.pop(dialogContext);
                _confirmDeleteChatHistory();
              },
            ),
            const Divider(height: 1),
            const SizedBox(height: 8),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    _projectUrl,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                IconButton(
                  tooltip: 'Copy link',
                  icon: const Icon(Icons.copy),
                  onPressed: () async {
                    await Clipboard.setData(
                      const ClipboardData(text: _projectUrl),
                    );
                    if (dialogContext.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Link copied')),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _inputSubscription?.cancel();
    connection?.dispose();
    _textController.dispose();
    super.dispose();
  }

  // সরাসরি গুগল ট্রান্সলেট লিংক ব্যবহার করে ফাংশন
  Future<void> _translateTextWithoutLibrary(String text) async {
    if (text.trim().isEmpty) return;

    setState(() {
      _isLoading = true;
      _translatedResult = "";
    });

    try {
      // গুগলের ফ্রি ট্রান্সলেট এন্ডপয়েন্ট লিংক
      final url = Uri.parse(
        'https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=en&dt=t&q=${Uri.encodeComponent(text)}',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        // গুগল ট্রান্সলেটের রেসপন্স একটি নেস্টেড লিস্ট (JSON) আকারে আসে
        final data = jsonDecode(response.body);

        // অনুবাদের মূল টেক্সট প্রথম এরে-এর ভেতরে থাকে
        String translatedText = "";
        for (var item in data[0]) {
          translatedText += item[0];
        }

        setState(() {
          _translatedResult = translatedText;
          print("Translated Result: $_translatedResult");
          _isAwaitingResponse = true;
          _chatMessages.add(
            _ChatMessage(text: _translatedResult, isUser: true),
          );
          _chatMessages.add(
            _ChatMessage(
              text: 'MCU Now Working (Pluto)...',
              isUser: false,
              isPending: true,
            ),
          );
        });
        await _saveChatHistory();
        _sendData(_translatedResult); // Send the translated text via Bluetooth
      } else {
        setState(() {
          _translatedResult = "Failed to connect to server.";
          _isAwaitingResponse = false;
          if (_chatMessages.isNotEmpty && _chatMessages.last.isPending) {
            _chatMessages.last
              ..text = _translatedResult
              ..isPending = false;
          }
        });
        unawaited(_saveChatHistory());
      }
    } catch (e) {
      setState(() {
        _translatedResult = "Error: $e";
        _isAwaitingResponse = false;
        if (_chatMessages.isNotEmpty && _chatMessages.last.isPending) {
          _chatMessages.last
            ..text = _translatedResult
            ..isPending = false;
        }
      });
      unawaited(_saveChatHistory());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F5),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                  itemCount: _chatMessages.length,
                  itemBuilder: (context, index) {
                    final message =
                        _chatMessages[_chatMessages.length - 1 - index];
                    return Align(
                      alignment: message.isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width * 0.78,
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: message.isUser
                              ? const Color(0xFF285C4D)
                              : Colors.white,
                          border: message.isUser
                              ? null
                              : Border.all(color: const Color(0xFFD4D8D4)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              message.text,
                              style: TextStyle(
                                color: message.isUser
                                    ? Colors.white
                                    : const Color(0xFF252A27),
                              ),
                            ),
                            if (!message.isUser && !message.isPending) ...[
                              const SizedBox(height: 6),
                              const Text(
                                'Pluto TinyML AI',
                                style: TextStyle(
                                  color: Color(0xFF7A827D),
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 8, 8, 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFD4D8D4)),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x12000000),
                          blurRadius: 12,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _textController,
                          minLines: 1,
                          maxLines: 6,
                          keyboardType: TextInputType.multiline,
                          textCapitalization: TextCapitalization.sentences,
                          inputFormatters: [_WordLimitFormatter(200)],
                          decoration: const InputDecoration(
                            hintText: 'Tell Pluto to get to work...',
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                          ),
                          onChanged: (String? value) {
                            print('Name field changed: $value');
                          },
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _showSettingsDialog();
                              },
                              tooltip: 'Settings',
                              icon: const Icon(Icons.settings_outlined),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF4D5A52),
                                side: const BorderSide(
                                  color: Color(0xFF4D5A52),
                                  width: 0.5,
                                ),
                                fixedSize: const Size(42, 42),
                                shape: const CircleBorder(),
                              ),
                            ),
                            const Spacer(),
                            IconButton.filled(
                              onPressed: _isLoading || _isAwaitingResponse
                                  ? null
                                  : () {
                                      String text = _textController.text.trim();
                                      if (text.isEmpty) return;
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        _receivedData = "";
                                      });
                                      _translateTextWithoutLibrary(text);
                                      _textController.clear();
                                    },
                              tooltip: 'Send',
                              icon: const Icon(Icons.arrow_upward),
                              style: IconButton.styleFrom(
                                backgroundColor: const Color(0xFF285C4D),
                                foregroundColor: Colors.white,
                                fixedSize: const Size(42, 42),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 12,
            child: SafeArea(
              bottom: false,
              child: OutlinedButton.icon(
                onPressed: _showDeviceList,
                icon: Icon(
                  isConnected
                      ? Icons.bluetooth_connected
                      : Icons.bluetooth_disabled,
                  size: 18,
                ),
                label: Text(isConnected ? 'Connected' : 'Disconnected'),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: isConnected
                      ? const Color(0xFF26734D)
                      : const Color(0xFF343A36),
                  side: const BorderSide(color: Colors.black, width: 1),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WordLimitFormatter extends TextInputFormatter {
  _WordLimitFormatter(this.maxWords);

  final int maxWords;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.trim();
    final wordCount = text.isEmpty ? 0 : text.split(RegExp(r'\s+')).length;
    return wordCount <= maxWords ? newValue : oldValue;
  }
}

class _ChatMessage {
  _ChatMessage({
    required this.text,
    required this.isUser,
    this.isPending = false,
  });

  String text;
  final bool isUser;
  bool isPending;

  factory _ChatMessage.fromJson(Map<String, dynamic> json) {
    return _ChatMessage(
      text: json['text'] as String,
      isUser: json['isUser'] as bool,
      isPending: json['isPending'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'text': text,
        'isUser': isUser,
        'isPending': isPending,
      };
}
