class OrderCheckoutModel {
  OrderCheckoutModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  OrderCheckoutModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null && json['data'].isNotEmpty
        ? Data.fromJson(json['data'])
        : null;
  }

  bool? _success;
  String? _message;
  Data? _data;

  OrderCheckoutModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      OrderCheckoutModel(
        success: success ?? _success,
        message: message ?? _message,
        data: data ?? _data,
      );

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

class Data {
  Data({
    num? id,
    String? number,
    String? invoiceNumber,
    String? createdVia,
    String? status,
    String? currency,
    String? discountTotal,
    String? discountTax,
    String? shippingTotal,
    String? shippingTax,
    String? cartTax,
    String? cartTaxHalf,
    String? total,
    String? totalTax,
    bool? pricesIncludeTax,
    CustomerId? customerId,
    dynamic customerIpAddress,
    dynamic customerUserAgent,
    dynamic orderNote,
    Billing? billing,
    Shipping? shipping,
    PaymentMethod? paymentMethod,
    String? paymentMethodTitle,
    String? transactionId,
    dynamic datePaid,
    dynamic dateCompleted,
    List<dynamic>? metaData,
    List<LineItems>? lineItems,
    List<dynamic>? couponLines,
    dynamic refunds,
    bool? setPaid,
    dynamic shippingClassId,
    TaxClassId? taxClassId,
    dynamic invoiceUrl,
  }) {
    _id = id;
    _number = number;
    _invoiceNumber = invoiceNumber;
    _createdVia = createdVia;
    _status = status;
    _currency = currency;
    _discountTotal = discountTotal;
    _discountTax = discountTax;
    _shippingTotal = shippingTotal;
    _shippingTax = shippingTax;
    _cartTax = cartTax;
    _cartTaxHalf = cartTaxHalf;
    _total = total;
    _totalTax = totalTax;
    _pricesIncludeTax = pricesIncludeTax;
    _customerId = customerId;
    _customerIpAddress = customerIpAddress;
    _customerUserAgent = customerUserAgent;
    _orderNote = orderNote;
    _billing = billing;
    _shipping = shipping;
    _paymentMethod = paymentMethod;
    _paymentMethodTitle = paymentMethodTitle;
    _transactionId = transactionId;
    _datePaid = datePaid;
    _dateCompleted = dateCompleted;
    _metaData = metaData;
    _lineItems = lineItems;
    _couponLines = couponLines;
    _refunds = refunds;
    _setPaid = setPaid;
    _shippingClassId = shippingClassId;
    _taxClassId = taxClassId;
    _invoiceUrl = invoiceUrl;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _number = json['number'];
    _invoiceNumber = json['invoice_number'];
    _createdVia = json['created_via'];
    _status = json['status'];
    _currency = json['currency'];
    _discountTotal = json['discount_total'];
    _discountTax = json['discount_tax'];
    _shippingTotal = json['shipping_total'];
    _shippingTax = json['shipping_tax'];
    _cartTax = json['cart_tax'];
    _cartTaxHalf = json['cart_tax_half'];
    _total = json['total'];
    _totalTax = json['total_tax'];
    _pricesIncludeTax = json['prices_include_tax'];
    _customerId = json['customer_id'] != null
        ? CustomerId.fromJson(json['customer_id'])
        : null;
    _customerIpAddress = json['customer_ip_address'];
    _customerUserAgent = json['customer_user_agent'];
    _orderNote = json['order_note'];
    _billing =
        json['billing'] != null ? Billing.fromJson(json['billing']) : null;
    _shipping =
        json['shipping'] != null ? Shipping.fromJson(json['shipping']) : null;
    _paymentMethod = json['payment_method'] != null
        ? PaymentMethod.fromJson(json['payment_method'])
        : null;
    _paymentMethodTitle = json['payment_method_title'];
    _transactionId = json['transaction_id'];
    _datePaid = json['date_paid'];
    _dateCompleted = json['date_completed'];
    if (json['meta_data'] != null) {
      _metaData = [];
      // json['meta_data'].forEach((v) {
      //   _metaData?.add(Dynamic.fromJson(v));
      // });
    }
    if (json['line_items'] != null) {
      _lineItems = [];
      json['line_items'].forEach((v) {
        _lineItems?.add(LineItems.fromJson(v));
      });
    }
    if (json['coupon_lines'] != null) {
      _couponLines = [];
      // json['coupon_lines'].forEach((v) {
      //   _couponLines?.add(Dynamic.fromJson(v));
      // });
    }
    _refunds = json['refunds'];
    _setPaid = json['set_paid'];
    _shippingClassId = json['shipping_class_id'];
    _taxClassId = json['tax_class_id'] != null
        ? TaxClassId.fromJson(json['tax_class_id'])
        : null;
    _invoiceUrl = json['invoice_url'];
  }

