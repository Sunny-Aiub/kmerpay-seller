
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:kookit_delivery/auth/presentation/pages/sign_in_screen.dart';

import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../../../resources/widgets/kpbutton.dart';
import '../../../resources/widgets/success_screen.dart';
import '../widgets/search_field_widget.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  var _formKey = new GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _emailControllerFocus = FocusNode();
  var _passcodeController = TextEditingController();
  var _passcodeControllerFocus = FocusNode();
  bool isNewpasscodeVisible = false;
  bool ispasscodeVisible = false;

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
                          sizeVer(96),
                          Center(child: SvgPicture.asset(AssetConstant.codeVerifiedIcon,height: 140,)),
                          sizeVer(64),
                          Text("Code Verified",
                              style: getSemiBoldStyle( fontSize: 26, color: ColorManager.primaryBlack,)),
                          Text(
                            "Please set a new passcode",
                            style:getMediumStyle(fontSize: 18, color: ColorManager.bluishGrey),),
                          sizeVer(40),

                          Text(
                            "New Passcode",
                            style:getRegularStyle(fontSize: 14, color: ColorManager.bluishGrey),),
                          sizeVer(4),

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
                            hintText: 'At least 6 characters',
                            focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                          sizeVer(16),

                          Text(
                            "Retype new passcode",
                            style:getRegularStyle(fontSize: 14, color: ColorManager.bluishGrey),),
                          sizeVer(4),

                          SearchWidget(
                            controller: _passcodeController,
                            focusNode: _passcodeControllerFocus,
                            obscureText:
                            ispasscodeVisible == false ? true : false,
                            prefixIcon: Icon(
                              PhosphorIcons.lock,
                              color: ColorManager.offWhite,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  ispasscodeVisible = !ispasscodeVisible;
                                });
                              },
                              icon: ispasscodeVisible == false
                                  ? Icon(
                                PhosphorIcons.eye,
                                color: ColorManager.offWhite,
                              )
                                  : Icon(
                                FeatherIcons.eyeOff,
                                color: ColorManager.primaryBlue,
                              ),
                            ),
                            border: Border.all(color: ColorManager.offWhite),
                            backgroundColor: Colors.white,
                            focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                            isEnabled: true,
                            hintText: 'passcode need to be matched',
                          ),


                          sizeVer(40),
                          CustomButton(buttonTitle: 'Submit',
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) => SuccessWidget(title: "Code Changed",
                                        subTitle: "Please login with your new passcode",
                                        imageString: AssetConstant.logoIcon,
                                        actionTitleString: 'Go to login',
                                      onPressed: (){
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              fullscreenDialog: true,
                                              builder: (context) =>
                                              const SignInScreen(), //const LandingScreen(),
                                            ));
                                      },
                                    ), //const LandingScreen(),
                                  ));
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
            IconButton(onPressed: ()=> Navigator.pop(context ),
                icon: const Icon(PhosphorIcons.arrow_left)),
          ],
        ),
      ),
    );
  }
}
