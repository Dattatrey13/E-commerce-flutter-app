/// success : true
/// message : "Success"
/// data : {"id":42,"number":"42","created_via":"WEB","status":"pending","currency":"INR","discount_total":"0.00","discount_tax":"0.00","shipping_total":"0.00","shipping_tax":"0.00","cart_tax":"26.28","total":"146.00","total_tax":"26.28","prices_include_tax":false,"customer_id":{"id":2,"first_name":"Hemant","last_name":"Manglani"},"customer_ip_address":null,"customer_user_agent":null,"order_note":"Testing Notes","billing":{"id":42,"first_name":"John","last_name":"Doe","company_name":null,"address_1":"969 Market","address_2":"","city":"San Francisco","state":"CA","postcode":"94103","country":"US","email":"john.doe@example.com","phone":"+917698518963","gst_number":null},"shipping":{"id":42,"first_name":"John","last_name":"Doe","company_name":null,"address_1":"969 Market","address_2":"","city":"San Francisco","state":"CA","postcode":"94103","country":"US","email":"john.doe@example.com","phone":null},"payment_method":{"method_id":"payeasebuzz","title":"Pay easebuzz"},"payment_method_title":"Pay EaseBuzz","transaction_id":"59c68f9a-3d07-4ae3-b9fa-8e9c19c78b04","date_paid":null,"date_completed":null,"meta_data":[],"line_items":[{"id":49,"product_id":{"id":29294,"product_title":"Bell Push Switch With Indicator (LED) (1 Switch) - 10AX. SWITCHES 240V – BERKO (NORWOOD)","product_slug":"bell-push-switch-with-indicator-led-1switch-10ax-switches-240v-berko-norwood","product_short_description":"<ul style=\"margin-top: 0px;margin-bottom: 1rem;display: flex;flex-flow: column wrap;color: #000000;font-family: 'Open Sans', sans-serif;font-size: 14px;padding: 0px 0px 0px 20px !important;list-style-type: square !important\">\n<li style=\"vertical-align: middle\">Brand – Norwood</li>\n<li style=\"vertical-align: middle\">Series – Berko</li>\n<li style=\"vertical-align: middle\">Product – Bell Push Switch With Indicator (LED) (1 Switch)</li>\n</ul>\n","price":"146","regular_price":"146.00","image_ids":[{"id":15559,"name":"RV 602011","alt":"","url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2022/06/RV-602011.jpg","product_image_meta":{"card":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_300*200.jpg","mobile":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_375*250.jpg","tablet":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_768*512.jpg","product":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_600*400.jpg","original":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2022/06/RV-602011.jpg"},"caption":null,"media_type":"image"}],"is_featured":false},"variation_id":null,"quantity":1,"line_subtotal":"146.00","price":"146.00","line_total":"146.00","line_tax":"26.28","cgst_tax":"13.14","sgst_tax":"13.14","created_at":"2024-09-11T15:41:26.858989","updated_at":"2024-09-11T15:41:26.858989","discounted_price":"0.00","hash_key":"8ad89a9ad2763c9ff7edd3061387c46cf184e7ecd692b6d89bb03a2d59ad239b","user_id":2,"tax_class_id":null,"shipping_class_id":null}],"coupon_lines":[],"refunds":null,"set_paid":false}

