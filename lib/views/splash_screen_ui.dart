import 'package:flutter/material.dart';
import 'package:flutter_iot_cake_fast_app/views/home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    super.initState();
    // หน่วงเวลา 3 วินาทีแล้วเปลี่ยนไปหน้า HomeUI
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeUI()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 104, 104, 105),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // แทนที่ Icon ด้วย Image.asset('assets/icon/โลโก้ของคุณ.png') ได้เลย
            const Icon(Icons.phone_in_talk, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'THAI HOTLINE APP\nสายด่วน',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
