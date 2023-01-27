import 'package:flutter/material.dart';
import 'package:kmerpay_seller/resources/colors.dart';
import 'package:kmerpay_seller/resources/styles.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
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

  const CustomButton(
      {super.key,
      this.onPressed,
      required this.buttonTitle,
      this.gradient,
      this.textAlign,
      this.textStyle,
        this.margin,
      this.border,this.leading,this.trailing,this.color,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: margin,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.primaryBlue,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: ListTile(
        onTap: onPressed,
        leading: leading,trailing: trailing,
        title: Text(
          buttonTitle,textAlign:TextAlign.center,style: getTextStyle(16, FontWeight.w600, Colors.white),),
        // textColor: Colors.white,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(25),
        // ),
      ),

    );
  }
}
