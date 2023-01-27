
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:kmerpay_seller/auth/presentation/pages/set_new_password_screen.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:kmerpay_seller/resources/widgets/kpbutton.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var _formKey = new GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _emailControllerFocus = FocusNode();
  var _passwordController = TextEditingController();
  var _passwordControllerFocus = FocusNode();
  bool isPasswordVisible = false;


  bool _onEditing = false;
  String _code = '';


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
                      padding: const EdgeInsets.all(32.0),
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


                          Center(
                            child:  VerificationCode(
                              autofocus: true,digitsOnly: true,itemSize: 60,
                              textStyle: getTextStyle(16, FontWeight.w400, ColorManager.offWhite),
                              underlineColor: ColorManager.primaryBlue,
                              keyboardType: TextInputType.number,cursorColor: ColorManager.primaryBlue,
                              fullBorder: true,
                              margin: EdgeInsets.all(8),
                              length: 4,
                              // clearAll is NOT required, you can delete it
                              // takes any widget, so you can implement your design
                              // clearAll: Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Text(
                              //     'clear all',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         decoration: TextDecoration.underline,
                              //         color: Colors.blue[700]),
                              //   ),
                              // ),
                              onCompleted: (String value) {
                                setState(() {
                                  _code = value;
                                });
                              },
                              onEditing: (bool value) {
                                setState(() {
                                  _onEditing = value;
                                });
                                if (!_onEditing) FocusScope.of(context).unfocus();
                              },
                            )
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: CustomButton(
                                buttonTitle: 'Submit',
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) =>
                                      const NewPasswordScreen(), //const LandingScreen(),
                                    ));
                              },
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Did not recieve the OTP?",
                                  style: getTextStyle(14, FontWeight.w400,
                                      ColorManager.grayLight)),
                              InkWell(
                                onTap: () {
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       fullscreenDialog: true,
                                  //       builder: (context) =>
                                  //       const SignInScreen(), //const LandingScreen(),
                                  //     ));
                                },
                                child: Text("Request resend",
                                    style: getTextStyle(14, FontWeight.w600,
                                        ColorManager.blueTextColor)),
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
                icon: const Icon(PhosphorIcons.arrow_left)),
          ],
        ),
      ),
    );
  }
}
