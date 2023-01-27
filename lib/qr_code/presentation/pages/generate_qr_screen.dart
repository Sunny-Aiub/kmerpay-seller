import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kmerpay_seller/qr_code/presentation/pages/qr_screen.dart';

import '../../../auth/presentation/widgets/search_field_widget.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../../../resources/widgets/kpbutton.dart';
import '../../../splash/presentation/pages/on_bording_screen.dart';


class GenerateQRScreen extends StatefulWidget {
  const GenerateQRScreen({Key? key}) : super(key: key);

  @override
  State<GenerateQRScreen> createState() => _GenerateQRScreenState();
}

class _GenerateQRScreenState extends State<GenerateQRScreen> {
  bool isAlertOn = true;
  bool isDarkModeOn = false;

  List<String> items = ["Counter 1","Counter 11","Counter 2","Counter 3","Counter 4"];

  String? selectedValue;

  TextEditingController _amountController =  TextEditingController();

  FocusNode _amountControllerFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.lightWhite,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: ColorManager.lightWhite,
          title: Text(
            'Generate QR Code',
            style: getSemiBoldStyle(
                fontSize: 20, color: ColorManager.primaryBlack),
          ),
          // leading: InkWell(
          //   onTap: ()=> Navigator.pop(context),
          //     child: Icon(PhosphorIcons.arrow_left,color: ColorManager.primaryBlack)),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizeVer(40),


                      Text('Counter name',
                          style: getRegularStyle(
                              fontSize: 14,
                              color: ColorManager.bluishGrey)),

                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Select counter name',
                                    style: getRegularStyle(fontSize: 12, color: ColorManager.offWhite),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: items!
                                .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item.toString(),
                                style: getRegularStyle(fontSize: 14, color: ColorManager.primaryBlack),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                                // if (selectedValue != null && _currentPosition != null) {
                                //   // isOutletLoading = true;
                                //   getOutletData(selectedValue!.areaId!);
                                // }else{
                                //   // Utils.displayToast("Select an address");
                                // }
                              });
                            },
                            icon: const Icon(
                              PhosphorIcons.caret_down,
                            ),
                            iconSize: 14,
                            iconEnabledColor: ColorManager.primaryBlue,
                            iconDisabledColor: ColorManager.offWhite,
                            buttonHeight: 40,
                            // buttonWidth: 160,
                            buttonPadding: const EdgeInsets.only(left: 0, right: 14),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: ColorManager.offWhite,
                              ),
                              color: Colors.white,
                            ),
                            buttonElevation: 0,
                            itemHeight: 40,
                            itemPadding: const EdgeInsets.only(left: 16, right: 16),
                            dropdownMaxHeight: double.infinity,
                            // dropdownWidth: double.infinity,
                            dropdownPadding: const EdgeInsets.only(left: 16, right: 16),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              // color: Colors.redAccent,
                            ),
                            dropdownElevation: 8,
                            scrollbarRadius: const Radius.circular(40),
                            scrollbarThickness: 6,
                            scrollbarAlwaysShow: true,
                            offset: const Offset(0, 0),
                          ),
                        ),
                      ),

                      sizeVer(24),
                      Text('Enter amount',
                          style: getRegularStyle(
                              fontSize: 14,
                              color: ColorManager.bluishGrey)),
                      SearchWidget(
                        controller: _amountController,
                        focusNode: _amountControllerFocus,
                        keyboardType: TextInputType.number,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('CFA',style: getMediumStyle(fontSize: 18, color: ColorManager.bluishGrey),),
                        ),
                        border: Border.all(color: ColorManager.offWhite),
                        backgroundColor: Colors.white,
                        isEnabled: true,
                        hintText: 'amount',
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.blue)),
                      ),

                      sizeVer(24),


                    ],
                  ),
                ),
              ),

            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 40),
              child: CustomButton(buttonTitle: 'Generate',
                trailing: Icon(PhosphorIcons.arrow_right,
                  color: ColorManager.primaryWhite,),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => QRScreen(counterName: selectedValue ?? "none", amount:_amountController.text), //const LandingScreen(),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
