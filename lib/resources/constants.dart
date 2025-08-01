import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'colors.dart';

Widget sizeVer(double height) {
  return SizedBox(height: height,);
}

Widget sizeHor(double width) {
  return SizedBox(width: width);
}

Widget verticalDivider({ EdgeInsets? padding}){
  return Padding(
    padding: padding ?? const EdgeInsets.symmetric(
        horizontal: 24.0, vertical: 20),
    child: Container(
      color: ColorManager.blueTextColor,
      height: 1,
    ),
  );
}

Widget horizontalDivider({ EdgeInsets? padding, double? width,Color? color}){
  return Padding(
    padding: padding ?? const EdgeInsets.symmetric(
        horizontal: 24.0, vertical: 20),
    child: Container(
      color: color ?? ColorManager.gray500,
      height: 1,width: width ?? 70,
    ),
  );
}
class PaddingConstant{
  static const  v12h16symmetricPadding = EdgeInsets.symmetric(vertical: 12,horizontal: 16);
  static const  h16Padding = EdgeInsets.symmetric(vertical: 0,horizontal: 16);
  static const  h12Padding = EdgeInsets.symmetric(vertical: 0,horizontal: 12);

}

class ScreenRouteConst {

  static const String searchScreen = "searchScreen";
  static const String filterScreen = "filterScreen";
  static const String productFilterScreen = "productFilterScreen";

  static const String viewProfile = "viewProfile";

  static const String editProfileScreen = "editProfileScreen";
  static const String updatePostScreen = "updatePostScreen";
  static const String commentScreen = "commentScreen";
  static const String signInScreen = "signInScreen";
  static const String signUpScreen = "signUpScreen";
  static const String forgotPasswordScreen = "forgotPasswordScreen";
  static const String changePasswordScreen = "changePasswordScreen";
  static const String deliveryLocationScreen = "deliveryLocationScreen";
  static const String splashScreen = "splashScreen";

  //Browse Menu
  static const String browseMenu = "browseMenu";

  //Brands
  static const String brands = "brands";
  static const String foodDetails = "foodDetails";

  static const String cartScreen = "cartScreen";
  static const String checkoutScreen = "checkoutScreen";
  static const String offersScreen = "offersScreen";

  ///orders
  static const String orderScreen = 'orderScreen';



  //Explore More
  static const String careScreen = "careScreen";
  static const String visionScreen = "visionScreen";
  static const String blogsScreen = "blogsScreen";
  static const String mediaScreen = "mediaScreen";
  static const String loyaltyScreen = "loyaltyScreen";
  static const String cateringScreen = "cateringScreen";
  static const String dineInScreen = "dineInScreen";
  static const String safetyStandardScreen = "safetyStandardScreen";




}

class AssetConstant {

  ///icons
  static const String logoIcon = "assets/icons/logo.svg";
  static const String logoTextIcon = "assets/icons/text_logo.svg";
  static const String splashIcon = "assets/icons/splash-icon.svg";

  static const String requestIcon = "assets/icons/ic_request.svg";
  static const String pendingIcon = "assets/icons/ic_pending.svg";
  static const String inProgressIcon = "assets/icons/ic_progress.svg";
  static const String completeDeliveryIcon = "assets/icons/ic_complete.svg";

  static const String dividerIcon = "assets/icons/divider.svg";



  ///images
  static const String profileImage = "assets/images/profile.svg";
  static const String splashImage = "assets/images/logo.png";
  static const String loginIcon = "assets/icons/login_icon.svg";
  static const String nidOrPassportIcon = "assets/images/drop_nid_or_passport.svg";
  static const String dropImageIcon = "assets/images/drop_image.svg";
  static const String codeVerifiedIcon = "assets/icons/code_verified_icon.svg";
  static const String successIcon = "assets/icons/success_icon.svg";


  static const String detailsBackground = "assets/images/details_background.png";



  static const String slider1 = "assets/images/onbording_sliders/slider1.png";
  static const String slider2 = "assets/images/onbording_sliders/slider2.png";
  static const String slider3 = "assets/images/onbording_sliders/slider3.png";

  ///home
  static const String examIcon = "assets/icons/home/Exam.svg";
  static const String studentIcon = "assets/icons/home/Student.svg";
  static const String examBack = "assets/icons/home/Exam Card Abstract shape.svg";
  static const String barcodeIcon = "assets/icons/barcode.svg";

  static const String deleteIcon = "assets/icons/delete.svg";

  static const String circleIcon = "assets/icons/circle.png";
  static const String profileBackgroundImage = "assets/images/Profile.png";


}



class VariableConstant {
  static const String currentLocationString = 'Select your location';
  static const String bannerImageLink = "https://images.deliveryhero.io/image/fd-bd/LH/xylf-hero.jpg?width=1600&height=400&quality=45";
  static const String shopImageLink = "https://images.deliveryhero.io/image/fd-bd/LH/w6ni-hero.jpg?width=1600&height=400&quality=45";
  static const String foodImageLink = "https://images.deliveryhero.io/image/fd-bd/Products/4243817.jpg?width=1200";
  static const String offerImageLink = "https://images.deliveryhero.io/image/fd-bd/Products/4243817.jpg?width=1200";


}

class MessageConstant{
  static const String unverifiedUserMessage = 'You need to sign in before doing this !';
  static const String addressChangeMessage = 'Are you sure you want to change this location? Cart will refresh and may be empty if you change the area or type.';
  static const String formEmptyMessage = 'Please input all field';
  static const String unmatchedPasswordMessage = 'Password doesn\'t match';

}
void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorManager.brandColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
