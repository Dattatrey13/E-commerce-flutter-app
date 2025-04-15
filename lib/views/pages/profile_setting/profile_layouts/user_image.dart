import '../../../../config.dart';

class UserImage extends StatelessWidget {
  const UserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AppController>(
      builder: (appCtrl) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            UserIcon(
              height: AppScreenUtil().screenHeight(80)
            ),
            Positioned(
              bottom: 0,
              right: 15,
              child: Container(
                padding: EdgeInsets.all(AppScreenUtil().size(3)),
                height: AppScreenUtil().screenHeight(20),
                width: AppScreenUtil().screenWidth(20),
              )
            )
          ],
        );
      }
    );
  }
}
