import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/my_image.dart';
import '../models/new_channel.dart';
import '../models/category.dart';

const logoNic =
    "https://old-freec2-production.s3.amazonaws.com/companyThumbnail/company2406/w375/1577349146ae2de99dff3dce4ed2050393c9a2a4bd404e8559.";

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

const List<LatLng> latLngList = [
  LatLng(10.7897002, 106.708346),
  LatLng(10.793058720917088, 106.71125147476975),
  LatLng(10.792958599974321, 106.71055410055935),
  LatLng(10.793216806482066, 106.71004984530504),
  LatLng(10.792573924561598, 106.70931492009396),
  LatLng(10.792753088513704, 106.71127829693523),
  LatLng(10.792753088513704, 106.7121044172455),
  LatLng(10.791957388969132, 106.71133194111124),
  LatLng(10.791535825442898, 106.70973870908428),
  LatLng(10.79432340328834, 106.70947048820433),
  LatLng(10.794407715258897, 106.71116027974807),
  LatLng(10.79421274379106, 106.71154115339759),
  LatLng(10.792768897092591, 106.71272668968702),
  LatLng(10.793575133513025, 106.70965824282031),
  LatLng(10.793880765054773, 106.70934710659954),
  LatLng(10.794439332241758, 106.71119246625365),
  LatLng(10.793822800475922, 106.71175573010156),
  LatLng(10.793638367650619, 106.71261403691743),
  LatLng(10.793063990412442, 106.7134240639749),
  LatLng(10.792210326801078, 106.70938465752273),
  LatLng(10.792600272201073, 106.7084673419923),
];

const List<MyImage> imagesNicMap = [
  MyImage(["https://api-portal.nichietsuvn.com/storage/introductions/27122021/61c96cb8df8f3.png"], 1),
  MyImage([
    "https://aptech.fpt.edu.vn/wp-content/uploads/2021/04/11-01-20_pic6.jpeg",
    "https://2030club.vn/wp-content/uploads/2022/02/hanh-trinh-tuan-xuan-2022-clbdn2030-3.jpg"
  ], 2),
  MyImage(["https://2030club.vn/wp-content/uploads/2022/05/111.png"], 1),
  MyImage([
    "https://aptech.fpt.edu.vn/wp-content/uploads/2021/04/11-01-20_pic6.jpeg",
    "https://2030club.vn/wp-content/uploads/2022/02/hanh-trinh-tuan-xuan-2022-clbdn2030-3.jpg"
  ], 2),
  MyImage(["https://jobsgo.vn/media/img/employer/54744-cover-app.jpg"], 1),
  MyImage([
    "https://aptech.fpt.edu.vn/wp-content/uploads/2021/04/11-01-20_pic6.jpeg",
    "https://2030club.vn/wp-content/uploads/2022/02/hanh-trinh-tuan-xuan-2022-clbdn2030-3.jpg"
  ], 2),
  MyImage(["https://api-portal.nichietsuvn.com/storage/introductions/27122021/61c96cb8df8f3.png"], 1),
  MyImage([
    "https://aptech.fpt.edu.vn/wp-content/uploads/2021/04/11-01-20_pic6.jpeg",
    "https://2030club.vn/wp-content/uploads/2022/02/hanh-trinh-tuan-xuan-2022-clbdn2030-3.jpg"
  ], 2),
  MyImage(["https://2030club.vn/wp-content/uploads/2022/05/111.png", ""], 1),
  MyImage([
    "https://aptech.fpt.edu.vn/wp-content/uploads/2021/04/11-01-20_pic6.jpeg",
    "https://2030club.vn/wp-content/uploads/2022/02/hanh-trinh-tuan-xuan-2022-clbdn2030-3.jpg"
  ], 2),
  MyImage(["https://2030club.vn/wp-content/uploads/2022/05/111.png", ""], 1),
  MyImage([
    "https://aptech.fpt.edu.vn/wp-content/uploads/2021/04/11-01-20_pic6.jpeg",
    "https://2030club.vn/wp-content/uploads/2022/02/hanh-trinh-tuan-xuan-2022-clbdn2030-3.jpg"
  ], 2),
];
