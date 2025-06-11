class ApiMethodList {
  //region Login
  static String checkMobileNumber = "user/check-number/";
  static String userRegister = "user/register/";
  static String verifyToken = "user/verify-token/";
  static String userProfile = "user/my-profile/";

  //new
  static String userAddress = "user/address/";
  static String userLogin = "user/login/";
  static String subCategory = "category/item/";
  static String userOrderCheckout = "orders/checkout/";
  static String updateOrderStatus = "user/order/update-status/";

  //endregion

  //region Dashboard
  static String parentCategory = "top/categories/";
  static String allCategory = "categories/";
  static String featuredProduct = "product/list/?is_mobile=true";
  static String recentProduct = "product/list/?is_mobile=true";
  static String recommendedProduct = "product/list/";
  static String newArrivalProduct = "product/list/?is_mobile=true";
  static String recommendedProductById = "recommended-by-product/";
  static String NewArrivalProductById = "product/recommended-by-product/";

  //static String recommendedProductById = "product/recommended-by-product/";
  static String brandList = "all-brands/";
  static String keyChainList = "product/list/keychains";
  // static String bestSellingList = "product/list/?is_mobile=true";
  static String wishlistCount = "wish-list/count/";
  static String cartCount = "cart/cart-list/count/";

  // static String guestCartCount = "product/guest/cart-list/count/";
  static String guestCartCount = "cart/cart-list/count/";

  //endregion

  //region Product
  static String productList = "product/list/?is_mobile=true";
  // static String productById = "product/";
  static String productByslug = "product/";
  static String filters = "price-filters/";
  static String getProductReview = "product/review/";
  static String createReview = "product/review/"; //-- not in use
  static String autoCompleteSearch = "auto-complete-search/?q=";
  static String productFilter = "product/filters/"; //-not in use
  static String productCreateReview = "product/review/";
  static String deleteReview = "review/";
  static String productPrice = "product/price/";
  static String allBrands = "categories-vies-brands/";
  static String locationList = "location/list/";
  static String statesList = "user/address/";
  // static String statesList = "location/states/";
  static String cityList = "location/states-vies-city/?state_id=";

  //endregion

  //region User Operations
  // Wishlist
  static String getWishListForUser = "wish-list/";
  static String createWishListForUser = "wish-list/";
  static String removeItemWishListForUser = "wish-list/";

  // Cart
  static String getUserCartDetails = "cart/cart-list/";
  static String userAddCart = "cart/cart-item/";
  static String userRemoveCart = "cart/cart-item/";
  static String applyCoupons = "cart/apply-coupons/";
  static String removeCoupons = "cart/remove-coupons/";

  // Product
  // for contact us
  static String productGetACall = "extra/contact-us/";

  // for build home
  static String buildHome = "extra/build-your-home/";

  // static String productPincodeCheck = "product/pincode-check/";
  static String productPincodeCheck = "product/validate-pincode/";

  // Order
  static String userCartTotal = "cart/summary/";
  static String getOrderDetailsByOrderId = "orders/list/";
  static String getOrderDetailsByTransactionId = "orders/transaction/";
  static String getOrderList = "orders/list/";
  static String cancelOrderList = "orders/cancel/";
  static String getAllCoupons = "coupons/";
  static String getPincodeList = "location/pincode-validate/";
  static String updateCart = "cart/cart-item/";

  // Profile
  static String userProfileSave = "user/my-profile/";
  static String deleteAccount = "user/delete-user-request/";

//endregion
// region Address
  static String userAddressList = "user/address/";
  static String validatePincode = "location/pincode-validate/?pincode=";

//endregion

//region Vendor Module
  static String getQuote = "extra/quotes/";
  static String getQuoteRequestDetail = "extra/quotes/requests/";
  static String vendorList = "chat/vendors/list/";
  static String getConversation = "chat/conversation/";
  static String acceptOrDecline = "extra/quotes/update-status/";
  static String sendFcmToken = "extra/send-fcm-token/";
//endregion
}
