import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothDevice? connectedDevice;
  BluetoothCharacteristic? characteristic;

  @override
  void initState() {
    super.initState();
    connectToDevice();
  }

  void connectToDevice() async {
    // Scan for nearby devices
    flutterBlue.scan().listen((scanResult) async {
      // Check if the device name matches your ESP32 device name
      if (scanResult.device.name == "BME280_ESP32") {
        // Connect to the device
        await scanResult.device.connect();
        connectedDevice = scanResult.device;

        // Discover services and characteristics
        List<BluetoothService>? services =
        await connectedDevice?.discoverServices();
        services?.forEach((service) {
          List<BluetoothCharacteristic> characteristics = service.characteristics;
          characteristics.forEach((characteristic) {
            if (characteristic.uuid.toString() == "cba1d466-344c-4be3-ab3f-189f80dd7518") {
              this.characteristic = characteristic;
            }
          });
        });

        // Enable notifications on the characteristic
        await characteristic?.setNotifyValue(true);

        // Listen for characteristic value changes
        characteristic?.value.listen((value) {
          print("Received data: ${value.toString()}");
        });
      }
    });
  }

  void sendData() async {
    if (connectedDevice != null && characteristic != null) {
      // Convert data to bytes and send it
      List<int> data = [1, 2, 3, 4, 5];
      await characteristic?.write(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bluetooth Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Send Data"),
          onPressed: sendData,
        ),
      ),
    );
  }
}