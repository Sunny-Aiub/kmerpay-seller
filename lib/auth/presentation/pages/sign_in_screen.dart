import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:kookit_delivery/auth/presentation/pages/sign_up_screen.dart';

import '../../../home/presentation/pages/home_screen.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../../../resources/widgets/kpbutton.dart';
import '../widgets/search_field_widget.dart';
import 'forgot_password_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import 'otp_screen.dart';

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
    _emailControllerFocus.addListener(() => setState(() {}));
    _passwordControllerFocus.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.gray50,
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 46.0,horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizeVer(40),

                          Text("Welcome to Kookit Rider Platform.",
                              style: getSemiBoldStyle(
                                fontSize: 24,
                                color: ColorManager.gray800,
                              )),
                          sizeVer(24),
                          Text(
                            "Enter your mail address",
                            style: getSemiBoldStyle(
                                fontSize: 14, color: ColorManager.gray700),
                          ),
                          SearchWidget(
                            controller: _emailController,
                            focusNode: _emailControllerFocus,
                            prefixIcon: Icon(
                              PhosphorIcons.envelope,
                              color: ColorManager.offWhite,
                            ),
                            border: Border.all(color: ColorManager.gray300),
                            backgroundColor: Colors.white,
                            isEnabled: true,
                            hintText: 'email',
                            focusedBorder:  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(color: ColorManager.gray300)),
                          ),
                          sizeVer(24),
                          Text(
                            "Enter password",
                            style: getSemiBoldStyle(
                                fontSize: 14, color: ColorManager.gray700),
                          ),
                          SearchWidget(
                            controller: _passwordController,
                            focusNode: _passwordControllerFocus,
                            obscureText:
                                isPasswordVisible == false ? true : false,
                            prefixIcon: Icon(
                              PhosphorIcons.lock,
                              color: ColorManager.offWhite,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              icon: isPasswordVisible == false
                                  ? Icon(
                                      PhosphorIcons.lock,
                                      color: ColorManager.deepBlack,
                                    )
                                  : Icon(
                                      FeatherIcons.eyeOff,
                                      color: ColorManager.primaryBlue,
                                    ),
                            ),
                            border: Border.all(color: ColorManager.offWhite),
                            backgroundColor: Colors.white,
                            focusedBorder:  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(color: ColorManager.gray300)),
                            isEnabled: true,
                            hintText: 'password',
                          ),
                          sizeVer(24),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       fullscreenDialog: true,
                              //       builder: (context) =>
                              //           const OTPScreen(), //const LandingScreen(),
                              //     ));
                              Get.to(const OTPScreen());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Forgot your password?",
                                    style: getMediumStyle(
                                        fontSize: 14,
                                        color: ColorManager.gray600)),
                              ],
                            ),
                          ),
                          sizeVer(32),
                          CustomButton(
                            buttonTitle: 'Continue',
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const HomeScreen();
                                  },
                                ),
                                (_) => false,
                              );
                            },
                          ),
                          sizeVer(30),

                          CustomButton(
                            buttonTitle: 'Sign Up Now',color: ColorManager.primaryWhite,
                            border: Border.all(color: ColorManager.primary500),
                            textStyle: getBoldStyle(color: ColorManager.primary500,fontSize: 14),
                            onPressed: () {
                              Get.to(const SignUpScreen());

                            },
                          ),


                          ///continue with
                          // Center(
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       horizontalDivider(),
                          //       Text("Or continue with",textAlign: TextAlign.center,
                          //           style: getRegularStyle(
                          //               fontSize: 14,
                          //               color: ColorManager.gray700)),
                          //
                          //       horizontalDivider(),
                          //     ],
                          //   ),
                          // ),
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
