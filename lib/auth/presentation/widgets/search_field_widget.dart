
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import '../../../resources/styles.dart';


class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnabled ;
  final Color? backgroundColor;
  final BoxBorder? border;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool? obscureText;
  void Function(String)? onChanged;
  final FocusNode? focusNode;

  final InputBorder? focusedBorder;

  final TextInputType? keyboardType;

  SearchWidget({Key? key, required this.controller, required this.isEnabled, this.backgroundColor,this.focusNode,
    this.border, this.prefixIcon, this.hintText,this.onChanged,this.suffixIcon,this.obscureText,this.focusedBorder, this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: 56,
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: (focusNode?.hasFocus == true) ? [
            BoxShadow(
              color: ColorManager.primary500.withOpacity(0.18),
              offset: Offset(0, 6),
              blurRadius: 20,
              spreadRadius: 0,
            )
          ]: null
          // border:  (focusedBorder != null)? null :border
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        enabled: isEnabled,keyboardType: keyboardType ?? TextInputType.text,
        focusNode: focusNode,
        obscureText: obscureText ?? false,
        style:getRegularStyle(fontSize: 14,color: ColorManager.gray500),
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(color: ColorManager.gray300)),
            focusedBorder: focusedBorder,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.all(12.0),
            hintStyle: getRegularStyle(fontSize: 12,color: ColorManager.gray500),
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