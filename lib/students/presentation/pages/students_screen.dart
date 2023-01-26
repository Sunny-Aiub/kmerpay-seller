
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';

import '../../../auth/presentation/widgets/search_field_widget.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  var _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.uiBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Subscribe Students',
            style: getTextStyle(16, FontWeight.w600, Colors.white),
          ),
          flexibleSpace: Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              HexColor.fromHex("#F0478C"),
              HexColor.fromHex("#CC0B5A"),
            ]),
          )),
        ),
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: ListTile(
                    minVerticalPadding:0,
                    //contentPadding: EdgeInsets.zero,
                    // horizontalTitleGap:0,
                    title: SearchWidget(
                      controller: _searchController,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FeatherIcons.search,
                          color: ColorManager.brandColor,
                        ),
                      ),
                      border: Border.all(color: ColorManager.grayBorder),
                      backgroundColor: Colors.white,
                      isEnabled: true,
                      hintText: 'search student by email',
                    ),
                    // subtitle: Text(
                    //   'John Martin ',
                    //   style: getTextStyle(
                    //       24, FontWeight.w600, ColorManager.deepBlack),
                    // ),
                    trailing: Container(
                      width: 54,
                      height: 48,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: ColorManager.grayBorder),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Icon(
                        PhosphorIcons.funnel_simple,
                        color: ColorManager.brandColor,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8),
                  child: Text(
                    'All Student',
                    style: getTextStyle(
                        16, FontWeight.w600, ColorManager.deepBlack),
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
                                        style: getTextStyle(12, FontWeight.w600,
                                            ColorManager.green),
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
}
