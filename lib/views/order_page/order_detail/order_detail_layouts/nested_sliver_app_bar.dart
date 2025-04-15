import 'package:dapperz/common_methods.dart';
import 'package:flutter/cupertino.dart';

import '../../../../config.dart';

class NestedSilverCustomAppBar extends StatefulWidget {
  final bool? isBack;
  final Widget? bodyLayout;

  const NestedSilverCustomAppBar({Key? key, this.isBack, this.bodyLayout})
      : super(key: key);

  @override
  State<NestedSilverCustomAppBar> createState() =>
      _NestedSilverCustomAppBarState();
}

class _NestedSilverCustomAppBarState extends State<NestedSilverCustomAppBar> {
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController!.removeListener(_scrollListener);
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(builder: (orderDetailCtrl) {
      return NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  expandedHeight: height,
                  backgroundColor: orderDetailCtrl.appCtrl.appTheme.whiteColor,
                  floating: false,
                  leading: Icon(appCtrl.isRTL || appCtrl.languageVal == "ar"
                          ? CupertinoIcons.arrow_right
                          : CupertinoIcons.arrow_left)
                      .gestures(
                          onTap: () => widget.isBack ?? false
                              ? Get.back()
                              : Get.offAndToNamed(routeName.dashboard)),
                  pinned: true,
                  title: _isShrink
                      ? Container()
                      : LatoFontStyle(
                          text: OrderDetailFont().orderDetail,
                          color: orderDetailCtrl.appCtrl.appTheme.blackColor),
                  flexibleSpace: SliverBackgroundImage(isShrink: _isShrink))
            ];
          },
          body: widget.bodyLayout!);
    });
  }
}
