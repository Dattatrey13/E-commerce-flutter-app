/// success : true
/// message : "Data fetched successfully."
/// data : [{"id":29,"cart_id":3,"product_id":{"id":79694,"product_title":"BATHROOT ACCESSORIES | Heavy-Duty Stainless Steel Tumbler holder for Bathroom Accessories","product_slug":"bathroot-accessories-heavy-duty-stainless-steel-tumbler-holder-for-bathroom-accessories-2","product_short_description":"<p>Brand &#8211; Bathroot Accessories<br />\nProduct Name &#8211; Tumbler holder<br />\nSeries &#8211; classic<br />\nColour &#8211; Multi Colours variation<br />\nMaterials &#8211; SS304</p>\n","price":"455","regular_price":"455.00","image_id":{"id":34,"name":"02-1.jpg","alt":"","url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/08/02-1.jpg","caption":null}},"variation_id":{"id":12555,"product_id":79694,"price":"1055","stock_status":"instock","regular_price":"1055.00","sale_price":"455","is_on_sale":true,"image_id":{"id":34,"name":"02-1.jpg","alt":"","url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/08/02-1.jpg","caption":null}},"quantity":15,"line_subtotal":6825,"line_total":6825,"line_tax":0,"cgst_tax":0,"sgst_tax":0,"tax_class_id":null,"shipping_class_id":null,"cart_item_key":"48e079bb-2a8c-4fe2-91ad-5b0da9dc15d5"},{"id":30,"cart_id":3,"product_id":{"id":78019,"product_title":"PARRYWARE T6002A1 ACCESSORIES STANDARD Towel Ring (dia 7”)","product_slug":"parryware-t6002a1-accessories-standard-towel-ring-dia-7","product_short_description":"<p>Brand &#8211; Parryware<br />\nProduct Code &#8211;  T6002A1<br />\nColour &#8211; Silver<br />\nMaterial &#8211; Stainless Steel<br />\nFinish Type &#8211; chrome</p>\n","price":"924","regular_price":"924.00","image_id":{"id":5257,"name":"T6002A1-1.jpg","alt":"","url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/08/T6002A1-1.jpg","caption":null}},"variation_id":null,"quantity":5,"line_subtotal":4620,"line_total":5451.6,"line_tax":831.6,"cgst_tax":415.8,"sgst_tax":415.8,"tax_class_id":7,"shipping_class_id":null,"cart_item_key":"cf194e84-f2b4-42df-98c3-0ac991ce029c"}]

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

/// id : 29
/// cart_id : 3
/// product_id : {"id":79694,"product_title":"BATHROOT ACCESSORIES | Heavy-Duty Stainless Steel Tumbler holder for Bathroom Accessories","product_slug":"bathroot-accessories-heavy-duty-stainless-steel-tumbler-holder-for-bathroom-accessories-2","product_short_description":"<p>Brand &#8211; Bathroot Accessories<br />\nProduct Name &#8211; Tumbler holder<br />\nSeries &#8211; classic<br />\nColour &#8211; Multi Colours variation<br />\nMaterials &#8211; SS304</p>\n","price":"455","regular_price":"455.00","image_id":{"id":34,"name":"02-1.jpg","alt":"","url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/08/02-1.jpg","caption":null}}
/// variation_id : {"id":12555,"product_id":79694,"price":"1055","stock_status":"instock","regular_price":"1055.00","sale_price":"455","is_on_sale":true,"image_id":{"id":34,"name":"02-1.jpg","alt":"","url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/08/02-1.jpg","caption":null}}
/// quantity : 15
/// line_subtotal : 6825
/// line_total : 6825
/// line_tax : 0
/// cgst_tax : 0
/// sgst_tax : 0
/// tax_class_id : null
/// shipping_class_id : null
/// cart_item_key : "48e079bb-2a8c-4fe2-91ad-5b0da9dc15d5"

class Data {
  Data({
    num? id,
    num? cartId,
    Slug? slug,
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
  }) {
    _id = id;
    _cartId = cartId;
    _slug = slug;
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
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _cartId = json['cart_id'];
    _slug = json['product_id'] != null
        ? Slug.fromJson(json['product_id'])
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
  }

  num? _id;
  num? _cartId;
  Slug? _slug;
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

  num? get id => _id;

  num? get cartId => _cartId;

