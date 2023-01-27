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
        backgroundColor: ColorManager.lightWhite,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: ColorManager.lightWhite,
          title: Text(
            'My Profile',
            style: getSemiBoldStyle(
                fontSize: 20, color: ColorManager.primaryBlack),
          ),
        ),
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    sizeVer(40),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 43,
                      child: Image.asset('assets/images/human.png'),
                    ),
                    sizeVer(16),
                    Text('John Doe',
                        style: getSemiBoldStyle(
                            fontSize: 14, color: ColorManager.primaryBlack)),
                    Text('johndoe@gmail.com',
                        style: getRegularStyle(
                            fontSize: 16,
                            color: ColorManager.bluishGrey)),

                    sizeVer(16),
                    Container(
                      width: 160,height: 40,
                      decoration: BoxDecoration(
                          color: ColorManager.primaryBlue,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(PhosphorIcons.pencil_line,color: ColorManager.primaryWhite,),
                          Text('Edit Profile',
                              style: getRegularStyle(
                                  fontSize: 16,
                                  color: ColorManager.primaryWhite)),

                        ],
                      )
                    ),
                    verticalDivider(),
                  ],
                ),
              ),

              ///General
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///email
                          Text(
                            'Email address',
                            style: getRegularStyle(fontSize: 14, color: ColorManager.bluishGrey),
                          ),
                          Text(
                            'johndoe@gmail.com',
                            style: getRegularStyle(fontSize: 16, color: ColorManager.primaryBlack),
                          ),
                          verticalDivider(padding:EdgeInsets.symmetric(vertical: 20)),

                          ///mobile
                          Text(
                            'Mobile number',
                            style: getRegularStyle(fontSize: 14, color: ColorManager.bluishGrey),
                          ),
                          Text(
                            '+237 123 123 1234',
                            style: getRegularStyle(fontSize: 16, color: ColorManager.primaryBlack),
                          ),
                          verticalDivider(padding:EdgeInsets.symmetric(vertical: 20)),

                          ///Address
                          Text(
                            'Address',
                            style: getRegularStyle(fontSize: 14, color: ColorManager.bluishGrey),
                          ),
                          Text(
                            'House:5, Road: 15, Block: B, Southside',
                            style: getRegularStyle(fontSize: 16, color: ColorManager.primaryBlack),
                          ),
                          verticalDivider(padding:EdgeInsets.symmetric(vertical: 20)),

                        ],
                      ),
                    ),
                  ),
                ),
              ),



              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 8),
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
                              16, FontWeight.w400, ColorManager.primaryBlack),
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
