class Introduction {
  String? message;
  String? introId;
  String? introTempleImage;
  String? introTempleName;
  String? introTempleDetail;

  Introduction(
      {this.message,
      this.introId,
      this.introTempleImage,
      this.introTempleName,
      this.introTempleDetail});

  Introduction.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    introId = json['introId'];
    introTempleImage = json['introTempleImage'];
    introTempleName = json['introTempleName'];
    introTempleDetail = json['introTempleDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['introId'] = this.introId;
    data['introTempleImage'] = this.introTempleImage;
    data['introTempleName'] = this.introTempleName;
    data['introTempleDetail'] = this.introTempleDetail;
    return data;
  }
}
