class CategoryModel {
  CategoryModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  CategoryModel.fromJson(dynamic json) {
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

  CategoryModel copyWith({
    bool? success,
    String? message,
    List<Data>? data,
  }) =>
      CategoryModel(
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
    num? termIdId,
    num? parentId,
    num? termTaxonomyId,
    String? termIdName,
    num? count,
    String? categoryUrl,
    List<Children>? children,
  }) {
    _termIdId = termIdId;
    _parentId = parentId;
    _termTaxonomyId = termTaxonomyId;
    _termIdName = termIdName;
    _count = count;
    _categoryUrl = categoryUrl;
    _children = children;
  }

  Data.fromJson(dynamic json) {
    _termIdId = json['term_id_id'];
    _parentId = json['parent_id'];
    _termTaxonomyId = json['term_taxonomy_id'];
    _termIdName = json['term_id__name'];
    _count = json['count'];
    _categoryUrl = json['category_url'];
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(Children.fromJson(v));
      });
    }
  }

  num? _termIdId;
  num? _parentId;
  num? _termTaxonomyId;
  String? _termIdName;
  num? _count;
  String? _categoryUrl;
  List<Children>? _children;

  Data copyWith({
    num? termIdId,
    num? parentId,
    num? termTaxonomyId,
    String? termIdName,
    num? count,
    String? categoryUrl,
    List<Children>? children,
  }) =>
      Data(
        termIdId: termIdId ?? _termIdId,
        parentId: parentId ?? _parentId,
        termTaxonomyId: termTaxonomyId ?? _termTaxonomyId,
        termIdName: termIdName ?? _termIdName,
        count: count ?? _count,
        categoryUrl: categoryUrl ?? _categoryUrl,
        children: children ?? _children,
      );

  num? get termIdId => _termIdId;

  num? get parentId => _parentId;

  num? get termTaxonomyId => _termTaxonomyId;

  String? get termIdName => _termIdName;

  num? get count => _count;

  String? get categoryUrl => _categoryUrl;

  List<Children>? get children => _children;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['term_id_id'] = _termIdId;
    map['parent_id'] = _parentId;
    map['term_taxonomy_id'] = _termTaxonomyId;
    map['term_id__name'] = _termIdName;
    map['count'] = _count;
    map['category_url'] = _categoryUrl;
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Children {
  Children({
    num? termIdId,
    num? parentId,
    num? termTaxonomyId,
    String? termIdName,
    num? count,
  }) {
    _termIdId = termIdId;
    _parentId = parentId;
    _termTaxonomyId = termTaxonomyId;
    _termIdName = termIdName;
    _count = count;
  }

  Children.fromJson(dynamic json) {
    _termIdId = json['term_id_id'];
    _parentId = json['parent_id'];
    _termTaxonomyId = json['term_taxonomy_id'];
    _termIdName = json['term_id__name'];
    _count = json['count'];
  }

  num? _termIdId;
  num? _parentId;
  num? _termTaxonomyId;
  String? _termIdName;
  num? _count;

  Children copyWith({
    num? termIdId,
    num? parentId,
    num? termTaxonomyId,
    String? termIdName,
    num? count,
  }) =>
      Children(
        termIdId: termIdId ?? _termIdId,
        parentId: parentId ?? _parentId,
        termTaxonomyId: termTaxonomyId ?? _termTaxonomyId,
        termIdName: termIdName ?? _termIdName,
        count: count ?? _count,
      );

  num? get termIdId => _termIdId;

  num? get parentId => _parentId;

  num? get termTaxonomyId => _termTaxonomyId;

  String? get termIdName => _termIdName;

  num? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['term_id_id'] = _termIdId;
    map['parent_id'] = _parentId;
    map['term_taxonomy_id'] = _termTaxonomyId;
    map['term_id__name'] = _termIdName;
    map['count'] = _count;
    return map;
  }
}
