class Temple {
  final int templeId;
  final String templeName;
  final String templeAddress;
  final String latitude;
  final String longitude;
  final String templeImage;
  final String templeDetail;
  final int provinceId;
  final int districtId;
  final int subdistrictId;
  double distance;

  Temple({
    required this.templeId,
    required this.templeName,
    required this.templeAddress,
    required this.latitude,
    required this.longitude,
    required this.templeImage,
    required this.templeDetail,
    required this.provinceId,
    required this.districtId,
    required this.subdistrictId,
    required this.distance,
  });

  factory Temple.fromJson(Map<String, dynamic> json) {
    return Temple(
      templeId: int.parse(json['templeId'].toString()),
      templeName: json['templeName'],
      templeAddress: json['templeAddress'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      templeImage: json['templeImage'],
      templeDetail: json['templeDetail'],
      provinceId: int.parse(json['provinceId'].toString()),
      districtId: int.parse(json['districtId'].toString()),
      subdistrictId: int.parse(json['subdistrictId'].toString()),
      distance: 0.0, // Initialize distance to 0
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'templeId': templeId,
      'templeName': templeName,
      'templeAddress': templeAddress,
      'latitude': latitude,
      'longitude': longitude,
      'templeImage': templeImage,
      'templeDetail': templeDetail,
      'provinceId': provinceId,
      'districtId': districtId,
      'subdistrictId': subdistrictId,
      'distance': distance,
    };
  }
}
