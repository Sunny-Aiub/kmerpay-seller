import 'package:flutter/material.dart';
import 'package:kmerpay_seller/resources/colors.dart';
import 'package:kmerpay_seller/resources/styles.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../resources/constants.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
class QRScreen extends StatefulWidget {
  final String amount;
  final String counterName;
  const QRScreen({Key? key, required this.counterName, required this.amount}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {


  @override
  Widget build(BuildContext context) {

    Map params = {
      "name": widget.counterName,
      'amount': widget.amount
    };

    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.lightWhite,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
            onTap: ()=> Navigator.pop(context),
            child: Icon(PhosphorIcons.arrow_left,color: ColorManager.primaryBlack)),
        backgroundColor: ColorManager.lightWhite,
        title: Text(
          'QR Code',
          style:
              getSemiBoldStyle(fontSize: 20, color: ColorManager.primaryBlack),
        ),
        // leading: InkWell(
        //   onTap: ()=> Navigator.pop(context),
        //     child: Icon(PhosphorIcons.arrow_left,color: ColorManager.primaryBlack)),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        sizeVer(40),
                        Text(
                            'Share this code with your customer to receive payment',
                            style: getMediumStyle(
                                fontSize: 18, color: ColorManager.bluishGrey)),
                        sizeVer(24),
                        SizedBox(
                          width: 360,height: 360,
                          child: QrImage(
                            data: params.toString(),
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                        ),
                      ]),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
