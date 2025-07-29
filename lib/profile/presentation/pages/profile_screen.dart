import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kookit_delivery/auth/presentation/widgets/search_field_widget.dart';

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

  final TextEditingController _fnameController = TextEditingController();

  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.lightWhite,
        appBar: AppBar(
          elevation: 1,
          leading: InkWell(
            onTap: () => Get.back(),
            child: Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 0.0,
                  bottom: 20.0,
                  right: 0.0,
                ),
                  child: Icon(
                    FeatherIcons.arrowLeft,
                    color: ColorManager.primary500,
                )),
          ),
          centerTitle: false,
          titleSpacing: 0,
          title: Text('Profile',
              style:
                  getRegularStyle(fontSize: 18, color: ColorManager.black700)),
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizeVer(32),
                        Center(
                          child: CircleAvatar(
                            backgroundColor: ColorManager.primary500,
                            radius: 30,
                            child: SvgPicture.asset(
                              "assets/images/profile.svg",
                              height: 68,
                              width: 68,
                            ),
                          ),
                        ),
                        sizeVer(8),
                        Center(
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, ScreenRouteConst.changePasswordScreen),
                            child: Container(
                              height: 22,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: ColorManager.primary500,
                                  ),
                              child: Center(
                                child: Text(
                                  'Upload Image',style: getSemiBoldStyle(fontSize: 10, color: ColorManager.primaryWhite)
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "First Name",
                          style: getSemiBoldStyle(
                              fontSize: 14, color: ColorManager.gray700),
                        ),
                        sizeVer(4),
                        SearchWidget(
                          controller: _fnameController,
                          border: Border.all(color: ColorManager.gray300),
                          backgroundColor: ColorManager.primaryWhite,
                          isEnabled: false,
                          hintText: 'John Albert',
                        ),
                        sizeVer(16),
                        Text(
                          "Last Name",
                          style: getSemiBoldStyle(
                              fontSize: 14, color: ColorManager.gray700),
                        ),
                        sizeVer(4),
                        SearchWidget(
                          controller: _lnameController,
                          border: Border.all(color: ColorManager.gray300),
                          backgroundColor: ColorManager.primaryWhite,
                          isEnabled: false,
                          hintText: 'Albert',
                        ),
                        sizeVer(16),
                        Text(
                          "Phone",
                          style: getSemiBoldStyle(
                              fontSize: 14, color: ColorManager.gray700),
                        ),
                        sizeVer(4),
                        SearchWidget(
                          controller: _phoneController,
                          border: Border.all(color: ColorManager.gray300),
                          backgroundColor: ColorManager.primaryWhite,
                          isEnabled: false,
                          hintText: '+88012132132131',
                        ),
                        sizeVer(32),
                        Center(
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, ScreenRouteConst.changePasswordScreen),
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width - 16,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: ColorManager.primary500),
                                // color: ColorManager.gray800,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 8),
                                child: Text(
                                  'Change Password',
                                  textAlign: TextAlign.center,
                                  style: getBoldStyle(
                                    fontSize: 14,
                                    color: ColorManager.primary500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
