/// success : true
/// message : "Data retrieved successfully."
/// pagination : {"next":null,"previous":null,"count":1,"total_pages":1,"current_page":1}
/// data : [{"id":3,"review":"Testing Review","rating":4,"created_at":"2024-08-31T11:12:35.329414","status":"pending","created_by":{"first_name":"hemant"}}]

class ProductReviewListModel {
  ProductReviewListModel({
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

  ProductReviewListModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
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

/// id : 3
/// review : "Testing Review"
/// rating : 4
/// created_at : "2024-08-31T11:12:35.329414"
/// status : "pending"
/// created_by : {"first_name":"hemant"}

class Data {
  Data({
    num? id,
    String? review,
    num? rating,
    String? createdAt,
    String? status,
    CreatedBy? createdBy,
  }) {
    _id = id;
    _review = review;
    _rating = rating;
    _createdAt = createdAt;
    _status = status;
    _createdBy = createdBy;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _review = json['review'];
    _rating = json['rating'];
    _createdAt = json['created_at'];
    _status = json['status'];
    _createdBy = json['created_by'] != null ? CreatedBy.fromJson(json['created_by']) : null;
  }

  num? _id;
  String? _review;
  num? _rating;
  String? _createdAt;
  String? _status;
  CreatedBy? _createdBy;

  num? get id => _id;

  String? get review => _review;

  num? get rating => _rating;

  String? get createdAt => _createdAt;

  String? get status => _status;

  CreatedBy? get createdBy => _createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['review'] = _review;
    map['rating'] = _rating;
    map['created_at'] = _createdAt;
    map['status'] = _status;
    if (_createdBy != null) {
      map['created_by'] = _createdBy?.toJson();
    }
    return map;
  }
}

/// first_name : "hemant"

class CreatedBy {
  CreatedBy({
    String? firstName,
  }) {
    _firstName = firstName;
  }

  CreatedBy.fromJson(dynamic json) {
    _firstName = json['first_name'];
  }

  String? _firstName;

  String? get firstName => _firstName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    return map;
  }
}

/// next : null
/// previous : null
/// count : 1
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
