import 'package:flutter/material.dart';
import 'package:kmerpay_seller/resources/colors.dart';
import 'package:kmerpay_seller/resources/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import 'kpbutton.dart';

class SuccessWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageString;
  final String actionTitleString;
  final VoidCallback? onPressed;
  final Gradient? gradient;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final BoxBorder? border;
  final double? width;
  final Widget? leading;
  final Widget? trailing;

  const SuccessWidget(
      {super.key,
      this.onPressed,
      required this.title,
      this.gradient,
      this.textAlign,
      this.textStyle,
      this.margin,
      this.border,
      this.leading,
      this.trailing,
      this.color,
      this.width,
      required this.subTitle,
      required this.imageString,
      required this.actionTitleString});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: SvgPicture.asset(
                AssetConstant.successIcon,
                height: 140,
              )),
              sizeVer(40),
              Text(title,
                  textAlign: TextAlign.center,
                  style: getSemiBoldStyle(
                      fontSize: 26, color: ColorManager.primaryBlack)),
              Text(subTitle,
                  textAlign: TextAlign.center,
                  style: getMediumStyle(
                      fontSize: 18, color: ColorManager.bluishGrey)),
              sizeVer(40),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CustomButton(
                  buttonTitle: actionTitleString,
                  onPressed: onPressed,
                ),
              ),
              sizeVer(40),
            ],
          ),
        ),
      ),
    );
  }
}
