import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:iconoir_flutter/iconoir.dart';
import 'package:kookit_delivery/orders/presentation/pages/order_details_screen.dart';
import 'package:kookit_delivery/resources/colors.dart';
import 'package:kookit_delivery/resources/constants.dart';
import 'package:kookit_delivery/resources/styles.dart';

import '../../../resources/widgets/kpbutton.dart';

class PendingRequestsScreen extends StatefulWidget {
  const PendingRequestsScreen({Key? key}) : super(key: key);

  @override
  State<PendingRequestsScreen> createState() => _PendingRequestsScreenState();
}

class _PendingRequestsScreenState extends State<PendingRequestsScreen> {
  var isListLoading = false;
  var items = ['asa', 'asdad', 'asdada'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ),
            ),
          ),
          centerTitle: false,
          titleSpacing: 0,
          title: Text('Pending Orders',
              style:
                  getRegularStyle(fontSize: 18, color: ColorManager.black700)),
          backgroundColor: Colors.white,
        ),
        body: (isListLoading == true)
            ? Center(
                child: CircularProgressIndicator(
                color: ColorManager.primary500,
              ))
            : (items.isEmpty)
                ? const Center(
                    child: Text("No data found"),
                  )
                : RefreshIndicator(
                    onRefresh: () async {},
                    child: NotificationListener(
                      onNotification: (ScrollNotification scrollInfo) {
                        // if (scrollInfo.metrics.pixels ==
                        //     scrollInfo.metrics.maxScrollExtent) {
                        //   // if (!isMoreOrderLoading &&
                        //   //     (dataCounter > items.length)) {
                        //   //   // start loading data
                        //   //   print("Scrolling to end...");
                        //   //   setState(() {
                        //   //     isMoreOrderLoading = true;
                        //   //     pageNo = pageNo + 1;
                        //   //     currentUrl = Urls.baseUrl +
                        //   //         "/delivery/requests?page=$pageNo";
                        //   //   });
                        //   //   _loadMoreData();
                        //   } else {}
                        // }
                        return true;
                      },
                      child: ListView.builder(
                        itemBuilder: (BuildContext buildContext, index) {
                          return InkWell(
                            onTap: () {},
                            child: DeliveryRequestItem(items[index]),
                          );
                        },
                        itemCount: items.length,
                        scrollDirection: Axis.vertical,
                      ),
                    ),
                  ));
  }
}

class DeliveryRequestItem extends StatelessWidget {
  const DeliveryRequestItem(String item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
              color: ColorManager.primaryWhite,
              border: Border.all(color: ColorManager.gray200),
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order #2345',
                      style: getBoldStyle(
                          fontSize: 14, color: ColorManager.primary600),
                    ),
                    Text(
                      '12 Sun, 2022',
                      style: getRegularStyle(
                          fontSize: 10, color: ColorManager.gray800),
                    ),
                  ],
                ),
              ),
              sizeVer(12),
              horizontalDivider(
                  padding: EdgeInsets.zero,
                  width: Get.width,
                  color: ColorManager.gray200),
              // sizeVer(12),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      PhosphorIcons.shopping_bag,
                      color: ColorManager.primary600,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Kilo Biryani, Nikunja Branch',
                        style: getRegularStyle(
                            fontSize: 10, color: ColorManager.gray600),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 24.0, bottom: 8),
                child: SvgPicture.asset(AssetConstant.dividerIcon),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      PhosphorIcons.clock,
                      color: ColorManager.primary600,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '2972 Westchester Rd. Santa Ana, Illinois 85486 ',
                        style: getRegularStyle(
                            fontSize: 10, color: ColorManager.gray600),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      PhosphorIcons.map_pin,
                      color: ColorManager.gray600,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '35 Minutes Remaining',
                        style: getRegularStyle(
                            fontSize: 10, color: ColorManager.gray600),
                      ),
                    ),
                  ],
                ),
              ),
              sizeVer(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // CustomButton(
                  //   buttonTitle: 'Pick Now',width: Get.width/2.5,height: 35,
                  //   onPressed: () {
                  //
                  //   },
                  // ),
                  Container(
                    width: Get.width / 2.5,
                    height: 35,
                    decoration: BoxDecoration(
                      color: ColorManager.primary500,
                      borderRadius: const BorderRadius.all(Radius.circular(1)),
                      // border: border,
                    ),
                    child: Center(
                      child: Text(
                        'Pick Now',
                        textAlign: TextAlign.center,
                        style: getBoldStyle(
                            color: ColorManager.primaryWhite, fontSize: 14),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(const OrderDetailsScreen()),
                    child: Container(
                      width: Get.width / 2.5,
                      height: 35,
                      decoration: BoxDecoration(
                        color: ColorManager.primary500,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(1)),
                        // border: border,
                      ),
                      child: Center(
                          child: Text(
                        'See Details',
                        textAlign: TextAlign.center,
                        style: getBoldStyle(
                            color: ColorManager.primaryWhite, fontSize: 14),
                      )),
                    ),
                  )
                  // CustomButton(
                  //   buttonTitle: 'See Details',width: Get.width/2.5,height: 35,
                  //   onPressed: () {
                  //
                  //   },
                  // ),
                ],
              ),
              sizeVer(10),
            ],
          )),
    );
  }
}
