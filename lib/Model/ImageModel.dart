
import 'dart:convert';

List<ImageModel> imageModelFromMap(String str) => List<ImageModel>.from(json.decode(str).map((x) => ImageModel.fromMap(x)));

String imageModelToMap(List<ImageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ImageModel {
  ImageModel({
    this.id = "",
    this.author = "",
    this.width = 0,
    this.height = 0,
    this.url = "",
    this.downloadUrl = "",
  });

  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  factory ImageModel.fromMap(Map<String, dynamic> json) => ImageModel(
    id: json["id"],
    author: json["author"],
    width: json["width"],
    height: json["height"],
    url: json["url"],
    downloadUrl: json["download_url"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "author": author,
    "width": width,
    "height": height,
    "url": url,
    "download_url": downloadUrl,
  };
}
