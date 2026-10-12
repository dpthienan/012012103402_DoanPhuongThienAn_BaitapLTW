# Ex02 - Danh sách sinh viên (Buổi 2)

## Chạy đúng cách (tránh lỗi đường dẫn)

Thư mục `D:\Platform for Developer's app` có dấu `'` nên Flutter analyze/test/VS Code Dart dễ bị lỗi.

**Nên mở và chạy từ đường dẫn sạch:**

```text
D:\Flutter\Ex02_buoi_2
```

Bản sao bài nộp cũng có tại:

```text
D:\Platform for Developer's app\Ex02_buoi_2
```

## Lệnh chạy trên máy ảo Android

```powershell
$env:JAVA_HOME = "C:\Program Files\Android\Android Studio\jbr"
$env:ANDROID_HOME = "$env:LOCALAPPDATA\Android\sdk"
$env:PATH = "$env:JAVA_HOME\bin;$env:ANDROID_HOME\platform-tools;$env:PATH"

cd D:\Flutter\Ex02_buoi_2
flutter emulators --launch Pixel_4
flutter run
```

## Yêu cầu đã làm

1. Class `Student` với `name`, `email?`, `phone?`
2. List 5 sinh viên (có email/phone null)
3. `for` tạo thẻ sinh viên
4. `??` hiển thị **Chưa cập nhật** (màu đỏ)
5. `for` đếm thiếu email → footer `Thiếu email: 2`

Widget dùng: `Scaffold`, `AppBar`, `Column`, `Row`, `Container`, `Text`, `SizedBox`
