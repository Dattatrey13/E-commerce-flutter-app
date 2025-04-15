
import '../../../../config.dart';

class SortByDropDown extends StatelessWidget {
  List<DropdownMenuItem> items = [];

  SortByDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(builder: (filterCtrl) {
      items.clear();
       items.add(const DropdownMenuItem(value: "noSorting",child: Text("--No sorting--"),));
      for (var element in filterCtrl.sortByList) {
        items.add(DropdownMenuItem(
          value: element.key,
          child: Text(element.name ?? ""),
        ));
      }
      // List<dynamic> sortListArray = jsonDecode(filterCtrl.jsonSortString);
      // sortListArray.forEach((element) {
      //   items.add(DropdownMenuItem(
      //           value: (element as Map)['key'],
      //           child: Text((element as Map)['name']),
      //         ));
      // });
      return DropdownButton(
        value: filterCtrl.dropDownVal,
        items: items,
        onChanged: (value) {
          //get value when changed
          filterCtrl.dropDownVal = value.toString();
          filterCtrl.update();
        },
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: filterCtrl.appCtrl.appTheme.blackColor,
        ),
        //Icon color
        style: TextStyle(
            color: filterCtrl.appCtrl.appTheme.blackColor, //Font color
            fontFamily: GoogleFonts.mulish().fontFamily,
            fontSize: AppScreenUtil().fontSize(FontSizes.f14)),
        underline: Container(),
        //remove underline
        isExpanded: true, //make true to make width 100%
      );
    });
  }
}
