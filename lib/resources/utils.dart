import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kookit_delivery/resources/styles.dart';

import 'colors.dart';

class Utils {
  static var screenWidth = 0.0;
  static var screenHeight = 0.0;

  // static openBrowser(String url){
  //   _launchURL() async {
  //     // const url = 'https://flutter.io';
  //     final uri = Uri.parse(url);
  //     if (await canLaunchUrl(uri)) {
  //       await launchUrl(uri);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   }
  // }
  static displayToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static void popUpAlert(
      String message,
      BuildContext context,
      String successButtonTitle,
      String cancelButtonTitle,
      VoidCallback? onSuccessClick) {
    // set up the button
    Widget okButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          minimumSize: const Size(90, 30),
          backgroundColor: ColorManager.primary600,
          textStyle:
              getRegularStyle(fontSize: 12, color: ColorManager.primaryWhite),
          elevation: 0

          // foreground
          ),
      onPressed: onSuccessClick,
      child: Text(successButtonTitle),
    );

    Widget cancelButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorManager.primaryBlack,
        backgroundColor: Colors.white,
        textStyle:
            getRegularStyle(fontSize: 12, color: ColorManager.primaryBlack),
        elevation: 0,
        // side: BorderSide(color: ColorManager.primary500)
        // foreground
      ),
      child: Text(cancelButtonTitle),
      onPressed: () {
        Navigator.pop(context, true);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SvgPicture.asset(AssetConstant.orderDone),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     "Congratulations!",
          //     style: getBoldStyle(fontSize: 14, color: Colors.black),
          //   ),
          // ),
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          message,
          style:
              getRegularStyle(fontSize: 22, color: ColorManager.primaryBlack),
        ),
      ),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static Future<bool> onWillPop(context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  static Future<void> goTo(BuildContext context, String routeName,
      [dynamic? data]) async {
    await Navigator.pushNamed(context, routeName, arguments: data);
  }
}
