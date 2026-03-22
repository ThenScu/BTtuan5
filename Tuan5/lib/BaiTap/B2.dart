import 'package:flutter/material.dart';

// Class chinh cho man hinh Momo don gian
class MomoScreen extends StatelessWidget {
  const MomoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar mau hong
      appBar: AppBar(
        backgroundColor: const Color(0xffD02A7E), // Mau hong Momo
        title: const Text(
          'Giao diện Momo ',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),

      // 2. Than man hinh la mot Column co the cuon duoc
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Phan 1: Phan Dich vu ( GridView) ---
            _buildServiceGrid(),
            const SizedBox(height: 24),
            // --- Phan 2: Tieu de va Banner quang cao lon ---
            _buildHeader('Sự kiện đang diễn ra'),
            const SizedBox(height: 8),
            _buildLargeBanner(),
            const SizedBox(height: 24),

            // --- Phan 3: Tieu de va Phan De xuat ( Row) ---
            _buildHeader('MoMo đề xuất'),
            const SizedBox(height: 8),
            _buildRecommendationRow(),
            const SizedBox(height: 24),

            // Tieu de cuoi cung
            _buildHeader('Có thể bạn quan tâm'),
          ],
        ),
      ),

      // 3. Thanh dieu huong duoi cung
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xffD02A7E), // Mau khi duoc chon
        unselectedItemColor: Colors.grey, // Mau khi khong duoc chon
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'MoMo'),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Ưu đãi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Quét QR',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Lịch sử'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tôi'),
        ],
      ),
    );
  }

  // Ham tao tieu de cac phan
  Widget _buildHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  // Ham tao Luoi Dich vu (Grid)
  Widget _buildServiceGrid() {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true, // QUAN TRONG: De Grid tu co lam theo Column cha
      physics:
          const NeverScrollableScrollPhysics(), // QUAN TRONG: Khong cho Grid tu cuon, cuon theo Column
      mainAxisSpacing: 16, // Khoang cach giua cac hang
      crossAxisSpacing: 12, // Khoang cach giua cac cot
      children: [
        _buildServiceItem(
          Icons.send_to_mobile,
          'Chuyển tiền',
          const Color(0xffEA2D3B),
        ),
        _buildServiceItem(
          Icons.receipt_long,
          'Hóa đơn',
          const Color(0xff2FB7D8),
        ),
        _buildServiceItem(
          Icons.phone_android,
          'Nạp ĐT',
          const Color(0xffFF8C1A),
        ),
        _buildServiceItem(
          Icons.shopping_bag,
          'Mã thẻ',
          const Color(0xff7740D8),
        ),

        _buildServiceItem(Icons.local_atm, 'Heo đất', const Color(0xffEA2D3B)),
        _buildServiceItem(
          Icons.directions_run,
          'Đi bộ',
          const Color(0xff2FB7D8),
        ),
        _buildServiceItem(Icons.water_drop, 'Nước', const Color(0xffFF8C1A)),
        _buildServiceItem(Icons.bar_chart, 'Quản lý', const Color(0xff7740D8)),

        // Item cuoi cung la 'Xem them' mau xam
        _buildServiceItem(Icons.add_circle_outline, 'Xem thêm', Colors.grey),
      ],
    );
  }

  // Ham tao mot item dich vu hinh tron (Icon ben tren Text)
  Widget _buildServiceItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1), // Mau nen nhe
            shape: BoxShape.circle, // Hinh tron
          ),
          child: Icon(icon, color: color, size: 28), // Icon chin
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis, // Cat bot text neu dai
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  // Ham tao Banner quang cao lon (Dung Container mau)
  Widget _buildLargeBanner() {
    return Card(
      clipBehavior: Clip.antiAlias, // Bo goc dep
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 160,
        width: double.infinity,
        color: const Color(0xffD02A7E), // Mau hong Momo
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: const Text(
          'BANNER QUẢNG CÁO MIXI88:\nNHẬN ĐẾN 50 TRIỆU',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  // Ham tao Hang cac De xuat (Row)
  Widget _buildRecommendationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Chia deu khoang cach
      children: [
        _buildSmallServiceItem(Icons.request_page, 'Vay Nhanh'),
        _buildSmallServiceItem(Icons.movie, 'Vé xem phim'),
        _buildSmallServiceItem(
          Icons.account_balance_wallet_outlined,
          'Túi Thần Tày',
        ),
        _buildSmallServiceItem(Icons.credit_card, 'Ví Trả Sau'),
      ],
    );
  }

  // Ham tao mot item De xuat nho
  Widget _buildSmallServiceItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4),
            ], // Bong nhe
          ),
          child: Icon(icon, color: const Color(0xffD02A7E), size: 24),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}
