
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:kmerpay_seller/auth/presentation/pages/sign_up_screen.dart';

import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../widgets/search_field_widget.dart';
import 'forgot_password_screen.dart';
import 'landing_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                          Text("Welcome Back",
                              style: getTextStyle(
                                  24, FontWeight.w700, ColorManager.deepBlack)),
                          Text(
                              "Sign in to Continue",
                              style: getTextStyle(
                                  14, FontWeight.w400, ColorManager.grayLight)),
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
                          sizeVer(16),

                          SearchWidget(
                            controller: _passwordController,
                            obscureText:
                            isPasswordVisible == false ? true : false,
                            prefixIcon: Icon(
                              FeatherIcons.key,
                              color: ColorManager.deepBlack,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              icon: isPasswordVisible == false
                                  ? Icon(
                                FeatherIcons.eyeOff,
                                color: ColorManager.deepBlack,
                              )
                                  : Icon(
                                FeatherIcons.eye,
                                color: ColorManager.deepBlack,
                              ),
                            ),
                            border: Border.all(color: ColorManager.grayBorder),
                            backgroundColor: Colors.white,
                            isEnabled: true,
                            hintText: 'password',
                          ),

                          sizeVer(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) =>
                                        const ForgotPasswordScreen(), //const LandingScreen(),
                                      ));
                                },
                                child: Text("Forgot Password",
                                    style: getTextStyle(14, FontWeight.w400,
                                        ColorManager.blueTextColor)),
                              ),

                            ],
                          ),
                          sizeVer(40),
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
                                "Sign In",
                                style: getTextStyle(
                                    16, FontWeight.w600, Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) =>
                                      const LandingScreen(), //const LandingScreen(),
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
                              Text("Don’t have an account ? ",
                                  style: getTextStyle(14, FontWeight.w400,
                                      ColorManager.grayLight)),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) =>
                                        const SignUpScreen(), //const LandingScreen(),
                                      ));
                                },
                                child: Text("Sign Up",
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
          ],
        ),
      ),
    );
  }
}
