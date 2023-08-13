// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce/core/constants/images.dart';

class BannerModel {
  String title;
  String imageUrl;
  BannerModel({
    required this.title,
    required this.imageUrl,
  });
  static List<BannerModel> homePageSliderItems = [
    BannerModel(title: "Fashion\nsale", imageUrl: ImageConstant.sliderImage1),
    BannerModel(title: "Fashion\nsale", imageUrl: ImageConstant.sliderImage1),
    BannerModel(title: "Fashion\nsale", imageUrl: ImageConstant.sliderImage1),
    BannerModel(title: "Fashion\nsale", imageUrl: ImageConstant.sliderImage1),
  ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
