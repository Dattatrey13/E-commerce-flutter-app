class QuoteListModel {
  QuoteListModel({
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

  QuoteListModel.fromJson(dynamic json) {
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

/// id : 46
/// request_count : 0
/// name : "knk"
/// phone_number : "7048704208"
/// company_name : "sdfe"
/// requirements : "Colors"
/// details : "sefef"
/// form_type : "GET_QUOTE"
/// other_data : {"company_name":"sdfe"}
/// created_at : "2024-10-17T00:01:55.190314"
/// is_handover : false
/// assigned_at : null
/// is_reported : false
/// reference_images : ["https://dapperz.s3.ap-south-1.amazonaws.com/wp-content/uploads/forms/document/Banner3-scaled.jpg"]
/// is_blocked : false
/// is_active : true
/// requested_user : 31
/// assigned_vendor : null

class Data {
  Data({
    num? id,
    num? requestCount,
    String? name,
    String? phoneNumber,
    String? companyName,
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
    num? requestedUser,
    dynamic assignedVendor,
  }) {
    _id = id;
    _requestCount = requestCount;
    _name = name;
    _phoneNumber = phoneNumber;
    _companyName = companyName;
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
    _requestedUser = requestedUser;
    _assignedVendor = assignedVendor;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _requestCount = json['request_count'];
    _name = json['name'];
    _phoneNumber = json['phone_number'];
    _companyName = json['company_name'];
    _requirements = json['requirements'];
    _details = json['details'];
    _formType = json['form_type'];
    _otherData = json['other_data'] != null
        ? OtherData.fromJson(json['other_data'])
        : null;
    _createdAt = json['created_at'];
    _isHandover = json['is_handover'];
    _assignedAt = json['assigned_at'];
    _isReported = json['is_reported'];
    _referenceImages = json['reference_images'] != null
        ? json['reference_images'].cast<String>()
        : [];
    _isBlocked = json['is_blocked'];
    _isActive = json['is_active'];
    _requestedUser = json['requested_user'];
    _assignedVendor = json['assigned_vendor'];
  }

  num? _id;
  num? _requestCount;
  String? _name;
  String? _phoneNumber;
  String? _companyName;
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
  num? _requestedUser;
  dynamic _assignedVendor;

  num? get id => _id;

  num? get requestCount => _requestCount;

  String? get name => _name;

  String? get phoneNumber => _phoneNumber;

  String? get companyName => _companyName;

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

  num? get requestedUser => _requestedUser;

  dynamic get assignedVendor => _assignedVendor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['request_count'] = _requestCount;
    map['name'] = _name;
    map['phone_number'] = _phoneNumber;
    map['company_name'] = _companyName;
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
    map['reference_images'] = _referenceImages;
    map['is_blocked'] = _isBlocked;
    map['is_active'] = _isActive;
    map['requested_user'] = _requestedUser;
    map['assigned_vendor'] = _assignedVendor;
    return map;
  }
}

/// company_name : "sdfe"

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

/// next : null
/// previous : null
/// count : 2
/// total_pages : 1
/// current_page : 1

class Pagination {
  Pagination({
    dynamic next,
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

  dynamic _next;
  dynamic _previous;
  num? _count;
  num? _totalPages;
  num? _currentPage;

  dynamic get next => _next;

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
