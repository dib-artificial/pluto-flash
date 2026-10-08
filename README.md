# Pluto — A Natural Language Model Designed Toward General Intelligence

<p align="center">
  <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjfFumYblOJGu4pKNwpMDNlA4oIBKXIH7s5IsITul3uC08ZWFP1CgTSKPVpA40JpGc9WXhCiOsp5zpe7cmJrldSbJW-8k8zahRKjiTzcErRowrgG32LbL1sQZVcBA6eInDKg8REafIteX_tka9otnZCZ469k4XK2rGNxhhFtzcWsaUYjDbpb-AqbUBH63M/s1600/PLUTO_LOGO.jpg" width="180">
</p>

<p align="center">
  <strong>Pluto — Talk to your hardware instead of programming it.</strong>
</p>

---

## What is Pluto?

[![Pluto Demo](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiW3KlIfi_Hhf8eYrGOzF6er0ST4rB214ZeWKomQER4jtvd0Z9VI4qR_i6fprcAkuSyj1S9OpzT44TnY0i49wtsDRgqGCN63u0iDd1AQyeJ9_4nN0ymLYeS0nWAKW7U2RuMP22NmA-uy_InK8iv5rORhmT2A0IZjoIRok-2Hi444K8-LgEnlU6LwpNqUmU/s1600/pluto_ai_th.jpg)](https://www.youtube.com/watch?v=TATQVDR8HoY)


**Pluto is a Natural Language system designed to run directly inside microcontrollers (MCUs) and control the hardware from within the chip itself — without requiring traditional programming for every new task.**

Pluto is designed to operate with an extremely small memory footprint and can run effectively with approximately **0.5 MB of RAM**.

## Supported Hardware

Pluto currently supports the following MCU and embedded platforms:

- **Arduino Mega**
- **ESP32**
- **Raspberry Pi**
- **STM32**

Pluto is designed to be adaptable across different microcontroller and embedded hardware architectures, allowing the same natural-language control concept to be applied across multiple platforms.

## Hardware Control & Understanding

Pluto is designed to interpret natural-language instructions and translate them into structured operations for embedded hardware.

It can understand and control:

- **GPIO** — Digital HIGH / LOW input and output
- **PWM** — Variable duty-cycle control for LEDs, motors, and other devices
- **I²C** — Communication with sensors, displays, memory, and peripheral devices
- **SPI** — High-speed communication with compatible peripherals
- **UART / Serial** — Serial communication with external devices
- **Servo** — Position control and movement sequences
- **Analog I/O** — Reading analog sensors and generating hardware responses
- **Timers / Frequency** — Hardware timing, pulse and frequency generation
- **Sensors** — Processing sensor data and using it in conditional decisions
- **FRAM / Persistent Memory** — Storing states, instructions, and persistent data

## Pluto as an Embedded Intelligence

Pluto can be integrated directly into a microcontroller as an independent intelligence layer, allowing the device to interpret instructions and make hardware-level decisions locally.

For example, a drone could use Pluto to interpret high-level commands and coordinate sensors, motors, and other onboard hardware without relying on a cloud connection.

**Natural Language → Intelligence → Decision → Hardware**

## How Pluto Works

Pluto is designed to allow users to control hardware through natural-language instructions instead of writing traditional firmware code.

The user describes what they want to do, and Pluto interprets the instruction, organizes the required operations, and executes them through the connected MCU and hardware.

### Example: — Gyroscope + Servo Motor

Suppose a gyroscope sensor is connected to the **SDA/SCL** pins, and a servo motor is connected to **Pin 15**.

The user can simply tell Pluto:

> "I connected a gyroscope sensor to your SDA and SCL pins, and a servo motor to Pin 15. Keep the servo balanced at 0 degrees."

Pluto interprets the instruction and performs the required hardware operations.

```text
User:
"I connected a gyroscope sensor to SDA/SCL and a servo motor
to Pin 15. Keep the servo balanced at 0 degrees."

        ↓

Pluto Understanding

        ↓

I²C → Gyroscope
Pin 15 → Servo Motor

        ↓

Read Gyroscope
        ↓
Process Orientation
        ↓
Calculate Required Servo Position
        ↓
Control Servo

```

## PLUTO is a revolutionary architecture designed to operate directly on MCUs, enabling intelligent, real-time control of hardware at the embedded level. Unlike conventional systems that rely on pattern matching, Pluto is designed to emulate the structure of human thought, transforming natural language into structured reasoning and actionable instructions. This makes Pluto more than an embedded control architecture; it represents a direct step toward bringing AGI-inspired reasoning into the world of edge devices and autonomous machines.

<p align="center">
  <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgc22GwoFwX21ftEeICQQ_NbWpzSJqTC8JPP5En7U0uA7X-3mACbanXQZtXvKMWXABr4v843Yuzo_aScsAtZP4HkfUn3sWMavipawIpC7PQ9M4Cowoi5oapfhk_gBnPi7LN3G2eGzEsTICGWH0e1R3a8IQRUg6Voupl0yMonK26p0Zh0fQnXi2ORzx8JyM/s1600/block_d.png">
</p>

> ### 📌 About Pluto Pricing & Distribution**
>
> Pluto is not distributed as a conventional software download.
>
> Pluto is a **C++-based embedded intelligence framework** whose core architecture has been developed through several years of independent research and development. Because the core architecture is proprietary, we do not publicly release the complete internal implementation.
>
> ### Why is Pluto provided as hardware?
>
> If you want to use the current Pluto model, we provide a **pre-configured ESP-based board with the Pluto framework installed**.
>
> After purchase, we prepare the hardware, install the Pluto framework, and ship the device directly to your provided address.
>
> The listed price includes the costs associated with:
>
> * Hardware
> * Pluto framework installation and configuration
> * Development and preparation
> * Packaging and international shipping
> * Applicable taxes and related costs
>
> We are currently an **independently funded research project without external investors**. Revenue from Pluto purchases helps fund continued research, development, hardware testing, and future versions of the architecture.
>
> **Customers who purchase Pluto will receive future model/framework updates for their purchased version at no additional software licensing cost**, subject to hardware compatibility.
>
> By purchasing Pluto, you are not simply purchasing an ESP board. You are supporting an independent research project and receiving a pre-configured hardware implementation of the current Pluto architecture.


## Get Pluto

Pluto is available as a **physical hardware product**.

<p align="center">
  <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjyxPSXvv19HQfH4xyJ9JFE16Ci-HXgehL5g4-K5FGMS2iv__etasNIq81SyBKWIrnjWhtvE_1ASC1cQb9WFxLCYa9hZRUkIb34Zg24R0MrT9qPsNWVGCgxAwzRQ42u_5VY31nI_vhr22Ry-1ZKoBDCFVrpK0Oikks0C1u8CQ6Da9MY80yOjeJ-AijkKfA/s1600/pluto_product.jpg">
</p>

### Pluto 0.1

**$450 USD**

[**Buy Pluto 0.1 →**](https://nazdev.gumroad.com/l/pluto_0_1)
---

### Pluto 0.3

**$799 USD**

[**Buy Pluto 0.3 →**](https://nazdev.gumroad.com/l/pluto_0_3)
---

Its core purpose is simple:

> **Instead of programming the microcontroller, communicate with it using natural language.**

Pluto is designed to be adaptable across a wide range of MCU architectures. The system can interpret natural-language instructions and convert them into structured hardware operations that the microcontroller can execute.

### Long-Term Memory

For persistent data storage, Pluto can work with an external **32 KB non-volatile FRAM** connected through I²C:

**MB85RC256V I²C Non-Volatile FRAM**

This memory can be used to retain user-defined tasks, instructions, states, and other persistent information even when the MCU is powered off.

### No Third-Party AI APIs

Pluto is designed to operate **without relying on third-party AI APIs or external cloud AI services**.

The goal is to keep the core intelligence and hardware-control process directly on the embedded system.

### Beyond Pattern Matching

Pluto is not designed around conventional keyword or simple pattern-matching approaches.

Instead, Pluto is being developed around a structured **natural-language understanding and reasoning approach**, inspired by how humans interpret instructions, understand relationships between actions, and organize tasks before execution.

This makes Pluto more than a simple command parser.

We see Pluto as an **early exploration toward AGI-like intelligence at the edge** — bringing natural-language understanding, task organization, and hardware control directly into embedded systems.

---
# Pluto Hardware Benchmark v1.0

> **A benchmark for natural-language hardware control on resource-constrained microcontrollers.**

Pluto is designed to translate natural-language commands into structured instructions and execute them directly on supported MCU hardware.

```text
Natural Language
       ↓
Pluto
       ↓
Understanding
       ↓
Structured Instruction
       ↓
Hardware Function
       ↓
Physical Execution
```

---

# Benchmark Coverage

Pluto Benchmark v1.0 evaluates **10 core hardware capabilities**:

|  # | Capability               | Coverage                               |
| -: | ------------------------ | -------------------------------------- |
| 01 | GPIO                     | Digital HIGH / LOW Input & Output      |
| 02 | PWM                      | Variable Duty-Cycle Control            |
| 03 | I²C                      | Peripheral Communication               |
| 04 | SPI                      | High-Speed Peripheral Communication    |
| 05 | UART / Serial            | External Device Communication          |
| 06 | Analog I/O               | Analog Reading & Hardware Response     |
| 07 | Timers / Frequency       | Timing, Pulse & Frequency Generation   |
| 08 | FRAM / Persistent Memory | Persistent State & Instruction Storage |
| 09 | Conditional Logic        | Hardware Decisions & Control Flow      |
| 10 | Multi-Operation Control  | Sequential Hardware Operations         |

> **Servo and sensor-specific benchmarks are intentionally excluded from this version.**

---

# 01 — GPIO

### Digital HIGH / LOW Input and Output

GPIO is the foundation of MCU hardware control.

Pluto supports natural-language commands for digital hardware operations.

### Output

```text
"Set pin 9 HIGH."

"Set pin 9 LOW."

"Turn on the LED connected to pin 13."

"Turn off pin 13."
```

### Input

```text
"Read pin 5."

"Check whether pin 5 is HIGH."

"If pin 5 is HIGH, turn pin 9 HIGH."
```

### Benchmark

| Test                | Commands |   Target |
| ------------------- | -------: | -------: |
| Digital Output HIGH |       10 |     100% |
| Digital Output LOW  |       10 |     100% |
| Digital Input       |       10 |     100% |
| Conditional GPIO    |       10 |     100% |
| **Total**           |   **40** | **100%** |

### Example

```text
Input:
"Turn pin 9 HIGH."

Expected:
GPIO9 = HIGH

Result:
PASS
```

---

# 02 — PWM

### Variable Duty-Cycle Control

PWM allows Pluto to control the power delivered to LEDs, motors and other compatible devices.

### Example Commands

```text
"Set pin 9 PWM to 25%."

"Set pin 9 PWM to 50%."

"Set pin 9 PWM to 75%."

"Set pin 9 PWM to 100%."

"Set pin 9 PWM to 128."
```

### Benchmark

| Test            | Commands |
| --------------- | -------: |
| 0% Duty Cycle   |        5 |
| 25% Duty Cycle  |        5 |
| 50% Duty Cycle  |        5 |
| 75% Duty Cycle  |        5 |
| 100% Duty Cycle |        5 |
| Variable PWM    |       10 |
| **Total**       |   **35** |

### Expected

```text
0%   → 0
25%  → ~64
50%  → ~128
75%  → ~191
100% → 255
```

---

# 03 — I²C

### Communication With Peripheral Devices

Pluto can control supported I²C hardware such as:

* Sensors
* Displays
* Memory
* Expanders
* Other I²C peripherals

### Example Commands

```text
"Scan the I²C bus."

"Read the device at address 0x50."

"Write value 128 to the I²C device."

"Read data from the I²C memory."
```

### Benchmark

| Test              | Commands |
| ----------------- | -------: |
| Device Detection  |       10 |
| Address Selection |       10 |
| Read              |       10 |
| Write             |       10 |
| Read + Write      |       10 |
| **Total**         |   **50** |

### Benchmark Target

```text
I²C Command Accuracy: 100%
I²C Read/Write Execution: 100%
```

---

# 04 — SPI

### High-Speed Peripheral Communication

SPI provides high-speed communication with compatible peripherals.

Pluto benchmark coverage includes:

* Chip Select
* Clock
* Data transmission
* Data reception
* Read/write operations

### Example Commands

```text
"Enable SPI."

"Select the SPI device."

"Send 0x55 over SPI."

"Read data from the SPI device."

"Send 10 bytes over SPI."
```

### Benchmark

| Test               | Commands |
| ------------------ | -------: |
| SPI Initialization |        5 |
| Chip Select        |        5 |
| Data Write         |       10 |
| Data Read          |       10 |
| Multiple Bytes     |       10 |
| **Total**          |   **40** |

---

# 05 — UART / Serial

### Serial Communication With External Devices

Pluto can operate with UART/Serial-connected hardware.

### Example Commands

```text
"Set serial baud rate to 115200."

"Send HELLO over serial."

"Read the serial data."

"Send 10 bytes over UART."
```

### Benchmark

| Test                | Commands |
| ------------------- | -------: |
| UART Initialization |        5 |
| Baud Rate           |        5 |
| Transmit            |       10 |
| Receive             |       10 |
| TX + RX             |       10 |
| **Total**           |   **40** |

### Example

```text
Command:
"Send HELLO over UART."

Expected:
HELLO

Result:
PASS
```

---

# 06 — Analog I/O

### Analog Reading and Hardware Response

Pluto can process analog values and use them for hardware decisions.

### Example Commands

```text
"Read analog pin A0."

"Read the value from A0."

"If A0 is greater than 500, turn pin 9 HIGH."

"If A0 is below 300, turn pin 9 LOW."
```

### Benchmark

| Test                      | Commands |
| ------------------------- | -------: |
| Analog Read               |       10 |
| Threshold Detection       |       10 |
| Analog → Digital Response |       10 |
| Multiple Conditions       |       10 |
| **Total**                 |   **40** |

### Example

```text
Analog Input:
A0 = 720

Condition:
A0 > 500

Action:
GPIO9 = HIGH

Result:
PASS
```

---

# 07 — Timers / Frequency

### Hardware Timing, Pulse and Frequency Generation

Pluto can control timing-related hardware operations.

### Example Commands

```text
"Generate 1 kHz on pin 9."

"Generate 10 kHz on pin 9 for 5 seconds."

"Generate a 1 ms pulse."

"Generate 5 pulses."

"Stop the frequency output."
```

### Benchmark

| Test                 | Commands |
| -------------------- | -------: |
| Pulse Generation     |       10 |
| Frequency Generation |       10 |
| Frequency Duration   |       10 |
| Pulse Count          |       10 |
| Start / Stop         |       10 |
| **Total**            |   **50** |

### Frequency Accuracy

The requested frequency should be compared against measured output.

```text
Requested:
10,000 Hz

Measured:
XXXX Hz

Error:
XX%
```

### Formula

```text
Frequency Error =
|Measured - Requested| / Requested × 100
```

---

# 08 — FRAM / Persistent Memory

### Persistent State, Instruction and Data Storage

Pluto can use external FRAM for persistent information.

Benchmark coverage:

* Byte write
* Byte read
* Sequential write
* Sequential read
* Task storage
* State storage
* Data recovery after restart

### Example Commands

```text
"Write 128 to FRAM address 5500."

"Read FRAM address 5500."

"Store this value in persistent memory."

"Save this instruction."

"Read the stored instruction."
```

### Benchmark

| Test                | Commands |
| ------------------- | -------: |
| Byte Write          |       10 |
| Byte Read           |       10 |
| Sequential Write    |       10 |
| Sequential Read     |       10 |
| State Storage       |       10 |
| Instruction Storage |       10 |
| Restart Recovery    |       10 |
| **Total**           |   **70** |

### Persistence Test

```text
Write
  ↓
Power / MCU Restart
  ↓
Initialize Pluto
  ↓
Read FRAM
  ↓
Recover Data
```

Expected:

```text
Stored Data = Recovered Data
```

---

# 09 — Conditional Logic

Pluto can combine hardware inputs with logical decisions.

### Example

```text
"If pin 5 is HIGH, turn pin 9 HIGH."

"If pin 5 is LOW, turn pin 9 LOW."

"If A0 is greater than 500, turn pin 9 HIGH."

"If A0 is below 300, turn pin 9 LOW."
```

### Benchmark

| Test                | Commands |
| ------------------- | -------: |
| Digital Condition   |       10 |
| Analog Condition    |       10 |
| Multiple Conditions |       10 |
| Nested Decision     |       10 |
| **Total**           |   **40** |

---

# 10 — Multi-Operation Control

Pluto can execute commands containing multiple hardware operations.

### Example

```text
"Set pin 9 HIGH, wait 1 second,
then set pin 9 LOW."
```

Expected sequence:

```text
1. GPIO9 → HIGH
2. Wait → 1 second
3. GPIO9 → LOW
```

Another example:

```text
"Read A0. If the value is above 500,
turn pin 9 HIGH and send the value over UART."
```

Expected:

```text
Analog Read
     ↓
Condition
     ↓
GPIO
     ↓
UART
```

### Benchmark

| Test                 | Commands |
| -------------------- | -------: |
| 2-Step Operations    |       10 |
| 3-Step Operations    |       10 |
| Conditional Sequence |       10 |
| Peripheral Sequence  |       10 |
| **Total**            |   **40** |

---

# Complete Benchmark

|  # | Capability               |   Tests |
| -: | ------------------------ | ------: |
| 01 | GPIO                     |      40 |
| 02 | PWM                      |      35 |
| 03 | I²C                      |      50 |
| 04 | SPI                      |      40 |
| 05 | UART / Serial            |      40 |
| 06 | Analog I/O               |      40 |
| 07 | Timers / Frequency       |      50 |
| 08 | FRAM / Persistent Memory |      70 |
| 09 | Conditional Logic        |      40 |
| 10 | Multi-Operation Control  |      40 |
|    | **TOTAL**                | **445** |

# Pluto Benchmark Score

The complete benchmark contains:

> **445 hardware-control test cases**

Each test is classified as:

```text
PASS
FAIL
```

Overall accuracy:

```text
Accuracy =
Successful Tests / 445 × 100
```

For example, if Pluto successfully passes 430 tests:

```text
430 / 445 × 100 = 96.63%
```

The final score should only be published after the complete benchmark has been executed on the specified hardware.

---

# Resource Benchmark

In addition to functional accuracy, Pluto should be evaluated for resource consumption.

| **Resource**               | **Result** |
| -------------------------- | ---------- |
| Flash Usage                | ~7.8 KB    |
| RAM Usage                  | ~976 bytes |
| FRAM Usage                 | ~1 KB*     |
| Average Command Latency    | <10 ms*    |
| Maximum Command Latency    | <25 ms*    |
| Hardware Execution Success | High reliability |

---

# Why Use Pluto?

## Natural Language Hardware Control

Traditional embedded development generally requires developers to write and modify firmware logic manually.

Pluto introduces another interaction layer:

```text
Human
 ↓
Natural Language
 ↓
Pluto
 ↓
Hardware
```

Instead of manually implementing every supported hardware operation, a user can express the intended action as a command.

---

## One Architecture, Multiple Hardware Interfaces

Pluto is designed around multiple fundamental MCU interfaces:

```text
GPIO
PWM
I²C
SPI
UART
Analog I/O
Timers
FRAM
Conditional Logic
Sequential Operations
```

This allows a single architecture to interact with a wide range of embedded hardware.

---

## Designed for Resource-Constrained Hardware

Pluto is intended for microcontrollers where computational resources are limited.

The benchmark therefore measures:

* Flash
* RAM
* FRAM
* Processing latency
* Hardware execution
* Reliability

The goal is not merely to demonstrate that a command can be understood.

The goal is to demonstrate that the command can be **executed on real hardware within MCU constraints.**

---

## No Need to Treat Hardware as a Black Box

Pluto's architecture is centered around hardware functions.

```text
Command
   ↓
Structured Instruction
   ↓
Hardware Function
   ↓
MCU Peripheral
```

This provides a structured path from human intent to physical hardware.

---

## Useful for Rapid Prototyping

Pluto can reduce the distance between an idea and a hardware experiment.

For example:

```text
"Generate 10 kHz on pin 9 for 5 seconds."
```

or:

```text
"If A0 is greater than 500,
turn pin 9 HIGH."
```

These commands represent hardware behavior directly.

---

## Useful for IoT and Robotics Development

The same fundamental interfaces used by Pluto are common across embedded systems:

```text
GPIO
PWM
I²C
SPI
UART
Analog
Timers
Memory
```

This makes Pluto suitable for experimentation in:

* IoT
* Robotics
* Automation
* Embedded systems
* Smart devices
* Hardware prototyping
* Educational systems

---

# Pluto's Core Idea

Pluto is not designed simply to generate text.

Its purpose is to connect **human intent with executable hardware instructions**.

```text
        HUMAN
          │
          ▼
  Natural Language
          │
          ▼
       PLUTO
          │
          ▼
 Structured Instruction
          │
          ▼
     MCU Hardware
          │
          ▼
   Physical Execution
```

> **The objective is simple: make human intent executable on microcontroller hardware.**

---

# Benchmark Principle

Pluto should be evaluated by what the hardware actually does—not only by what Pluto says.

```text
Correct Text
     ≠
Correct Hardware
```

Therefore:

> **A benchmark test passes only when the intended hardware behavior is correctly executed.**

---

# Summary

**Pluto Benchmark v1.0**

```text
445 Test Cases
10 Hardware Capabilities
Real MCU Execution
Persistent Memory Testing
Communication Testing
Timing & Frequency Testing
Conditional Logic
Multi-Operation Execution
```

### Core Coverage

**GPIO → PWM → I²C → SPI → UART → Analog → Timers → FRAM → Conditional Logic → Multi-Operation Control**

---

## Pluto

### Natural Language → Understanding → Structured Instruction → Hardware Execution

Pluto explores a new interaction model for embedded systems:

> **Instead of only programming the hardware, communicate with it.**

---
### Core Idea

**Natural Language → Understanding → Structured Instruction → Hardware Execution**

Pluto's long-term goal is to make embedded hardware programmable through **communication rather than traditional code**.




---

## Future Development

Pluto is currently under active development.

We are working toward **Pluto 1.5 Flash** and **Pluto 2.5**, with a major expansion of Pluto's capabilities.

The future versions are being designed to run directly on smartphones and use a portion of the phone's available system resources. Pluto 1.5 Flash and Pluto 2.5 are planned to use approximately **2 GB of RAM and 10 GB of storage** from the host smartphone, rather than requiring dedicated memory and storage hardware.

For example, on a smartphone with **8 GB of RAM**, Pluto may use approximately **2 GB of the available RAM** while running, with the remaining system resources available to the smartphone and other applications.

The goal is for Pluto to understand and process user instructions in a more human-like way and use that understanding to perform tasks.

Pluto will be designed to communicate directly with the smartphone and control a wide range of external hardware and embedded systems.



### The Long-Term Vision

Pluto is not intended to operate primarily through simple pattern matching.

The long-term objective is to develop a system capable of **understanding information, reasoning about instructions, organizing tasks, and taking appropriate actions** in a way that is closer to human information processing.

This development represents our exploration toward **AGI (Artificial General Intelligence)** — bringing more general-purpose intelligence from software systems into real-world hardware interaction.

---

## Support Pluto Development

Pluto is an independent research and development project.

If you are interested in supporting the development of future Pluto versions, hardware integration, and embedded intelligence, you can support the project or get in touch with us.

**Development support, collaboration, and early-access opportunities will be announced as the project progresses.**

### Links

🌐 **Website:** [Visit us](https://dibsoftiot.com/)

💼 **LinkedIn:** [Follow LinkedIn](https://www.linkedin.com/in/nazmul-agi/)

---

### Support the Development

If you would like to support the ongoing development of Pluto:

[**Support Pluto Development →**](https://nazdev.gumroad.com/l/support)

---

<p align="center">
  <strong>Pluto — Talk to your hardware instead of programming it.</strong>
</p>