  num? _id;
  String? _number;
  String? _invoiceNumber;
  String? _createdVia;
  String? _status;
  String? _currency;
  String? _discountTotal;
  String? _discountTax;
  String? _shippingTotal;
  String? _shippingTax;
  String? _cartTax;
  String? _cartTaxHalf;
  String? _total;
  String? _totalTax;
  bool? _pricesIncludeTax;
  CustomerId? _customerId;
  dynamic _customerIpAddress;
  dynamic _customerUserAgent;
  dynamic _orderNote;
  Billing? _billing;
  Shipping? _shipping;
  PaymentMethod? _paymentMethod;
  String? _paymentMethodTitle;
  String? _transactionId;
  dynamic _datePaid;
  dynamic _dateCompleted;
  List<dynamic>? _metaData;
  List<LineItems>? _lineItems;
  List<dynamic>? _couponLines;
  dynamic _refunds;
  bool? _setPaid;
  dynamic _shippingClassId;
  TaxClassId? _taxClassId;
  dynamic _invoiceUrl;

  num? get id => _id;

  String? get number => _number;

  String? get invoiceNumber => _invoiceNumber;

  String? get createdVia => _createdVia;

  String? get status => _status;

  String? get currency => _currency;

  String? get discountTotal => _discountTotal;

  String? get discountTax => _discountTax;

  String? get shippingTotal => _shippingTotal;

  String? get shippingTax => _shippingTax;

  String? get cartTax => _cartTax;

  String? get cartTaxHalf => _cartTaxHalf;

  String? get total => _total;

  String? get totalTax => _totalTax;

  bool? get pricesIncludeTax => _pricesIncludeTax;

  CustomerId? get customerId => _customerId;

  dynamic get customerIpAddress => _customerIpAddress;

  dynamic get customerUserAgent => _customerUserAgent;

  dynamic get orderNote => _orderNote;

  Billing? get billing => _billing;

  Shipping? get shipping => _shipping;

  PaymentMethod? get paymentMethod => _paymentMethod;

  String? get paymentMethodTitle => _paymentMethodTitle;

  String? get transactionId => _transactionId;

  dynamic get datePaid => _datePaid;

  dynamic get dateCompleted => _dateCompleted;

  List<dynamic>? get metaData => _metaData;

  List<LineItems>? get lineItems => _lineItems;

  List<dynamic>? get couponLines => _couponLines;

  dynamic get refunds => _refunds;

  bool? get setPaid => _setPaid;

  dynamic get shippingClassId => _shippingClassId;

  TaxClassId? get taxClassId => _taxClassId;

  dynamic get invoiceUrl => _invoiceUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['number'] = _number;
    map['invoice_number'] = _invoiceNumber;
    map['created_via'] = _createdVia;
    map['status'] = _status;
    map['currency'] = _currency;
    map['discount_total'] = _discountTotal;
    map['discount_tax'] = _discountTax;
    map['shipping_total'] = _shippingTotal;
    map['shipping_tax'] = _shippingTax;
    map['cart_tax'] = _cartTax;
    map['cart_tax_half'] = _cartTaxHalf;
    map['total'] = _total;
    map['total_tax'] = _totalTax;
    map['prices_include_tax'] = _pricesIncludeTax;
    if (_customerId != null) {
      map['customer_id'] = _customerId?.toJson();
    }
    map['customer_ip_address'] = _customerIpAddress;
    map['customer_user_agent'] = _customerUserAgent;
    map['order_note'] = _orderNote;
    if (_billing != null) {
      map['billing'] = _billing?.toJson();
    }
    if (_shipping != null) {
      map['shipping'] = _shipping?.toJson();
    }
    if (_paymentMethod != null) {
      map['payment_method'] = _paymentMethod?.toJson();
    }
    map['payment_method_title'] = _paymentMethodTitle;
    map['transaction_id'] = _transactionId;
    map['date_paid'] = _datePaid;
    map['date_completed'] = _dateCompleted;
    if (_metaData != null) {
      map['meta_data'] = _metaData?.map((v) => v.toJson()).toList();
    }
    if (_lineItems != null) {
      map['line_items'] = _lineItems?.map((v) => v.toJson()).toList();
    }
    if (_couponLines != null) {
      map['coupon_lines'] = _couponLines?.map((v) => v.toJson()).toList();
    }
    map['refunds'] = _refunds;
    map['set_paid'] = _setPaid;
    map['shipping_class_id'] = _shippingClassId;
    if (_taxClassId != null) {
      map['tax_class_id'] = _taxClassId?.toJson();
    }
    map['invoice_url'] = _invoiceUrl;
    return map;
  }
}

