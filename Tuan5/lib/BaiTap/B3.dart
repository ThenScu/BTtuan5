import 'package:flutter/material.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: const Text(
          'Quà của Scu (7)',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          // 1. Hang filter xau xau don gian
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('Sắp xếp', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Dịch vụ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Gần tôi', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // 2. Hang Xu va The qua hinh chu nhat co ban
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                color: Colors.orange[200],
                child: const Text(
                  '1.955 Xu',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                color: Colors.blue[300],
                child: const Text(
                  '4 thẻ quà',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 3. Danh sach voucher dung ListTile thuan tuy
          Expanded(
            child: ListView(
              children: [
                _buildNewbieCard(
                  Icons.movie,
                  'CGV',
                  'Đồng giá 79K',
                  'Dùng ngay',
                ),
                _buildNewbieCard(
                  Icons.sim_card,
                  'Mua Sim',
                  'Giảm 100K',
                  'Dùng ngay',
                ),
                _buildNewbieCard(
                  Icons.account_balance,
                  'VIB',
                  'Tặng 100k',
                  'Dùng ngay',
                ),
                _buildNewbieCard(
                  Icons.umbrella,
                  'Bảo hiểm',
                  'Hoàn 15K',
                  'Dùng ngay',
                ),
                _buildNewbieCard(
                  Icons.local_activity,
                  'Phí ko dừng',
                  'Giảm 10K',
                  'Thu thập',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Ham tao card kieu newbie dung ListTile
  Widget _buildNewbieCard(
    IconData icon,
    String title,
    String subtitle,
    String btnText,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blue), // Icon ben trai
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ), // Chu to
        subtitle: Text(subtitle), // Chu nho
        trailing: Text(
          btnText,
          style: const TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
          ),
        ), // Chu o goc phai
      ),
    );
  }
}
