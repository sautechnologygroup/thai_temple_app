class Temple {
  final int templeId;
  final String templeName;
  final String templeAddress;
  final double latitude; // Update the type to double
  final double longitude; // Update the type to double
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
      templeId:
          json['templeId'] != null ? int.parse(json['templeId'].toString()) : 0,
      templeName: json['templeName'] ?? '',
      templeAddress: json['templeAddress'] ?? '',
      latitude: _parseDouble(json['latitude']),
      longitude: _parseDouble(json['longitude']),
      templeImage: json['templeImage'] ?? '',
      templeDetail: json['templeDetail'] ?? '',
      provinceId: json['provinceId'] != null
          ? int.parse(json['provinceId'].toString())
          : 0,
      districtId: json['districtId'] != null
          ? int.parse(json['districtId'].toString())
          : 0,
      subdistrictId: json['subdistrictId'] != null
          ? int.parse(json['subdistrictId'].toString())
          : 0,
      distance: 0.0, // Initialize distance to 0
    );
  }

  static double _parseDouble(dynamic value) {
    if (value is double) {
      return value;
    } else if (value is int) {
      return value.toDouble();
    } else if (value is String) {
      return double.tryParse(value) ?? 0.0;
    } else {
      return 0.0;
    }
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