class TaxClassId {
  TaxClassId({
    num? id,
    String? name,
    String? slug,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
  }

  TaxClassId.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
  }

  num? _id;
  String? _name;
  String? _slug;

  num? get id => _id;

  String? get name => _name;

  String? get slug => _slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    return map;
  }
}

/// id : 763
/// product_id : {"id":49976,"product_title":"240 VOLT 2 WAY SWITCH WITH NEON INDICATOR - PIANO SWITCHES (1M) (VIHAN)","product_slug":"240-volt-2-way-switch-with-neon-indicator-piano-switches-1m-vihan-2","product_short_description":"<ul>\\n<li>BRAND &#8211; VIHAN</li>\\n<li>SERIES &#8211; PIANO</li>\\n<li>PRODUCT &#8211; 240 VOLT 2 WAY SWITCH WITH NEON INDICATOR (1M)</li>\\n</ul>\\n","price":"228","regular_price":"228.00","image_ids":[{"id":13099,"name":"11-removebg-preview-1","alt":"","url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2023/10/11-removebg-preview-1.png","product_image_meta":{"card":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_300*200.png","mobile":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_375*250.png","tablet":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_768*512.png","product":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_600*400.png","original":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2023/10/11-removebg-preview-1.png"},"caption":null,"media_type":"image","is_default":true}],"is_featured":false}
/// variation_id : null
/// product_url : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2023/10/11-removebg-preview-1.png"
/// quantity : 1
/// line_subtotal : "228.00"
/// price : "228.00"
/// line_total : "228.00"
/// line_tax : "41.04"
/// cgst_tax : "20.52"
/// sgst_tax : "20.52"
/// created_at : "2024-09-22T16:05:42.579852"
/// updated_at : "2024-09-22T16:05:42.579883"
/// discounted_price : "0.00"
/// hash_key : "d0e8871ba0e6bd9b9bee7387138568a7e42866259d6d12b9b26e9bb911591d0d"
/// user_id : 31
/// tax_class_id : 7
/// shipping_class_id : null

class LineItems {
  LineItems({
    num? id,
    ProductId? productId,
    dynamic variationId,
    String? productUrl,
    num? quantity,
    String? lineSubtotal,
    String? price,
    String? lineTotal,
    String? lineTax,
    String? cgstTax,
    String? sgstTax,
    String? createdAt,
    String? updatedAt,
    String? discountedPrice,
    String? hashKey,
    num? userId,
    num? taxClassId,
    dynamic shippingClassId,
  }) {
    _id = id;
    _productId = productId;
    _variationId = variationId;
    _productUrl = productUrl;
    _quantity = quantity;
    _lineSubtotal = lineSubtotal;
    _price = price;
    _lineTotal = lineTotal;
    _lineTax = lineTax;
    _cgstTax = cgstTax;
    _sgstTax = sgstTax;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _discountedPrice = discountedPrice;
    _hashKey = hashKey;
    _userId = userId;
    _taxClassId = taxClassId;
    _shippingClassId = shippingClassId;
  }

  LineItems.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'] != null
        ? ProductId.fromJson(json['product_id'])
        : null;
    _variationId = json['variation_id'];
    _productUrl = json['product_url'];
    _quantity = json['quantity'];
    _lineSubtotal = json['line_subtotal'];
    _price = json['price'];
    _lineTotal = json['line_total'];
    _lineTax = json['line_tax'];
    _cgstTax = json['cgst_tax'];
    _sgstTax = json['sgst_tax'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _discountedPrice = json['discounted_price'];
    _hashKey = json['hash_key'];
    _userId = json['user_id'];
    _taxClassId = json['tax_class_id'];
    _shippingClassId = json['shipping_class_id'];
  }

  num? _id;
  ProductId? _productId;
  dynamic _variationId;
  String? _productUrl;
  num? _quantity;
  String? _lineSubtotal;
  String? _price;
  String? _lineTotal;
  String? _lineTax;
  String? _cgstTax;
  String? _sgstTax;
  String? _createdAt;
  String? _updatedAt;
  String? _discountedPrice;
  String? _hashKey;
  num? _userId;
  num? _taxClassId;
  dynamic _shippingClassId;

  num? get id => _id;

  ProductId? get productId => _productId;

  dynamic get variationId => _variationId;

