import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:kookit_delivery/auth/presentation/pages/sign_in_screen.dart';
import 'package:kookit_delivery/home/presentation/pages/home_screen.dart';
import 'package:kookit_delivery/profile/presentation/pages/profile_screen.dart';
import 'package:kookit_delivery/resources/appconfigs.dart';
import 'package:kookit_delivery/resources/constants.dart';
import 'package:unicons/unicons.dart';

import '../../../resources/colors.dart';
import '../../../resources/styles.dart';

class LeftMenuScreen extends StatefulWidget {
  const LeftMenuScreen({Key? key}) : super(key: key);

  @override
  State<LeftMenuScreen> createState() => _LeftMenuScreenState();
}

class _LeftMenuScreenState extends State<LeftMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Stack(
            children: [
              ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  sizeVer(32),
                  ListTile(

                    title: Text(
                        'Sadia Absary',
                        style: getTextStyle(14, FontWeight.w600,
                            ColorManager.gray800)),
                    onTap: () {
                      Navigator.pop(context);

                    },
                  ),
                  ListTile(
                    leading: Icon(
                      FeatherIcons.home,
                      color: ColorManager.primary500,
                    ),
                    title: Text(
                      'Home',
                      style: getTextStyle(14, FontWeight.w400,
                          ColorManager.gray700)),
                    onTap: () {
                      Navigator.pop(context);

                    },
                  ),
                  ListTile(
                    leading: Icon(
                      FeatherIcons.user,
                      color: ColorManager.primary500,
                    ),
                    title: Text(
                        'Profile',
                        style: getTextStyle(14, FontWeight.w400,
                            ColorManager.gray700)),
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => const ProfileScreen());

                    },
                  ),


                  ListTile(
                    leading: Icon(
                      UniconsLine.history,
                      color: ColorManager.primary500,
                    ),
                    title: Text(
                        'History',
                        style: getTextStyle(14, FontWeight.w400,
                            ColorManager.gray700)),
                    onTap: () {
                      Navigator.pop(context);

                    },
                  ),

                  ListTile(
                    leading: Icon(
                      FeatherIcons.creditCard,
                      color: ColorManager.primary500,
                    ),
                    title: Text(
                        'Earnings',
                        style: getTextStyle(14, FontWeight.w400,
                            ColorManager.gray700)),
                    onTap: () {
                      Navigator.pop(context);

                    },
                  ),


                ],
              ),
              if(AppConfigs.isLoggedIn == true)Align(
                alignment:  Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: InkWell(
                    onTap: () =>Get.to(const SignInScreen()),
                    child: Container(
                      height: 40,width: MediaQuery.of(context).size.width/2 - 16,
                      decoration: BoxDecoration(
                        color: ColorManager.primary500,
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                        child: Text(
                          'Logout',textAlign: TextAlign.center,
                          style: getBoldStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}
