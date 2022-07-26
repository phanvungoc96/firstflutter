import 'package:flutter/material.dart';

class CategoryWidgetModel {
  final String title;
  IconData? leading;
  Widget? trailing;

  CategoryWidgetModel({required this.title, this.leading, this.trailing});
}

final List<CategoryWidgetModel> tiData = [
  CategoryWidgetModel(
      title: 'Lịch việt', leading: Icons.calendar_today_outlined),
  CategoryWidgetModel(title: 'Thời tiết', leading: Icons.cloud_outlined),
  CategoryWidgetModel(
      title: 'Kết quả xổ số', leading: Icons.confirmation_num_outlined),
  CategoryWidgetModel(
      title: 'Giá vàng', leading: Icons.account_balance_outlined),
  CategoryWidgetModel(
      title: 'Live Score', leading: Icons.sports_soccer_outlined),
  CategoryWidgetModel(
      title: 'Tiết kiệm 3G/ 4G truy cập', leading: Icons.network_cell_outlined),
];

final List<CategoryWidgetModel> cdData = [
  CategoryWidgetModel(
      title: 'Cỡ chữ & Font', leading: Icons.sort_by_alpha_outlined),
  CategoryWidgetModel(
      title: 'Theme',
      leading: Icons.dashboard_customize_outlined,
      trailing: Container(
        padding: EdgeInsets.all(3),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 1, color: Colors.green)),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 1, color: Colors.green)),
        ),
      )),
  CategoryWidgetModel(
    title: 'Giọng đọc',
    leading: Icons.keyboard_voice_outlined,
    trailing: Text(
      'Mặc định',
      style: TextStyle(color: Colors.grey),
    ),
  ),
  CategoryWidgetModel(
      title: 'Tin địa phương',
      leading: Icons.account_balance_outlined,
      trailing: Text(
        'Chọn địa phương',
        style: TextStyle(color: Colors.grey),
      )),
  CategoryWidgetModel(title: 'Nâng cao', leading: Icons.attractions_outlined),
];

final List<CategoryWidgetModel> spData = [
  CategoryWidgetModel(title: 'Liên hệ'),
  CategoryWidgetModel(title: 'Đối tác chính thức'),
  CategoryWidgetModel(
    title: 'Kiểm tra phiên bản mới',
    trailing: Text(
      '22.07',
      style: TextStyle(color: Colors.green),
    ),
  ),
  CategoryWidgetModel(title: 'Điều khoản sử dụng'),
  CategoryWidgetModel(title: 'Chính sách bảo mật'),
  CategoryWidgetModel(title: 'Bình chọn cho Báo Mới'),
  CategoryWidgetModel(title: 'Email góp ý, báo lỗi'),
];
