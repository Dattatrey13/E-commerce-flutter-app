
import 'dart:developer';

import 'package:dapperz/user_singleton.dart';
import 'package:dapperz/views/authentication_page/login/login_layouts/guest_login_text.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../config.dart';

class LoginBody extends StatelessWidget {
  final GlobalKey<FormState>? formKey;

  const LoginBody({Key? key, this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (loginCtrl) {
        return Column(
          children: [
            const Space(0, 20),
            AuthenticationAppBar(
              isDone: false,
              onTap: () {
                // Guest login code (commented out)
              },
            ),
            const Space(0, 20),
            LoginWidget().loginLayout(
              child: AuthenticationTitleText(
                text1: LoginFont().hey,
                text2: LoginFont().loginNow,
                isTextShow: true,
              ),
              context: context,
            ),
            const Space(0, 35),
            const LoginEmailTextForm(),
            const Space(0, 20),
            const LoginPasswordTextForm(),
            const Space(0, 10),
            // Forgot Password Layout (Optional)
            LoginWidget().forgotPasswordLayout(
              onTap: () => Get.toNamed(routeName.forgotPassword),
              color: loginCtrl.appCtrl.appTheme.primary,
              text: LoginFont().forgotPassword,
            ),
            const Space(0, 25),
            SignInButton(
              onTap: () async {
                UserSingleton().isRegister = false;

                FocusScopeNode currentFocus = FocusScope.of(Get.context!);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }

                if (formKey!.currentState!.validate()) {
                  await loginCtrl.login(); // Replaced with email/password login
                } else {
                  log('Form not valid');
                }
              },
            ),
            const Space(0, 20),
            const OrSignInWith(),
            const Space(0, 20),
            const GuestLoginText(),
            const Space(0, 30),
            const SignUpText(),
          ],
        );
      },
    );
  }

  Future showDialogToken(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Token Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 200,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(text: UserSingleton().token ?? ""),
                        );
                        Fluttertoast.showToast(msg: "Copied to Clipboard");
                      },
                      child: const Icon(Icons.copy),
                    ),
                    const SizedBox(width: 10),
                    Expanded(child: Text(UserSingleton().token ?? "")),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: UserSingleton().uuidFcm ?? ""),
                      );
                      Fluttertoast.showToast(msg: "Copied to Clipboard");
                    },
                    child: const Icon(Icons.copy),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(UserSingleton().uuidFcm ?? "")),
                ],
              ),
              SizedBox(
                height: 200,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(text: UserSingleton().uuidForGuest ?? ""),
                        );
                        Fluttertoast.showToast(msg: "Copied to Clipboard");
                      },
                      child: const Icon(Icons.copy),
                    ),
                    const SizedBox(width: 10),
                    Expanded(child: Text(UserSingleton().uuidForGuest ?? "")),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}


