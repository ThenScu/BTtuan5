import 'package:flutter/material.dart';

class ListViewDemoScreen extends StatelessWidget {
  const ListViewDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'ListView Demo',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader('Chọn loại đề tài'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCircleButton('Đồ án'),
                _buildCircleButton('KLKS'),
                _buildCircleButton('Luận văn'),
                _buildCircleButton('Khác'),
              ],
            ),
          ),
          _buildHeader('Chọn chuyên ngành thực hiện'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                _buildListItem(
                  'Công nghệ phần mềm',
                  'Phát triển các ứng dụng giải quyết các vấn đề thực tế',
                ),
                _buildListItem(
                  'Hệ thống thông tin',
                  'Phát triển các kỹ thuật xử lý thông tin trong tổ chức',
                ),
                _buildListItem(
                  'Mạng máy tính',
                  'Xử lý các vấn đề liên quan đến mạng máy tính',
                ),
                _buildListItem(
                  'An toàn thông tin',
                  'Thiết kế và đảm bảo an toàn cho hệ thống máy tính',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String text) {
    return Container(
      color: Colors.lightBlue,
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCircleButton(String text) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.deepPurple,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildListItem(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black54),
      ),
      child: ListTile(
        leading: const Icon(Icons.home, color: Colors.black54),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.black87)),
        trailing: const Icon(Icons.arrow_forward, color: Colors.black54),
      ),
    );
  }
}
