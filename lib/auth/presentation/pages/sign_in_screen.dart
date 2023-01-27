import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:kmerpay_seller/auth/presentation/pages/otp_screen.dart';
import 'package:kmerpay_seller/auth/presentation/pages/sign_up_screen.dart';
import 'package:kmerpay_seller/resources/widgets/kpbutton.dart';

import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../widgets/search_field_widget.dart';
import 'forgot_password_screen.dart';
import 'landing_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

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
                          sizeVer(96),
                          Center(
                              child: SvgPicture.asset(
                            AssetConstant.loginIcon,
                            height: 140,
                          )),
                          sizeVer(64),
                          Text("Hello! Welcome Back",
                              style: getSemiBoldStyle(
                                fontSize: 26,
                                color: ColorManager.primaryBlack,
                              )),
                          Text(
                            "Please Login to Your Account",
                            style: getMediumStyle(
                                fontSize: 18, color: ColorManager.bluishGrey),
                          ),
                          sizeVer(40),
                          SearchWidget(
                            controller: _emailController,
                            focusNode: _emailControllerFocus,
                            prefixIcon: Icon(
                              PhosphorIcons.envelope,
                              color: ColorManager.offWhite,
                            ),
                            border: Border.all(color: ColorManager.offWhite),
                            backgroundColor: Colors.white,
                            isEnabled: true,
                            hintText: 'email',
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                          sizeVer(16),
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
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                            isEnabled: true,
                            hintText: 'passcode',
                          ),
                          sizeVer(20),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) =>
                                        const OTPScreen(), //const LandingScreen(),
                                  ));
                            },
                            child: Text("Forgot Passcode",
                                style: getMediumStyle(
                                    fontSize: 14,
                                    color: ColorManager.primaryBlue)),
                          ),
                          sizeVer(40),
                          CustomButton(
                            buttonTitle: 'Login',
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const LandingScreen();
                                  },
                                ),
                                (_) => false,
                              );
                            },
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
