import 'dart:collection';

import 'package:dapperz/common_methods.dart';
import 'package:dapperz/controllers/home_product_controllers/wishlist_controller.dart';
import 'package:dapperz/views/bottom_navigate_page/wishlist/widget_layouts/wish_list_card.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../config.dart';
import '../../../models/cart/add_cart_model.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final wishListCtrl = Get.put(WishlistController());
    return GetBuilder<WishlistController>(
      builder: (_) {
        return Scaffold(
          body: RefreshIndicator(
            displacement: 100,
            backgroundColor: Colors.white,
            color: appCtrl.appTheme.primary,
            strokeWidth: 3,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {
              wishListCtrl.getData();
            },
            child: wishListCtrl.appCtrl.isShimmer
                ? const WishListShimmer()
                : WillPopScope(
              onWillPop: () async {
                appCtrl.isHeart = true;
                appCtrl.isCart = true;
                appCtrl.isShare = false;
                appCtrl.isSearch = true;
                appCtrl.isNotification = false;
                appCtrl.selectedIndex = 0;
                appCtrl.update();
                wishListCtrl.homeCtrl.getData();
                Get.forceAppUpdate();
                return true;
              },
              child: wishListCtrl.wishlist.isNotEmpty
                  ? ListView.builder(
                itemCount: wishListCtrl.wishlist.length,
                itemBuilder: (context, index) {
                  return WishListCard(
                      wishlistItemDetail:
                      wishListCtrl.wishlist[index],
                      index: index,
                      lastIndex: wishListCtrl.wishlist.length - 1,
                      firstActionTap: () async {
                        if (wishListCtrl.wishlist[index].productId!
                            .isFeatured ??
                            false) {
                          Get.toNamed(routeName.getACall,
                              arguments: wishListCtrl
                                  .wishlist[index].productId!.id);
                        } else {
                          HashMap<String, dynamic> params =
                          HashMap();
                          params['product_id'] = wishListCtrl
                              .wishlist[index].productId!.id
                              .toString();
                          params['quantity'] = "1".toString();
                          if (wishListCtrl
                              .wishlist[index].variations !=
                              null &&
                              wishListCtrl.wishlist[index]
                                  .variations!.isNotEmpty) {
                            params['variation_id'] = wishListCtrl
                                .wishlist[index].variations!.first
                                .toString();
                          }
                          AddCartModel? cstatus =
                          await appCtrl.addToCart(params);
                          if (cstatus.data != null &&
                              cstatus.success != null &&
                              cstatus.data!.productId != null) {
                            bool? status = await wishListCtrl
                                .removeItemFromWishList(wishListCtrl
                                .wishlist[index].wishlistToken
                                .toString());
                            if (status != null && status) {
                              Fluttertoast.showToast(
                                  msg:
                                  "Product moved to Cart Successfully");
                              wishListCtrl.wishlist.removeAt(index);
                              wishListCtrl.update();
                              Get.forceAppUpdate();
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                  "Unable to move product from Wishlist");
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg:
                                "Unable to move product from Wishlist");
                          }
                        }
                      },
                      secondActionTap: () async {
                        bool? status = await wishListCtrl
                            .removeItemFromWishList(wishListCtrl
                            .wishlist[index].wishlistToken
                            .toString());
                        if (status != null && status) {
                          Fluttertoast.showToast(
                              msg: "Item removed from wishlist");
                          wishListCtrl.wishlist.removeAt(index);
                          wishListCtrl.update();
                        } else {
                          Fluttertoast.showToast(
                              msg:
                              "Unable to remove product from Wishlist");
                        }
                      });
                },
              )
                  : ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                children: const [
                  Center(
                    child: Text('Your Wishlist is Empty'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    Get.delete<WishlistController>();
    super.dispose();
  }
}
