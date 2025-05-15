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
    Product_Id? product_id,
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
    _product_id = product_id;
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
    _product_id = json['product_id'] != null
        ? Product_Id.fromJson(json['product_id'])
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
  Product_Id? _product_id;
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

  Product_Id? get product_id => _product_id;

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
    if (_product_id != null) {
      map['product_id'] = _product_id?.toJson();
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
    ImageId? imageId,
  }) {
    _id = id;
    _product_id = product_id;
    _price = price;
    _stockStatus = stockStatus;
    _regularPrice = regularPrice;
    _salePrice = salePrice;
    _isOnSale = isOnSale;
    _imageId = imageId;
  }

  VariationId.fromJson(dynamic json) {
    _id = json['id'];
    _product_id = json['product_id'];
    _price = json['price'];
    _stockStatus = json['stock_status'];
    _regularPrice = json['regular_price'];
    _salePrice = json['sale_price'];
    _isOnSale = json['is_on_sale'];
    _imageId =
        json['image_id'] != null ? ImageId.fromJson(json['image_id']) : null;
  }

  num? _id;
  num? _product_id;
  String? _price;
  String? _stockStatus;
  String? _regularPrice;
  String? _salePrice;
  bool? _isOnSale;
  ImageId? _imageId;

  num? get id => _id;

  num? get Product_Id => _product_id;

  String? get price => _price;

  String? get stockStatus => _stockStatus;

  String? get regularPrice => _regularPrice;

  String? get salePrice => _salePrice;

  bool? get isOnSale => _isOnSale;

  ImageId? get imageId => _imageId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _product_id;
    map['price'] = _price;
    map['stock_status'] = _stockStatus;
    map['regular_price'] = _regularPrice;
    map['sale_price'] = _salePrice;
    map['is_on_sale'] = _isOnSale;
    if (_imageId != null) {
      map['image_id'] = _imageId?.toJson();
    }
    return map;
  }
}
class ImageId {
  ImageId({
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

  ImageId.fromJson(dynamic json) {
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

class Product_Id {
  product_id({
    num? id,
    String? slug,
    String? productTitle,
    String? productSlug,
    num? product_id,
    String? productShortDescription,
    String? price,
    String? regularPrice,
    ImageId? defaultImage,
  }) {
    _id = id;
    _productTitle = productTitle;
    _product_id = product_id;
    _productSlug = productSlug;
    _productShortDescription = productShortDescription;
    _price = price;
    _regularPrice = regularPrice;
    // _imageId = imageId;
    _defaultImage = defaultImage;

  }

  Product_Id.fromJson(dynamic json) {
    _id = json['id'];
    _slug: json['slug'];
    _productTitle = json['product_title'];
    _product_id = json['product_product_id'];
    _productSlug = json['product_slug'];
    _productShortDescription = json['product_short_description'];
    _price = json['price'];
    _regularPrice = json['regular_price'];
    // _imageId =
    //     json['image_id'] != null ? ImageId.fromJson(json['image_id']) : null;
    _defaultImage = json['default_image'] != null
        ?ImageId.fromJson(json['default_image'])
        :null;
  }

  num? _id;
  String? _slug;
  String? _productTitle;
  num? _product_id;
  String? _productSlug;
  String? _productShortDescription;
  String? _price;
  String? _regularPrice;
  // ImageId? _imageId;
  ImageId? _defaultImage;

  num? get id => _id;

  String? get productTitle => _productTitle;

  String? get productSlug => _productSlug;

  num? get productId => _product_id;

  String? get productShortDescription => _productShortDescription;

  String? get price => _price;

  String? get regularPrice => _regularPrice;

  // ImageId? get imageId => _imageId;
  ImageId? get defaultImage => _defaultImage;

  get slug => null;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_title'] = _productTitle;
    map['product_product_id'] = _product_id;
    map['product_slug'] = _productSlug;
    map['product_short_description'] = _productShortDescription;
    map['price'] = _price;
    map['regular_price'] = _regularPrice;
    // if (_imageId != null) {
    //   map['image_id'] = _imageId?.toJson();
    // }
    if (_defaultImage != null) {
      map['default_image'] = _defaultImage?.toJson(); // <--- NEW
    }
    return map;
  }
}