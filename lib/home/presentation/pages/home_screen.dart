import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.uiBackgroundColor,
        body: Stack(
          children: [
            CustomScrollView(slivers: [

              ///banner
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/banner.png',
                          ),
                          fit: BoxFit.fill)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 35,
                                child: Image.asset('assets/images/human.png')),
                            title: Text(
                              'Welcome, John',
                              style: getSemiBoldStyle(
                                  fontSize: 20,
                                  color: ColorManager.primaryWhite),
                            ),
                            trailing: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: badges.Badge(
                                  badgeStyle: BadgeStyle(
                                      badgeColor: ColorManager.primaryBlue),
                                  position: BadgePosition.custom(
                                    top: -5,
                                    start: 12,
                                  ),
                                  badgeContent: SizedBox(
                                    height: 1,
                                    width: 1,
                                  ),
                                  child: Icon(
                                    FeatherIcons.bell,
                                    color: ColorManager.primaryBlue,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32.0, left: 32),
                            child: Text(
                              'Total Sale Today',
                              style: getRegularStyle(
                                  fontSize: 16, color: ColorManager.lightWhite),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, left: 32),
                            child: Text(
                              '23,534.00 CFA',
                              style: getSemiBoldStyle(
                                  fontSize: 24,
                                  color: ColorManager.primaryWhite),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),

              ///outlets + counters
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 30),
                  child: Container(
                      height: 88,
                      decoration: BoxDecoration(
                          color: ColorManager.primaryWhite,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 12,
                                spreadRadius: 0,
                                color: ColorManager.primaryWhite)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2 - 32,
                            child: ListTile(
                              title: Text('Total Outlet',
                                  textAlign: TextAlign.center,
                                  style: getRegularStyle(
                                      fontSize: 14,
                                      color: ColorManager.bluishGrey)),
                              subtitle: Text('12',
                                  textAlign: TextAlign.center,
                                  style: getSemiBoldStyle(
                                      fontSize: 20,
                                      color: ColorManager.primaryBlack)),
                            ),
                          ),
                          Container(
                            height: 60,
                            color: ColorManager.offWhite,
                            width: 1,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2 - 32,
                            child: ListTile(
                              title: Text('Total Counter',
                                  textAlign: TextAlign.center,
                                  style: getRegularStyle(
                                      fontSize: 14,
                                      color: ColorManager.bluishGrey)),
                              subtitle: Text('43',
                                  textAlign: TextAlign.center,
                                  style: getSemiBoldStyle(
                                      fontSize: 20,
                                      color: ColorManager.primaryBlack)),
                            ),
                          )
                        ],
                      )),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 10),
                  child: Text(
                    'Today’s Transactions',
                    style: getSemiBoldStyle(
                        fontSize: 20, color: ColorManager.primaryBlack),
                  ),
                ),
              ),

              ///transaction list
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 6,
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 24),
                    child: Container(
                      height: 88,
                      decoration: BoxDecoration(
                          color: ColorManager.primaryWhite,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 12,
                                spreadRadius: 0,
                                color: ColorManager.primaryWhite)
                          ]),
                      child: ListTile(
                        title: Text('Northern Outlet',
                            style: getRegularStyle(
                                fontSize: 14, color: ColorManager.primaryBlack)),
                        subtitle: Text('Gadget Counter, 12:25 PM',
                            style: getSemiBoldStyle(
                                fontSize: 12, color: ColorManager.bluishGrey)),
                        trailing:  Text('+1,250.00 CFA',
                            style: getSemiBoldStyle(
                                fontSize: 16, color: ColorManager.green)),
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

  setUpRecentExams() {
    List<Widget> childrens = [];
    for (var i = 0; i < 4; i++) {
      childrens.add(Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
            onTap: () {
              // Navigator.pushNamed(
              //     context, ScreenRouteConst.foodDetails,arguments: topSellingFoods[i]);
            },
            child: Container(
              width: 260,
              height: 160,
              decoration: BoxDecoration(
                  color: ColorManager.randomGenerator(),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                    alignment: Alignment.bottomRight,
                    image: AssetImage(
                        "assets/icons/home/Exam Card Abstract shape.png"),
                    fit: BoxFit.contain,
                  )),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Moc Test',
                        style: getTextStyle(16, FontWeight.w600, Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Course - Nigeria Customs Service',
                          style:
                              getTextStyle(14, FontWeight.w400, Colors.white),
                        ),
                      ),
                      Text(
                        '24 Aug 2022',
                        style: getTextStyle(14, FontWeight.w400, Colors.white),
                      ),
                    ],
                  )),
            )),
      ));
    }
    return childrens;
  }
}
