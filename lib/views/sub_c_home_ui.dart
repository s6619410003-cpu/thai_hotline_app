import 'package:flutter/material.dart';
import 'package:flutter_iot_cake_fast_app/views/about_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class SubCHomeUI extends StatefulWidget {
  const SubCHomeUI({super.key});

  @override
  State<SubCHomeUI> createState() => _SubCHomeUIState();
}

class _SubCHomeUIState extends State<SubCHomeUI> {
  // ฟังก์ชันสำหรับโทรออก
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  // จุดแก้ไขที่ 1: เพิ่มพารามิเตอร์ imagePath และปรับให้แสดงรูปภาพเต็มกรอบ
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover, // ทำให้โลโก้ธนาคารเต็มกรอบ 50x50
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.account_balance, color: Colors.grey),
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
                'สายด่วน\nธนาคาร',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // จุดแก้ไขที่ 2: ปรับรูปใหญ่ตรงกลางให้โค้งมนและเต็มกรอบ
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
                    'assets/images/weal.jpg', // <-- เปลี่ยนเป็นชื่อไฟล์รูปใหญ่ของคุณ
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // รายการเบอร์โทรธนาคาร (ใส่ imagePath เพิ่มเข้าไป)
              _buildHotlineCard(
                  title: 'ธนาคารกรุงไทย',
                  number: '02-111-1111',
                  imagePath: 'assets/images/kt.jpg'),
              _buildHotlineCard(
                  title: 'ธนาคารกรุงเทพ',
                  number: '1333',
                  imagePath: 'assets/images/bb.jpg'),
              _buildHotlineCard(
                  title: 'GSB (ออมสิน)',
                  number: '1115',
                  imagePath: 'assets/images/gsb.jpg'),
              _buildHotlineCard(
                  title: 'ธนาคารกรุงศรีอยุธยา',
                  number: '1572',
                  imagePath: 'assets/images/kg.jpg'),
              _buildHotlineCard(
                  title: 'ธนาคารกสิกรไทย',
                  number: '02-888-8888',
                  imagePath: 'assets/images/kb.jpg'),
              _buildHotlineCard(
                  title: 'ธนาคารไทยพาณิชย์',
                  number: '02-777-7777',
                  imagePath: 'assets/images/scb.jpg'),
              _buildHotlineCard(
                  title: 'ttb (ทีทีบี)',
                  number: '1428',
                  imagePath: 'assets/images/ttb.jpg'),
              _buildHotlineCard(
                  title: 'citibank (ซิตี้แบงก์)',
                  number: '1588',
                  imagePath: 'assets/images/citi.jpg'),
              _buildHotlineCard(
                  title: 'GH BANK (ธอส.)',
                  number: '02-645-9000',
                  imagePath: 'assets/images/ghb.jpg'),
              _buildHotlineCard(
                  title: 'เกียรตินาคินภัทร',
                  number: '02-165-5555',
                  imagePath: 'assets/images/knkpt.jpg'),
              _buildHotlineCard(
                  title: 'ไทยเครดิต',
                  number: '02-697-5454',
                  imagePath: 'assets/images/tkd.jpg'),
              _buildHotlineCard(
                  title: 'UOB (ยูโอบี)',
                  number: '02-285-1555',
                  imagePath: 'assets/images/uob.jpg'),
              _buildHotlineCard(
                  title: 'TISCO (ทิสโก้)',
                  number: '02-633-6000',
                  imagePath: 'assets/images/tisco.jpg'),
              _buildHotlineCard(
                  title: 'Islamic Bank (ไอแบงก์)',
                  number: '02-204-2766',
                  imagePath: 'assets/images/ibot.jpg'),
              _buildHotlineCard(
                  title: 'CIMB THAI (ซีไอเอ็มบี ไทย)',
                  number: '02-626-7777',
                  imagePath: 'assets/images/ct.jpg'),
              _buildHotlineCard(
                  title: 'LHB (แลนด์ แอนด์ เฮ้าส์)',
                  number: '1327',
                  imagePath: 'assets/images/lhb.jpg'),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
