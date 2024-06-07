import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/model/market/user_address_model.dart';

import '../../../global_providers.dart';
import '../../constants/colors.dart';
import '../../controller/market/provider/address_controller.dart';
import '../../model/market/bazar_sell_post_model.dart';
import '../../model/market/rent_item_textField_model.dart';
import '../../model/market/sell_item_textField_model.dart';
import '../../util/services/shared_preferences.dart';
import '../widget/dialogs/fail_dialog.dart';
import '../widget/dialogs/loading_dialog.dart';
import '../widget/dialogs/success_dialog.dart';

@RoutePage()
class SelectAddressPage extends StatefulWidget {
  const SelectAddressPage(
      {Key? key,
      this.sellItemTextFieldModel,
      this.rentItemTextFieldModel,
      required this.pickedImages,
      required this.fromSellPage})
      : super(key: key);
  final SellItemTextFieldModel? sellItemTextFieldModel;
  final RentItemTextFieldModel? rentItemTextFieldModel;
  final List<File> pickedImages;
  final bool fromSellPage;

  @override
  State<SelectAddressPage> createState() => _SelectAddressPageState();
}

class _SelectAddressPageState extends State<SelectAddressPage> {
  int selectedIndex = 0;

  List<Address> addressList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
              )),
          centerTitle: false,
          title: Text(
            "Select Address",
            style: TextStyle(
              fontSize: 20.sp,
              color: primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Padding(
          padding: pagePadding,
          child: SingleChildScrollView(
            child: Consumer(builder: (context, ref, child) {
              addressList = ref.watch(bazarAddressProvider);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        context.router.push(MapRoute()).then((value) async {
                          await ref
                              .read(bazarAddressProvider.notifier)
                              .refresh();

                          // setState(() {});
                        });
                      },
                      child: const Text(
                        'Add new Address',
                        style: TextStyle(
                            color: primary, fontWeight: FontWeight.w500),
                      )),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: addressList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        debugPrint(addressList[index].toString());
                        return AddressTile(
                          address: addressList[index],
                          selectedIndex: selectedIndex,
                          currentIndex: index,
                          onTap: () {
                            selectedIndex = index;
                            setState(() {});
                          },
                        );
                      }),
                  Consumer(builder: (context, ref, child) {
                    return ElevatedButton(
                      onPressed: widget.fromSellPage
                          ? () {
                              sellProductPost(ref,
                                  sellItemTextFieldModel:
                                      widget.sellItemTextFieldModel!,
                                  wtsUpMobileNo:
                                      addressList[selectedIndex].wtsUpMobileNo,
                                  lati: addressList[selectedIndex].latitude,
                                  longi: addressList[selectedIndex].longitude,
                                  pickedImages: widget.pickedImages);
                            }
                          : () {
                              rentProductPost(ref,
                                  rentItemTextFieldModel:
                                      widget.rentItemTextFieldModel!,
                                  wtsUpMobileNo:
                                      addressList[selectedIndex].wtsUpMobileNo,
                                  pickedImages: widget.pickedImages);
                            },
                      child: const Text('Add to Sell'),
                    );
                  }),
                  40.verticalSpace,
                ],
              );
            }),
          ),
        ));
  }

  Future<void> sellProductPost(WidgetRef ref,
      {required SellItemTextFieldModel sellItemTextFieldModel,
      required double lati,
      required double longi,
      String? wtsUpMobileNo,
      List<File>? pickedImages}) async {
    showLoading(context);

    final BazarSellPostModel bazarSellPost = BazarSellPostModel(
        userId: UserPreferences.userId,
        category: sellItemTextFieldModel.category,
        subCategory: sellItemTextFieldModel.subCategory,
        variety: sellItemTextFieldModel.variety,
        brand: sellItemTextFieldModel.brand,
        description: sellItemTextFieldModel.description,
        price: sellItemTextFieldModel.price,
        wtsUpMobileNo: wtsUpMobileNo,
        quantity: sellItemTextFieldModel.quantity,
        Qty_unit: sellItemTextFieldModel.Qty_unit,
        latitude: lati,
        longitude: longi,
        trading: 'sell');
    try {
      await ref.read(sellPostProvider).sellRentProductFormSubmit(
          sellRentPost: bazarSellPost, images: pickedImages);
      Navigator.pop(context);
      successDialog(context, onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } catch (e) {
      Navigator.pop(context);
      failDialog(context);
    }
  }

  Future<void> rentProductPost(WidgetRef ref,
      {required RentItemTextFieldModel rentItemTextFieldModel,
      String? wtsUpMobileNo,
      List<File>? pickedImages}) async {
    showLoading(context);
    double lat;
    double long;

    lat = addressList[selectedIndex].latitude;
    long = addressList[selectedIndex].longitude;

    final BazarSellPostModel bazarRentPost = BazarSellPostModel(
        userId: UserPreferences.userId,
        category: rentItemTextFieldModel.category,
        subCategory: rentItemTextFieldModel.subCategory,
        brand: rentItemTextFieldModel.brand,
        wtsUpMobileNo: wtsUpMobileNo,
        description: rentItemTextFieldModel.description,
        price: rentItemTextFieldModel.price,
        latitude: lat,
        longitude: long,
        trading: 'rent');
    try {
      await ref.read(sellPostProvider).sellRentProductFormSubmit(
          sellRentPost: bazarRentPost, images: pickedImages);
      Navigator.pop(context);
      successDialog(context, onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } catch (e) {
      Navigator.pop(context);
      failDialog(context);
      debugPrint(bazarRentPost.toString());
    }
  }
}

class AddressTile extends StatefulWidget {
  const AddressTile(
      {Key? key,
      required this.address,
      required this.onTap,
      required this.selectedIndex,
      required this.currentIndex})
      : super(key: key);

  final Address address;
  final VoidCallback onTap;
  final int selectedIndex;
  final int currentIndex;

  @override
  State<AddressTile> createState() => _AddressTileState();
}

class _AddressTileState extends State<AddressTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Color(0xffFFFCF6),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      widget.address.locationType,
                      style: const TextStyle(
                          color: Color(0xff563E1F),
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: primary,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: 250.w,
                        child: Text(
                          '${widget.address.area} ${widget.address.district} ${widget.address.state} ${widget.address.pinCode}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Color(0xffCE9141),
                              fontSize: 10,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  if (widget.address.wtsUpMobileNo != null)
                    Row(
                      children: [
                        10.verticalSpace,
                        Image.asset(
                          'assets/images/WhatsApp.png',
                          height: 18.h,
                          width: 18.h,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.address.wtsUpMobileNo!,
                          style: const TextStyle(
                              color: Color(0xffCE9141),
                              fontSize: 10,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                ],
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: widget.onTap,
            child: Container(
              margin: const EdgeInsets.all(3),
              width: 15.w,
              height: 15.h,
              decoration: BoxDecoration(
                color: widget.selectedIndex == widget.currentIndex
                    ? primary
                    : const Color(0xffC6C6C6),
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
