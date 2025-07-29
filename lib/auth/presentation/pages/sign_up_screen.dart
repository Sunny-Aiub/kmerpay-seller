
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kookit_delivery/auth/presentation/pages/sign_in_screen.dart';
import 'package:unicons/unicons.dart';

import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../../../resources/widgets/kpbutton.dart';
import '../../data/models/area.dart';
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

  var _confirmPasswordController = TextEditingController();
  var _confirmPasswordControllerFocus = FocusNode();

  TextEditingController _fnameController = TextEditingController();
  var _fNameControllerFocus = FocusNode();

  TextEditingController _lnameController = TextEditingController();
  var _lNameControllerFocus = FocusNode();

  TextEditingController _phoneController = TextEditingController();
  bool isPasswordVisible = false;

  bool isConfirmPasswordVisible = false;

  bool agreedToTerms = false;

  List<AreaDatum>? items = [area1,area2];

  AreaDatum? selectedValue;

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
                          sizeVer(40),

                          Text("Sign Up",
                              style: getSemiBoldStyle(
                                fontSize: 24,
                                color: ColorManager.primary600,
                              )),
                          sizeVer(24),
                          ///first name
                          Text(
                            "First Name",
                            style: getSemiBoldStyle(
                                fontSize: 14, color: ColorManager.gray700),
                          ),
                          SearchWidget(
                            controller: _fnameController,
                            focusNode: _fNameControllerFocus,
                            border: Border.all(color: ColorManager.gray300),
                            backgroundColor: Colors.white,
                            isEnabled: true,
                            hintText: 'you@example.com',
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(color: ColorManager.gray300)),
                          ),
                          sizeVer(24),
                          ///last name
                          Text(
                            "Last Name",
                            style: getSemiBoldStyle(
                                fontSize: 14, color: ColorManager.gray700),
                          ),
                          SearchWidget(
                            controller: _lnameController,
                            focusNode: _lNameControllerFocus,
                            border: Border.all(color: ColorManager.gray300),
                            backgroundColor: Colors.white,
                            isEnabled: true,
                            hintText: 'first name',
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(color: ColorManager.gray300)),
                          ),
                          sizeVer(24),

                          ///zone
                          Text(
                            "Zone",
                            style: getSemiBoldStyle(
                                fontSize: 14, color: ColorManager.gray700),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                children: [
                                  // Icon(
                                  //   Icons.list,
                                  //   size: 16,
                                  //   color: Colors.yellow,
                                  // ),
                                  // SizedBox(
                                  //   width: 4,
                                  // ),
                                  Expanded(
                                    child: Text(
                                      'Select Area',
                                      style: getRegularStyle(
                                          fontSize: 14, color: ColorManager.gray300),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: items!
                                  .map((item) => DropdownMenuItem<AreaDatum>(
                                value: item,
                                child: Text(
                                  item.areaName.toString(),
                                  style: getRegularStyle(
                                      fontSize: 14, color: ColorManager.gray400),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as AreaDatum;
                                  if (selectedValue != null) {
                                    // isOutletLoading = true;
                                  }else{
                                    // Utils.displayToast("Select an address");
                                  }
                                });
                              },
                              icon: const Icon(
                                FeatherIcons.chevronDown,
                              ),
                              iconSize: 14,
                              iconEnabledColor: ColorManager.gray600,
                              iconDisabledColor:  ColorManager.gray600,
                              buttonHeight: 50,
                              // buttonWidth: 160,
                              buttonPadding: const EdgeInsets.only(left: 0, right: 14),
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: ColorManager.gray400,
                                ),
                                color: Colors.white,
                              ),
                              buttonElevation: 0,
                              itemHeight: 40,
                              itemPadding: const EdgeInsets.only(left: 16, right: 16),
                              dropdownMaxHeight: double.infinity,
                              // dropdownWidth: double.infinity,
                              dropdownPadding: const EdgeInsets.only(left: 16, right: 16),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                // color: Colors.redAccent,
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                              offset: const Offset(0, 0),
                            ),
                          ),
                          sizeVer(24),

                          ///email address
                          Text(
                            "Email Address",
                            style: getSemiBoldStyle(
                                fontSize: 14, color: ColorManager.gray700),
                          ),
                          SearchWidget(
                            controller: _emailController,
                            focusNode: _emailControllerFocus,
                            border: Border.all(color: ColorManager.gray300),
                            backgroundColor: Colors.white,
                            isEnabled: true,
                            hintText: 'you@example.com',
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(color: ColorManager.gray300)),
                          ),
                          sizeVer(24),

                          ///phone number
                          Text(
                            "Phone Number",
                            style: getSemiBoldStyle(
                                fontSize: 14, color: ColorManager.gray700),
                          ),
                          SearchWidget(
                            controller: _phoneController,
                            border: Border.all(color: ColorManager.grayBorder),
                            backgroundColor: Colors.white,
                            isEnabled: true,
                            hintText: 'phone number',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorManager.gray50
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all( 12.0),
                                  child: Text(
                                    '+880',textAlign: TextAlign.center,
                                    style: getRegularStyle(
                                        fontSize: 14, color: ColorManager.gray500),
                                  ),
                                ),
                              ),
                            ),
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(color: ColorManager.gray300)),
                          ),
                          sizeVer(24),

                          ///password
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

                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              icon: isPasswordVisible == false
                                  ? Icon(
                                PhosphorIcons.eye,
                                color: ColorManager.deepBlack,
                              )
                                  : Icon(
                                FeatherIcons.eyeOff,
                                color: ColorManager.primary500,
                              ),
                            ),
                            border: Border.all(color: ColorManager.grayBorder),
                            backgroundColor: Colors.white,
                            focusedBorder:  OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(color: ColorManager.gray300)),
                            isEnabled: true,
                            hintText: 'password',
                          ),
                          sizeVer(24),

                          ///confirm password
                          Text(
                            "Retype password",
                            style: getSemiBoldStyle(
                                fontSize: 14, color: ColorManager.gray700),
                          ),
                          SearchWidget(
                            controller: _confirmPasswordController,
                            focusNode: _confirmPasswordControllerFocus,
                            obscureText:
                            isConfirmPasswordVisible == false ? true : false,

                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isConfirmPasswordVisible = !isConfirmPasswordVisible;
                                });
                              },
                              icon: isConfirmPasswordVisible == false
                                  ? Icon(
                                PhosphorIcons.eye,
                                color: ColorManager.deepBlack,
                              )
                                  : Icon(
                                FeatherIcons.eyeOff,
                                color: ColorManager.primary500,
                              ),
                            ),
                            border: Border.all(color: ColorManager.grayBorder),
                            backgroundColor: Colors.white,
                            focusedBorder:  OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(color: ColorManager.gray300)),
                            isEnabled: true,
                            hintText: 'retype password',
                          ),
                          sizeVer(24),

                          SizedBox(
                            width: double.infinity,
                              child: SvgPicture.asset(AssetConstant.nidOrPassportIcon,)),
                          sizeVer(24),
                          SizedBox(
                              width: double.infinity,
                              child: SvgPicture.asset(AssetConstant.dropImageIcon)),

                          sizeVer(40),
                          CustomButton(
                            buttonTitle: 'Sign Up',
                            onPressed: () {

                            },
                          ),
                          sizeVer(24),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Already have an account? ",
                                    style: getTextStyle(14, FontWeight.w400,
                                        ColorManager.grayLight)),
                                sizeVer(16),
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
                                  child: CustomButton(
                                    buttonTitle: 'Sign In Here',color: ColorManager.primaryWhite,
                                    border: Border.all(color: ColorManager.primary500),
                                    textStyle: getBoldStyle(color: ColorManager.primary500,fontSize: 14),
                                    onPressed: () {
                                      Get.to(const SignInScreen());

                                    },
                                  ),
                                ),
                              ],
                            ),
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
