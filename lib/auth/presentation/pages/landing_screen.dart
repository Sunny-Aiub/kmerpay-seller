
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kmerpay_seller/outlets/presentation/pages/outlets_screen.dart';
import 'package:kmerpay_seller/resources/constants.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../profile/presentation/pages/profile_screen.dart';
import '../../../qr_code/presentation/pages/generate_qr_screen.dart';
import '../../../resources/colors.dart';
import '../../../students/presentation/pages/students_screen.dart';
import '../../../transactions/presentation/pages/all_transactions_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  late PersistentTabController _controller;

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const AllOutletsScreen(),
      const GenerateQRScreen(),
      const AllTransactionsScreen(),
      const ProfileScreen(),

    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(PhosphorIcons.house),
        title: ("Home"),
        activeColorPrimary: ColorManager.primaryBlue,
        inactiveColorPrimary: ColorManager.silver,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(PhosphorIcons.storefront),
        title: ("Outlets"),
        activeColorPrimary: ColorManager.primaryBlue,
        inactiveColorPrimary: ColorManager.silver,
      ),

      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AssetConstant.barcodeIcon,),
        inactiveColorPrimary: Colors.white,
        // title: ("Scan"),
        activeColorPrimary: ColorManager.primaryWhite,
        // inactiveColorPrimary: ColorManager.silver,
      ),

      PersistentBottomNavBarItem(
        icon: const Icon(PhosphorIcons.receipt),
        title: ("Transaction"),
        activeColorPrimary: ColorManager.primaryBlue,
        inactiveColorPrimary: ColorManager.silver,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(PhosphorIcons.user_circle),
        title: ("Home"),
        activeColorPrimary: ColorManager.primaryBlue,
        inactiveColorPrimary: ColorManager.silver,
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
      true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: ColorManager.offWhite.withOpacity(0.18),
            offset: Offset(0, 6),
            blurRadius: 20,
            spreadRadius: 0,
          )
        ]
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
    );;
  }
}
