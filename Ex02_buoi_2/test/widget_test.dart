import 'package:flutter_test/flutter_test.dart';
import 'package:ex02_buoi_2/main.dart';

void main() {
  testWidgets('Student list shows title and missing email count',
      (WidgetTester tester) async {
    await tester.pumpWidget(const StudentListApp());

    expect(find.text('Danh sách sinh viên'), findsOneWidget);
    expect(find.text('Nguyễn Văn An'), findsOneWidget);
    expect(find.text('Tổng: 5 sinh viên'), findsOneWidget);
    expect(find.text('Thiếu email: 2'), findsOneWidget);
    expect(find.text('Chưa cập nhật'), findsNWidgets(4));
  });
}
