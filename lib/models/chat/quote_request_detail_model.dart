/// success : true
/// message : "Success"
/// data : {"quotation":{"id":44,"request_count":9,"name":"Hemant","phone_number":"9123456780","company_name":"18","area":null,"requirements":"Building Material","details":"Testing","form_type":"GET_QUOTE","other_data":{"company_name":"18"},"created_at":"2024-10-16T23:05:09.523336","is_handover":false,"assigned_at":null,"is_reported":false,"reference_images":[],"is_blocked":false,"is_active":true,"city":null,"category_id":null,"requested_user":2,"assigned_vendor":null},"requests":{"id":15,"quotation_items":[{"id":16,"title":"item 1","description":"Description","price":"500.00","qty":5,"line_total":"2500.00","is_included_tax":true,"tax_per":"10.00","quotation_id":44},{"id":17,"title":"Item 2","description":"Description","price":"200.00","qty":5,"line_total":"1000.00","is_included_tax":true,"tax_per":"10.00","quotation_id":44}],"requested_user":{"id":2,"first_name":"Hemant","last_name":"Manglani"},"vendor_id":{"id":203,"first_name":"Dapperz (c9)","last_name":"Mart"},"created_at":"2024-10-17T09:19:37.456920","updated_at":"2024-10-17T09:19:37.456939","is_reported":false,"is_deleted":false,"status":"pending","total":"3500.00","sub_total":"3150.00","total_tax":"350.00","notes":null,"is_advance":true,"shipping":"0.00","discount":"0.00","reference_images":null,"quotation_id":44}}

class QuoteRequestDetailModel {
  QuoteRequestDetailModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  QuoteRequestDetailModel.fromJson(dynamic json) {
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

/// quotation : {"id":44,"request_count":9,"name":"Hemant","phone_number":"9123456780","company_name":"18","area":null,"requirements":"Building Material","details":"Testing","form_type":"GET_QUOTE","other_data":{"company_name":"18"},"created_at":"2024-10-16T23:05:09.523336","is_handover":false,"assigned_at":null,"is_reported":false,"reference_images":[],"is_blocked":false,"is_active":true,"city":null,"category_id":null,"requested_user":2,"assigned_vendor":null}
/// requests : {"id":15,"quotation_items":[{"id":16,"title":"item 1","description":"Description","price":"500.00","qty":5,"line_total":"2500.00","is_included_tax":true,"tax_per":"10.00","quotation_id":44},{"id":17,"title":"Item 2","description":"Description","price":"200.00","qty":5,"line_total":"1000.00","is_included_tax":true,"tax_per":"10.00","quotation_id":44}],"requested_user":{"id":2,"first_name":"Hemant","last_name":"Manglani"},"vendor_id":{"id":203,"first_name":"Dapperz (c9)","last_name":"Mart"},"created_at":"2024-10-17T09:19:37.456920","updated_at":"2024-10-17T09:19:37.456939","is_reported":false,"is_deleted":false,"status":"pending","total":"3500.00","sub_total":"3150.00","total_tax":"350.00","notes":null,"is_advance":true,"shipping":"0.00","discount":"0.00","reference_images":null,"quotation_id":44}

class Data {
  Data({
    Quotation? quotation,
    Requests? requests,
  }) {
    _quotation = quotation;
    _requests = requests;
  }

  Data.fromJson(dynamic json) {
    _quotation = json['quotation'] != null ? Quotation.fromJson(json['quotation']) : null;
    _requests = json['requests'] != null ? Requests.fromJson(json['requests']) : null;
  }

  Quotation? _quotation;
  Requests? _requests;

  Quotation? get quotation => _quotation;

  Requests? get requests => _requests;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_quotation != null) {
      map['quotation'] = _quotation?.toJson();
    }
    if (_requests != null) {
      map['requests'] = _requests?.toJson();
    }
    return map;
  }
}

