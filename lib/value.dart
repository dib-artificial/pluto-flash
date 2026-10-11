//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   isConnected ? Icons.bluetooth_connected : Icons.bluetooth_disabled,
//                   color: isConnected ? Colors.green : Colors.red,
//                   size: 26,
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   isConnected ? "Connected" : "Disconnected",
//                   style: TextStyle(
//                     color: isConnected ? Colors.green : Colors.red,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
            
//             const SizedBox(height: 20),
        
//             InkWell(
//               onTap: () {
//                 _showDeviceList();
//               },
//               child: Container(
//                 padding: EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(10)
//                 ),
//                 child: Text(
//                   'Connect BT',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18
//                   ),
//                 ),
//               ),
//             ),
            
//             SizedBox(height: 30),
        
//             Text(
//                 "BT-DATA: "+_receivedData,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600
//                 ),
//               ),

//               SizedBox(height: 30),
//               InkWell(
//               onTap: () {
//                 _sendData("LED OFF");
//               },
//               child: Container(
//                 padding: EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(10)
//                 ),
//                 child: Text(
//                   'LED OFF',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             InkWell(
//               onTap: () {
//                 _sendData("LED ON");
//               },
//               child: Container(
//                 padding: EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.circular(10)
//                 ),
//                 child: Text(
//                   'LED ON',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18
//                   ),
//                 ),
//               ),
//             ),
        
            
//           ],
//         ),
//       ),
//     );
//   }
// }