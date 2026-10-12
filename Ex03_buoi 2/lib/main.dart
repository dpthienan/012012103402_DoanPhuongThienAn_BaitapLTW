import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xếp loại học lực',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const XepLoaiPage(),
    );
  }
}

// Hàm xếp loại học lực dùng if/else
String xepLoai(double diem) {
  if (diem < 0 || diem > 10) {
    return 'Không hợp lệ';
  } else if (diem >= 8.0) {
    return 'Giỏi';
  } else if (diem >= 6.5) {
    return 'Khá';
  } else if (diem >= 5.0) {
    return 'Trung bình';
  } else {
    return 'Yếu';
  }
}

// Hàm trả về màu chữ cho xếp loại dùng if
Color mauXepLoai(String loai) {
  if (loai == 'Giỏi') {
    return Colors.green;
  } else if (loai == 'Khá') {
    return Colors.blue;
  } else if (loai == 'Trung bình') {
    return Colors.orange;
  } else if (loai == 'Yếu') {
    return Colors.red;
  } else {
    return Colors.grey;
  }
}

// Hàm trả về màu nền badge cho xếp loại dùng if
Color nenXepLoai(String loai) {
  if (loai == 'Giỏi') {
    return Colors.green.shade100;
  } else if (loai == 'Khá') {
    return Colors.blue.shade100;
  } else if (loai == 'Trung bình') {
    return Colors.orange.shade100;
  } else if (loai == 'Yếu') {
    return Colors.red.shade100;
  } else {
    return Colors.grey.shade200;
  }
}

class XepLoaiPage extends StatelessWidget {
  const XepLoaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Khai báo biến điểm có giá trị 8.5
    double diem = 8.5;
    String loaiChinh = xepLoai(diem);

    // Danh sách điểm kiểm tra thêm
    List<double> danhSachDiem = [9, 7, 5.5, 3, 11];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Xếp loại học lực',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF1565C0),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Card điểm trung bình chính
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Điểm trung bình',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$diem',
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Badge xếp loại chính, màu dùng if
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    decoration: BoxDecoration(
                      color: nenXepLoai(loaiChinh),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      loaiChinh,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: mauXepLoai(loaiChinh),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Card kiểm tra thêm
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'KIỂM TRA THÊM',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Danh sách 5 điểm
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Điểm 9',
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                      _badgeXepLoai(xepLoai(danhSachDiem[0])),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Điểm 7',
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                      _badgeXepLoai(xepLoai(danhSachDiem[1])),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Điểm 5.5',
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                      _badgeXepLoai(xepLoai(danhSachDiem[2])),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Điểm 3',
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                      _badgeXepLoai(xepLoai(danhSachDiem[3])),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Điểm 11',
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                      _badgeXepLoai(xepLoai(danhSachDiem[4])),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget badge xếp loại
  Widget _badgeXepLoai(String loai) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: nenXepLoai(loai),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        loai,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: mauXepLoai(loai),
        ),
      ),
    );
  }
}