/// id : 15
/// quotation_items : [{"id":16,"title":"item 1","description":"Description","price":"500.00","qty":5,"line_total":"2500.00","is_included_tax":true,"tax_per":"10.00","quotation_id":44},{"id":17,"title":"Item 2","description":"Description","price":"200.00","qty":5,"line_total":"1000.00","is_included_tax":true,"tax_per":"10.00","quotation_id":44}]
/// requested_user : {"id":2,"first_name":"Hemant","last_name":"Manglani"}
/// vendor_id : {"id":203,"first_name":"Dapperz (c9)","last_name":"Mart"}
/// created_at : "2024-10-17T09:19:37.456920"
/// updated_at : "2024-10-17T09:19:37.456939"
/// is_reported : false
/// is_deleted : false
/// status : "pending"
/// total : "3500.00"
/// sub_total : "3150.00"
/// total_tax : "350.00"
/// notes : null
/// is_advance : true
/// shipping : "0.00"
/// discount : "0.00"
/// reference_images : null
/// quotation_id : 44

class Requests {
  Requests({
    num? id,
    List<QuotationItems>? quotationItems,
    RequestedUser? requestedUser,
    VendorId? vendorId,
    String? createdAt,
    String? updatedAt,
    bool? isReported,
    bool? isDeleted,
    String? status,
    String? total,
    String? subTotal,
    String? totalTax,
    dynamic notes,
    bool? isAdvance,
    String? shipping,
    String? discount,
    dynamic referenceImages,
    num? quotationId,
  }) {
    _id = id;
    _quotationItems = quotationItems;
    _requestedUser = requestedUser;
    _vendorId = vendorId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _isReported = isReported;
    _isDeleted = isDeleted;
    _status = status;
    _total = total;
    _subTotal = subTotal;
    _totalTax = totalTax;
    _notes = notes;
    _isAdvance = isAdvance;
    _shipping = shipping;
    _discount = discount;
    _referenceImages = referenceImages;
    _quotationId = quotationId;
  }

  Requests.fromJson(dynamic json) {
    _id = json['id'];
    if (json['quotation_items'] != null) {
      _quotationItems = [];
      json['quotation_items'].forEach((v) {
        _quotationItems?.add(QuotationItems.fromJson(v));
      });
    }
    _requestedUser = json['requested_user'] != null ? RequestedUser.fromJson(json['requested_user']) : null;
    _vendorId = json['vendor_id'] != null ? VendorId.fromJson(json['vendor_id']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _isReported = json['is_reported'];
    _isDeleted = json['is_deleted'];
    _status = json['status'];
    _total = json['total'];
    _subTotal = json['sub_total'];
    _totalTax = json['total_tax'];
    _notes = json['notes'];
    _isAdvance = json['is_advance'];
    _shipping = json['shipping'];
    _discount = json['discount'];
    _referenceImages = json['reference_images'];
    _quotationId = json['quotation_id'];
  }

  num? _id;
  List<QuotationItems>? _quotationItems;
  RequestedUser? _requestedUser;
  VendorId? _vendorId;
  String? _createdAt;
  String? _updatedAt;
  bool? _isReported;
  bool? _isDeleted;
  String? _status;
  String? _total;
  String? _subTotal;
  String? _totalTax;
  dynamic _notes;
  bool? _isAdvance;
  String? _shipping;
  String? _discount;
  dynamic _referenceImages;
  num? _quotationId;

  num? get id => _id;

  List<QuotationItems>? get quotationItems => _quotationItems;

  RequestedUser? get requestedUser => _requestedUser;

  VendorId? get vendorId => _vendorId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  bool? get isReported => _isReported;

  bool? get isDeleted => _isDeleted;

  String? get status => _status;

  String? get total => _total;

  String? get subTotal => _subTotal;

  String? get totalTax => _totalTax;

  dynamic get notes => _notes;

  bool? get isAdvance => _isAdvance;

  String? get shipping => _shipping;

  String? get discount => _discount;

  dynamic get referenceImages => _referenceImages;

  num? get quotationId => _quotationId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_quotationItems != null) {
      map['quotation_items'] = _quotationItems?.map((v) => v.toJson()).toList();
    }
    if (_requestedUser != null) {
      map['requested_user'] = _requestedUser?.toJson();
    }
    if (_vendorId != null) {
      map['vendor_id'] = _vendorId?.toJson();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['is_reported'] = _isReported;
    map['is_deleted'] = _isDeleted;
    map['status'] = _status;
    map['total'] = _total;
    map['sub_total'] = _subTotal;
    map['total_tax'] = _totalTax;
    map['notes'] = _notes;
    map['is_advance'] = _isAdvance;
    map['shipping'] = _shipping;
    map['discount'] = _discount;
    map['reference_images'] = _referenceImages;
    map['quotation_id'] = _quotationId;
    return map;
  }
}

