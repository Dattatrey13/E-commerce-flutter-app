import '../../config.dart';

class BottomNavigationWidget {
  BottomNavigationBarItem bottomNavigationCard({var color, int? selectedIndex, IconData? image, var bgColor, String? title}) {
    return BottomNavigationBarItem(
      backgroundColor: bgColor,
      icon: Padding(
        padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(2)),
        child: Icon(image),
      ),
      label: title!,
    );
  }
}
