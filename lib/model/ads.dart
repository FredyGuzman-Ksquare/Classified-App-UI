import '../utils/constants.dart';

class Ad {
  String? sId;
  String? title;
  String? description;
  num? price;
  List<String>? images;
  String? authorName;
  String? userId;
  String? mobile;
  String? createdAt;

  Ad({
    this.sId,
    this.title,
    this.description,
    this.price,
    this.images,
    this.authorName,
    this.userId,
    this.mobile,
    this.createdAt,
  });

  Ad.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '000';
    title = json['title'] ?? 'title';
    description = json['description'] ?? 'description';
    price = json['price'] ?? 0.0;
    images = List<String>.from(json['images'] ??
        [
          Constants.defaultImage,
        ]);

    authorName = json['authorName'] ?? 'user';
    userId = json['userId'] ?? 'user';
    mobile = json['mobile'] ?? 'mobile';
    createdAt = json['createdAt'] ?? 'createat';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['images'] = this.images;
    data['authorName'] = this.authorName;
    data['userId'] = this.userId;
    data['mobile'] = this.mobile;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
