class ProductListModel {
  ProductListModel({
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

  ProductListModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null && json['data'].isNotEmpty) {
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
    String? productTitle,
    String? slug,
    String? productShortDescription,
    String? price,
    String? regularPrice,
    List<ImageIds>? imageIds,
    String? productType,
    List<num>? variations,
    dynamic brandId,
    bool? isMultiImage,
    bool? isFeatured,
    num? averageRating,
    num? ratingCount,
    String? salePrice,
    bool? isOnSale,
    dynamic dateOnSaleFrom,
    dynamic dateOnSaleTo,
    bool? isInWishlist,
    bool? isInCart,
    String? wishlistToken,
    dynamic discountPercentage,
  }) {
    _id = id;
    _productTitle = productTitle;
    _slug = slug;
    _productShortDescription = productShortDescription;
    _price = price;
    _regularPrice = regularPrice;
    _imageIds = imageIds;
    _productType = productType;
    _variations = variations;
    _brandId = brandId;
    _isMultiImage = isMultiImage;
    _isFeatured = isFeatured;
    _averageRating = averageRating;
    _ratingCount = ratingCount;
    _salePrice = salePrice;
    _isOnSale = isOnSale;
    _dateOnSaleFrom = dateOnSaleFrom;
    _dateOnSaleTo = dateOnSaleTo;
    _isInWishlist = isInWishlist;
    _isInCart = isInCart;
    _wishlistToken = wishlistToken;
    _discountPercentage = discountPercentage;
  }

  Data.fromJson(dynamic json) {
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
    _variations =
        json['variations'] != null ? json['variations'].cast<num>() : [];
    _brandId = json['brand_id'];
    _isMultiImage = json['is_multi_image'];
    _isFeatured = json['is_featured'];
    _averageRating = json['average_rating'];
    _ratingCount = json['rating_count'];
    _salePrice = json['sale_price'];
    _isOnSale = json['is_on_sale'];
    _dateOnSaleFrom = json['date_on_sale_from'];
    _dateOnSaleTo = json['date_on_sale_to'];
    _isInWishlist = json['is_in_wishlist'];
    _isInCart = json['is_in_cart'];
    _wishlistToken = json['wishlist_token'];
    _discountPercentage = json['discount_percentage'];
  }

  num? _id;
  String? _productTitle;
  String? _slug;
  String? _productShortDescription;
  String? _price;
  String? _regularPrice;
  List<ImageIds>? _imageIds;
  String? _productType;
  List<num>? _variations;
  dynamic _brandId;
  bool? _isMultiImage;
  bool? _isFeatured;
  num? _averageRating;
  num? _ratingCount;
  String? _salePrice;
  bool? _isOnSale;
  dynamic _dateOnSaleFrom;
  dynamic _dateOnSaleTo;
  bool? _isInWishlist;
  bool? _isInCart;
  String? _wishlistToken;
  dynamic _discountPercentage;

  num? get id => _id;

  String? get productTitle => _productTitle;

  String? get slug => _slug;

  String? get productShortDescription => _productShortDescription;

  String? get price => _price;

  String? get regularPrice => _regularPrice;

  List<ImageIds>? get imageIds => _imageIds;

  String? get productType => _productType;

  List<num>? get variations => _variations;

  dynamic get brandId => _brandId;

  bool? get isMultiImage => _isMultiImage;

  bool? get isFeatured => _isFeatured;

  num? get averageRating => _averageRating;

  num? get ratingCount => _ratingCount;

  String? get salePrice => _salePrice;

  bool? get isOnSale => _isOnSale;

  dynamic get dateOnSaleFrom => _dateOnSaleFrom;

  dynamic get dateOnSaleTo => _dateOnSaleTo;

  bool? get isInWishlist => _isInWishlist;

  set setIsWishList(bool value) {
    _isInWishlist = value;
  }

  bool? get isInCart => _isInCart;

  String? get wishlistToken => _wishlistToken;

  dynamic get discountPercentage => _discountPercentage;

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
    map['variations'] = _variations;
    map['brand_id'] = _brandId;
    map['is_multi_image'] = _isMultiImage;
    map['is_featured'] = _isFeatured;
    map['average_rating'] = _averageRating;
    map['rating_count'] = _ratingCount;
    map['sale_price'] = _salePrice;
    map['is_on_sale'] = _isOnSale;
    map['date_on_sale_from'] = _dateOnSaleFrom;
    map['date_on_sale_to'] = _dateOnSaleTo;
    map['is_in_wishlist'] = _isInWishlist;
    map['is_in_cart'] = _isInCart;
    map['wishlist_token'] = _wishlistToken;
    map['discount_percentage'] = _discountPercentage;
    return map;
  }
}

class ImageIds {
  ImageIds({
    num? id,
    String? name,
    String? alt,
    String? url,
    ProductImageMeta? productImageMeta,
    dynamic caption,
    String? mediaType,
    bool? isDefault,
  }) {
    _id = id;
    _name = name;
    _alt = alt;
    _url = url;
    _productImageMeta = productImageMeta;
    _caption = caption;
    _mediaType = mediaType;
    _isDefault = isDefault;
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
    _isDefault = json['is_default'];
  }

  num? _id;
  String? _name;
  String? _alt;
  String? _url;
  ProductImageMeta? _productImageMeta;
  dynamic _caption;
  String? _mediaType;
  bool? _isDefault;

  num? get id => _id;

  String? get name => _name;

  String? get alt => _alt;

  String? get url => _url;

  ProductImageMeta? get productImageMeta => _productImageMeta;

  dynamic get caption => _caption;

  String? get mediaType => _mediaType;

  bool? get isDefault => _isDefault;

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
    map['is_default'] = _isDefault;
    return map;
  }
}

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