  String? get productUrl => _productUrl;

  num? get quantity => _quantity;

  String? get lineSubtotal => _lineSubtotal;

  String? get price => _price;

  String? get lineTotal => _lineTotal;

  String? get lineTax => _lineTax;

  String? get cgstTax => _cgstTax;

  String? get sgstTax => _sgstTax;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get discountedPrice => _discountedPrice;

  String? get hashKey => _hashKey;

  num? get userId => _userId;

  num? get taxClassId => _taxClassId;

  dynamic get shippingClassId => _shippingClassId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_productId != null) {
      map['product_id'] = _productId?.toJson();
    }
    map['variation_id'] = _variationId;
    map['product_url'] = _productUrl;
    map['quantity'] = _quantity;
    map['line_subtotal'] = _lineSubtotal;
    map['price'] = _price;
    map['line_total'] = _lineTotal;
    map['line_tax'] = _lineTax;
    map['cgst_tax'] = _cgstTax;
    map['sgst_tax'] = _sgstTax;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['discounted_price'] = _discountedPrice;
    map['hash_key'] = _hashKey;
    map['user_id'] = _userId;
    map['tax_class_id'] = _taxClassId;
    map['shipping_class_id'] = _shippingClassId;
    return map;
  }
}

/// id : 49976
/// product_title : "240 VOLT 2 WAY SWITCH WITH NEON INDICATOR - PIANO SWITCHES (1M) (VIHAN)"
/// product_slug : "240-volt-2-way-switch-with-neon-indicator-piano-switches-1m-vihan-2"
/// product_short_description : "<ul>\\n<li>BRAND &#8211; VIHAN</li>\\n<li>SERIES &#8211; PIANO</li>\\n<li>PRODUCT &#8211; 240 VOLT 2 WAY SWITCH WITH NEON INDICATOR (1M)</li>\\n</ul>\\n"
/// price : "228"
/// regular_price : "228.00"
/// image_ids : [{"id":13099,"name":"11-removebg-preview-1","alt":"","url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2023/10/11-removebg-preview-1.png","product_image_meta":{"card":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_300*200.png","mobile":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_375*250.png","tablet":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_768*512.png","product":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_600*400.png","original":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2023/10/11-removebg-preview-1.png"},"caption":null,"media_type":"image","is_default":true}]
/// is_featured : false

class ProductId {
  ProductId({
    num? id,
    String? productTitle,
    String? productSlug,
    String? productShortDescription,
    String? price,
    String? regularPrice,
    List<ImageIds>? imageIds,
    bool? isFeatured,
  }) {
    _id = id;
    _productTitle = productTitle;
    _productSlug = productSlug;
    _productShortDescription = productShortDescription;
    _price = price;
    _regularPrice = regularPrice;
    _imageIds = imageIds;
    _isFeatured = isFeatured;
  }

  ProductId.fromJson(dynamic json) {
    _id = json['id'];
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
    _isFeatured = json['is_featured'];
  }

  num? _id;
  String? _productTitle;
  String? _productSlug;
  String? _productShortDescription;
  String? _price;
  String? _regularPrice;
  List<ImageIds>? _imageIds;
  bool? _isFeatured;

  num? get id => _id;

  String? get productTitle => _productTitle;

  String? get productSlug => _productSlug;

  String? get productShortDescription => _productShortDescription;

  String? get price => _price;

  String? get regularPrice => _regularPrice;

  List<ImageIds>? get imageIds => _imageIds;

  bool? get isFeatured => _isFeatured;

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
    map['is_featured'] = _isFeatured;
    return map;
  }
}

/// id : 13099
/// name : "11-removebg-preview-1"
/// alt : ""
/// url : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2023/10/11-removebg-preview-1.png"
/// product_image_meta : {"card":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_300*200.png","mobile":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_375*250.png","tablet":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_768*512.png","product":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_600*400.png","original":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2023/10/11-removebg-preview-1.png"}
/// caption : null
/// media_type : "image"
/// is_default : true

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

/// card : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_300*200.png"
/// mobile : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_375*250.png"
/// tablet : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_768*512.png"
/// product : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/11-removebg-preview-1_600*400.png"
/// original : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2023/10/11-removebg-preview-1.png"

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

/// method_id : "cod"
/// title : "Cash On Delivery"

class PaymentMethod {
  PaymentMethod({
    String? methodId,
    String? title,
  }) {
    _methodId = methodId;
    _title = title;
  }

  PaymentMethod.fromJson(dynamic json) {
    _methodId = json['method_id'];
    _title = json['title'];
  }

  String? _methodId;
  String? _title;

