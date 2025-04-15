import '../../../../config.dart';

class CustomRangeSlider extends StatelessWidget {
  const CustomRangeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(builder: (filterCtrl) {
      return SliderTheme(
        data: SliderThemeData(
          activeTrackColor: filterCtrl.appCtrl.appTheme.primary,
          inactiveTrackColor: filterCtrl.appCtrl.appTheme.lightGray,
          activeTickMarkColor: filterCtrl.appCtrl.appTheme.primary,
          inactiveTickMarkColor: filterCtrl.appCtrl.appTheme.lightGray,
          valueIndicatorColor: filterCtrl.appCtrl.appTheme.primary,
          valueIndicatorShape: const RectangularSliderValueIndicatorShape(),
          valueIndicatorTextStyle: TextStyle(color: filterCtrl.appCtrl.appTheme.white),
          rangeThumbShape: CustomThumbShape(),
          trackHeight: 5.0,
          showValueIndicator: ShowValueIndicator.never,
        ),
        child: RangeSlider(
          min: double.parse((filterCtrl.filterDataModel!.minPrice ?? 0.0).toStringAsFixed(0)),
          values: filterCtrl.currentRangeValues!,
          max: double.parse((filterCtrl.filterDataModel!.maxPrice ?? 0.0).toStringAsFixed(0)),
          divisions: 1000,
          onChanged: (RangeValues values) {
            double start = double.parse(values.start.toStringAsFixed(0));
            double end = double.parse(values.end.toStringAsFixed(0));
            RangeValues rangeValues = RangeValues(start, end);
            filterCtrl.currentRangeValues = rangeValues;
            filterCtrl.update();
          },
        ),
      );
    });
  }
}
