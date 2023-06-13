class Introduction {
  String? message;
  String? introId;
  String? introTempleImage;
  String? introTempleName;
  String? introTempleDetail;
  String? geographies; // added this line

  Introduction({
    this.message,
    this.introId,
    this.introTempleImage,
    this.introTempleName,
    this.introTempleDetail,
    this.geographies,
  });

  factory Introduction.fromJson(Map<String, dynamic> json) {
    return Introduction(
      message: json['message'],
      introId: json['introId'],
      introTempleImage: json['introTempleImage'],
      introTempleName: json['introTempleName'],
      introTempleDetail: json['introTempleDetail'],
      geographies: json['geographies'], // added this line
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'introId': introId,
      'introTempleImage': introTempleImage,
      'introTempleName': introTempleName,
      'introTempleDetail': introTempleDetail,
      'geographies': geographies, // added this line
    };
  }
}
