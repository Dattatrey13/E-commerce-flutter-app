class GetProductPriceModel {
  GetProductPriceModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetProductPriceModel.fromJson(dynamic json) {
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

  GetProductPriceModel copyWith({
    bool? success,
    String? message,
    List<Data>? data,
  }) =>
      GetProductPriceModel(
        success: success ?? _success,
        message: message ?? _message,
        data: data ?? _data,
      );

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
    num? slug,
    String? sku,
    num? virtual,
    num? downloadable,
    String? minPrice,
    String? maxPrice,
    num? onsale,
    dynamic stockQuantity,
    String? stockStatus,
    num? ratingCount,
    String? averageRating,
    num? totalSales,
    String? taxStatus,
    String? taxClass,
  }) {
    _slug = slug;
    _sku = sku;
    _virtual = virtual;
    _downloadable = downloadable;
    _minPrice = minPrice;
    _maxPrice = maxPrice;
    _onsale = onsale;
    _stockQuantity = stockQuantity;
    _stockStatus = stockStatus;
    _ratingCount = ratingCount;
    _averageRating = averageRating;
    _totalSales = totalSales;
    _taxStatus = taxStatus;
    _taxClass = taxClass;
  }

  Data.fromJson(dynamic json) {
    _slug = json['product_slug'];
    _sku = json['sku'];
    _virtual = json['virtual'];
    _downloadable = json['downloadable'];
    _minPrice = json['min_price'];
    _maxPrice = json['max_price'];
    _onsale = json['onsale'];
    _stockQuantity = json['stock_quantity'];
    _stockStatus = json['stock_status'];
    _ratingCount = json['rating_count'];
    _averageRating = json['average_rating'];
    _totalSales = json['total_sales'];
    _taxStatus = json['tax_status'];
    _taxClass = json['tax_class'];
  }

  num? _slug;
  String? _sku;
  num? _virtual;
  num? _downloadable;
  String? _minPrice;
  String? _maxPrice;
  num? _onsale;
  dynamic _stockQuantity;
  String? _stockStatus;
  num? _ratingCount;
  String? _averageRating;
  num? _totalSales;
  String? _taxStatus;
  String? _taxClass;

  Data copyWith({
    num? slug,
    String? sku,
    num? virtual,
    num? downloadable,
    String? minPrice,
    String? maxPrice,
    num? onsale,
    dynamic stockQuantity,
    String? stockStatus,
    num? ratingCount,
    String? averageRating,
    num? totalSales,
    String? taxStatus,
    String? taxClass,
  }) =>
      Data(
        slug: slug ?? _slug,
        sku: sku ?? _sku,
        virtual: virtual ?? _virtual,
        downloadable: downloadable ?? _downloadable,
        minPrice: minPrice ?? _minPrice,
        maxPrice: maxPrice ?? _maxPrice,
        onsale: onsale ?? _onsale,
        stockQuantity: stockQuantity ?? _stockQuantity,
        stockStatus: stockStatus ?? _stockStatus,
        ratingCount: ratingCount ?? _ratingCount,
        averageRating: averageRating ?? _averageRating,
        totalSales: totalSales ?? _totalSales,
        taxStatus: taxStatus ?? _taxStatus,
        taxClass: taxClass ?? _taxClass,
      );

  num? get slug => _slug;

  String? get sku => _sku;

  num? get virtual => _virtual;

  num? get downloadable => _downloadable;

  String? get minPrice => _minPrice;

  String? get maxPrice => _maxPrice;

  num? get onsale => _onsale;

  dynamic get stockQuantity => _stockQuantity;

  String? get stockStatus => _stockStatus;

  num? get ratingCount => _ratingCount;

  String? get averageRating => _averageRating;

  num? get totalSales => _totalSales;

  String? get taxStatus => _taxStatus;

  String? get taxClass => _taxClass;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_slug'] = _slug;
    map['sku'] = _sku;
    map['virtual'] = _virtual;
    map['downloadable'] = _downloadable;
    map['min_price'] = _minPrice;
    map['max_price'] = _maxPrice;
    map['onsale'] = _onsale;
    map['stock_quantity'] = _stockQuantity;
    map['stock_status'] = _stockStatus;
    map['rating_count'] = _ratingCount;
    map['average_rating'] = _averageRating;
    map['total_sales'] = _totalSales;
    map['tax_status'] = _taxStatus;
    map['tax_class'] = _taxClass;
    return map;
  }
}
