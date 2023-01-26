
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';

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
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 35,
                        child: CircleAvatar(
                          backgroundColor: ColorManager.brandColor,
                          radius: 33,
                        )),
                    title: Text(
                      'Good Morning',
                      style: getTextStyle(
                          14, FontWeight.w400, ColorManager.grayLight),
                    ),
                    subtitle: Text(
                      'John Martin ',
                      style: getTextStyle(
                          24, FontWeight.w600, ColorManager.deepBlack),
                    ),
                    trailing: Icon(
                      FeatherIcons.bell,
                      color: ColorManager.deepBlack,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Exam',
                        style: getTextStyle(
                            20, FontWeight.w600, ColorManager.deepBlack),
                      ),
                      Text(
                        'See all',
                        style: getTextStyle(
                            14, FontWeight.w600, ColorManager.blueTextColor),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: setUpRecentExams(),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subscribe Students',
                        style: getTextStyle(
                            20, FontWeight.w600, ColorManager.deepBlack),
                      ),
                      Text(
                        'See all',
                        style: getTextStyle(
                            14, FontWeight.w600, ColorManager.blueTextColor),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 6,
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: ColorManager.brandColor,
                          radius: 25,
                        ),
                        title: Text(
                          'Dianne Russell',
                          style: getTextStyle(
                              16, FontWeight.w600, ColorManager.grayLight),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'debbie.baker@example.com',
                              style: getTextStyle(
                                  14, FontWeight.w400, ColorManager.deepBlack),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3)),
                                      color: Colors.green.shade100,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Active',
                                        style: getTextStyle(
                                            12, FontWeight.w600, ColorManager.green),
                                      ),
                                    ),
                                  ),
                                  sizeHor(8),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                      color: ColorManager.brandColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Report',
                                        style: getTextStyle(
                                            12, FontWeight.w600, Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        trailing: CircleAvatar(
                          backgroundColor: Color.fromRGBO(247, 82, 82, 0.1),
                          child: SvgPicture.asset(AssetConstant.deleteIcon),
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
