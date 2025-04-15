/// success : true
/// message : "success"
/// data : {"id":60,"category_name":"Electronic Accessories","category_slug":"electronic-accessories","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/category/Electronic+Accessories.png","product_count":197,"children":[{"id":3,"category_name":"White Title","category_slug":"white-title","image_url":null,"product_count":0},{"id":4,"category_name":"White Title","category_slug":"white-title","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/categories/image 75.png","product_count":0},{"id":5,"category_name":"White Title","category_slug":"white-title","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/categories/image 75.png","product_count":0}]}

class SubCategoryModel {
  SubCategoryModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  SubCategoryModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;

  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// id : 60
/// category_name : "Electronic Accessories"
/// category_slug : "electronic-accessories"
/// image_url : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/category/Electronic+Accessories.png"
/// product_count : 197
/// children : [{"id":3,"category_name":"White Title","category_slug":"white-title","image_url":null,"product_count":0},{"id":4,"category_name":"White Title","category_slug":"white-title","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/categories/image 75.png","product_count":0},{"id":5,"category_name":"White Title","category_slug":"white-title","image_url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/categories/image 75.png","product_count":0}]

class Data {
  Data({
    num? id,
    String? categoryName,
    String? categorySlug,
    String? imageUrl,
    num? productCount,
    List<Children>? children,
  }) {
    _id = id;
    _categoryName = categoryName;
    _categorySlug = categorySlug;
    _imageUrl = imageUrl;
    _productCount = productCount;
    _children = children;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['category_name'];
    _categorySlug = json['category_slug'];
    _imageUrl = json['image_url'];
    _productCount = json['product_count'];
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(Children.fromJson(v));
      });
    }
  }
  num? _id;
  String? _categoryName;
  String? _categorySlug;
  String? _imageUrl;
  num? _productCount;
  List<Children>? _children;

  num? get id => _id;
  String? get categoryName => _categoryName;
  String? get categorySlug => _categorySlug;
  String? get imageUrl => _imageUrl;
  num? get productCount => _productCount;
  List<Children>? get children => _children;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_name'] = _categoryName;
    map['category_slug'] = _categorySlug;
    map['image_url'] = _imageUrl;
    map['product_count'] = _productCount;
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 3
/// category_name : "White Title"
/// category_slug : "white-title"
/// image_url : null
/// product_count : 0

class Children {
  Children({
    num? id,
    String? categoryName,
    String? categorySlug,
    dynamic imageUrl,
    num? productCount,
  }) {
    _id = id;
    _categoryName = categoryName;
    _categorySlug = categorySlug;
    _imageUrl = imageUrl;
    _productCount = productCount;
  }

  Children.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['category_name'];
    _categorySlug = json['category_slug'];
    _imageUrl = json['image_url'];
    _productCount = json['product_count'];
  }
  num? _id;
  String? _categoryName;
  String? _categorySlug;
  dynamic _imageUrl;
  num? _productCount;

  num? get id => _id;
  String? get categoryName => _categoryName;
  String? get categorySlug => _categorySlug;
  dynamic get imageUrl => _imageUrl;
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