// import 'dart:developer';
//
// import 'package:dapperz/user_singleton.dart';
// import 'package:dapperz/views/authentication_page/login/login_layouts/guest_login_text.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import '../../../../config.dart';
//
// class LoginBody extends StatelessWidget {
//   final GlobalKey<FormState>? formKey;
//
//   const LoginBody({Key? key, this.formKey}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<LoginController>(
//       builder: (loginCtrl) {
//         return Column(
//           children: [
//             // app bar layout
//             const Space(0, 20),
//             AuthenticationAppBar(
//                 isDone: false,
//                 onTap: () {
//                   // UserSingleton().isGuest = true;
//                   // UserSingleton().uuidForGuest = appCtrl.storage.read(Session.isGuestLoginToken);
//                   // if(UserSingleton().uuidForGuest == null || UserSingleton().uuidForGuest == ""){
//                   //   var uuid = const Uuid();
//                   //   UserSingleton().uuidForGuest = uuid.v5(Uuid.NAMESPACE_URL, 'https://dapperz.in');
//                   // }
//                   // appCtrl.storage.write(Session.isGuest, true);
//                   // appCtrl.storage.write(Session.isGuestLoginToken, UserSingleton().uuidForGuest);
//                   // appCtrl.storage.write(Session.isLogin, false);
//                   // appCtrl.storage.write(Session.isRegularLoginToken, "");
//                   // appCtrl.goToHome();
//                   // Get.toNamed(routeName.dashboard);
//                 }),
//             const Space(0, 20),
//             // text and description layout
//             LoginWidget().loginLayout(
//               child: AuthenticationTitleText(
//                   text1: LoginFont().hey,
//                   text2: LoginFont().loginNow,
//                   isTextShow: true),
//               context: context,
//             ),
//             const Space(0, 35),
//             // email text box layout
//             const LoginEmailTextForm(),
//             const Space(0, 40),
//             // password text box layout
//             // const LoginPasswordTextForm(),
//             // const Space(0, 10),
//             // forgot password text layout
//             // LoginWidget().forgotPasswordLayout(
//             //   onTap: () => Get.toNamed(routeName.forgotPassword),
//             //   color: loginCtrl.appCtrl.appTheme.primary,
//             //   text: LoginFont().forgotPassword,
//             // ),
//             // const Space(0, 25),
//             // button layout
//             SignInButton(
//               onTap: () async {
//                 UserSingleton().isRegister = false;
//                 FocusScopeNode currentFocus = FocusScope.of(Get.context!);
//                 if (!currentFocus.hasPrimaryFocus) {
//                   currentFocus.unfocus();
//                 }
//                 if (formKey!.currentState!.validate()) {
//                   bool userExist = await loginCtrl
//                       .checkMobileExist(loginCtrl.txtMobile.text.trim());
//                   if (userExist) {
//                     loginCtrl.sendOTP(loginCtrl.txtMobile.text.trim());
//                   } else {
//                     Fluttertoast.showToast(msg: "User Doesn't Exist");
//                   }
//                 } else {
//                   log('No Valid');
//                 }
//               },
//             ),
//             const Space(0, 20),
//             //or sign in with text layout
//             const OrSignInWith(),
//             const Space(0, 20),
//             // //social login layout
//             // SocialLoginLayout(),
//             const GuestLoginText(),
//             const Space(0, 30),
//             //create new account layout
//             const SignUpText(),
//             // const Space(0, 20),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.center,
//             //   crossAxisAlignment: CrossAxisAlignment.center,
//             //   children: [
//             //     IconButton(
//             //       onPressed: () {
//             //         showDialogToken(context);
//             //       },
//             //       icon: const Icon(Icons.copy),
//             //     ),
//             //   ],
//             // ),
//           ],
//         );
//       },
//     );
//   }
//
//   Future showDialogToken(BuildContext context) {
//     return showDialog(
//         context: context,
//         barrierDismissible: false, // user must tap button!
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Token Details'),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   height: 200,
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Clipboard.setData(
//                               ClipboardData(text: UserSingleton().token ?? ""));
//                           Fluttertoast.showToast(msg: "Copied to Clipboard");
//                         },
//                         child: const Icon(Icons.copy),
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         child: Text(UserSingleton().token ?? ""),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Clipboard.setData(
//                             ClipboardData(text: UserSingleton().uuidFcm ?? ""));
//                         Fluttertoast.showToast(msg: "Copied to Clipboard");
//                       },
//                       child: const Icon(Icons.copy),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Text(UserSingleton().uuidFcm ?? ""),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 200,
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Clipboard.setData(ClipboardData(
//                               text: UserSingleton().uuidForGuest ?? ""));
//                           Fluttertoast.showToast(msg: "Copied to Clipboard");
//                         },
//                         child: const Icon(Icons.copy),
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         child: Text(UserSingleton().uuidForGuest ?? ""),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Get.back();
//                 },
//                 child: const Text('Close'),
//               ),
//             ],
//           );
//         });
//   }
// }
