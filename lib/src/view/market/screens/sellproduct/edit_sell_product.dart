import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/widget/textfield_widget.dart';

import '../../../../../global_providers.dart';
import '../../../../constants/colors.dart';
import '../../../../model/market/edit_my_product_model.dart';
import '../../../../model/market/get_bazar_product_model.dart';
import '../../../../util/text_validation/text_validation.dart';
import '../../../widget/dialogs/fail_dialog.dart';
import '../../../widget/dialogs/loading_dialog.dart';
import '../../../widget/dialogs/success_dialog.dart';

@RoutePage()
class EditSellingItemPage extends ConsumerStatefulWidget {
  const EditSellingItemPage({
    Key? key,
    required this.getBazarProductModel,
  }) : super(key: key);
  final GetBazarProductModel getBazarProductModel;

  @override
  _EditSellingItemPageState createState() => _EditSellingItemPageState();
}

class _EditSellingItemPageState extends ConsumerState<EditSellingItemPage> {
  final _formKey = GlobalKey<FormState>();

  List<String> valueListRelatedCrops = ['kg', 'g', 'mg'];
  List<String> valueListRelatedLifeStocks = ['unit'];
  String? selectedValRelatedCrops = 'kg';
  String? selectedValRelatedLifeStocks = 'unit';
  bool readOnly = false;

