import 'package:flutter/material.dart';

void main() => runApp(const StudentListApp());

class Student {
  final String name;
  final String? email;
  final String? phone;

  const Student({
    required this.name,
    this.email,
    this.phone,
  });
}

class StudentListApp extends StatelessWidget {
  const StudentListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Danh sách sinh viên',
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: const Color(0xFF1A3A6B),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A3A6B),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: const Color(0xFFF2F2F2),
      ),
      home: const StudentListPage(),
    );
  }
}

class StudentListPage extends StatelessWidget {
  const StudentListPage({super.key});

  // Bước 2: danh sách 5 sinh viên (có trường null)
  static const List<Student> students = [
    Student(
      name: 'Nguyễn Văn An',
      email: 'an.nguyen@email.com',
      phone: '0901234567',
    ),
    Student(
      name: 'Trần Thị Bình',
      email: null,
      phone: '0912345678',
    ),
    Student(
      name: 'Lê Minh Chi',
      email: 'chi.le@email.com',
      phone: null,
    ),
    Student(
      name: 'Phạm Quốc Dũng',
      email: null,
      phone: null,
    ),
    Student(
      name: 'Võ Thanh Em',
      email: 'em.vo@email.com',
      phone: '0934567890',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Bước 5: đếm sinh viên thiếu email bằng for
    int missingEmailCount = 0;
    for (final student in students) {
      if (student.email == null) {
        missingEmailCount++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Danh sách sinh viên',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          // Bước 3: for tạo thẻ sinh viên
          for (final student in students) _buildStudentCard(student),
        ],
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFFD6EAF8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tổng: ${students.length} sinh viên',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A3A6B),
              ),
            ),
            Text(
              'Thiếu email: $missingEmailCount',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A3A6B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentCard(Student student) {
    // Bước 4: dùng ?? hiển thị "Chưa cập nhật"
    final emailText = student.email ?? 'Chưa cập nhật';
    final phoneText = student.phone ?? 'Chưa cập nhật';
    final emailMissing = student.email == null;
    final phoneMissing = student.phone == null;

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 10, 12, 0),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                student.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Text(
                'Email: ',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              Text(
                emailText,
                style: TextStyle(
                  fontSize: 14,
                  color: emailMissing ? Colors.red : Colors.black87,
                  fontWeight:
                      emailMissing ? FontWeight.w500 : FontWeight.normal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text(
                'SĐT: ',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              Text(
                phoneText,
                style: TextStyle(
                  fontSize: 14,
                  color: phoneMissing ? Colors.red : Colors.black87,
                  fontWeight:
                      phoneMissing ? FontWeight.w500 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
