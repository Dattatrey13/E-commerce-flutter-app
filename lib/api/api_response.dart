import 'package:dapperz/api/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.idle() : status = Status.idle;

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed(this.data, {dynamic otherParams})
      : status = Status.completed;

  ApiResponse.error(this.message) : status = Status.error;
}
