import '../../../../config.dart';

class OtpTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;

  const OtpTextForm({Key? key, this.controller, this.focusNode, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return SizedBox(
        height: 55,
        child: TextFormField(
          focusNode: focusNode!,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: controller,
          maxLength: 1,
          cursorColor: appCtrl.appTheme.lightGray,
          decoration: InputDecoration(
              fillColor: appCtrl.appTheme.lightGray,
              filled: true,
              border: OtpWidget().decoration(),
              focusedBorder: OtpWidget().decoration(),
              disabledBorder: OtpWidget().decoration(),
              enabledBorder: OtpWidget().decoration(),
              counterText: '',
              hintStyle: TextStyle(color: appCtrl.appTheme.blackColor, fontSize: 20.0)),
          onChanged: onChanged,
        ),
      );
    });
  }
}
