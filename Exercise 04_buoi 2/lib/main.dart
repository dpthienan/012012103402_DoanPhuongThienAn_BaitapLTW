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
      title: 'Bảng điểm lớp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BangDiemPage(),
    );
  }
}

// Class Student với score nullable
class Student {
  String name;
  double? score;

  Student(this.name, this.score);
}

// Hàm xếp loại (dùng lại từ Bài 2) dùng if/else
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

// Màu chữ xếp loại dùng if
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

class BangDiemPage extends StatelessWidget {
  const BangDiemPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu khai báo sẵn: An 9.0, Bình 7.2, Chi (chưa có), Dũng 4.5, Em 5.8
    List<Student> danhSach = [
      Student('Nguyễn Văn An', 9.0),
      Student('Trần Thị Bình', 7.2),
      Student('Lê Minh Chi', null),
      Student('Phạm Quốc Dũng', 4.5),
      Student('Võ Thanh Em', 5.8),
    ];

    // Tính thống kê dùng for + if
    double tongDiem = 0;
    int soCoDiem = 0;
    int soGioi = 0;
    int soChuaCoDiem = 0;
    double caoNhat = 0;

    for (int i = 0; i < danhSach.length; i++) {
      if (danhSach[i].score != null) {
        tongDiem += danhSach[i].score!;
        soCoDiem++;
        if (danhSach[i].score! > caoNhat) {
          caoNhat = danhSach[i].score!;
        }
        if (xepLoai(danhSach[i].score!) == 'Giỏi') {
          soGioi++;
        }
      } else {
        soChuaCoDiem++;
      }
    }

    double trungBinh = soCoDiem > 0 ? tongDiem / soCoDiem : 0;
    String trungBinhStr = trungBinh.toStringAsFixed(2);
    String caoNhatStr = caoNhat == caoNhat.roundToDouble()
        ? caoNhat.toInt().toString()
        : caoNhat.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bảng điểm lớp',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFF1A237E),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card thống kê tổng quan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1A237E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Điểm trung bình lớp',
                    style: TextStyle(fontSize: 13, color: Colors.white70),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    trungBinhStr,
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Hàng thống kê: Giỏi | Chưa có điểm | Cao nhất
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Giỏi',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.white60),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '$soGioi',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Chưa có điểm',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.white60),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '$soChuaCoDiem',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cao nhất',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.white60),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              caoNhatStr,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Tiêu đề danh sách
            Text(
              'DANH SÁCH · ${danhSach.length} SINH VIÊN',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                letterSpacing: 1.0,
              ),
            ),

            const SizedBox(height: 8),

            // Danh sách sinh viên dùng for
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: _buildDanhSach(danhSach),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dùng for để build danh sách sinh viên
  List<Widget> _buildDanhSach(List<Student> danhSach) {
    List<Widget> items = [];

    for (int i = 0; i < danhSach.length; i++) {
      Student sv = danhSach[i];

      // Xác định xếp loại và điểm hiển thị
      String loaiStr;
      String diemStr;

      if (sv.score == null) {
        loaiStr = 'Chưa có điểm';
        diemStr = '—';
      } else {
        loaiStr = xepLoai(sv.score!);
        diemStr = sv.score == sv.score!.roundToDouble()
            ? sv.score!.toInt().toString()
            : sv.score.toString();
      }

      // Màu xếp loại dùng if
      Color mauLoai;
      if (sv.score == null) {
        mauLoai = Colors.grey;
      } else {
        mauLoai = mauXepLoai(loaiStr);
      }

      items.add(
        Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  // Tên và xếp loại
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sv.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          loaiStr,
                          style: TextStyle(
                            fontSize: 13,
                            color: mauLoai,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Điểm
                  Text(
                    diemStr,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: sv.score == null ? Colors.grey : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            // Divider (không hiện ở dòng cuối)
            if (i < danhSach.length - 1)
              const Divider(height: 1, indent: 16, endIndent: 16),
          ],
        ),
      );
    }

    return items;
  }
}
