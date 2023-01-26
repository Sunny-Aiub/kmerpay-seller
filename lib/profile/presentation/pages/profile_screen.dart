import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../../../splash/presentation/pages/on_bording_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isAlertOn = true;
  bool isDarkModeOn = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.uiBackgroundColor,
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 320,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: ColorManager.brandColor,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                        alignment: Alignment.centerRight,
                        image: AssetImage(AssetConstant.profileBackgroundImage),
                        fit: BoxFit.contain,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 43,
                      ),
                      sizeVer(16),
                      Text(
                        'James Cameron',
                        style: getTextStyle(24, FontWeight.w600, Colors.white),
                      ),
                      Text(
                        'James.cameron@gmail.com',
                        style: getTextStyle(16, FontWeight.w400, Colors.white),
                      ),
                      Text(
                        '+880 65245 21',
                        style: getTextStyle(16, FontWeight.w400, Colors.white),
                      ),
                      sizeVer(16),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Edit Profile',
                            textAlign: TextAlign.center,
                            style: getTextStyle(
                                16, FontWeight.w400, ColorManager.brandColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///General
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'General',
                              style: getTextStyle(
                                  16, FontWeight.w400, ColorManager.grayLight),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 0),
                            child: Container(
                              color: ColorManager.grey4,
                              height: 1,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              PhosphorIcons.password,
                              color: ColorManager.brandColor,
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: ColorManager.deepBlack,
                            ),
                            title: Text(
                              'Change Password',
                              style: getTextStyle(
                                  16, FontWeight.w400, ColorManager.grayLight),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              ///Preference
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Preference',
                              style: getTextStyle(
                                  16, FontWeight.w400, ColorManager.grayLight),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 0),
                            child: Container(
                              color: ColorManager.grey4,
                              height: 1,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              PhosphorIcons.bell,
                              color: ColorManager.brandColor,
                            ),
                            trailing: (isAlertOn == false)
                                ? Icon(
                                    Icons.toggle_off_outlined,
                                    color: ColorManager.grayLight,
                                  )
                                : Icon(
                                    Icons.toggle_on_outlined,
                                    color: ColorManager.brandColor,
                                  ),
                            title: Text(
                              'Examination Alert',
                              style: getTextStyle(
                                  16, FontWeight.w400, ColorManager.grayLight),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 0),
                            child: Container(
                              color: ColorManager.grey4,
                              height: 1,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              PhosphorIcons.moon,
                              color: ColorManager.brandColor,
                            ),
                            trailing: (isDarkModeOn == false)
                                ? Icon(
                                    Icons.toggle_off_outlined,
                                    color: ColorManager.grayLight,
                                  )
                                : Icon(
                                    Icons.toggle_on_outlined,
                                    color: ColorManager.brandColor,
                                  ),
                            title: Text(
                              'Dark',
                              style: getTextStyle(
                                  16, FontWeight.w400, ColorManager.grayLight),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: ListTile(
                        leading: Icon(
                          PhosphorIcons.phone_call,
                          color: ColorManager.brandColor,
                        ),
                        title: Text(
                          'Support',
                          style: getTextStyle(
                              16, FontWeight.w400, ColorManager.grayLight),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const OnBordingScreen();
                              },
                            ),
                            (_) => false,
                          );
                        },
                        leading: Icon(
                          PhosphorIcons.sign_out,
                          color: ColorManager.brandColor,
                        ),
                        title: Text(
                          'Sign Out',
                          style: getTextStyle(
                              16, FontWeight.w400, ColorManager.grayLight),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
