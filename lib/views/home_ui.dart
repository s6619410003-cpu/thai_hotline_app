import 'package:flutter/material.dart';
import 'package:flutter_iot_cake_fast_app/views/sub_a_home_ui.dart';
import 'package:flutter_iot_cake_fast_app/views/sub_b_home_ui.dart';
import 'package:flutter_iot_cake_fast_app/views/sub_c_home_ui.dart';
import 'package:flutter_iot_cake_fast_app/views/sub_d_home_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const SubAHomeUI(),
    const SubBHomeUI(),
    const SubCHomeUI(),
    const SubDHomeUI(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_car), label: 'เดินทาง'),
          BottomNavigationBarItem(
              icon: Icon(Icons.warning), label: 'อุบัติเหตุ-เหตุฉุกเฉิน'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: 'ธนาคาร'),
          BottomNavigationBarItem(icon: Icon(Icons.bolt), label: 'สาธารณูปโภค'),
        ],
      ),
    );
  }
}
