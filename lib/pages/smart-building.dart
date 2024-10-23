import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SmartBuilding extends StatefulWidget {
  const SmartBuilding({super.key});

  @override
  State<SmartBuilding> createState() => _SmartBuildingState();
}

class _SmartBuildingState extends State<SmartBuilding> {
  // Variabel untuk menyimpan nilai pilihan
  String? selectedBuilding;
  String? selectedFloor;
  String? selectedRoom;

  final List<String> buildings = ['Gedung Takumi', 'Gedung Minori'];
  final List<String> floors = ['Lantai 1', 'Lantai 2', 'Lantai 3'];
  final List<String> rooms = ['Ruangan 304', 'Ruangan 305', 'Ruangan 306'];

  // Menyimpan status perangkat
  List<bool> deviceStates = [
    false,
    false,
    false,
    false
  ]; // Default semua perangkat mati

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 23, 93, 150),
        title: const Row(
          children: [
            Text(
              "Hallo,",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 5),
            Text(
              "Ibrahim",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            SizedBox(width: 4),
          ],
        ),
        actions: const [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(
              'assets/images/ibrahim.jpg',
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Gedung :',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              DropdownButton<String>(
                hint: const Text('Pilih Gedung'),
                value: selectedBuilding,
                isExpanded: true,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedBuilding = newValue;
                  });
                },
                items: buildings.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),

              // Dropdown untuk Lantai
              const Text(
                'Lantai :',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton<String>(
                hint: const Text('Pilih Lantai'),
                value: selectedFloor,
                isExpanded: true,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedFloor = newValue;
                  });
                },
                items: floors.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),

              // Dropdown untuk Ruangan
              const Text(
                'Ruangan :',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton<String>(
                hint: const Text('Pilih Ruangan'),
                value: selectedRoom,
                isExpanded: true,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRoom = newValue;
                  });
                },
                items: rooms.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),

              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  _buildDeviceCard(
                    icon: Icons.door_front_door,
                    deviceName: 'Smart Door',
                    description: 'Pintu jati\nWarna Coklat',
                    roomNumber: '304',
                    width: (MediaQuery.of(context).size.width / 2) - 28,
                    deviceIndex: 0,
                  ),
                  _buildDeviceCard(
                    icon: Icons.ac_unit,
                    deviceName: 'Smart AC',
                    description: 'Midea\nMSAF-05CRN2',
                    roomNumber: '304',
                    width: (MediaQuery.of(context).size.width / 2) - 28,
                    deviceIndex: 1,
                  ),
                  _buildDeviceCard(
                    icon: Icons.lightbulb_outline,
                    deviceName: 'Smart Lamp',
                    description: 'tp-link Smart Wi-Fi\nLight Bulb TAPO L530E ',
                    roomNumber: '304',
                    width: (MediaQuery.of(context).size.width / 2) - 28,
                    deviceIndex: 2,
                  ),
                  _buildDeviceCard(
                    icon: FontAwesomeIcons.fan,
                    deviceName: 'Smart Fan',
                    description: 'Maspion Kipas Angin Tower\nTF-7022S X2 7Inch',
                    roomNumber: '304',
                    width: (MediaQuery.of(context).size.width / 2) - 28,
                    deviceIndex: 3,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat kartu perangkat
  Widget _buildDeviceCard({
    required IconData icon,
    required String deviceName,
    required String description,
    required String roomNumber,
    required double width,
    required int deviceIndex, // Menambahkan indeks perangkat
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ikon dan Nomor Ruangan
          Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
              const Spacer(),
              Text(
                roomNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Nama Perangkat
          Text(
            deviceName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          // Deskripsi Perangkat
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          // Tombol Power
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  deviceStates[deviceIndex] =
                      !deviceStates[deviceIndex]; // Toggle state
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(deviceStates[deviceIndex]
                        ? 'Tombol Power Ditekan! Perangkat Menyala'
                        : 'Tombol Power Ditekan! Perangkat Mati'),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: deviceStates[deviceIndex]
                      ? Colors.red
                      : Colors.black54, // Ubah warna berdasarkan status
                ),
                child: const Icon(
                  Icons.power_settings_new,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
