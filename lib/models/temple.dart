class Temple {
  final int id;
  final String name;
  final String address;
  final String district;
  final String province;
  final String postcode;
  final String phone;
  final String email;
  final String website;
  final String latitude;
  final String longitude;
  final String image;
  final String description;
  final String history;
  final String highlight;
  final String openTime;
  final String fee;
  final String contact;
  final String facilities;
  final String tips;
  final String travel;
  final String religion;
  final String category;
  final String subCategory;
  final String status;
  final String createBy;
  final String createDate;
  final String updateBy;
  final String updateDate;

  Temple({
    required this.id,
    required this.name,
    required this.address,
    required this.district,
    required this.province,
    required this.postcode,
    required this.phone,
    required this.email,
    required this.website,
    required this.latitude,
    required this.longitude,
    required this.image,
    required this.description,
    required this.history,
    required this.highlight,
    required this.openTime,
    required this.fee,
    required this.contact,
    required this.facilities,
    required this.tips,
    required this.travel,
    required this.religion,
    required this.category,
    required this.subCategory,
    required this.status,
    required this.createBy,
    required this.createDate,
    required this.updateBy,
    required this.updateDate,
  });

  factory Temple.fromJson(Map<String, dynamic> json) {
    return Temple(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      district: json['district'],
      province: json['province'],
      postcode: json['postcode'],
      phone: json['phone'],
      email: json['email'],
      website: json['website'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      image: json['image'],
      description: json['description'],
      history: json['history'],
      highlight: json['highlight'],
      openTime: json['open_time'],
      fee: json['fee'],
      contact: json['contact'],
      facilities: json['facilities'],
      tips: json['tips'],
      travel: json['travel'],
      religion: json['religion'],
      category: json['category'],
      subCategory: json['sub_category'],
      status: json['status'],
      createBy: json['create_by'],
      createDate: json['create_date'],
      updateBy: json['update_by'],
      updateDate: json['update_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'district': district,
      'province': province,
      'postcode': postcode,
      'phone': phone,
      'email': email,
      'website': website,
      'latitude': latitude,
      'longitude': longitude,
      'image': image,
      'description': description,
      'history': history,
      'highlight': highlight,
      'open_time': openTime,
      'fee': fee,
      'contact': contact,
      'facilities': facilities,
      'tips': tips,
      'travel': travel,
      'religion': religion,
      'category': category,
      'sub_category': subCategory,
      'status': status,
      'create_by': createBy,
      'create_date': createDate,
      'update_by': updateBy,
      'update_date': updateDate,
    };
  }
}
