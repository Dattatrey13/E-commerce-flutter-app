// class CheckPincodeModel {
//   CheckPincodeModel({
//     bool? success,
//     String? message,
//     Data? data,
//   }) {
//     _success = success;
//     _message = message;
//     _data = data;
//   }
//
//   CheckPincodeModel.fromJson(dynamic json) {
//     _success = json['success'];
//     _message = json['message'];
//     _data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//
//   bool? _success;
//   String? _message;
//   Data? _data;
//
//   CheckPincodeModel copyWith({
//     bool? success,
//     String? message,
//     Data? data,
//   }) =>
//       CheckPincodeModel(
//         success: success ?? _success,
//         message: message ?? _message,
//         data: data ?? _data,
//       );
//
//   bool? get success => _success;
//
//   String? get message => _message;
//
//   Data? get data => _data;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['success'] = _success;
//     map['message'] = _message;
//     if (_data != null) {
//       map['data'] = _data?.toJson();
//     }
//     return map;
//   }
// }
//
// class Data {
//   Data({
//     bool? isExists,
//     List<dynamic>? pincode,
//   }) {
//     _isExists = isExists;
//     _pincode = pincode;
//   }
//
//   Data.fromJson(dynamic json) {
//     _isExists = json['is_exists'];
//     if (json['pincode'] != null) {
//       _pincode = [];
//     }
//   }
//
//   bool? _isExists;
//   List<dynamic>? _pincode;
//
//   Data copyWith({
//     bool? isExists,
//     List<dynamic>? pincode,
//   }) =>
//       Data(
//         isExists: isExists ?? _isExists,
//         pincode: pincode ?? _pincode,
//       );
//
//   bool? get isExists => _isExists;
//
//   List<dynamic>? get pincode => _pincode;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['is_exists'] = _isExists;
//     if (_pincode != null) {
//       map['pincode'] = _pincode?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }
