import 'package:flutter/material.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 104, 104, 105),
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        // ปุ่มย้อนกลับแบบในรูป
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'ผู้จัดทำ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // 1. ส่วนโลโก้มหาวิทยาลัย (สี่เหลี่ยมตามรูป)
              Container(
                width: 150,
                height: 150,
                color: Colors.grey[200], // พื้นหลังสีเทาอ่อนกรณีไม่มีรูป
                child: Image.asset(
                  'assets/images/sauima.jpg', // <-- ใส่รูปโลโก้มอที่นี่
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image, size: 50, color: Colors.grey),
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                'มหาวิทยาลัยเอเชียอาคเนย์',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 40),

              // 2. ส่วนรูปโปรไฟล์นักศึกษา (วงกลมตามรูป)
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/smash.jpg', // <-- ใส่รูปนักศึกษาที่นี่
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person, size: 100, color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 3. ส่วนข้อมูลนักศึกษา (จัดวางแบบในรูป)
              const Text('รหัสนักศึกษา: 6619410003',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('ชื่อ-สกุล: นายอนุชา แซ่ลิ้ม',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Email: s6619410003@sau.ac.th',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('สาขาวิชา:วิศวกรรมคอมพิวเตอร์',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('คณะ: คณะวิศวกรรมศาสตร์',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
