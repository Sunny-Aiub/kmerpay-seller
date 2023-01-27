import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kmerpay_seller/auth/presentation/widgets/search_field_widget.dart';

import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class AllOutletsScreen extends StatefulWidget {
  const AllOutletsScreen({Key? key}) : super(key: key);

  @override
  State<AllOutletsScreen> createState() => _AllOutletsScreenState();
}

class _AllOutletsScreenState extends State<AllOutletsScreen> {
  var _searchController = TextEditingController();

  bool forIos = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: ColorManager.uiBackgroundColor,
          title: Text(
            'Outlets',
            style: getSemiBoldStyle(
                fontSize: 20, color: ColorManager.primaryBlack),
          ),
        ),
        backgroundColor: ColorManager.uiBackgroundColor,
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: ListTile(
                    minVerticalPadding: 0,
                    //contentPadding: EdgeInsets.zero,
                    // horizontalTitleGap:0,
                    title: SearchWidget(
                      controller: _searchController,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          PhosphorIcons.funnel_simple,
                          color: ColorManager.bluishGrey,
                        ),
                      ),
                      prefixIcon: Icon(
                        FeatherIcons.search,
                        color: ColorManager.bluishGrey,
                      ),
                      border: Border.all(color: ColorManager.offWhite),
                      backgroundColor: Colors.white,
                      isEnabled: true,
                      hintText: 'Search by outlet name',
                    ),
                  ),
                ),
              ),


              ///transaction list
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 12,
                      (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 24),
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
                        leading: CircleAvatar(
                          radius: 28,
                          child: Image.asset('assets/images/human.png'),
                        ),
                        title: Text('Northern Outlet',
                            style: getRegularStyle(
                                fontSize: 16,
                                color: ColorManager.primaryBlack)),
                        subtitle: Text('7 counter',
                            style: getSemiBoldStyle(
                                fontSize: 14, color: ColorManager.bluishGrey)),
                        trailing: CupertinoSwitch(
                          // overrides the default green color of the track
                          activeColor: ColorManager.primaryBlue,
                          // color of the round icon, which moves from right to left
                          thumbColor: ColorManager.primaryWhite,
                          // when the switch is off
                          trackColor: ColorManager.silver,
                          // boolean variable value
                          value: forIos,
                          // changes the state of the switch
                          onChanged: (value) => setState(() => forIos = value),
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