class GetOrderByIdModel {
  GetOrderByIdModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetOrderByIdModel.fromJson(dynamic json) {
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

/// id : 42
/// number : "42"
/// created_via : "WEB"
/// status : "pending"
/// currency : "INR"
/// discount_total : "0.00"
/// discount_tax : "0.00"
/// shipping_total : "0.00"
/// shipping_tax : "0.00"
/// cart_tax : "26.28"
/// total : "146.00"
/// total_tax : "26.28"
/// prices_include_tax : false
/// customer_id : {"id":2,"first_name":"Hemant","last_name":"Manglani"}
/// customer_ip_address : null
/// customer_user_agent : null
/// order_note : "Testing Notes"
/// billing : {"id":42,"first_name":"John","last_name":"Doe","company_name":null,"address_1":"969 Market","address_2":"","city":"San Francisco","state":"CA","postcode":"94103","country":"US","email":"john.doe@example.com","phone":"+917698518963","gst_number":null}
/// shipping : {"id":42,"first_name":"John","last_name":"Doe","company_name":null,"address_1":"969 Market","address_2":"","city":"San Francisco","state":"CA","postcode":"94103","country":"US","email":"john.doe@example.com","phone":null}
/// payment_method : {"method_id":"payeasebuzz","title":"Pay easebuzz"}
/// payment_method_title : "Pay EaseBuzz"
/// transaction_id : "59c68f9a-3d07-4ae3-b9fa-8e9c19c78b04"
/// date_paid : null
/// date_completed : null
/// meta_data : []
/// line_items : [{"id":49,"product_id":{"id":29294,"product_title":"Bell Push Switch With Indicator (LED) (1 Switch) - 10AX. SWITCHES 240V – BERKO (NORWOOD)","product_slug":"bell-push-switch-with-indicator-led-1switch-10ax-switches-240v-berko-norwood","product_short_description":"<ul style=\"margin-top: 0px;margin-bottom: 1rem;display: flex;flex-flow: column wrap;color: #000000;font-family: 'Open Sans', sans-serif;font-size: 14px;padding: 0px 0px 0px 20px !important;list-style-type: square !important\">\n<li style=\"vertical-align: middle\">Brand – Norwood</li>\n<li style=\"vertical-align: middle\">Series – Berko</li>\n<li style=\"vertical-align: middle\">Product – Bell Push Switch With Indicator (LED) (1 Switch)</li>\n</ul>\n","price":"146","regular_price":"146.00","image_ids":[{"id":15559,"name":"RV 602011","alt":"","url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2022/06/RV-602011.jpg","product_image_meta":{"card":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_300*200.jpg","mobile":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_375*250.jpg","tablet":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_768*512.jpg","product":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_600*400.jpg","original":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2022/06/RV-602011.jpg"},"caption":null,"media_type":"image"}],"is_featured":false},"variation_id":null,"quantity":1,"line_subtotal":"146.00","price":"146.00","line_total":"146.00","line_tax":"26.28","cgst_tax":"13.14","sgst_tax":"13.14","created_at":"2024-09-11T15:41:26.858989","updated_at":"2024-09-11T15:41:26.858989","discounted_price":"0.00","hash_key":"8ad89a9ad2763c9ff7edd3061387c46cf184e7ecd692b6d89bb03a2d59ad239b","user_id":2,"tax_class_id":null,"shipping_class_id":null}]
/// coupon_lines : []
/// refunds : null
/// set_paid : false

class Data {
  Data({
    num? id,
    String? number,
    String? createdVia,
    String? status,
    String? currency,
    String? discountTotal,
    String? discountTax,
    String? shippingTotal,
    String? shippingTax,
    String? cartTax,
    String? total,
    String? totalTax,
    bool? pricesIncludeTax,
    CustomerId? customerId,
    dynamic customerIpAddress,
    dynamic customerUserAgent,
    String? orderNote,
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
    String? invoiceUrl,
    List<SubOrders>? subOrders,
  }) {
    _id = id;
    _number = number;
    _createdVia = createdVia;
    _status = status;
    _currency = currency;
    _discountTotal = discountTotal;
    _discountTax = discountTax;
    _shippingTotal = shippingTotal;
    _shippingTax = shippingTax;
    _cartTax = cartTax;
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
    _invoiceUrl = invoiceUrl;
    _subOrders = subOrders;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _number = json['number'];
    _createdVia = json['created_via'];
    _status = json['status'];
    _currency = json['currency'];
    _discountTotal = json['discount_total'];
    _discountTax = json['discount_tax'];
    _shippingTotal = json['shipping_total'];
    _shippingTax = json['shipping_tax'];
    _cartTax = json['cart_tax'];
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
    _invoiceUrl = json['invoice_url'];
    if (json['sub_orders'] != null) {
      _subOrders = [];
      json['sub_orders'].forEach((v) {
        _subOrders?.add(SubOrders.fromJson(v));
      });
    }
  }

  num? _id;
  String? _number;
  String? _createdVia;
  String? _status;
  String? _currency;
  String? _discountTotal;
  String? _discountTax;
  String? _shippingTotal;
  String? _shippingTax;
  String? _cartTax;
  String? _total;
  String? _totalTax;
  bool? _pricesIncludeTax;
  CustomerId? _customerId;
  dynamic _customerIpAddress;
  dynamic _customerUserAgent;
  String? _orderNote;
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
  String? _invoiceUrl;
  List<SubOrders>? _subOrders;

  String? get invoiceUrl => _invoiceUrl;

  List<SubOrders>? get subOrders => _subOrders;

  num? get id => _id;

  String? get number => _number;

  String? get createdVia => _createdVia;

  String? get status => _status;

  String? get currency => _currency;

  String? get discountTotal => _discountTotal;

  String? get discountTax => _discountTax;

  String? get shippingTotal => _shippingTotal;

  String? get shippingTax => _shippingTax;

  String? get cartTax => _cartTax;

  String? get total => _total;

  String? get totalTax => _totalTax;

  bool? get pricesIncludeTax => _pricesIncludeTax;

  CustomerId? get customerId => _customerId;

  dynamic get customerIpAddress => _customerIpAddress;

  dynamic get customerUserAgent => _customerUserAgent;

  String? get orderNote => _orderNote;

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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['number'] = _number;
    map['created_via'] = _createdVia;
    map['status'] = _status;
    map['currency'] = _currency;
    map['discount_total'] = _discountTotal;
    map['discount_tax'] = _discountTax;
    map['shipping_total'] = _shippingTotal;
    map['shipping_tax'] = _shippingTax;
    map['cart_tax'] = _cartTax;
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
    map['invoice_url'] = _invoiceUrl;
    if (_subOrders != null) {
      map['sub_orders'] = _subOrders?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 49
/// product_id : {"id":29294,"product_title":"Bell Push Switch With Indicator (LED) (1 Switch) - 10AX. SWITCHES 240V – BERKO (NORWOOD)","product_slug":"bell-push-switch-with-indicator-led-1switch-10ax-switches-240v-berko-norwood","product_short_description":"<ul style=\"margin-top: 0px;margin-bottom: 1rem;display: flex;flex-flow: column wrap;color: #000000;font-family: 'Open Sans', sans-serif;font-size: 14px;padding: 0px 0px 0px 20px !important;list-style-type: square !important\">\n<li style=\"vertical-align: middle\">Brand – Norwood</li>\n<li style=\"vertical-align: middle\">Series – Berko</li>\n<li style=\"vertical-align: middle\">Product – Bell Push Switch With Indicator (LED) (1 Switch)</li>\n</ul>\n","price":"146","regular_price":"146.00","image_ids":[{"id":15559,"name":"RV 602011","alt":"","url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2022/06/RV-602011.jpg","product_image_meta":{"card":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_300*200.jpg","mobile":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_375*250.jpg","tablet":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_768*512.jpg","product":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_600*400.jpg","original":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2022/06/RV-602011.jpg"},"caption":null,"media_type":"image"}],"is_featured":false}
/// variation_id : null
/// quantity : 1
/// line_subtotal : "146.00"
/// price : "146.00"
/// line_total : "146.00"
/// line_tax : "26.28"
/// cgst_tax : "13.14"
/// sgst_tax : "13.14"
/// created_at : "2024-09-11T15:41:26.858989"
/// updated_at : "2024-09-11T15:41:26.858989"
/// discounted_price : "0.00"
/// hash_key : "8ad89a9ad2763c9ff7edd3061387c46cf184e7ecd692b6d89bb03a2d59ad239b"
/// user_id : 2
/// tax_class_id : null
/// shipping_class_id : null

class LineItems {
  LineItems({
    num? id,
    Slug? slug,
    VariationId? variationId,
    VendorId? vendorId,
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
    dynamic taxClassId,
    dynamic shippingClassId,
  }) {
    _id = id;
    _slug = slug;
    _variationId = variationId;
    _vendorId = vendorId;
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
    _slug = json['product_id'] != null
        ? Slug.fromJson(json['product_id'])
        : null;
    _variationId = json['variation_id'] != null
        ? VariationId.fromJson(json['variation_id'])
        : null;
    _vendorId =
        json['vendor_id'] != null ? VendorId.fromJson(json['vendor_id']) : null;
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
  Slug? _slug;
  VariationId? _variationId;
  VendorId? _vendorId;
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
  dynamic _taxClassId;
  dynamic _shippingClassId;

  num? get id => _id;

  Slug? get slug => _slug;

  VariationId? get variationId => _variationId;

  VendorId? get vendorId => _vendorId;

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

  dynamic get taxClassId => _taxClassId;

  dynamic get shippingClassId => _shippingClassId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_slug != null) {
      map['product_id'] = _slug?.toJson();
    }
    if (_variationId != null) {
      map['variation_id'] = _variationId?.toJson();
    }
    if (_vendorId != null) {
      map['vendor_id'] = _vendorId?.toJson();
    }
    map['variation_id'] = _variationId;
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

class VendorId {
  VendorId({
    num? id,
    String? firstName,
    String? lastName,
    String? fcmToken,
    String? username,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _fcmToken = fcmToken;
    _username = username;
  }

  VendorId.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _fcmToken = json['fcm_token'];
    _username = json['username'];
  }

  num? _id;
  String? _firstName;
  String? _lastName;
  String? _fcmToken;
  String? _username;

  num? get id => _id;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get fcmToken => _fcmToken;

  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['fcm_token'] = _fcmToken;
    map['username'] = _username;
    return map;
  }
}

/// id : 26054
/// terms_ids : [{"id":1998,"attribute_id":{"id":27,"attribute_name":"COLOUR","attribute_slug":"colour","attribute_type":"select"},"term_name":"ROSE GOLD","slug":"rose-gold","description":""}]
/// image_ids : [{"id":11853,"name":"SF-9466-1-RG-1.jpg","alt":"","url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/06/SF-9466-1-RG-1.jpg","product_image_meta":{"card":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/SF-9466-1-RG-1_300*200.jpg","mobile":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/SF-9466-1-RG-1_375*250.jpg","tablet":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/SF-9466-1-RG-1_768*512.jpg","product":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/SF-9466-1-RG-1_600*400.jpg","original":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/06/SF-9466-1-RG-1.jpg"},"caption":null,"media_type":"image","is_default":false}]
/// discount_percentage : 44.0
/// description : ""
/// product_status : "publish"
/// is_manage_stock : false
/// is_default : true
/// stock_status : "in_stock"
/// stock_quantity : null
/// is_back_order : false
/// back_order_status : "no"
/// low_stock_threshold : null
/// sku : "SF 9466-1-S"
/// price : "8500"
/// regular_price : "8500.00"
/// sale_price : "4760"
/// is_on_sale : true
/// date_on_sale_from : null
/// date_on_sale_to : null
/// experts : "ROSE GOLD"
/// weight : ""
/// dimensions : {"width":"","height":"","length":""}
/// tax_status : "taxable"
/// product_id : 61769
/// tax_class_id : 7
/// shipping_class_id : null

class VariationId {
  VariationId({
    num? id,
    List<TermsIds>? termsIds,
    List<ImageIds>? imageIds,
    num? discountPercentage,
    String? description,
    String? productStatus,
    bool? isManageStock,
    bool? isDefault,
    String? stockStatus,
    dynamic stockQuantity,
    bool? isBackOrder,
    String? backOrderStatus,
    dynamic lowStockThreshold,
    String? sku,
    String? price,
    String? regularPrice,
    String? salePrice,
    bool? isOnSale,
    dynamic dateOnSaleFrom,
    dynamic dateOnSaleTo,
    String? experts,
    String? weight,
    Dimensions? dimensions,
    String? taxStatus,
    num? slug,
    num? taxClassId,
    dynamic shippingClassId,
  }) {
    _id = id;
    _termsIds = termsIds;
    _imageIds = imageIds;
    _discountPercentage = discountPercentage;
    _description = description;
    _productStatus = productStatus;
    _isManageStock = isManageStock;
    _isDefault = isDefault;
    _stockStatus = stockStatus;
    _stockQuantity = stockQuantity;
    _isBackOrder = isBackOrder;
    _backOrderStatus = backOrderStatus;
    _lowStockThreshold = lowStockThreshold;
    _sku = sku;
    _price = price;
    _regularPrice = regularPrice;
    _salePrice = salePrice;
    _isOnSale = isOnSale;
    _dateOnSaleFrom = dateOnSaleFrom;
    _dateOnSaleTo = dateOnSaleTo;
    _experts = experts;
    _weight = weight;
    _dimensions = dimensions;
    _taxStatus = taxStatus;
    _slug = slug;
    _taxClassId = taxClassId;
    _shippingClassId = shippingClassId;
  }

  VariationId.fromJson(dynamic json) {
    _id = json['id'];
    if (json['terms_ids'] != null) {
      _termsIds = [];
      json['terms_ids'].forEach((v) {
        _termsIds?.add(TermsIds.fromJson(v));
      });
    }
    if (json['image_ids'] != null) {
      _imageIds = [];
      json['image_ids'].forEach((v) {
        _imageIds?.add(ImageIds.fromJson(v));
      });
    }
    _discountPercentage = json['discount_percentage'];
    _description = json['description'];
    _productStatus = json['product_status'];
    _isManageStock = json['is_manage_stock'];
    _isDefault = json['is_default'];
    _stockStatus = json['stock_status'];
    _stockQuantity = json['stock_quantity'];
    _isBackOrder = json['is_back_order'];
    _backOrderStatus = json['back_order_status'];
    _lowStockThreshold = json['low_stock_threshold'];
    _sku = json['sku'];
    _price = json['price'];
    _regularPrice = json['regular_price'];
    _salePrice = json['sale_price'];
    _isOnSale = json['is_on_sale'];
    _dateOnSaleFrom = json['date_on_sale_from'];
    _dateOnSaleTo = json['date_on_sale_to'];
    _experts = json['experts'];
    _weight = json['weight'];
    _dimensions = json['dimensions'] != null
        ? Dimensions.fromJson(json['dimensions'])
        : null;
    _taxStatus = json['tax_status'];
    _slug = json['product_id'];
    _taxClassId = json['tax_class_id'];
    _shippingClassId = json['shipping_class_id'];
  }

  num? _id;
  List<TermsIds>? _termsIds;
  List<ImageIds>? _imageIds;
  num? _discountPercentage;
  String? _description;
  String? _productStatus;
  bool? _isManageStock;
  bool? _isDefault;
  String? _stockStatus;
  dynamic _stockQuantity;
  bool? _isBackOrder;
  String? _backOrderStatus;
  dynamic _lowStockThreshold;
  String? _sku;
  String? _price;
  String? _regularPrice;
  String? _salePrice;
  bool? _isOnSale;
  dynamic _dateOnSaleFrom;
  dynamic _dateOnSaleTo;
  String? _experts;
  String? _weight;
  Dimensions? _dimensions;
  String? _taxStatus;
  num? _slug;
  num? _taxClassId;
  dynamic _shippingClassId;

  num? get id => _id;

  List<TermsIds>? get termsIds => _termsIds;

  List<ImageIds>? get imageIds => _imageIds;

  num? get discountPercentage => _discountPercentage;

  String? get description => _description;

  String? get productStatus => _productStatus;

  bool? get isManageStock => _isManageStock;

  bool? get isDefault => _isDefault;

  String? get stockStatus => _stockStatus;

  dynamic get stockQuantity => _stockQuantity;

  bool? get isBackOrder => _isBackOrder;

  String? get backOrderStatus => _backOrderStatus;

  dynamic get lowStockThreshold => _lowStockThreshold;

  String? get sku => _sku;

  String? get price => _price;

  String? get regularPrice => _regularPrice;

  String? get salePrice => _salePrice;

  bool? get isOnSale => _isOnSale;

  dynamic get dateOnSaleFrom => _dateOnSaleFrom;

  dynamic get dateOnSaleTo => _dateOnSaleTo;

  String? get experts => _experts;

  String? get weight => _weight;

  Dimensions? get dimensions => _dimensions;

  String? get taxStatus => _taxStatus;

  num? get slug => _slug;

  num? get taxClassId => _taxClassId;

  dynamic get shippingClassId => _shippingClassId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_termsIds != null) {
      map['terms_ids'] = _termsIds?.map((v) => v.toJson()).toList();
    }
    if (_imageIds != null) {
      map['image_ids'] = _imageIds?.map((v) => v.toJson()).toList();
    }
    map['discount_percentage'] = _discountPercentage;
    map['description'] = _description;
    map['product_status'] = _productStatus;
    map['is_manage_stock'] = _isManageStock;
    map['is_default'] = _isDefault;
    map['stock_status'] = _stockStatus;
    map['stock_quantity'] = _stockQuantity;
    map['is_back_order'] = _isBackOrder;
    map['back_order_status'] = _backOrderStatus;
    map['low_stock_threshold'] = _lowStockThreshold;
    map['sku'] = _sku;
    map['price'] = _price;
    map['regular_price'] = _regularPrice;
    map['sale_price'] = _salePrice;
    map['is_on_sale'] = _isOnSale;
    map['date_on_sale_from'] = _dateOnSaleFrom;
    map['date_on_sale_to'] = _dateOnSaleTo;
    map['experts'] = _experts;
    map['weight'] = _weight;
    if (_dimensions != null) {
      map['dimensions'] = _dimensions?.toJson();
    }
    map['tax_status'] = _taxStatus;
    map['product_id'] = _slug;
    map['tax_class_id'] = _taxClassId;
    map['shipping_class_id'] = _shippingClassId;
    return map;
  }
}

/// id : 29294
/// product_title : "Bell Push Switch With Indicator (LED) (1 Switch) - 10AX. SWITCHES 240V – BERKO (NORWOOD)"
/// product_slug : "bell-push-switch-with-indicator-led-1switch-10ax-switches-240v-berko-norwood"
/// product_short_description : "<ul style=\"margin-top: 0px;margin-bottom: 1rem;display: flex;flex-flow: column wrap;color: #000000;font-family: 'Open Sans', sans-serif;font-size: 14px;padding: 0px 0px 0px 20px !important;list-style-type: square !important\">\n<li style=\"vertical-align: middle\">Brand – Norwood</li>\n<li style=\"vertical-align: middle\">Series – Berko</li>\n<li style=\"vertical-align: middle\">Product – Bell Push Switch With Indicator (LED) (1 Switch)</li>\n</ul>\n"
/// price : "146"
/// regular_price : "146.00"
/// image_ids : [{"id":15559,"name":"RV 602011","alt":"","url":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2022/06/RV-602011.jpg","product_image_meta":{"card":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_300*200.jpg","mobile":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_375*250.jpg","tablet":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_768*512.jpg","product":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_600*400.jpg","original":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2022/06/RV-602011.jpg"},"caption":null,"media_type":"image"}]
/// is_featured : false

class Slug {
  Slug({
    num? id,
    String? productTitle,
    String? slug,
    String? productShortDescription,
    String? price,
    String? regularPrice,
    List<ImageIds>? imageIds,
    bool? isFeatured,
  }) {
    _id = id;
    _productTitle = productTitle;
    _slug = slug;
    _productShortDescription = productShortDescription;
    _price = price;
    _regularPrice = regularPrice;
    _imageIds = imageIds;
    _isFeatured = isFeatured;
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
    _isFeatured = json['is_featured'];
  }

  num? _id;
  String? _productTitle;
  String? _slug;
  String? _productShortDescription;
  String? _price;
  String? _regularPrice;
  List<ImageIds>? _imageIds;
  bool? _isFeatured;

  num? get id => _id;

  String? get productTitle => _productTitle;

  String? get slug => _slug;

  String? get productShortDescription => _productShortDescription;

  String? get price => _price;

  String? get regularPrice => _regularPrice;

  List<ImageIds>? get imageIds => _imageIds;

  bool? get isFeatured => _isFeatured;

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
    map['is_featured'] = _isFeatured;
    return map;
  }
}

/// id : 15559
/// name : "RV 602011"
/// alt : ""
/// url : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2022/06/RV-602011.jpg"
/// product_image_meta : {"card":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_300*200.jpg","mobile":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_375*250.jpg","tablet":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_768*512.jpg","product":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_600*400.jpg","original":"https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2022/06/RV-602011.jpg"}
/// caption : null
/// media_type : "image"

class TermsIds {
  TermsIds({
    num? id,
    AttributeId? attributeId,
    String? termName,
    String? slug,
    String? description,
  }) {
    _id = id;
    _attributeId = attributeId;
    _termName = termName;
    _slug = slug;
    _description = description;
  }

