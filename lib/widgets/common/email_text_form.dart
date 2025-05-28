import '../../config.dart';

class EmailTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? emailFocus;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final ValueChanged<String>? onFieldSubmitted;
  final String? label;

  const EmailTextForm({
    super.key,
    this.controller,
    this.emailFocus,
    this.suffixIcon,
    this.validator,
    this.label,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppScreenUtil().screenWidth(15),
      ),
      child: CustomTextFormField(
        radius: 5,
        labelText: label,
        controller: controller,
        focusNode: emailFocus,
        keyboardType: TextInputType.emailAddress,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