  Slug? get slug => _slug;

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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cart_id'] = _cartId;
    if (_slug != null) {
      map['product_id'] = _slug?.toJson();
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

/// id : 12555
/// product_id : 79694
/// price : "1055"
/// stock_status : "instock"
/// regular_price : "1055.00"
/// sale_price : "455"
/// is_on_sale : true
/// image_id : {"id":34,"name":"02-1.jpg","alt":"","url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/08/02-1.jpg","caption":null}

class VariationId {
  VariationId({
    num? id,
    num? slug,
    String? price,
    String? stockStatus,
    String? regularPrice,
    String? salePrice,
    bool? isOnSale,
    ImageId? imageId,
  }) {
    _id = id;
    _slug = slug;
    _price = price;
    _stockStatus = stockStatus;
    _regularPrice = regularPrice;
    _salePrice = salePrice;
    _isOnSale = isOnSale;
    _imageId = imageId;
  }

  VariationId.fromJson(dynamic json) {
    _id = json['id'];
    _slug = json['product_id'];
    _price = json['price'];
    _stockStatus = json['stock_status'];
    _regularPrice = json['regular_price'];
    _salePrice = json['sale_price'];
    _isOnSale = json['is_on_sale'];
    _imageId =
        json['image_id'] != null ? ImageId.fromJson(json['image_id']) : null;
  }

  num? _id;
  num? _slug;
  String? _price;
  String? _stockStatus;
  String? _regularPrice;
  String? _salePrice;
  bool? _isOnSale;
  ImageId? _imageId;

  num? get id => _id;

  num? get slug => _slug;

  String? get price => _price;

  String? get stockStatus => _stockStatus;

  String? get regularPrice => _regularPrice;

  String? get salePrice => _salePrice;

  bool? get isOnSale => _isOnSale;

  ImageId? get imageId => _imageId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _slug;
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

/// id : 34
/// name : "02-1.jpg"
/// alt : ""
/// url : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/08/02-1.jpg"
/// caption : null

class ImageId {
  ImageId({
    num? id,
    String? name,
    String? alt,
    String? url,
    dynamic caption,
  }) {
    _id = id;
    _name = name;
    _alt = alt;
    _url = url;
    _caption = caption;
  }

  ImageId.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _alt = json['alt'];
    _url = json['url'];
    _caption = json['caption'];
  }

  num? _id;
  String? _name;
  String? _alt;
  String? _url;
  dynamic _caption;

  num? get id => _id;

  String? get name => _name;

  String? get alt => _alt;

  String? get url => _url;

  dynamic get caption => _caption;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['alt'] = _alt;
    map['url'] = _url;
    map['caption'] = _caption;
    return map;
  }
}

/// id : 79694
/// product_title : "BATHROOT ACCESSORIES | Heavy-Duty Stainless Steel Tumbler holder for Bathroom Accessories"
/// product_slug : "bathroot-accessories-heavy-duty-stainless-steel-tumbler-holder-for-bathroom-accessories-2"
/// product_short_description : "<p>Brand &#8211; Bathroot Accessories<br />\nProduct Name &#8211; Tumbler holder<br />\nSeries &#8211; classic<br />\nColour &#8211; Multi Colours variation<br />\nMaterials &#8211; SS304</p>\n"
/// price : "455"
/// regular_price : "455.00"
/// image_id : {"id":34,"name":"02-1.jpg","alt":"","url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/08/02-1.jpg","caption":null}

class Slug {
  Slug({
    num? id,
    String? productTitle,
    String? slug,
    String? productShortDescription,
    String? price,
    String? regularPrice,
    ImageId? imageId,
  }) {
    _id = id;
    _productTitle = productTitle;
    _slug = slug;
    _productShortDescription = productShortDescription;
    _price = price;
    _regularPrice = regularPrice;
    _imageId = imageId;
  }

  Slug.fromJson(dynamic json) {
    _id = json['id'];
    _productTitle = json['product_title'];
    _slug = json['product_slug'];
    _productShortDescription = json['product_short_description'];
    _price = json['price'];
    _regularPrice = json['regular_price'];
    _imageId =
        json['image_id'] != null ? ImageId.fromJson(json['image_id']) : null;
  }

  num? _id;
  String? _productTitle;
  String? _slug;
  String? _productShortDescription;
  String? _price;
  String? _regularPrice;
  ImageId? _imageId;

  num? get id => _id;

  String? get productTitle => _productTitle;


  String? get slug => _slug;

  String? get productShortDescription => _productShortDescription;

  String? get price => _price;

  String? get regularPrice => _regularPrice;

  ImageId? get imageId => _imageId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_title'] = _productTitle;
    map['product_slug'] = _slug;
    map['product_short_description'] = _productShortDescription;
    map['price'] = _price;
    map['regular_price'] = _regularPrice;
    if (_imageId != null) {
      map['image_id'] = _imageId?.toJson();
    }
    return map;
  }
}

/// id : 34
/// name : "02-1.jpg"
/// alt : ""
/// url : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/08/02-1.jpg"
/// caption : null
