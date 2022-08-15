import 'package:flutter/material.dart';

class ReponseData {
  ReponseData({
    this.isSuccess,
    this.message,
    this.total,
    this.data,
  });

  bool? isSuccess;
  String? message;
  int? total;
  List<Post>? data;

  factory ReponseData.fromJson(Map<String, dynamic> json) => ReponseData(
        isSuccess: json["isSuccess"],
        message: json["message"],
        total: json["total"],
        data: List<Post>.from(json["data"].map((x) => Post.fromJson(x))),
      );
}

class Post with ChangeNotifier {
  Post({
    this.id,
    this.userName,
    this.brandName,
    this.title,
    this.phoneName,
    this.price,
    this.color,
    this.memory,
    this.description,
    this.imagePhoneUrl,
    required this.listImagePhoneUrl,
    this.totalImage,
    this.time,
    this.address,
    this.isFavorite,
  });

  int? id;
  String? userName;
  String? brandName;
  String? title;
  String? phoneName;
  double? price;
  String? color;
  dynamic? memory;
  String? description;
  String? imagePhoneUrl;
  List<ListImagePhoneUrl>? listImagePhoneUrl;
  int? totalImage;
  String? time;
  String? address;
  bool? isFavorite;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        userName: json["userName"],
        brandName: json["brandName"],
        title: json["title"],
        phoneName: json["phoneName"],
        price: json["price"],
        color: json["color"],
        memory: json["memory"],
        description: json["description"],
        imagePhoneUrl: json["imagePhoneUrl"],
        listImagePhoneUrl: List<ListImagePhoneUrl>.from(
            json["listImagePhoneUrl"]
                .map((x) => ListImagePhoneUrl.fromJson(x))),
        totalImage: json["totalImage"],
        time: json["time"],
        address: json["address"],
        isFavorite: json["isFavorite"],
      );
}

class ListImagePhoneUrl {
  ListImagePhoneUrl({
    this.url,
  });

  String? url;

  factory ListImagePhoneUrl.fromJson(Map<String, dynamic> json) =>
      ListImagePhoneUrl(
        url: json["url"],
      );
}
