import 'package:flutter/material.dart';
import 'package:flutter_iot_cake_fast_app/views/about_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class SubDHomeUI extends StatefulWidget {
  const SubDHomeUI({super.key});

  @override
  State<SubDHomeUI> createState() => _SubDHomeUIState();
}

class _SubDHomeUIState extends State<SubDHomeUI> {
  // ฟังก์ชันสำหรับโทรออก
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  // แก้ไขฟังก์ชันสร้าง Card ให้รองรับรูปภาพและแสดงผลเต็มกรอบ
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
              fit: BoxFit.cover, // ปรับรูปให้เต็มช่อง 50x50
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.electrical_services, color: Colors.grey),
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
                'สายด่วน\nสาธารณูปโภค',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // ปรับปรุงรูปภาพใหญ่ตรงกลางให้โค้งมนและเต็มกรอบ
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
                    'assets/images/town.jpg', // <-- ใส่ชื่อรูปใหญ่ของคุณที่นี่
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // รายการเบอร์โทรสาธารณูปโภค (ระบุ imagePath ให้ครบ)
              _buildHotlineCard(
                  title: 'ไฟฟ้านครหลวง (MEA)',
                  number: '1130',
                  imagePath: 'assets/images/mea.jpg'),
              _buildHotlineCard(
                  title: 'ไฟฟ้าส่วนภูมิภาค (PEA)',
                  number: '1129',
                  imagePath: 'assets/images/pea.jpg'),
              _buildHotlineCard(
                  title: 'ไฟฟ้าฝ่ายผลิต (EGAT)',
                  number: '1416',
                  imagePath: 'assets/images/egat.jpg'),
              _buildHotlineCard(
                  title: 'การประปานครหลวง (MWA)',
                  number: '1125',
                  imagePath: 'assets/images/mwa.jpg'),
              _buildHotlineCard(
                  title: 'การประปาส่วนภูมิภาค (PWA)',
                  number: '1662',
                  imagePath: 'assets/images/pwa.jpg'),
              _buildHotlineCard(
                  title: 'True (ทรู)',
                  number: '1242',
                  imagePath: 'assets/images/true.jpg'),
              _buildHotlineCard(
                  title: 'dtac (ดีแทค)',
                  number: '1678',
                  imagePath: 'assets/images/dtac.jpg'),
              _buildHotlineCard(
                  title: 'AIS (เอไอเอส)',
                  number: '1175',
                  imagePath: 'assets/images/ais.jpg'),
              _buildHotlineCard(
                  title: 'NT (โทรคมนาคมแห่งชาติ)/TOT (ทีโอที)',
                  number: '1100',
                  imagePath: 'assets/images/tot.jpg'),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
