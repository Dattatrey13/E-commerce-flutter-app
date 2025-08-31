import 'package:dapperz/config.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:dapperz/widgets/common_text_widget/common_account_text.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatelessWidget {
  final signUpCtrl = Get.put(SignUpController());

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (_) {
      return AppComponent(
        child: Scaffold(
          body: Directionality(
            textDirection: signUpCtrl.appCtrl.isRTL ||
                    signUpCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Form(
              key: signUpCtrl.signupFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //app bar layout
                    const Space(0, 20),
                    AuthenticationAppBar(
                        isDone: false,
                        onTap: () => Get.toNamed(routeName.dashboard)),
                    const Space(0, 20),
                    //hey and sign up text layout
                    SignUpWidget().layout(
                        child: AuthenticationTitleText(
                            text1: SignUpFont().hey,
                            text2: SignUpFont().signUp,
                            isTextShow: true),
                        context: context),
                    const Space(0, 35),
                    //name text box layout
                    const SignupNameTextForm(),
                    const Space(0, 15),
                    //email text box layout
                    const SignUpEmailTextForm (),
                    const Space(0, 15),
                    //password text box layout
                    const SignUpPasswordTextForm(),
                    const Space(0, 35),
                    //button layout
                    CustomButton(
                      title: SignUpFont().signUp.toUpperCase(),
      onTap: () async {
      if (signUpCtrl.txtName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Name");
      return;
      } else {
      UserSingleton().isRegister = true;
      await signUpCtrl.signRegister(); // Directly call signRegister
      }
      }
                    ),
                    const Space(0, 20),
                    //or sign in with text layout
                    const OrSignInWith(),
                    const Space(0, 20),
                    //social login layout
                    // SocialLoginLayout(),
                    // const Space(0, 30),
                    //already account and sign in layout
                    CommonAccountText(
                      text1: CommonTextFont().alreadyAccount,
                      text2: CommonTextFont().signIn,
                      textColor: signUpCtrl.appCtrl.appTheme.themeColor,
                      fontWeight: FontWeight.normal,
                      onTap: () => Get.back(),
                    ),
                    const Space(0, 20)
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

