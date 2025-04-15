import 'package:dapperz/main.dart';
import 'package:dapperz/widgets/common_text_widget/common_account_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../../config.dart';

class OtpBody extends StatefulWidget {
  final String mobileNo;

  const OtpBody({Key? key, required this.mobileNo}) : super(key: key);

  @override
  State<OtpBody> createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(builder: (otpCtrl) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //code verification text layout
            LatoFontStyle(
              text: OtpFont().codeVerification,
              fontWeight: FontWeight.w700,
              color: otpCtrl.appCtrl.appTheme.blackColor,
              fontSize: FontSizes.f12,
            ),
            const Space(0, 5),
            //email text box layout
            LatoFontStyle(
              text: OtpFont().enterYourVerificationCode,
              fontWeight: FontWeight.normal,
              color: otpCtrl.appCtrl.appTheme.contentColor,
              fontSize: FontSizes.f14,
            ),
            const Space(0, 8),
            //mobile number layout
            MobileNumberLayout(mobileNo: widget.mobileNo),
            const Space(0, 15),
            //otp layout
            //const OtpNumberLayout(),
            Center(
              child: OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.underline,
                outlineBorderRadius: 15,
                style: const TextStyle(fontSize: 17),
                onChanged: (pin) {},
                onCompleted: (pin) {
                  otpCtrl.fieldOTP.text = pin.trim();
                },
              ),
            ),
            const Space(0, 15),
            // not get code text box
            otpCtrl.remainingSeconds > 0
                ? Center(
                    child: LatoFontStyle(
                      text:
                          "You can resend OTP in 0:${otpCtrl.remainingSeconds.toString()} Seconds",
                      fontWeight: FontWeight.normal,
                      color: otpCtrl.appCtrl.appTheme.contentColor,
                      fontSize: FontSizes.f14,
                      textAlign: TextAlign.center,
                    ),
                  )
                : CommonAccountText(
                    text1: OtpFont().notGetCode,
                    text2: OtpFont().resend,
                    textColor: otpCtrl.appCtrl.appTheme.blackColor,
                    fontWeight: FontWeight.normal,
                    isCenter: true,
                    onTap: () async {
                      //showProgressDialog(true);
                      try {
                        await auth!.verifyPhoneNumber(
                            phoneNumber: "+91${widget.mobileNo}",
                            timeout: const Duration(seconds: 30),
                            verificationCompleted:
                                (AuthCredential authCredential) {},
                            verificationFailed:
                                (FirebaseAuthException exception) {
                              //showProgressDialog(false);
                            },
                            codeSent: (String verificationId,
                                int? forceResendingToken) {
                              //showProgressDialog(false);
                              Fluttertoast.showToast(
                                  msg: 'OTP Sent Successfully');
                              otpCtrl.remainingSeconds = 30;
                              otpCtrl.update();
                              otpCtrl.startTimer();
                              otpCtrl.update();
                              setState(() {});
                            },
                            codeAutoRetrievalTimeout: (String verificationId) {
                              //showProgressDialog(false);
                              verificationId = verificationId;
                            });
                      } on FirebaseAuthException catch (e) {
                        if (kDebugMode) {
                          print(e);
                        }
                      }
                    },
                  ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