  TermsIds.fromJson(dynamic json) {
    _id = json['id'];
    _attributeId = json['attribute_id'] != null
        ? AttributeId.fromJson(json['attribute_id'])
        : null;
    _termName = json['term_name'];
    _slug = json['slug'];
    _description = json['description'];
  }

  num? _id;
  AttributeId? _attributeId;
  String? _termName;
  String? _slug;
  String? _description;

  num? get id => _id;

  AttributeId? get attributeId => _attributeId;

  String? get termName => _termName;

  String? get slug => _slug;

  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_attributeId != null) {
      map['attribute_id'] = _attributeId?.toJson();
    }
    map['term_name'] = _termName;
    map['slug'] = _slug;
    map['description'] = _description;
    return map;
  }
}

class AttributeId {
  AttributeId({
    num? id,
    String? attributeName,
    String? attributeSlug,
    String? attributeType,
  }) {
    _id = id;
    _attributeName = attributeName;
    _attributeSlug = attributeSlug;
    _attributeType = attributeType;
  }

  AttributeId.fromJson(dynamic json) {
    _id = json['id'];
    _attributeName = json['attribute_name'];
    _attributeSlug = json['attribute_slug'];
    _attributeType = json['attribute_type'];
  }

  num? _id;
  String? _attributeName;
  String? _attributeSlug;
  String? _attributeType;

