
class WishListModel {
  WishListModel({
    bool? success,
    String? message,
    Pagination? pagination,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _pagination = pagination;
    _data = data;
  }

  WishListModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  bool? _success;
  String? _message;
  Pagination? _pagination;
  List<Data>? _data;

  bool? get success => _success;

  String? get message => _message;

  Pagination? get pagination => _pagination;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    num? id,
    String? originalPrice,
    String? wishlistToken,
    bool? onSale,
    String? expiration,
    num? quantity,
    Slug? slug,
    String? createdAt,
    List<num>? variations,
  }) {
    _id = id;
    _originalPrice = originalPrice;
    _wishlistToken = wishlistToken;
    _onSale = onSale;
    _expiration = expiration;
    _quantity = quantity;
    _slug = slug;
    _createdAt = createdAt;
    _variations = variations;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _originalPrice = json['original_price'];
    _wishlistToken = json['wishlist_token'];
    _onSale = json['on_sale'];
    _expiration = json['expiration'];
    _quantity = json['quantity'];
    _slug = json['product_id'] != null
        ? Slug.fromJson(json['product_id'])
        : null;
    _createdAt = json['created_at'];
    _variations =
        json['variations'] != null ? json['variations'].cast<num>() : [];
  }

  num? _id;
  String? _originalPrice;
  String? _wishlistToken;
  bool? _onSale;
  String? _expiration;
  num? _quantity;
  Slug? _slug;
  String? _createdAt;
  List<num>? _variations;

  num? get id => _id;

  String? get originalPrice => _originalPrice;

  String? get wishlistToken => _wishlistToken;

  bool? get onSale => _onSale;

  String? get expiration => _expiration;

  num? get quantity => _quantity;

  Slug? get slug => _slug;

  String? get createdAt => _createdAt;

  List<num>? get variations => _variations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['original_price'] = _originalPrice;
    map['wishlist_token'] = _wishlistToken;
    map['on_sale'] = _onSale;
    map['expiration'] = _expiration;
    map['quantity'] = _quantity;
    if (_slug != null) {
      map['product_id'] = _slug?.toJson();
    }
    map['created_at'] = _createdAt;
    map['variations'] = _variations;
    return map;
  }
}

class Slug {
  Slug({
    num? id,
    String? productTitle,
    String? slug,
    String? productShortDescription,
    String? price,
    String? regularPrice,
    List<ImageIds>? imageIds,
    String? productType,
    num? brandId,
    bool? isMultiImage,
    bool? isFeatured,
    num? averageRating,
    num? ratingCount,
    String? salePrice,
    bool? isOnSale,
    dynamic dateOnSaleFrom,
    dynamic dateOnSaleTo,
  }) {
    _id = id;
    _productTitle = productTitle;
    _slug = slug;
    _productShortDescription = productShortDescription;
    _price = price;
    _regularPrice = regularPrice;
    _imageIds = imageIds;
    _productType = productType;
    _brandId = brandId;
    _isMultiImage = isMultiImage;
    _isFeatured = isFeatured;
    _averageRating = averageRating;
    _ratingCount = ratingCount;
    _salePrice = salePrice;
    _isOnSale = isOnSale;
    _dateOnSaleFrom = dateOnSaleFrom;
    _dateOnSaleTo = dateOnSaleTo;
  }

  Slug.fromJson(dynamic json) {
    _id = json['id'];
    _productTitle = json['product_title'];
    _slug = json['product_slug'];
    _productShortDescription = json['product_short_description'];
    _price = json['price'];
    _regularPrice = json['regular_price'];
    if (json['image_ids'] != null) {
      _imageIds = [];
      json['image_ids'].forEach((v) {
        _imageIds?.add(ImageIds.fromJson(v));
      });
    }
    _productType = json['product_type'];
    _brandId = json['brand_id'];
    _isMultiImage = json['is_multi_image'];
    _isFeatured = json['is_featured'];
    _averageRating = json['average_rating'];
    _ratingCount = json['rating_count'];
    _salePrice = json['sale_price'];
    _isOnSale = json['is_on_sale'];
    _dateOnSaleFrom = json['date_on_sale_from'];
    _dateOnSaleTo = json['date_on_sale_to'];
  }

  num? _id;
  String? _productTitle;
  String? _slug;
  String? _productShortDescription;
  String? _price;
  String? _regularPrice;
  List<ImageIds>? _imageIds;
  String? _productType;
  num? _brandId;
  bool? _isMultiImage;
  bool? _isFeatured;
  num? _averageRating;
  num? _ratingCount;
  String? _salePrice;
  bool? _isOnSale;
  dynamic _dateOnSaleFrom;
  dynamic _dateOnSaleTo;

  num? get id => _id;

  String? get productTitle => _productTitle;

  String? get slug => _slug;

  String? get productShortDescription => _productShortDescription;

  String? get price => _price;

  String? get regularPrice => _regularPrice;

  List<ImageIds>? get imageIds => _imageIds;

  String? get productType => _productType;

  num? get brandId => _brandId;

  bool? get isMultiImage => _isMultiImage;

  bool? get isFeatured => _isFeatured;

  num? get averageRating => _averageRating;

