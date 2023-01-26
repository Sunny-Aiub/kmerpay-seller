
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import '../../../resources/styles.dart';


class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnabled ;
  final Color? backgroundColor;
  final BoxBorder? border;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final String? hintText;
  final bool? obscureText;
  void Function(String)? onChanged;

  SearchWidget({Key? key, required this.controller, required this.isEnabled, this.backgroundColor,
    this.border, this.prefixIcon, this.hintText,this.onChanged,this.suffixIcon,this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: 56,
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(4),
          border:  border
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        enabled: isEnabled,
        obscureText: obscureText ?? false,
        style:getTextStyle(14, FontWeight.w400, ColorManager.grayLight),
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.all(12.0),
            hintText: hintText ?? "Search here",
            // hintStyle: getRegularStyle(
            //     fontSize: 14,color: ColorManager.gray400
            // )
        ),
      ),
    )
    ;
  }
}