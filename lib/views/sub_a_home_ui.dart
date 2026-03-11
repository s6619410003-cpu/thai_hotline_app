import 'package:flutter/material.dart';
import 'package:flutter_iot_cake_fast_app/views/about_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class SubAHomeUI extends StatefulWidget {
  const SubAHomeUI({super.key});

  @override
  State<SubAHomeUI> createState() => _SubAHomeUIState();
}

class _SubAHomeUIState extends State<SubAHomeUI> {
  // ฟังก์ชันสำหรับโทรออก
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  // จุดแก้ไขที่ 1: เพิ่มพารามิเตอร์ imagePath
  Widget _buildHotlineCard({
    required String title,
    required String number,
    required String imagePath,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade400, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        // จุดแก้ไขที่ 2: เปลี่ยนจาก Icon เป็น Image.asset
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black87, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              // ตัวช่วยกรณีหาไฟล์ภาพไม่เจอ
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image_not_supported, color: Colors.grey),
            ),
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(number),
        trailing: IconButton(
          icon: const Icon(Icons.phone_outlined, color: Colors.black87),
          onPressed: () => _makePhoneCall(number),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 104, 104, 105),
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.black87),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUI()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'สายด่วน\nการเดินทาง',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // จุดแก้ไขที่ 3: เปลี่ยนรูปใหญ่ตรงกลาง
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  'assets/images/hway.jpg', // <-- ใส่ชื่อรูปใหญ่ของคุณที่นี่
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image, size: 50, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 30),

              // จุดแก้ไขที่ 4: ใส่ imagePath ให้กับแต่ละรายการ
              _buildHotlineCard(
                  title: 'ข้อมูลจราจร',
                  number: '1197',
                  imagePath: 'assets/images/ptf.jpg'),
              _buildHotlineCard(
                  title: 'ตำรวจทางหลวง',
                  number: '1193',
                  imagePath: 'assets/images/phw.jpg'),
              _buildHotlineCard(
                  title: 'ตำรวจท่องเที่ยว',
                  number: '1155',
                  imagePath: 'assets/images/ptr.jpg'),
              _buildHotlineCard(
                  title: 'เส้นทางบนทางด่วน',
                  number: '1543',
                  imagePath: 'assets/images/exat.jpg'),
              _buildHotlineCard(
                  title: 'ขสมก.',
                  number: '1348',
                  imagePath: 'assets/images/bmta.jpg'),
              _buildHotlineCard(
                  title: 'กรมทางหลวงชนบท',
                  number: '1146',
                  imagePath: 'assets/images/sdrrt.jpg'),
              _buildHotlineCard(
                  title: 'บขส.',
                  number: '1490',
                  imagePath: 'assets/images/bks.jpg'),
              _buildHotlineCard(
                  title: 'กรมทางหลวง',
                  number: '1586',
                  imagePath: 'assets/images/sdrht.jpg'),
              _buildHotlineCard(
                  title: 'การรถไฟแห่งประเทศไทย',
                  number: '1690',
                  imagePath: 'assets/images/train.jpg'),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
