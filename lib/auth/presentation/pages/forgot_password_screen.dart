
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:kookit_delivery/auth/presentation/pages/sign_in_screen.dart';

import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../widgets/search_field_widget.dart';
import 'otp_screen.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var _formKey = new GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _emailControllerFocus = FocusNode();
  var _passwordController = TextEditingController();
  var _passwordControllerFocus = FocusNode();
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizeVer(140),
                          Text("Verification Code Sent",
                              style: getSemiBoldStyle(fontSize: 26, color: ColorManager.primaryBlack)),
                          Text(
                              "Please type in the code here",
                              style: getMediumStyle(fontSize: 18, color: ColorManager.bluishGrey)),

                          sizeVer(40),

                          SearchWidget(
                            controller: _emailController,
                            prefixIcon: Icon(
                              FeatherIcons.send,
                              color: ColorManager.deepBlack,
                            ),
                            border: Border.all(color: ColorManager.grayBorder),
                            backgroundColor: Colors.white,
                            isEnabled: true,
                            hintText: 'email',
                          ),


                          Container(
                            height: 52,
                            margin: EdgeInsets.all(40),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: ColorManager.brandColor,
                              borderRadius:
                              BorderRadius.all(Radius.circular(4)),
                            ),
                            child: TextButton(
                              child: Text(
                                "Next",
                                style: getTextStyle(
                                    16, FontWeight.w600, Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) =>
                                      const OTPScreen(), //const LandingScreen(),
                                    ));
                              },
                              // textColor: Colors.white,
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(25),
                              // ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Back to",
                                  style: getTextStyle(14, FontWeight.w400,
                                      ColorManager.grayLight)),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) =>
                                        const SignInScreen(), //const LandingScreen(),
                                      ));
                                },
                                child: Text("Sign In",
                                    style: getTextStyle(14, FontWeight.w600,
                                        ColorManager.brandColor)),
                              ),
                            ],
                          ),
                          sizeVer(40),

                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
            IconButton(onPressed: ()=> Navigator.pop(context ),
                icon: Icon(PhosphorIcons.arrow_left)),
          ],
        ),
      ),
    );
  }
}
