# Magic 8 Ball

Ứng dụng quả cầu tiên tri với các câu trả lời ngẫu nhiên.

Dự án Flutter độc lập, dùng Flutter 3.38.6 / Dart 3.10.7.

## Chức năng

- Hiển thị hình ảnh quả cầu từ assets.
- Nhấn quả cầu hoặc nút để nhận câu trả lời.
- Quản lý trạng thái bằng StatefulWidget và dart:math.

## Chạy và kiểm tra

```powershell
flutter pub get
flutter analyze
flutter test
flutter devices
flutter run
```

Tài nguyên cần thiết đã có sẵn trong dự án. Đã kiểm tra bằng analyze, unit/widget test.

## Nền tảng chạy

Dự án chỉ giữ nền tảng Android. Mở máy ảo Android, chạy `flutter devices` để kiểm tra kết nối, sau đó chạy `flutter run` và chọn thiết bị Android. Các thư mục nền tảng khác đã được loại bỏ.
