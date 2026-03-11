import 'package:flutter/material.dart';
import 'package:flutter_iot_cake_fast_app/views/about_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class SubBHomeUI extends StatefulWidget {
  const SubBHomeUI({super.key});

  @override
  State<SubBHomeUI> createState() => _SubBHomeUIState();
}

class _SubBHomeUIState extends State<SubBHomeUI> {
  // ฟังก์ชันสำหรับโทรออก
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  // จุดแก้ไขที่ 1: ปรับปรุงฟังก์ชันสร้าง Card ให้แสดงรูปภาพเต็มกรอบ
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
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black87, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          // แก้ไข: ใช้ ClipRRect + Image.asset แทน Icon
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover, // ทำให้รูปเต็มกรอบ 50x50
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
                'สายด่วน\nอุบัติเหตุ-เหตุฉุกเฉิน',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // จุดแก้ไขที่ 2: ปรับรูปใหญ่ตรงกลางให้เต็มและโค้งมน
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/emergency.jpg', // <-- ใส่ชื่อรูปใหญ่ของคุณที่นี่
                    fit: BoxFit.cover, // ทำให้รูปใหญ่เต็มกรอบ 160x160
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // รายการเบอร์โทร
              _buildHotlineCard(
                  title: 'เหตุด่วนเหตุร้าย',
                  number: '191',
                  imagePath: 'assets/images/plist.jpg'),
              _buildHotlineCard(
                  title: 'ศูนย์ปลอดภัยคมนาคม',
                  number: '1356',
                  imagePath: 'assets/images/3h.jpg'),
              _buildHotlineCard(
                  title: 'หน่วยแพทย์กู้ชีพ',
                  number: '1554',
                  imagePath: 'assets/images/svh.jpg'),
              _buildHotlineCard(
                  title: 'ศูนย์เอราวัณ',
                  number: '1646',
                  imagePath: 'assets/images/hpt.jpg'),
              _buildHotlineCard(
                  title: 'เจ็บป่วยฉุกเฉิน',
                  number: '1669',
                  imagePath: 'assets/images/hwt.jpg'),
              _buildHotlineCard(
                  title: 'สายด่วนรถหาย',
                  number: '1192',
                  imagePath: 'assets/images/plist.jpg'),
              _buildHotlineCard(
                  title: 'แจ้งไฟไหม้,สัตว์เข้าบ้าน',
                  number: '199',
                  imagePath: 'assets/images/fr.png'),
              _buildHotlineCard(
                  title: 'อุบัติเหตุทางน้ำ',
                  number: '1196',
                  imagePath: 'assets/images/pwarter.jpg'),
              _buildHotlineCard(
                  title: 'แจ้งคนหาย',
                  number: '1300',
                  imagePath: 'assets/images/1300.png'),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
