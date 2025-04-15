/// success : true
/// message : "Success"
/// data : [{"id":60,"category_name":"Electronic Accessories","category_slug":"electronic-accessories","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/category/Electronic+Accessories.png","product_count":197},{"id":159,"category_name":"Building Material","category_slug":"building-material","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/category/Building-Material.jpg","product_count":78},{"id":169,"category_name":"Tiles","category_slug":"tiles","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/category/Tiles.jpg","product_count":138},{"id":180,"category_name":"Plumbing","category_slug":"plumbing","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/category/Plumbing.jpg","product_count":390},{"id":186,"category_name":"Colors","category_slug":"colors","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/category/Colors.jpg","product_count":40},{"id":192,"category_name":"Electricals","category_slug":"electricals","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/category/Electricals.jpg","product_count":882},{"id":199,"category_name":"Furniture","category_slug":"furniture","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/category/Furniture.jpg","product_count":1065},{"id":545,"category_name":"SEWERAGE PIPE","category_slug":"sewerage-pipe","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/category/SEWERAGE+PIPE.png","product_count":2},{"id":773,"category_name":"Fabrication Material","category_slug":"fabrication-material","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/category/Fabrication+Material.jpg","product_count":21},{"id":865,"category_name":"Sanitary","category_slug":"sanitary","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/category/Sanitary.jpg","product_count":4092},{"id":1186,"category_name":"Lights","category_slug":"lights","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/category/Lights.png","product_count":0}]

class ParentCategoryModel {
  ParentCategoryModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  ParentCategoryModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  bool? _success;
  String? _message;
  List<Data>? _data;

  bool? get success => _success;

  String? get message => _message;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 60
/// category_name : "Electronic Accessories"
/// category_slug : "electronic-accessories"
/// image_url : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/category/Electronic+Accessories.png"
/// product_count : 197

class Data {
  Data({
    num? id,
    String? categoryName,
    String? categorySlug,
    String? imageUrl,
    num? productCount,
  }) {
    _id = id;
    _categoryName = categoryName;
    _categorySlug = categorySlug;
    _imageUrl = imageUrl;
    _productCount = productCount;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['category_name'];
    _categorySlug = json['category_slug'];
    _imageUrl = json['image_url'];
    _productCount = json['product_count'];
  }

  num? _id;
  String? _categoryName;
  String? _categorySlug;
  String? _imageUrl;
  num? _productCount;

  num? get id => _id;

  String? get categoryName => _categoryName;

  String? get categorySlug => _categorySlug;

  String? get imageUrl => _imageUrl;

  num? get productCount => _productCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_name'] = _categoryName;
    map['category_slug'] = _categorySlug;
    map['image_url'] = _imageUrl;
    map['product_count'] = _productCount;
    return map;
  }
}
