import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:iconoir_flutter/iconoir.dart';
import 'package:kookit_delivery/orders/presentation/widgets/order_item_widget.dart';
import 'package:kookit_delivery/resources/colors.dart';
import 'package:kookit_delivery/resources/constants.dart';
import 'package:kookit_delivery/resources/styles.dart';

import '../../../resources/widgets/kpbutton.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({Key? key}) : super(key: key);

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  var isListLoading = false;
  var items = ['asa','asdad','asdada'];

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
                child: InkWell(
                  child: Icon(FeatherIcons.arrowLeft,color: ColorManager.primary500,),
                )),
          ),
          centerTitle: false,
          titleSpacing: 0,
          title: Text('In Progress', style:getRegularStyle(fontSize: 18, color: ColorManager.black700)),
          backgroundColor: Colors.white,
        ),
        body: (isListLoading == true)
            ?  Center(
            child: CircularProgressIndicator(
              color: ColorManager.primary500,
            ))
            : (items.isEmpty)
            ? const Center(
          child: Text("No data found"),
        )
            : RefreshIndicator(
          onRefresh: () async {

          },
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
                  onTap: () {

                  },
                  child: OrderItem(items[index]),
                );
              },
              itemCount: items.length,
              scrollDirection: Axis.vertical,
            ),
          ),
        ));
  }
}

