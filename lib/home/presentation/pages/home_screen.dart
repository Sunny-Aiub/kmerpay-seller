import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kookit_delivery/orders/presentation/pages/complete_order_screen.dart';
import 'package:kookit_delivery/orders/presentation/pages/in_progress_screen.dart';
import 'package:kookit_delivery/orders/presentation/pages/pending_orders.dart';
import 'package:kookit_delivery/resources/appconfigs.dart';

import '../../../orders/presentation/pages/delivery_requests_screen.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../../../resources/utils.dart';
import 'left_menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var goOnline = true.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const LeftMenuScreen(),
        appBar: AppBar(
          backgroundColor: ColorManager.primaryWhite,
          iconTheme: IconThemeData(color: ColorManager.primaryBlack),
          elevation: 1,
          centerTitle: false,
          title: SvgPicture.asset(AssetConstant.logoTextIcon),
          actions: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(FeatherIcons.bell),
            )
          ],
        ),
        backgroundColor: ColorManager.uiBackgroundColor,
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              ///status design
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.primaryWhite,
                  ),
                  height: 60,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Your Status',
                          style: getRegularStyle(
                              fontSize: 19, color: ColorManager.gray800),
                        ),
                      ),
                      const Spacer(),
                      Obx(
                        () => Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              AppConfigs.statusTitle.value,
                              style: getRegularStyle(
                                  fontSize: 18.77, color: ColorManager.gray800),
                            )
                            // : Text('Offline',
                            //     style: getRegularStyle(
                            //         fontSize: 18.77,
                            //         color: ColorManager.gray800)),
                            ),
                      ),
                      InkWell(
                        onTap: () {
                          if (AppConfigs.statusTitle.value ==
                              StatusType.Online.name) {
                            Utils.popUpAlert("Are you sure want to go Offline?",
                                context, 'Yes', 'Cancel', () {
                              goOnline.toggle();
                              AppConfigs.statusTitle.value =
                                  StatusType.Offline.name;
                              //
                              // if(goOnline.value == true){
                              //   AppConfigs.statusTitle = StatusType.Online.name.obs;
                              // }else{
                              //   AppConfigs.statusTitle = StatusType.Offline.name.obs;
                              // }
                              Get.back();
                            });
                          } else {
                            Utils.popUpAlert("Are you sure want to go Online?",
                                context, 'Yes', 'Cancel', () {
                              goOnline.toggle();
                              AppConfigs.statusTitle.value =
                                  StatusType.Online.name;

                              Get.back();
                            });
                          }
                        },
                        child: Obx(
                          () => Padding(
                            padding: const EdgeInsets.only(
                              right: 18.0,
                            ),
                            child: (goOnline.value == false)
                                ? Icon(
                                    Icons.toggle_off_outlined,
                                    size: 40,
                                    color: ColorManager.red500,
                                  )
                                : Icon(
                                    Icons.toggle_on_outlined,
                                    size: 40,
                                    color: ColorManager.primary600,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///delivery request
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 32.0, horizontal: 24),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.redPending,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: ColorManager.redBorder)),
                    height: 90,
                    child: ListTile(
                      onTap: () => Get.to(const DeliveryRequestsScreen()),
                      leading: SvgPicture.asset(AssetConstant.requestIcon),
                      title: Text(
                        'Delivery Request',
                        style: getRegularStyle(
                            fontSize: 14, color: ColorManager.primaryRed),
                      ),
                      subtitle: Text(
                        '3',
                        style: getSemiBoldStyle(
                            fontSize: 28, color: ColorManager.black800),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: ColorManager.primaryRed,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///pending design
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.primaryWhite,
                        boxShadow: [
                          BoxShadow(
                              color: ColorManager.black100,
                              offset: const Offset(0, 1),
                              blurRadius: 2,
                              spreadRadius: 0)
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: ColorManager.whiteBorder)),
                    height: 90,
                    child: ListTile(
                      onTap: () {
                        Get.to(const PendingRequestsScreen());
                      },
                      leading: SvgPicture.asset(AssetConstant.pendingIcon),
                      title: Text(
                        'Pending Delivery',
                        style: getRegularStyle(
                            fontSize: 14, color: ColorManager.yellowPending),
                      ),
                      subtitle: Text(
                        '3',
                        style: getSemiBoldStyle(
                            fontSize: 28, color: ColorManager.black800),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: ColorManager.black800,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///in progress
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 32.0, horizontal: 24),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.primaryWhite,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: ColorManager.primaryWhite)),
                    height: 90,
                    child: ListTile(
                      onTap: () => Get.to(const InProgressScreen()),
                      leading: SvgPicture.asset(AssetConstant.inProgressIcon),
                      title: Text(
                        'In Progress',
                        style: getRegularStyle(
                            fontSize: 14, color: ColorManager.primaryRed),
                      ),
                      subtitle: Text(
                        '3',
                        style: getSemiBoldStyle(
                            fontSize: 28, color: ColorManager.black800),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: ColorManager.black800,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///complete
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.primaryWhite,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: ColorManager.primaryWhite)),
                    height: 90,
                    child: ListTile(
                      onTap: () => Get.to(const CompleteOrderScreen()),
                      leading:
                          SvgPicture.asset(AssetConstant.completeDeliveryIcon),
                      title: Text(
                        'Complete Delivery',
                        style: getRegularStyle(
                            fontSize: 14, color: ColorManager.green),
                      ),
                      subtitle: Text(
                        '3',
                        style: getSemiBoldStyle(
                            fontSize: 28, color: ColorManager.black800),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: ColorManager.black300,
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
