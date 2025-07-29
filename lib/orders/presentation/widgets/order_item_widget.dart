import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kookit_delivery/resources/colors.dart';
import 'package:kookit_delivery/resources/constants.dart';
import 'package:kookit_delivery/resources/styles.dart';
import 'package:kookit_delivery/resources/widgets/kpbutton.dart';

class OrderItem extends StatelessWidget{

  const OrderItem(String item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration:  BoxDecoration(
              color: ColorManager.primaryWhite,
              border: Border.all(color: ColorManager.gray200),
              borderRadius: BorderRadius.all(Radius.circular(4))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order #2345',style: getBoldStyle(fontSize: 14, color: ColorManager.primary600),),
                    Text('12 Sun, 2022',style: getRegularStyle(fontSize: 10, color: ColorManager.gray800),),
                  ],
                ),
              ),
              sizeVer(12),
              horizontalDivider( padding: EdgeInsets.zero, width: Get.width,color: ColorManager.gray200),
              // sizeVer(12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(PhosphorIcons.shopping_bag,color: ColorManager.primary600,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('Kilo Biryani, Nikunja Branch',style: getRegularStyle(fontSize: 10, color: ColorManager.gray600),),
                    ),               ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 24.0,bottom: 8),
                child: SvgPicture.asset(AssetConstant.dividerIcon),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(PhosphorIcons.clock,color: ColorManager.primary600,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('2972 Westchester Rd. Santa Ana, Illinois 85486 ',style: getRegularStyle(fontSize: 10, color: ColorManager.gray600),),
                    ),               ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(PhosphorIcons.map_pin,color: ColorManager.gray600,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('35 Minutes Remaining',style: getRegularStyle(fontSize: 10, color: ColorManager.gray600),),
                    ),               ],
                ),
              ),
              sizeVer(10),
              CustomButton(
                buttonTitle: 'Accept',
                onPressed: () {

                },
              ),


            ],
          )
      ),
    );
  }
}