  num? get id => _id;

  String? get attributeName => _attributeName;

  String? get attributeSlug => _attributeSlug;

  String? get attributeType => _attributeType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['attribute_name'] = _attributeName;
    map['attribute_slug'] = _attributeSlug;
    map['attribute_type'] = _attributeType;
    return map;
  }
}

class Dimensions {
  Dimensions({
    String? width,
    String? height,
    String? length,
  }) {
    _width = width;
    _height = height;
    _length = length;
  }

  Dimensions.fromJson(dynamic json) {
    _width = json['width'];
    _height = json['height'];
    _length = json['length'];
  }

  String? _width;
  String? _height;
  String? _length;

  String? get width => _width;

  String? get height => _height;

  String? get length => _length;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['width'] = _width;
    map['height'] = _height;
    map['length'] = _length;
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

/// card : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_300*200.jpg"
/// mobile : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_375*250.jpg"
/// tablet : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_768*512.jpg"
/// product : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2024/9/RV-602011_600*400.jpg"
/// original : "https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/2022/06/RV-602011.jpg"

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

/// method_id : "payeasebuzz"
/// title : "Pay easebuzz"

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

/// id : 42
/// first_name : "John"
/// last_name : "Doe"
/// company_name : null
/// address_1 : "969 Market"
/// address_2 : ""
/// city : "San Francisco"
/// state : "CA"
/// postcode : "94103"
/// country : "US"
/// email : "john.doe@example.com"
/// phone : null

class Shipping {
  Shipping({
    num? id,
    String? firstName,
    String? lastName,
    dynamic companyName,
    String? address1,
    String? address2,
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
  String? _address2;
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

  String? get address2 => _address2;

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

/// id : 42
/// first_name : "John"
/// last_name : "Doe"
/// company_name : null
/// address_1 : "969 Market"
/// address_2 : ""
/// city : "San Francisco"
/// state : "CA"
/// postcode : "94103"
/// country : "US"
/// email : "john.doe@example.com"
/// phone : "+917698518963"
/// gst_number : null

class Billing {
  Billing({
    num? id,
    String? firstName,
    String? lastName,
    dynamic companyName,
    String? address1,
    String? address2,
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
  String? _address2;
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

  String? get address2 => _address2;

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

/// id : 2
/// first_name : "Hemant"
/// last_name : "Manglani"

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

class SubOrders {
  SubOrders({
    num? id,
    String? number,
    String? status,
    String? total,
    String? subTotal,
    String? totalTax,
    PaymentMethod? paymentMethod,
    String? paymentMethodTitle,
    dynamic transactionId,
    dynamic refunds,
    bool? setPaid,
    String? dateCreated,
    bool? isCancelable,
    num? totalLineItem,
  }) {
    _id = id;
    _number = number;
    _status = status;
    _total = total;
    _subTotal = subTotal;
    _totalTax = totalTax;
    _paymentMethod = paymentMethod;
    _paymentMethodTitle = paymentMethodTitle;
    _transactionId = transactionId;
    _refunds = refunds;
    _setPaid = setPaid;
    _dateCreated = dateCreated;
    _isCancelable = isCancelable;
    _totalLineItem = totalLineItem;
  }

  SubOrders.fromJson(dynamic json) {
    _id = json['id'];
    _number = json['number'];
    _status = json['status'];
    _total = json['total'];
    _subTotal = json['sub_total'];
    _totalTax = json['total_tax'];
    _paymentMethod = json['payment_method'] != null
        ? PaymentMethod.fromJson(json['payment_method'])
        : null;
    _paymentMethodTitle = json['payment_method_title'];
    _transactionId = json['transaction_id'];
    _refunds = json['refunds'];
    _setPaid = json['set_paid'];
    _dateCreated = json['date_created'];
    _isCancelable = json['is_cancelable'];
    _totalLineItem = json['total_line_item'];
  }

  num? _id;
  String? _number;
  String? _status;
  String? _total;
  String? _subTotal;
  String? _totalTax;
  PaymentMethod? _paymentMethod;
  String? _paymentMethodTitle;
  dynamic _transactionId;
  dynamic _refunds;
  bool? _setPaid;
  String? _dateCreated;
  bool? _isCancelable;
  num? _totalLineItem;

  num? get id => _id;

  String? get number => _number;

  String? get status => _status;

  String? get total => _total;

  String? get subTotal => _subTotal;

  String? get totalTax => _totalTax;

  PaymentMethod? get paymentMethod => _paymentMethod;

  String? get paymentMethodTitle => _paymentMethodTitle;

  dynamic get transactionId => _transactionId;

  dynamic get refunds => _refunds;

  bool? get setPaid => _setPaid;

  String? get dateCreated => _dateCreated;

  bool? get isCancelable => _isCancelable;

  num? get totalLineItem => _totalLineItem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['number'] = _number;
    map['status'] = _status;
    map['total'] = _total;
    map['sub_total'] = _subTotal;
    map['total_tax'] = _totalTax;
    if (_paymentMethod != null) {
      map['payment_method'] = _paymentMethod?.toJson();
    }
    map['payment_method_title'] = _paymentMethodTitle;
    map['transaction_id'] = _transactionId;
    map['refunds'] = _refunds;
    map['set_paid'] = _setPaid;
    map['date_created'] = _dateCreated;
    map['is_cancelable'] = _isCancelable;
    map['total_line_item'] = _totalLineItem;
    return map;
  }
}
