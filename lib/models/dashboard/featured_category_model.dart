class FeaturedCategoryModel {
  FeaturedCategoryModel({
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

  FeaturedCategoryModel.fromJson(dynamic json) {
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

  FeaturedCategoryModel copyWith({
    bool? success,
    String? message,
    Pagination? pagination,
    List<Data>? data,
  }) =>
      FeaturedCategoryModel(
        success: success ?? _success,
        message: message ?? _message,
        pagination: pagination ?? _pagination,
        data: data ?? _data,
      );

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

class Data {
  Data({
    num? id,
    String? createdDate,
    String? name,
    String? description,
    String? htmlPrice,
    String? sku,
    String? skuVariations,
    String? attributes,
    String? image,
    String? url,
    String? price,
    String? averageRating,
    num? reviewCount,
    num? totalSales,
    PostId? postId,
    String? priceRange,
    String? postContent,
  }) {
    _id = id;
    _createdDate = createdDate;
    _name = name;
    _description = description;
    _htmlPrice = htmlPrice;
    _sku = sku;
    _skuVariations = skuVariations;
    _attributes = attributes;
    _image = image;
    _url = url;
    _price = price;
    _averageRating = averageRating;
    _reviewCount = reviewCount;
    _totalSales = totalSales;
    _postId = postId;
    _priceRange = priceRange;
    _postContent = postContent;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _createdDate = json['created_date'];
    _name = json['name'];
    _description = json['description'];
    _htmlPrice = json['html_price'];
    _sku = json['sku'];
    _skuVariations = json['sku_variations'];
    _attributes = json['attributes'];
    _image = json['image'];
    _url = json['url'];
    _price = json['price'];
    _averageRating = json['average_rating'];
    _reviewCount = json['review_count'];
    _totalSales = json['total_sales'];
    _postId = json['post_id'] != null ? PostId.fromJson(json['post_id']) : null;
    _priceRange = json['price_range'];
    _postContent = json['post_content'];
  }

  num? _id;
  String? _createdDate;
  String? _name;
  String? _description;
  String? _htmlPrice;
  String? _sku;
  String? _skuVariations;
  String? _attributes;
  String? _image;
  String? _url;
  String? _price;
  String? _averageRating;
  num? _reviewCount;
  num? _totalSales;
  PostId? _postId;
  String? _priceRange;
  String? _postContent;

  Data copyWith({
    num? id,
    String? createdDate,
    String? name,
    String? description,
    String? htmlPrice,
    String? sku,
    String? skuVariations,
    String? attributes,
    String? image,
    String? url,
    String? price,
    String? averageRating,
    num? reviewCount,
    num? totalSales,
    PostId? postId,
    String? priceRange,
    String? postContent,
  }) =>
      Data(
        id: id ?? _id,
        createdDate: createdDate ?? _createdDate,
        name: name ?? _name,
        description: description ?? _description,
        htmlPrice: htmlPrice ?? _htmlPrice,
        sku: sku ?? _sku,
        skuVariations: skuVariations ?? _skuVariations,
        attributes: attributes ?? _attributes,
        image: image ?? _image,
        url: url ?? _url,
        price: price ?? _price,
        averageRating: averageRating ?? _averageRating,
        reviewCount: reviewCount ?? _reviewCount,
        totalSales: totalSales ?? _totalSales,
        postId: postId ?? _postId,
        priceRange: priceRange ?? _priceRange,
        postContent: postContent ?? _postContent,
      );

  num? get id => _id;

  String? get createdDate => _createdDate;

  String? get name => _name;

  String? get description => _description;

  String? get htmlPrice => _htmlPrice;

  String? get sku => _sku;

  String? get skuVariations => _skuVariations;

  String? get attributes => _attributes;

  String? get image => _image;

  String? get url => _url;

  String? get price => _price;

  String? get averageRating => _averageRating;

  num? get reviewCount => _reviewCount;

  num? get totalSales => _totalSales;

  PostId? get postId => _postId;

  String? get priceRange => _priceRange;

  String? get postContent => _postContent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_date'] = _createdDate;
    map['name'] = _name;
    map['description'] = _description;
    map['html_price'] = _htmlPrice;
    map['sku'] = _sku;
    map['sku_variations'] = _skuVariations;
    map['attributes'] = _attributes;
    map['image'] = _image;
    map['url'] = _url;
    map['price'] = _price;
    map['average_rating'] = _averageRating;
    map['review_count'] = _reviewCount;
    map['total_sales'] = _totalSales;
    if (_postId != null) {
      map['post_id'] = _postId?.toJson();
    }
    map['price_range'] = _priceRange;
    map['post_content'] = _postContent;
    return map;
  }
}

class PostId {
  PostId({
    num? id,
    String? postDate,
    String? postDateGmt,
    String? postTitle,
    String? postStatus,
    String? commentStatus,
    String? pingStatus,
    String? postType,
    num? commentCount,
    PostMeta? postMeta,
    String? postContent,
  }) {
    _id = id;
    _postDate = postDate;
    _postDateGmt = postDateGmt;
    _postTitle = postTitle;
    _postStatus = postStatus;
    _commentStatus = commentStatus;
    _pingStatus = pingStatus;
    _postType = postType;
    _commentCount = commentCount;
    _postMeta = postMeta;
    _postContent = postContent;
  }

  PostId.fromJson(dynamic json) {
    _id = json['id'];
    _postDate = json['post_date'];
    _postDateGmt = json['post_date_gmt'];
    _postTitle = json['post_title'];
    _postStatus = json['post_status'];
    _commentStatus = json['comment_status'];
    _pingStatus = json['ping_status'];
    _postType = json['post_type'];
    _commentCount = json['comment_count'];
    _postMeta = json['post_meta'] != null ? PostMeta.fromJson(json['post_meta']) : null;
    _postContent = json['post_content'];
  }

  num? _id;
  String? _postDate;
  String? _postDateGmt;
  String? _postTitle;
  String? _postStatus;
  String? _commentStatus;
  String? _pingStatus;
  String? _postType;
  num? _commentCount;
  PostMeta? _postMeta;
  String? _postContent;

  PostId copyWith({
    num? id,
    String? postDate,
    String? postDateGmt,
    String? postTitle,
    String? postStatus,
    String? commentStatus,
    String? pingStatus,
    String? postType,
    num? commentCount,
    PostMeta? postMeta,
    String? postContent,
  }) =>
      PostId(
        id: id ?? _id,
        postDate: postDate ?? _postDate,
        postDateGmt: postDateGmt ?? _postDateGmt,
        postTitle: postTitle ?? _postTitle,
        postStatus: postStatus ?? _postStatus,
        commentStatus: commentStatus ?? _commentStatus,
        pingStatus: pingStatus ?? _pingStatus,
        postType: postType ?? _postType,
        commentCount: commentCount ?? _commentCount,
        postMeta: postMeta ?? _postMeta,
        postContent: postContent ?? _postContent,
      );

  num? get id => _id;

  String? get postDate => _postDate;

  String? get postDateGmt => _postDateGmt;

  String? get postTitle => _postTitle;

  String? get postStatus => _postStatus;

  String? get commentStatus => _commentStatus;

  String? get pingStatus => _pingStatus;

  String? get postType => _postType;

  num? get commentCount => _commentCount;

  PostMeta? get postMeta => _postMeta;

  String? get postContent => _postContent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['post_date'] = _postDate;
    map['post_date_gmt'] = _postDateGmt;
    map['post_title'] = _postTitle;
    map['post_status'] = _postStatus;
    map['comment_status'] = _commentStatus;
    map['ping_status'] = _pingStatus;
    map['post_type'] = _postType;
    map['comment_count'] = _commentCount;
    if (_postMeta != null) {
      map['post_meta'] = _postMeta?.toJson();
    }
    map['post_content'] = _postContent;
    return map;
  }
}

class PostMeta {
  PostMeta({
    String? totalSales,
    String? taxStatus,
    String? taxClass,
    String? manageStock,
    String? backorders,
    String? soldIndividually,
    String? virtual,
    String? downloadable,
    String? downloadLimit,
    String? downloadExpiry,
    dynamic stock,
    String? stockStatus,
    String? wcAverageRating,
    String? wcReviewCount,
    String? productVersion,
    ChosenProductCat? chosenProductCat,
    String? visibility,
    String? thumbnailId,
    String? productImageGallery,
    String? regularPrice,
    String? salePrice,
    String? purchaseNote,
    String? productAttributes,
    String? salePriceDatesFrom,
    String? salePriceDatesTo,
    String? price,
    String? dokanMinMaxMeta,
    String? dokanNewProductEmailSent,
    String? deliveryTime,
    String? deliveryTime1,
    String? besaPostViewsCount,
    String? editLast,
    String? wpPageTemplate,
    String? rsPageBgColor,
    String? editLock,
    bool? isAttribute,
    bool? isFeatured,
    bool? isWishList,
  }) {
    _totalSales = totalSales;
    _taxStatus = taxStatus;
    _taxClass = taxClass;
    _manageStock = manageStock;
    _backorders = backorders;
    _soldIndividually = soldIndividually;
    _virtual = virtual;
    _downloadable = downloadable;
    _downloadLimit = downloadLimit;
    _downloadExpiry = downloadExpiry;
    _stock = stock;
    _stockStatus = stockStatus;
    _wcAverageRating = wcAverageRating;
    _wcReviewCount = wcReviewCount;
    _productVersion = productVersion;
    _chosenProductCat = chosenProductCat;
    _visibility = visibility;
    _thumbnailId = thumbnailId;
    _productImageGallery = productImageGallery;
    _regularPrice = regularPrice;
    _salePrice = salePrice;
    _purchaseNote = purchaseNote;
    _productAttributes = productAttributes;
    _salePriceDatesFrom = salePriceDatesFrom;
    _salePriceDatesTo = salePriceDatesTo;
    _price = price;
    _dokanMinMaxMeta = dokanMinMaxMeta;
    _dokanNewProductEmailSent = dokanNewProductEmailSent;
    _deliveryTime = deliveryTime;
    _deliveryTime1 = deliveryTime1;
    _besaPostViewsCount = besaPostViewsCount;
    _editLast = editLast;
    _wpPageTemplate = wpPageTemplate;
    _rsPageBgColor = rsPageBgColor;
    _editLock = editLock;
    _isAttribute = isAttribute;
    _isFeatured = isFeatured;
    _isWishList = isWishList;
  }

  PostMeta.fromJson(dynamic json) {
    _totalSales = json['total_sales'];
    _taxStatus = json['_tax_status'];
    _taxClass = json['_tax_class'];
    _manageStock = json['_manage_stock'];
    _backorders = json['_backorders'];
    _soldIndividually = json['_sold_individually'];
    _virtual = json['_virtual'];
    _downloadable = json['_downloadable'];
    _downloadLimit = json['_download_limit'];
    _downloadExpiry = json['_download_expiry'];
    _stock = json['_stock'];
    _stockStatus = json['_stock_status'];
    _wcAverageRating = json['_wc_average_rating'];
    _wcReviewCount = json['_wc_review_count'];
    _productVersion = json['_product_version'];
    _chosenProductCat = json['chosen_product_cat'] != null ? ChosenProductCat.fromJson(json['chosen_product_cat']) : null;
    _visibility = json['_visibility'];
    _thumbnailId = json['_thumbnail_id'];
    _productImageGallery = json['_product_image_gallery'];
    _regularPrice = json['_regular_price'];
    _salePrice = json['_sale_price'];
    _purchaseNote = json['_purchase_note'];
    _productAttributes = json['_product_attributes'];
    _salePriceDatesFrom = json['_sale_price_dates_from'];
    _salePriceDatesTo = json['_sale_price_dates_to'];
    _price = json['_price'];
    _dokanMinMaxMeta = json['_dokan_min_max_meta'];
    _dokanNewProductEmailSent = json['_dokan_new_product_email_sent'];
    _deliveryTime = json['delivery_time'];
    _deliveryTime1 = json['_delivery_time'];
    _besaPostViewsCount = json['besa_post_views_count'];
    _editLast = json['_edit_last'];
    _wpPageTemplate = json['_wp_page_template'];
    _rsPageBgColor = json['rs_page_bg_color'];
    _editLock = json['_edit_lock'];
    _isAttribute = json['is_attribute'];
    _isFeatured = json['is_featured'];
    _isWishList = json['is_wishlist'];
  }

  String? _totalSales;
  String? _taxStatus;
  String? _taxClass;
  String? _manageStock;
  String? _backorders;
  String? _soldIndividually;
  String? _virtual;
  String? _downloadable;
  String? _downloadLimit;
  String? _downloadExpiry;
  dynamic _stock;
  String? _stockStatus;
  String? _wcAverageRating;
  String? _wcReviewCount;
  String? _productVersion;
  ChosenProductCat? _chosenProductCat;
  String? _visibility;
  String? _thumbnailId;
  String? _productImageGallery;
  String? _regularPrice;
  String? _salePrice;
  String? _purchaseNote;
  String? _productAttributes;
  String? _salePriceDatesFrom;
  String? _salePriceDatesTo;
  String? _price;
  String? _dokanMinMaxMeta;
  String? _dokanNewProductEmailSent;
  String? _deliveryTime;
  String? _deliveryTime1;
  String? _besaPostViewsCount;
  String? _editLast;
  String? _wpPageTemplate;
  String? _rsPageBgColor;
  String? _editLock;
  bool? _isAttribute;
  bool? _isFeatured;
  bool? _isWishList;

  PostMeta copyWith({
    String? totalSales,
    String? taxStatus,
    String? taxClass,
    String? manageStock,
    String? backorders,
    String? soldIndividually,
    String? virtual,
    String? downloadable,
    String? downloadLimit,
    String? downloadExpiry,
    dynamic stock,
    String? stockStatus,
    String? wcAverageRating,
    String? wcReviewCount,
    String? productVersion,
    ChosenProductCat? chosenProductCat,
    String? visibility,
    String? thumbnailId,
    String? productImageGallery,
    String? regularPrice,
    String? salePrice,
    String? purchaseNote,
    String? productAttributes,
    String? salePriceDatesFrom,
    String? salePriceDatesTo,
    String? price,
    String? dokanMinMaxMeta,
    String? dokanNewProductEmailSent,
    String? deliveryTime,
    String? deliveryTime1,
    String? besaPostViewsCount,
    String? editLast,
    String? wpPageTemplate,
    String? rsPageBgColor,
    String? editLock,
    bool? isAttribute,
    bool? isFeatured,
    bool? isWishList,
  }) =>
      PostMeta(
        totalSales: totalSales ?? _totalSales,
        taxStatus: taxStatus ?? _taxStatus,
        taxClass: taxClass ?? _taxClass,
        manageStock: manageStock ?? _manageStock,
        backorders: backorders ?? _backorders,
        soldIndividually: soldIndividually ?? _soldIndividually,
        virtual: virtual ?? _virtual,
        downloadable: downloadable ?? _downloadable,
        downloadLimit: downloadLimit ?? _downloadLimit,
        downloadExpiry: downloadExpiry ?? _downloadExpiry,
        stock: stock ?? _stock,
        stockStatus: stockStatus ?? _stockStatus,
        wcAverageRating: wcAverageRating ?? _wcAverageRating,
        wcReviewCount: wcReviewCount ?? _wcReviewCount,
        productVersion: productVersion ?? _productVersion,
        chosenProductCat: chosenProductCat ?? _chosenProductCat,
        visibility: visibility ?? _visibility,
        thumbnailId: thumbnailId ?? _thumbnailId,
        productImageGallery: productImageGallery ?? _productImageGallery,
        regularPrice: regularPrice ?? _regularPrice,
        salePrice: salePrice ?? _salePrice,
        purchaseNote: purchaseNote ?? _purchaseNote,
        productAttributes: productAttributes ?? _productAttributes,
        salePriceDatesFrom: salePriceDatesFrom ?? _salePriceDatesFrom,
        salePriceDatesTo: salePriceDatesTo ?? _salePriceDatesTo,
        price: price ?? _price,
        dokanMinMaxMeta: dokanMinMaxMeta ?? _dokanMinMaxMeta,
        dokanNewProductEmailSent: dokanNewProductEmailSent ?? _dokanNewProductEmailSent,
        deliveryTime: deliveryTime ?? _deliveryTime,
        deliveryTime1: deliveryTime1 ?? _deliveryTime1,
        besaPostViewsCount: besaPostViewsCount ?? _besaPostViewsCount,
        editLast: editLast ?? _editLast,
        wpPageTemplate: wpPageTemplate ?? _wpPageTemplate,
        rsPageBgColor: rsPageBgColor ?? _rsPageBgColor,
        editLock: editLock ?? _editLock,
        isAttribute: isAttribute ?? _isAttribute,
        isFeatured: isFeatured ?? _isFeatured,
        isWishList: isWishList ?? _isWishList,
      );

  String? get totalSales => _totalSales;

  String? get taxStatus => _taxStatus;

  String? get taxClass => _taxClass;

  String? get manageStock => _manageStock;

  String? get backorders => _backorders;

  String? get soldIndividually => _soldIndividually;

  String? get virtual => _virtual;

  String? get downloadable => _downloadable;

  String? get downloadLimit => _downloadLimit;

  String? get downloadExpiry => _downloadExpiry;

  dynamic get stock => _stock;

  String? get stockStatus => _stockStatus;

  String? get wcAverageRating => _wcAverageRating;

  String? get wcReviewCount => _wcReviewCount;

  String? get productVersion => _productVersion;

  ChosenProductCat? get chosenProductCat => _chosenProductCat;

  String? get visibility => _visibility;

  String? get thumbnailId => _thumbnailId;

  String? get productImageGallery => _productImageGallery;

  String? get regularPrice => _regularPrice;

  String? get salePrice => _salePrice;

  String? get purchaseNote => _purchaseNote;

  String? get productAttributes => _productAttributes;

  String? get salePriceDatesFrom => _salePriceDatesFrom;

  String? get salePriceDatesTo => _salePriceDatesTo;

  String? get price => _price;

  String? get dokanMinMaxMeta => _dokanMinMaxMeta;

  String? get dokanNewProductEmailSent => _dokanNewProductEmailSent;

  String? get deliveryTime => _deliveryTime;

  String? get deliveryTime1 => _deliveryTime1;

  String? get besaPostViewsCount => _besaPostViewsCount;

  String? get editLast => _editLast;

  String? get wpPageTemplate => _wpPageTemplate;

  String? get rsPageBgColor => _rsPageBgColor;

  String? get editLock => _editLock;

  bool? get isAttribute => _isAttribute;

  bool? get isFeatured => _isFeatured;

  bool? get isWishList => _isWishList;

  set setIsWishList(bool value) {
    _isWishList = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_sales'] = _totalSales;
    map['_tax_status'] = _taxStatus;
    map['_tax_class'] = _taxClass;
    map['_manage_stock'] = _manageStock;
    map['_backorders'] = _backorders;
    map['_sold_individually'] = _soldIndividually;
    map['_virtual'] = _virtual;
    map['_downloadable'] = _downloadable;
    map['_download_limit'] = _downloadLimit;
    map['_download_expiry'] = _downloadExpiry;
    map['_stock'] = _stock;
    map['_stock_status'] = _stockStatus;
    map['_wc_average_rating'] = _wcAverageRating;
    map['_wc_review_count'] = _wcReviewCount;
    map['_product_version'] = _productVersion;
    if (_chosenProductCat != null) {
      map['chosen_product_cat'] = _chosenProductCat?.toJson();
    }
    map['_visibility'] = _visibility;
    map['_thumbnail_id'] = _thumbnailId;
    map['_product_image_gallery'] = _productImageGallery;
    map['_regular_price'] = _regularPrice;
    map['_sale_price'] = _salePrice;
    map['_purchase_note'] = _purchaseNote;
    map['_product_attributes'] = _productAttributes;
    map['_sale_price_dates_from'] = _salePriceDatesFrom;
    map['_sale_price_dates_to'] = _salePriceDatesTo;
    map['_price'] = _price;
    map['_dokan_min_max_meta'] = _dokanMinMaxMeta;
    map['_dokan_new_product_email_sent'] = _dokanNewProductEmailSent;
    map['delivery_time'] = _deliveryTime;
    map['_delivery_time'] = _deliveryTime1;
    map['besa_post_views_count'] = _besaPostViewsCount;
    map['_edit_last'] = _editLast;
    map['_wp_page_template'] = _wpPageTemplate;
    map['rs_page_bg_color'] = _rsPageBgColor;
    map['_edit_lock'] = _editLock;
    map['is_attribute'] = _isAttribute;
    map['is_featured'] = _isFeatured;
    map['is_wishlist'] = _isWishList;
    return map;
  }
}

class ChosenProductCat {
  ChosenProductCat({
    dynamic index,
  }) {
    _index = index;
  }

  ChosenProductCat.fromJson(dynamic json) {
    _index = json['0'];
  }

  dynamic _index;

  ChosenProductCat copyWith({
    dynamic index,
  }) =>
      ChosenProductCat(
        index: index ?? _index,
      );

  dynamic get index => _index;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['0'] = _index;
    return map;
  }
}

class Pagination {
  Pagination({
    String? next,
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

  String? _next;
  dynamic _previous;
  num? _count;
  num? _totalPages;
  num? _currentPage;

  Pagination copyWith({
    String? next,
    dynamic previous,
    num? count,
    num? totalPages,
    num? currentPage,
  }) =>
      Pagination(
        next: next ?? _next,
        previous: previous ?? _previous,
        count: count ?? _count,
        totalPages: totalPages ?? _totalPages,
        currentPage: currentPage ?? _currentPage,
      );

  String? get next => _next;

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