  String? get methodId => _methodId;

  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['method_id'] = _methodId;
    map['title'] = _title;
    return map;
  }
}

/// id : 292
/// first_name : "uhbb"
/// last_name : "fhh"
/// company_name : null
/// address_1 : "bhhh"
/// address_2 : null
/// city : "vhhn"
/// state : "Ahmedabad"
/// postcode : "669966"
/// country : "india"
/// email : "hhh@hh.com"
/// phone : null

class Shipping {
  Shipping({
    num? id,
    String? firstName,
    String? lastName,
    dynamic companyName,
    String? address1,
    dynamic address2,
    String? city,
    String? state,
    String? postcode,
    String? country,
    String? email,
    dynamic phone,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _companyName = companyName;
    _address1 = address1;
    _address2 = address2;
    _city = city;
    _state = state;
    _postcode = postcode;
    _country = country;
    _email = email;
    _phone = phone;
  }

  Shipping.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _companyName = json['company_name'];
    _address1 = json['address_1'];
    _address2 = json['address_2'];
    _city = json['city'];
    _state = json['state'];
    _postcode = json['postcode'];
    _country = json['country'];
    _email = json['email'];
    _phone = json['phone'];
  }

  num? _id;
  String? _firstName;
  String? _lastName;
  dynamic _companyName;
  String? _address1;
  dynamic _address2;
  String? _city;
  String? _state;
  String? _postcode;
  String? _country;
  String? _email;
  dynamic _phone;

  num? get id => _id;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  dynamic get companyName => _companyName;

  String? get address1 => _address1;

  dynamic get address2 => _address2;

  String? get city => _city;

  String? get state => _state;

  String? get postcode => _postcode;

  String? get country => _country;

  String? get email => _email;

  dynamic get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['company_name'] = _companyName;
    map['address_1'] = _address1;
    map['address_2'] = _address2;
    map['city'] = _city;
    map['state'] = _state;
    map['postcode'] = _postcode;
    map['country'] = _country;
    map['email'] = _email;
    map['phone'] = _phone;
    return map;
  }
}

/// id : 292
/// first_name : "uhbb"
/// last_name : "fhh"
/// company_name : null
/// address_1 : "bhhh"
/// address_2 : null
/// city : "vhhn"
/// state : "Ahmedabad"
/// postcode : "669966"
/// country : "india"
/// email : "hhh@hh.com"
/// phone : "9966996699"
/// gst_number : null

class Billing {
  Billing({
    num? id,
    String? firstName,
    String? lastName,
    dynamic companyName,
    String? address1,
    dynamic address2,
    String? city,
    String? state,
    String? postcode,
    String? country,
    String? email,
    String? phone,
    dynamic gstNumber,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _companyName = companyName;
    _address1 = address1;
    _address2 = address2;
    _city = city;
    _state = state;
    _postcode = postcode;
    _country = country;
    _email = email;
    _phone = phone;
    _gstNumber = gstNumber;
  }

  Billing.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _companyName = json['company_name'];
    _address1 = json['address_1'];
    _address2 = json['address_2'];
    _city = json['city'];
    _state = json['state'];
    _postcode = json['postcode'];
    _country = json['country'];
    _email = json['email'];
    _phone = json['phone'];
    _gstNumber = json['gst_number'];
  }

  num? _id;
  String? _firstName;
  String? _lastName;
  dynamic _companyName;
  String? _address1;
  dynamic _address2;
  String? _city;
  String? _state;
  String? _postcode;
  String? _country;
  String? _email;
  String? _phone;
  dynamic _gstNumber;

  num? get id => _id;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  dynamic get companyName => _companyName;

  String? get address1 => _address1;

  dynamic get address2 => _address2;

  String? get city => _city;

  String? get state => _state;

  String? get postcode => _postcode;

  String? get country => _country;

  String? get email => _email;

  String? get phone => _phone;

  dynamic get gstNumber => _gstNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['company_name'] = _companyName;
    map['address_1'] = _address1;
    map['address_2'] = _address2;
    map['city'] = _city;
    map['state'] = _state;
    map['postcode'] = _postcode;
    map['country'] = _country;
    map['email'] = _email;
    map['phone'] = _phone;
    map['gst_number'] = _gstNumber;
    return map;
  }
}

/// id : 31
/// first_name : "rishiiiii"
/// last_name : "Gupta"

class CustomerId {
  CustomerId({
    num? id,
    String? firstName,
    String? lastName,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
  }

  CustomerId.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
  }

  num? _id;
  String? _firstName;
  String? _lastName;

  num? get id => _id;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    return map;
  }
}
