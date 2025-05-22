class CartListModel {
  CartListModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  CartListModel.fromJson(dynamic json) {
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
class Data {
  Data({
    num? id,
    num? cartId,
    ProductId? product_id,
    VariationId? variationId,
    num? quantity,
    num? lineSubtotal,
    num? lineTotal,
    num? lineTax,
    num? cgstTax,
    num? sgstTax,
    dynamic taxClassId,
    dynamic shippingClassId,
    String? cartItemKey,
    String? slug,
  }) {
    _id = id;
    _cartId = cartId;
    _productId = productId;
    _variationId = variationId;
    _quantity = quantity;
    _lineSubtotal = lineSubtotal;
    _lineTotal = lineTotal;
    _lineTax = lineTax;
    _cgstTax = cgstTax;
    _sgstTax = sgstTax;
    _taxClassId = taxClassId;
    _shippingClassId = shippingClassId;
    _cartItemKey = cartItemKey;
    _slug = slug;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _cartId = json['cart_id'];
    _productId = json['product_id'] != null
        ? ProductId.fromJson(json['product_id'])
        : null;
    _variationId = json['variation_id'] != null
        ? VariationId.fromJson(json['variation_id'])
        : null;
    _quantity = json['quantity'];
    _lineSubtotal = json['line_subtotal'];
    _lineTotal = json['line_total'];
    _lineTax = json['line_tax'];
    _cgstTax = json['cgst_tax'];
    _sgstTax = json['sgst_tax'];
    _taxClassId = json['tax_class_id'];
    _shippingClassId = json['shipping_class_id'];
    _cartItemKey = json['cart_item_key'];
    _slug = json['slug'];
  }

  num? _id;
  num? _cartId;
  ProductId? _productId;
  VariationId? _variationId;
  num? _quantity;
  num? _lineSubtotal;
  num? _lineTotal;
  num? _lineTax;
  num? _cgstTax;
  num? _sgstTax;
  dynamic _taxClassId;
  dynamic _shippingClassId;
  String? _cartItemKey;
  String? _slug;

  num? get id => _id;

  num? get cartId => _cartId;

  ProductId? get productId => _productId;

  VariationId? get variationId => _variationId;

  num? get quantity => _quantity;

  num? get lineSubtotal => _lineSubtotal;

  num? get lineTotal => _lineTotal;

  num? get lineTax => _lineTax;

  num? get cgstTax => _cgstTax;

  num? get sgstTax => _sgstTax;

  dynamic get taxClassId => _taxClassId;

  dynamic get shippingClassId => _shippingClassId;

  String? get cartItemKey => _cartItemKey;

  String? get slug => _slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cart_id'] = _cartId;
    if (_productId != null) {
      map['product_id'] = _productId?.toJson();
    }
    if (_variationId != null) {
      map['variation_id'] = _variationId?.toJson();
    }
    map['quantity'] = _quantity;
    map['line_subtotal'] = _lineSubtotal;
    map['line_total'] = _lineTotal;
    map['line_tax'] = _lineTax;
    map['cgst_tax'] = _cgstTax;
    map['sgst_tax'] = _sgstTax;
    map['tax_class_id'] = _taxClassId;
    map['shipping_class_id'] = _shippingClassId;
    map['cart_item_key'] = _cartItemKey;
    return map;
  }

  set setValue(dynamic value) {
    _quantity = num.parse(value);
  }
}
class VariationId {
  VariationId({
    num? id,
    num? product_id,
    String? price,
    String? stockStatus,
    String? regularPrice,
    String? salePrice,
    bool? isOnSale,
    ImageIds? imageIds,
  }) {
    _id = id;
    _product_id = product_id;
    _price = price;
    _stockStatus = stockStatus;
    _regularPrice = regularPrice;
    _salePrice = salePrice;
    _isOnSale = isOnSale;
    _imageIds = imageIds;
  }

  VariationId.fromJson(dynamic json) {
    _id = json['id'];
    _product_id = json['product_id'];
    _price = json['price'];
    _stockStatus = json['stock_status'];
    _regularPrice = json['regular_price'];
    _salePrice = json['sale_price'];
    _isOnSale = json['is_on_sale'];
    _imageIds =
        json['image_ids'] != null ? ImageIds.fromJson(json['image_ids']) : null;
  }

  num? _id;
  num? _product_id;
  String? _price;
  String? _stockStatus;
  String? _regularPrice;
  String? _salePrice;
  bool? _isOnSale;
  ImageIds? _imageIds;

  num? get id => _id;

  num? get Product_Id => _product_id;

  String? get price => _price;

  String? get stockStatus => _stockStatus;

  String? get regularPrice => _regularPrice;

  String? get salePrice => _salePrice;

  bool? get isOnSale => _isOnSale;

  ImageIds? get imageIds => _imageIds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _product_id;
    map['price'] = _price;
    map['stock_status'] = _stockStatus;
    map['regular_price'] = _regularPrice;
    map['sale_price'] = _salePrice;
    map['is_on_sale'] = _isOnSale;
    if (_imageIds != null) {
      map['image_ids'] = _imageIds?.toJson();
    }
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
  }) {
    _id = id;
    _name = name;
    _alt = alt;
    _url = url;
    _productImageMeta = productImageMeta;
    _caption = caption;
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
  }

  num? _id;
  String? _name;
  String? _alt;
  String? _url;
  ProductImageMeta? _productImageMeta;
  dynamic _caption;

  num? get id => _id;

  String? get name => _name;

  String? get alt => _alt;

  String? get url => _url;

  ProductImageMeta? get productImageMeta => _productImageMeta;

  dynamic get caption => _caption;

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

class ProductId {
  ProductId({
    num? id,
    String? slug,
    String? productTitle,
    String? productSlug,
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
    ImageIds? defaultImage,
  }) {
    _id = id;
    _productTitle = productTitle;
    _productSlug = productSlug;
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
    _defaultImage = defaultImage;
  }

  ProductId.fromJson(dynamic json) {
    _id = json['id'];
    _slug = json['slug'];
    _productTitle = json['product_title'];
    _productSlug = json['product_slug'];
    _productShortDescription = json['product_short_description'];
    _price = json['price'];
    _regularPrice = json['regular_price'];
    if (json['image_ids'] != null) {
      _imageIds = [];
      json['image_ids'].forEach((v) {
        _imageIds?.add(ImageIds.fromJson(v));
      });
    }
    _defaultImage = json['default_image'] != null
        ?ImageIds.fromJson(json['default_image'])
        :null;
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
  String? _slug;
  String? _productTitle;
  String? _productSlug;
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
  ImageIds? _defaultImage;

  num? get id => _id;

  String? get productTitle => _productTitle;

  String? get productSlug => _productSlug;

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

  ImageIds? get defaultImage => _defaultImage;

  String? get slug => _slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_title'] = _productTitle;
    map['product_slug'] = _productSlug;
    map['product_short_description'] = _productShortDescription;
    map['price'] = _price;
    map['regular_price'] = _regularPrice;
    if (_imageIds != null) {
      map['image_ids'] = _imageIds?.map((v) => v.toJson()).toList();
    }
    if (_defaultImage != null) {
      map['default_image'] = _defaultImage?.toJson(); // <--- NEW
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