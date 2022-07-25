import 'package:my_app/models/news_model.dart';

import '../models/News.dart';
import '../models/new_channel.dart';
import '../models/category.dart';

const List<Category> categoryList = [
  Category("Theo dõi", "https://photo-baomoi.bmcdn.me/w700_r1/2022_07_21_94_43230828/aee9fd3f227dcb23926c.jpg"),
  Category("Nóng", "https://photo-baomoi.bmcdn.me/w700_r1/2022_07_21_62_43230792/3d168cc15383badde392.jpg"),
  Category("Mới", "https://photo-baomoi.bmcdn.me/w700_r1/2022_07_21_62_43230796/8ce8083fd77d3e23676c.jpg"),
  Category("Tổng hợp", "https://cdnimg.vietnamplus.vn/t620/uploaded/fsmsy/2022_07_21/ttxvn_tet_co_truyen.jpg"),
  Category("Bóng đá VN",
      "https://znews-photo.zingcdn.me/w1920/Uploaded/mdf_drokxr/2020_01_07/Park_Hangseo_Piyapong_Pueon_4_zing.jpg"),
  Category("Bóng đá QT", "https://znews-photo.zingcdn.me/w1920/Uploaded/natmzz/2022_07_20/kk.JPG"),
  Category("Độc & lạ",
      "https://cdnimg.vietnamplus.vn/t620/uploaded/znaets/2022_07_21/283714058_546613890209737_6451879188130238480_n.jpg"),
  Category("Tình yêu",
      "https://image.vtc.vn/resize/th/upload/2022/07/20/z35803476660749318e8679247a8ffb685d23f436e0247-19103785.jpg"),
  Category("Giải trí",
      "https://image.vtc.vn/resize/th/upload/2022/07/20/z3580065240683eebee427321e5533e23b2ba91a6aa9d3-19175378.jpg"),
  Category("Thế giới", "https://photo-baomoi.bmcdn.me/w700_r1/2022_07_21_119_43229316/568cf64a2908c0569919.jpg"),
  Category("Pháp luật", "https://photo-baomoi.bmcdn.me/w700_r1/2022_07_21_65_43230373/ba5a7480abc2429c1bd3.jpg"),
  Category("Xe 360",
      "https://znews-photo.zingcdn.me/w860/Uploaded/zxgorz/2022_07_20/z3530565309061_731a68809c0c0fb6555692c3f2dff3d9_1.jpg"),
  Category("Công nghệ", "https://photo-baomoi.bmcdn.me/w700_r1/2022_07_21_236_22352176/9b54ea9635d4dc8a85c5.jpg"),
  Category("Ẩm thực", "https://photo-baomoi.bmcdn.me/w700_r1/2022_07_21_598_43227337/3e1d54e48ba662f83bb7.jpg"),
  Category("Làm đẹp", "https://photo-baomoi.bmcdn.me/w700_r1/2022_07_21_17_43230370/0da12f7bf03919674028.jpg"),
  Category("Sức khoẻ", "https://photo-baomoi.bmcdn.me/w700_r1/2022_07_21_17_43230370/fffdad2772659b3bc274.jpg"),
  Category("Du lịch", "https://photo-baomoi.bmcdn.me/w700_r1/2022_07_21_119_43229316/f91b4add959f7cc1258e.jpg"),
  Category("Nhà đất", "https://photo-baomoi.bmcdn.me/w700_r1/2022_07_21_180_43229752/2f4d5a9185d36c8d35c2.jpg"),
];

const List<NewsChannel> newChannelList = [
  NewsChannel("VietnamNet", "https://photo-baomoi.bmcdn.me/w700_r1/2022_07_21_94_43230828/aee9fd3f227dcb23926c.jpg"),
  NewsChannel("Tiền Phong", "https://photo-baomoi.bmcdn.me/w700_r1/2022_07_21_62_43230792/3d168cc15383badde392.jpg"),
  NewsChannel("VTC News", "https://photo-baomoi.bmcdn.me/w700_r1/2022_07_21_62_43230796/8ce8083fd77d3e23676c.jpg"),
  NewsChannel("Zing", "https://cdnimg.vietnamplus.vn/t620/uploaded/fsmsy/2022_07_21/ttxvn_tet_co_truyen.jpg"),
  NewsChannel("VOV",
      "https://znews-photo.zingcdn.me/w1920/Uploaded/mdf_drokxr/2020_01_07/Park_Hangseo_Piyapong_Pueon_4_zing.jpg"),
  NewsChannel("VietnamPlus", "https://znews-photo.zingcdn.me/w1920/Uploaded/natmzz/2022_07_20/kk.JPG"),
  NewsChannel("PLO",
      "https://cdnimg.vietnamplus.vn/t620/uploaded/znaets/2022_07_21/283714058_546613890209737_6451879188130238480_n.jpg"),
  NewsChannel("Infonet",
      "https://image.vtc.vn/resize/th/upload/2022/07/20/z35803476660749318e8679247a8ffb685d23f436e0247-19103785.jpg"),
];
