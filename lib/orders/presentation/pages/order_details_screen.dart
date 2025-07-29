import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:kookit_delivery/resources/colors.dart';
import 'package:kookit_delivery/resources/constants.dart';
import 'package:kookit_delivery/resources/styles.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 0.0,
                bottom: 20.0,
                right: 0.0,
              ),
              child: InkWell(
                onTap: () => Get.back(),
                child: Icon(FeatherIcons.arrowLeft,color: ColorManager.primary500,),
              )),
          centerTitle: false,
          titleSpacing: 0,
          title: Text('Order Details', style:getRegularStyle(fontSize: 18, color: ColorManager.black700)),
          backgroundColor: Colors.white,
        ),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AssetConstant.detailsBackground),fit: BoxFit.contain)
              ),
              child: Column(
                children: [
                  Text("Order #2345", style: getRegularStyle(fontSize: 16, color: ColorManager.gray50),),
                  Text("Delivery Pending", style: getSemiBoldStyle(fontSize: 20, color: ColorManager.primaryWhite),)
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
