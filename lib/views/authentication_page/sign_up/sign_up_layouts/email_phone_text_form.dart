// import '../../../../config.dart';
//
// class SignUpEmailPhoneTextForm extends StatelessWidget {
//   const SignUpEmailPhoneTextForm({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<SignUpController>(builder: (signUpCtrl) {
//       return Padding(
//         padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
//         child: CustomTextFormField(
//           radius: 5,
//           labelText: SignUpFont().emailPhone,
//           controller: signUpCtrl.txtMobileNo,
//           focusNode: signUpCtrl.mobileNoFocus,
//           keyboardType: TextInputType.phone,
//           onFieldSubmitted: (value) {
//             // SignUpWidget().fieldFocusChange(context, signUpCtrl.mobileNoFocus, signUpCtrl.passwordFocus);
//           },
//           maxLength: 10,
//           validator: (value) => CommonValidation().checkEmailValidation(value),
//         ),
//       );
//     });
//   }
// }

import '../../../../config.dart';

class SignUpEmailTextForm extends StatelessWidget {
  const SignUpEmailTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpCtrl) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: CustomTextFormField(
          radius: 5,
          labelText: "Email",
          controller: signUpCtrl.txtEmail,
          focusNode: signUpCtrl.emailFocus,
          keyboardType: TextInputType.emailAddress,
          onFieldSubmitted: (value) {
            // Move focus to the next field if needed
            FocusScope.of(context).requestFocus(signUpCtrl.passwordFocus);
          },
          validator: (value) => CommonValidation().checkEmailValidation(value),
        ),
      );
    });
  }
}