  num? get ratingCount => _ratingCount;

  String? get salePrice => _salePrice;

  bool? get isOnSale => _isOnSale;

  dynamic get dateOnSaleFrom => _dateOnSaleFrom;

  dynamic get dateOnSaleTo => _dateOnSaleTo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_title'] = _productTitle;
    map['product_slug'] = _slug;
    map['product_short_description'] = _productShortDescription;
    map['price'] = _price;
    map['regular_price'] = _regularPrice;
    if (_imageIds != null) {
      map['image_ids'] = _imageIds?.map((v) => v.toJson()).toList();
    }
    map['product_type'] = _productType;
    map['brand_id'] = _brandId;
    map['is_multi_image'] = _isMultiImage;
    map['is_featured'] = _isFeatured;
    map['average_rating'] = _averageRating;
    map['rating_count'] = _ratingCount;
    map['sale_price'] = _salePrice;
    map['is_on_sale'] = _isOnSale;
    map['date_on_sale_from'] = _dateOnSaleFrom;
    map['date_on_sale_to'] = _dateOnSaleTo;
    return map;
  }
}

/// id : 108
/// name : "244-1.jpg"
/// alt : ""
/// url : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/08/244-1.jpg"
/// product_image_meta : {"card":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/8/244-1_300*200.jpg","mobile":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/8/244-1_375*250.jpg","tablet":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/8/244-1_768*512.jpg","product":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/8/244-1_600*400.jpg","original":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/08/244-1.jpg"}
/// caption : null
/// media_type : "image"

class ImageIds {
  ImageIds({
    num? id,
    String? name,
    String? alt,
    String? url,
    ProductImageMeta? productImageMeta,
    dynamic caption,
    String? mediaType,
  }) {
    _id = id;
    _name = name;
    _alt = alt;
    _url = url;
    _productImageMeta = productImageMeta;
    _caption = caption;
    _mediaType = mediaType;
  }

  ImageIds.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _alt = json['alt'];
    _url = json['url'];
    _productImageMeta = json['product_image_meta'] != null
        ? ProductImageMeta.fromJson(json['product_image_meta'])
        : null;
    _caption = json['caption'];
    _mediaType = json['media_type'];
  }

  num? _id;
  String? _name;
  String? _alt;
  String? _url;
  ProductImageMeta? _productImageMeta;
  dynamic _caption;
  String? _mediaType;

  num? get id => _id;

  String? get name => _name;

  String? get alt => _alt;

  String? get url => _url;

  ProductImageMeta? get productImageMeta => _productImageMeta;

  dynamic get caption => _caption;

  String? get mediaType => _mediaType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['alt'] = _alt;
    map['url'] = _url;
    if (_productImageMeta != null) {
      map['product_image_meta'] = _productImageMeta?.toJson();
    }
    map['caption'] = _caption;
    map['media_type'] = _mediaType;
    return map;
  }
}

/// card : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/8/244-1_300*200.jpg"
/// mobile : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/8/244-1_375*250.jpg"
/// tablet : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/8/244-1_768*512.jpg"
/// product : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/8/244-1_600*400.jpg"
/// original : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/08/244-1.jpg"

class ProductImageMeta {
  ProductImageMeta({
    String? card,
    String? mobile,
    String? tablet,
    String? product,
    String? original,
  }) {
    _card = card;
    _mobile = mobile;
    _tablet = tablet;
    _product = product;
    _original = original;
  }

  ProductImageMeta.fromJson(dynamic json) {
    _card = json['card'];
    _mobile = json['mobile'];
    _tablet = json['tablet'];
    _product = json['product'];
    _original = json['original'];
  }

  String? _card;
  String? _mobile;
  String? _tablet;
  String? _product;
  String? _original;

  String? get card => _card;

  String? get mobile => _mobile;

  String? get tablet => _tablet;

  String? get product => _product;

  String? get original => _original;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['card'] = _card;
    map['mobile'] = _mobile;
    map['tablet'] = _tablet;
    map['product'] = _product;
    map['original'] = _original;
    return map;
  }
}

/// next : "http://dapperz-backend-production.up.railway.app/api/wish-list/?page=2"
/// previous : null
/// count : 20
/// total_pages : 2
/// current_page : 1

class Pagination {
  Pagination({
    String? next,
    dynamic previous,
    num? count,
    num? totalPages,
    num? currentPage,
  }) {
    _next = next;
    _previous = previous;
    _count = count;
    _totalPages = totalPages;
    _currentPage = currentPage;
  }

  Pagination.fromJson(dynamic json) {
    _next = json['next'];
    _previous = json['previous'];
    _count = json['count'];
    _totalPages = json['total_pages'];
    _currentPage = json['current_page'];
  }

  String? _next;
  dynamic _previous;
  num? _count;
  num? _totalPages;
  num? _currentPage;

  String? get next => _next;

  dynamic get previous => _previous;

  num? get count => _count;

  num? get totalPages => _totalPages;

  num? get currentPage => _currentPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['next'] = _next;
    map['previous'] = _previous;
    map['count'] = _count;
    map['total_pages'] = _totalPages;
    map['current_page'] = _currentPage;
    return map;
  }
}
