import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kmerpay_seller/resources/styles.dart';

import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import 'on_bording_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progressValue = 0.0;

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    _updateProgress();
    super.initState();
  }

  void _updateProgress() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.25;
        // we "finish" downloading here
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) =>
                    const OnBordingScreen(), //const LandingScreen(),
              ));
          return;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: ColorManager.backBlue
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SvgPicture.asset(AssetConstant.splashIcon, fit: BoxFit.fill,),
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
                  child: SvgPicture.asset(AssetConstant.logoIcon,height: 85,width: 104,),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 48.0, bottom: 100,left: 48,right: 48),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(ColorManager.primaryWhite),
                    value: _progressValue,
                  ),
                ),

                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: Text(
                          'Making Payment a Lot Easier',
                          style: getTextStyle(
                              18, FontWeight.w500, ColorManager.primaryWhite),
                        )),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