  final TextEditingController _categoryTextEditingController =
      TextEditingController();
  final TextEditingController _subCategoryTextEditingController =
      TextEditingController();
  final TextEditingController _varietyTextEditingController =
      TextEditingController();
  final TextEditingController _brandTextEditingController =
      TextEditingController();
  final TextEditingController _avalQuantTextEditingController =
      TextEditingController();
  final TextEditingController _amountTextEditingController =
      TextEditingController();
  final TextEditingController _descriptrionTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.getBazarProductModel.status == 'Approved') {
      readOnly = true;
    } else {
      readOnly = false;
    }
    _categoryTextEditingController.text = widget.getBazarProductModel.category;
    _descriptrionTextEditingController.text =
        widget.getBazarProductModel.description ?? '';
    _subCategoryTextEditingController.text =
        widget.getBazarProductModel.subCategory;
    _brandTextEditingController.text = widget.getBazarProductModel.brand;
    _amountTextEditingController.text =
        widget.getBazarProductModel.price.toString();
    _avalQuantTextEditingController.text =
        widget.getBazarProductModel.quantity.toString();
    // _varietyTextEditingController.text=widget.getBazarProductModel.

    // selectedValRelatedCrops=widget.getBazarProductModel.;
    // _avalQuantTextEditingController.text=widget.getBazarProductModel.;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final EditMyProductModel editMyProductModel =
                    EditMyProductModel(
                        userId: UserPreferences.userId,
                        productId: widget.getBazarProductModel.id,
                        quantity: _avalQuantTextEditingController.text,
                        price: _amountTextEditingController.text,
                        subCategory: _subCategoryTextEditingController.text,
                        variety: _varietyTextEditingController.text,
                        brand: _brandTextEditingController.text,
                        description: _descriptrionTextEditingController.text);

                editProductPost(ref, editMyProductModel: editMyProductModel);
                // sellProductPost(ref,
                //     sellItemTextFieldModel:
                //     widget.sellItemTextFieldModel!,
                //     wtsUpMobileNo:
                //     addressList[selectedIndex].wtsUpMobileNo,
                //     lati: addressList[selectedIndex].latitude,
                //     longi: addressList[selectedIndex].longitude,
                //     pickedImages: widget.pickedImages);

                // context.router.push(SelectAddressRoute(
                //     sellItemTextFieldModel: sellItemTextField,
                //     pickedImages: _pickedImages,
                //     fromSellPage: true));
              },
              icon: const Icon(
                Icons.check,
                color: primary,
                size: 25,
              )),
          8.horizontalSpace,
        ],
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        title: Text(
          "Edit Selling Product",
          style: TextStyle(
            fontSize: 20.sp,
            color: primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: pagePadding,
            child: Column(
              children: [
                10.verticalSpace,
                if (widget.getBazarProductModel.status == "Rejected")
                  Column(
                    children: [
                      20.verticalSpace,
                      Container(
                        height: 70.h,
                        width: 335.w,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xffE81E43).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.warning,
                              color: Color(0xffEE264A),
                            ),
                            Container(
                                child: Text(
                              'Reason: ${widget.getBazarProductModel.rejReason!}',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xffE81E43),
                                  fontWeight: FontWeight.w500),
                            ))
                          ],
                        ),
                      ),
                    ],
                  ),
                10.verticalSpace,
                if (widget.getBazarProductModel.status != 'Approved')
                  Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add Details",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                color: Color(0xff563E1F),
                                fontSize: 15),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      AppTextField(
                        readOnly: true,
                        textController: _categoryTextEditingController,
                        validator: (value) =>
                            Validate.minLength(value: value!, minLen: 2),
                        onTap: () {},
                        hintText: 'Category',
                        onChanged: (val) {},
                      ),
                      15.verticalSpace,
                      AppTextField(
                        readOnly: readOnly,
                        textController: _subCategoryTextEditingController,
                        validator: (value) =>
                            Validate.minLength(value: value!, minLen: 2),
                        onTap: () {},
                        hintText: 'Sub Category',
                        onChanged: (val) {},
                      ),
                      15.verticalSpace,
                      AppTextField(
                        readOnly: readOnly,
                        textController: _varietyTextEditingController,
                        validator: (value) =>
                            Validate.minLength(value: value!, minLen: 2),
                        onTap: () {},
                        hintText: 'Variety',
                        onChanged: (val) {},
                      ),
                      15.verticalSpace,
                      AppTextField(
                        readOnly: readOnly,
                        textController: _brandTextEditingController,
                        validator: (value) =>
                            Validate.minLength(value: value!, minLen: 2),
                        onTap: () {},
                        hintText: 'Brand',
                        onChanged: (val) {},
                      ),
                      15.verticalSpace,
                    ],
                  ),
                AppTextField(
                  textController: _avalQuantTextEditingController,
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      Validate.minLength(value: value!, minLen: 1),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onTap: () {},
                  hintText: 'Available Quantity',
                  onChanged: (val) {},
                  suffixIcon:
                      widget.getBazarProductModel.category == 'Equipments' ||
                              widget.getBazarProductModel.category == 'Animals'
                          ? DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                iconEnabledColor: primary,
                                icon: const Icon(
                                  Icons.expand_more,
                                  color: primary,
                                  size: 30,
                                ),
                                value: selectedValRelatedLifeStocks,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedValRelatedLifeStocks = newValue;
                                  });
                                },
                                items: valueListRelatedLifeStocks.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                          color: Color(0xff563E1F),
                                          fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )
                          : DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                iconEnabledColor: primary,
                                icon: const Icon(
                                  Icons.expand_more,
                                  color: primary,
                                  size: 30,
                                ),
                                value: selectedValRelatedCrops,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedValRelatedCrops = newValue;
                                  });
                                },
                                items: valueListRelatedCrops.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                          color: Color(0xff563E1F),
                                          fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                ),
                15.verticalSpace,
                AppTextField(
                  validator: (value) =>
                      Validate.minLength(value: value!, minLen: 1),
                  textController: _amountTextEditingController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onTap: () {},
                  hintText: 'Enter amount in rupees',
                  onChanged: (val) {},
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: widget.getBazarProductModel.category ==
                                'Equipments' ||
                            widget.getBazarProductModel.category == 'Animals'
                        ? Text(
                            '/$selectedValRelatedLifeStocks',
                            style: const TextStyle(
                                color: Color(0xff563E1F), fontSize: 14),
                          )
                        : Text(
                            '/$selectedValRelatedCrops',
                            style: const TextStyle(
                                color: Color(0xff563E1F), fontSize: 14),
                          ),
                  ),
                ),
                15.verticalSpace,
                if (widget.getBazarProductModel.status != 'Approved')
                  Column(
                    children: [
                      AppTextField(
                        readOnly: readOnly,
                        maxlines: 5,
                        textController: _descriptrionTextEditingController,
                        onTap: () {},
                        hintText: 'Description',
                        onChanged: (val) {},
                      ),
                      15.verticalSpace,
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> editProductPost(
    WidgetRef ref, {
    required EditMyProductModel editMyProductModel,
  }) async {
    showLoading(context);
    try {
      await ref
          .read(sellPostProvider)
          .editMyProduct(editMyProductModel: editMyProductModel);
      Navigator.pop(context);

      successDialog(context, onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
      }, message: 'Product Edited Successfully');
    } catch (e) {
      Navigator.pop(context);
      failDialog(context);
    }
  }
}
