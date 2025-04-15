/// success : true
/// message : "Created successfully"
/// data : {"id":3,"review":"Testing Review","rating":4,"status":"pending","created_at":"2024-08-31T11:12:35.329414","is_verified":false,"reviewer_user_id":null,"created_by":2}

class CreateReviewModel {
  CreateReviewModel({
    bool? success,
    String? message,
    Data? data,}){
    _success = success;
    _message = message;
    _data = data;
  }

  CreateReviewModel.fromJson(dynamic json) {
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

/// id : 3
/// review : "Testing Review"
/// rating : 4
/// status : "pending"
/// created_at : "2024-08-31T11:12:35.329414"
/// is_verified : false
/// reviewer_user_id : null
/// created_by : 2

class Data {
  Data({
    num? id,
    String? review,
    num? rating,
    String? status,
    String? createdAt,
    bool? isVerified,
    dynamic reviewerUserId,
    num? createdBy,}){
    _id = id;
    _review = review;
    _rating = rating;
    _status = status;
    _createdAt = createdAt;
    _isVerified = isVerified;
    _reviewerUserId = reviewerUserId;
    _createdBy = createdBy;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _review = json['review'];
    _rating = json['rating'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _isVerified = json['is_verified'];
    _reviewerUserId = json['reviewer_user_id'];
    _createdBy = json['created_by'];
  }
  num? _id;
  String? _review;
  num? _rating;
  String? _status;
  String? _createdAt;
  bool? _isVerified;
  dynamic _reviewerUserId;
  num? _createdBy;

  num? get id => _id;
  String? get review => _review;
  num? get rating => _rating;
  String? get status => _status;
  String? get createdAt => _createdAt;
  bool? get isVerified => _isVerified;
  dynamic get reviewerUserId => _reviewerUserId;
  num? get createdBy => _createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['review'] = _review;
    map['rating'] = _rating;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['is_verified'] = _isVerified;
    map['reviewer_user_id'] = _reviewerUserId;
    map['created_by'] = _createdBy;
    return map;
  }

}