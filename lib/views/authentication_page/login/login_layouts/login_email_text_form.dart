import '../../../../config.dart';

class LoginEmailTextForm extends StatelessWidget {
  const LoginEmailTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (loginCtrl) {
      return EmailTextForm(
        controller: loginCtrl.txtEmail,
        label: LoginFont().email,
        emailFocus: loginCtrl.emailFocus,
        onFieldSubmitted: (value) {
          // Optionally shift focus to password
          // LoginWidget().fieldFocusChange(context, loginCtrl.emailFocus, loginCtrl.passwordFocus);
        },
        validator: (value) => CommonValidation().checkEmailValidation(value),
      );
    });
  }
}



// import '../../../../config.dart';
//
// class LoginEmailTextForm extends StatelessWidget {
//   const LoginEmailTextForm({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<LoginController>(builder: (loginCtrl) {
//       return Padding(
//         padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
//         child: CustomTextFormField(
//           radius: 5,
//           labelText: LoginFont().userNameOrEmail,
//           // controller: loginCtrl.txtMobile,
//           // focusNode: loginCtrl.mobileFocus,
//           keyboardType: TextInputType.phone,
//           onFieldSubmitted: (value) {
//             // LoginWidget().fieldFocusChange(context, loginCtrl.mobileFocus, loginCtrl.passwordFocus);
//           },
//           maxLength: 10,
//           validator: (value) => CommonValidation().checkMobileValidation(value),
//         ),
//       );
//     });
//   }
// }