/// id : 203
/// first_name : "Dapperz (c9)"
/// last_name : "Mart"

class VendorId {
  VendorId({
    num? id,
    String? firstName,
    String? lastName,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
  }

  VendorId.fromJson(dynamic json) {
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

/// id : 2
/// first_name : "Hemant"
/// last_name : "Manglani"

class RequestedUser {
  RequestedUser({
    num? id,
    String? firstName,
    String? lastName,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
  }

  RequestedUser.fromJson(dynamic json) {
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

/// id : 16
/// title : "item 1"
/// description : "Description"
/// price : "500.00"
/// qty : 5
/// line_total : "2500.00"
/// is_included_tax : true
/// tax_per : "10.00"
/// quotation_id : 44

class QuotationItems {
  QuotationItems({
    num? id,
    String? title,
    String? description,
    String? price,
    num? qty,
    String? lineTotal,
    bool? isIncludedTax,
    String? taxPer,
    num? quotationId,
  }) {
    _id = id;
    _title = title;
    _description = description;
    _price = price;
    _qty = qty;
    _lineTotal = lineTotal;
    _isIncludedTax = isIncludedTax;
    _taxPer = taxPer;
    _quotationId = quotationId;
  }

  QuotationItems.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _price = json['price'];
    _qty = json['qty'];
    _lineTotal = json['line_total'];
    _isIncludedTax = json['is_included_tax'];
    _taxPer = json['tax_per'];
    _quotationId = json['quotation_id'];
  }

  num? _id;
  String? _title;
  String? _description;
  String? _price;
  num? _qty;
  String? _lineTotal;
  bool? _isIncludedTax;
  String? _taxPer;
  num? _quotationId;

  num? get id => _id;

  String? get title => _title;

  String? get description => _description;

  String? get price => _price;

  num? get qty => _qty;

  String? get lineTotal => _lineTotal;

  bool? get isIncludedTax => _isIncludedTax;

  String? get taxPer => _taxPer;

  num? get quotationId => _quotationId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['price'] = _price;
    map['qty'] = _qty;
    map['line_total'] = _lineTotal;
    map['is_included_tax'] = _isIncludedTax;
    map['tax_per'] = _taxPer;
    map['quotation_id'] = _quotationId;
    return map;
  }
}

/// id : 44
/// request_count : 9
/// name : "Hemant"
/// phone_number : "9123456780"
/// company_name : "18"
/// area : null
/// requirements : "Building Material"
/// details : "Testing"
/// form_type : "GET_QUOTE"
/// other_data : {"company_name":"18"}
/// created_at : "2024-10-16T23:05:09.523336"
/// is_handover : false
/// assigned_at : null
/// is_reported : false
/// reference_images : []
/// is_blocked : false
/// is_active : true
/// city : null
/// category_id : null
/// requested_user : 2
/// assigned_vendor : null

class Quotation {
  Quotation({
    num? id,
    num? requestCount,
    String? name,
    String? phoneNumber,
    String? companyName,
    dynamic area,
    String? requirements,
    String? details,
    String? formType,
    OtherData? otherData,
    String? createdAt,
    bool? isHandover,
    dynamic assignedAt,
    bool? isReported,
    List<String>? referenceImages,
    bool? isBlocked,
    bool? isActive,
    dynamic city,
    dynamic categoryId,
    num? requestedUser,
    dynamic assignedVendor,
  }) {
    _id = id;
    _requestCount = requestCount;
    _name = name;
    _phoneNumber = phoneNumber;
    _companyName = companyName;
    _area = area;
    _requirements = requirements;
    _details = details;
    _formType = formType;
    _otherData = otherData;
    _createdAt = createdAt;
    _isHandover = isHandover;
    _assignedAt = assignedAt;
    _isReported = isReported;
    _referenceImages = referenceImages;
    _isBlocked = isBlocked;
    _isActive = isActive;
    _city = city;
    _categoryId = categoryId;
    _requestedUser = requestedUser;
    _assignedVendor = assignedVendor;
  }

  Quotation.fromJson(dynamic json) {
    _id = json['id'];
    _requestCount = json['request_count'];
    _name = json['name'];
    _phoneNumber = json['phone_number'];
    _companyName = json['company_name'];
    _area = json['area'];
    _requirements = json['requirements'];
    _details = json['details'];
    _formType = json['form_type'];
    _otherData = json['other_data'] != null ? OtherData.fromJson(json['other_data']) : null;
    _createdAt = json['created_at'];
    _isHandover = json['is_handover'];
    _assignedAt = json['assigned_at'];
    _isReported = json['is_reported'];
    if (json['reference_images'] != null) {
      _referenceImages = [];
      json['reference_images'].forEach((v) {
        _referenceImages?.add(v);
      });
    }
    _isBlocked = json['is_blocked'];
    _isActive = json['is_active'];
    _city = json['city'];
    _categoryId = json['category_id'];
    _requestedUser = json['requested_user'];
    _assignedVendor = json['assigned_vendor'];
  }

  num? _id;
  num? _requestCount;
  String? _name;
  String? _phoneNumber;
  String? _companyName;
  dynamic _area;
  String? _requirements;
  String? _details;
  String? _formType;
  OtherData? _otherData;
  String? _createdAt;
  bool? _isHandover;
  dynamic _assignedAt;
  bool? _isReported;
  List<String>? _referenceImages;
  bool? _isBlocked;
  bool? _isActive;
  dynamic _city;
  dynamic _categoryId;
  num? _requestedUser;
  dynamic _assignedVendor;

  num? get id => _id;

  num? get requestCount => _requestCount;

  String? get name => _name;

  String? get phoneNumber => _phoneNumber;

  String? get companyName => _companyName;

  dynamic get area => _area;

  String? get requirements => _requirements;

  String? get details => _details;

  String? get formType => _formType;

  OtherData? get otherData => _otherData;

  String? get createdAt => _createdAt;

  bool? get isHandover => _isHandover;

  dynamic get assignedAt => _assignedAt;

  bool? get isReported => _isReported;

  List<String>? get referenceImages => _referenceImages;

  bool? get isBlocked => _isBlocked;

  bool? get isActive => _isActive;

  dynamic get city => _city;

  dynamic get categoryId => _categoryId;

  num? get requestedUser => _requestedUser;

  dynamic get assignedVendor => _assignedVendor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['request_count'] = _requestCount;
    map['name'] = _name;
    map['phone_number'] = _phoneNumber;
    map['company_name'] = _companyName;
    map['area'] = _area;
    map['requirements'] = _requirements;
    map['details'] = _details;
    map['form_type'] = _formType;
    if (_otherData != null) {
      map['other_data'] = _otherData?.toJson();
    }
    map['created_at'] = _createdAt;
    map['is_handover'] = _isHandover;
    map['assigned_at'] = _assignedAt;
    map['is_reported'] = _isReported;
    if (_referenceImages != null) {
      map['reference_images'] = _referenceImages?.map((v) => v).toList();
    }
    map['is_blocked'] = _isBlocked;
    map['is_active'] = _isActive;
    map['city'] = _city;
    map['category_id'] = _categoryId;
    map['requested_user'] = _requestedUser;
    map['assigned_vendor'] = _assignedVendor;
    return map;
  }
}

/// company_name : "18"

class OtherData {
  OtherData({
    String? companyName,
  }) {
    _companyName = companyName;
  }

  OtherData.fromJson(dynamic json) {
    _companyName = json['company_name'];
  }

  String? _companyName;

  String? get companyName => _companyName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_name'] = _companyName;
    return map;
  }
}
