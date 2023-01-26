
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:kmerpay_seller/auth/presentation/pages/sign_in_screen.dart';
import 'package:unicons/unicons.dart';

import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../widgets/search_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _formKey = new GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _emailControllerFocus = FocusNode();
  var _passwordController = TextEditingController();
  var _passwordControllerFocus = FocusNode();

  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();
  bool isPasswordVisible = false;

  TextEditingController _confirmPasswordController = TextEditingController();
  bool isConfirmPasswordVisible = false;

  bool agreedToTerms = false;

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
                          Text("Create New Account",
                              style: getTextStyle(
                                  24, FontWeight.w700, ColorManager.deepBlack)),
                          Text(
                              "Enter the email associated with your account to change your password.",
                              style: getTextStyle(
                                  14, FontWeight.w400, ColorManager.grayLight)),
                          sizeVer(40),
                          SearchWidget(
                            controller: _fnameController,
                            prefixIcon: Icon(
                              FeatherIcons.user,
                              color: ColorManager.deepBlack,
                            ),
                            border: Border.all(color: ColorManager.grayBorder),
                            backgroundColor: Colors.white,
                            isEnabled: true,
                            hintText: 'first name',
                          ),
                          sizeVer(16),
                          SearchWidget(
                            controller: _lnameController,
                            prefixIcon: Icon(
                              FeatherIcons.user,
                              color: ColorManager.deepBlack,
                            ),
                            border: Border.all(color: ColorManager.grayBorder),
                            backgroundColor: Colors.white,
                            isEnabled: true,
                            hintText: 'last name',
                          ),
                          sizeVer(16),
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
                            controller: _phoneController,
                            prefixIcon: Icon(
                              FeatherIcons.phone,
                              color: ColorManager.deepBlack,
                            ),
                            border: Border.all(color: ColorManager.grayBorder),
                            backgroundColor: Colors.white,
                            isEnabled: true,
                            hintText: 'phone number',
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
                            hintText: 'phone number',
                          ),
                          sizeVer(16),
                          SearchWidget(
                            controller: _confirmPasswordController,
                            obscureText: isConfirmPasswordVisible == false
                                ? true
                                : false,
                            prefixIcon: Icon(
                              FeatherIcons.key,
                              color: ColorManager.deepBlack,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isConfirmPasswordVisible =
                                      !isConfirmPasswordVisible;
                                });
                              },
                              icon: isConfirmPasswordVisible == false
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
                            hintText: 'phone number',
                          ),
                          sizeVer(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    agreedToTerms = !agreedToTerms;
                                  });
                                },
                                icon: agreedToTerms == false
                                    ? const Icon(FeatherIcons.square)
                                    : const Icon(FeatherIcons.checkSquare),
                                padding: EdgeInsets.zero,
                                alignment: Alignment.centerLeft,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: getTextStyle(14, FontWeight.w400,
                                      ColorManager.deepBlack),
                                  children: [
                                    TextSpan(
                                      text: 'I agree to the ',
                                    ),
                                    TextSpan(
                                      text: 'Examtice ',
                                      style: TextStyle(
                                          color: ColorManager.brandColor),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          setState(() {
                                            // mode = mode == AuthMode.login
                                            //     ? AuthMode.register
                                            //     : AuthMode.login;
                                          });
                                        },
                                    ),
                                    TextSpan(text: 'Terms & Condition')
                                  ],
                                ),
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
                                "Sign Up",
                                style: getTextStyle(
                                    16, FontWeight.w600, Colors.white),
                              ),
                              onPressed: () {
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //       fullscreenDialog: true,
                                //       builder: (context) =>
                                //       const SignUpScreen(), //const LandingScreen(),
                                //     ));
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
                              Text("Already have an account? ",
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
          ],
        ),
      ),
    );
  }
}
