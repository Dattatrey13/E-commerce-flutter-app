class UserSingleton {
  static final UserSingleton _singleton = UserSingleton._internal();

  factory UserSingleton() {
    return _singleton;
  }

  UserSingleton._internal();

  String? token;
  String? uuidFcm;
  String? fcmToken;
  String? selectedLocation;
  String? parentId;
  bool? isRegister = false;

  String? displayName;
  String? userId;
  String? firstName;
  String? lastName;
  String? digitsPhone;
  String? coupons;
  String? couponsDesc;
  String? couponsDiscount;

  bool? redirectProductPage = false;
  String? slug;

  int wishListCount = 0;
  int cartCount = 0;

  bool? isGuest = false;
  String? uuidForGuest;
  bool? isBuyNow = false;

  resetAll() {
    token = null;
    uuidFcm = null;
    fcmToken = null;
    selectedLocation = null;
    isRegister = false;

    displayName = null;
    userId = null;
    firstName = null;
    lastName = null;
    digitsPhone = null;
    coupons = null;
    couponsDesc = null;
    couponsDiscount = null;

    redirectProductPage = false;
    slug = null;

    wishListCount = 0;
    cartCount = 0;

    isGuest = false;
    uuidForGuest = null;
    isBuyNow = false;
  }
}
