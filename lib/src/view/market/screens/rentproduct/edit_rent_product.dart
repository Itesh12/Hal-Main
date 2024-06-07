
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
class EditRentPage extends ConsumerStatefulWidget {
  const EditRentPage(this.getBazarProductModel, {
    Key? key,
  }) : super(key: key);
  final GetBazarProductModel getBazarProductModel;


  @override
  _EditRentState createState() => _EditRentState();
}

class _EditRentState extends ConsumerState<EditRentPage> {
  final _formKey = GlobalKey<FormState>();

  List<String> valueList = ['Rupee'];
  String? selectedVal = 'Rupee';

  final TextEditingController _categoryTextEditingController =
      TextEditingController();
  final TextEditingController _subCategoryTextEditingController =
      TextEditingController();
  final TextEditingController _brandTextEditingController =
      TextEditingController();
  final TextEditingController _rentPriceTextEditingController =
      TextEditingController();
  final TextEditingController _descriptrionTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    _categoryTextEditingController.text = widget.getBazarProductModel.category;
    _subCategoryTextEditingController.text = widget.getBazarProductModel.subCategory;
    _brandTextEditingController.text=widget.getBazarProductModel.brand;
    _rentPriceTextEditingController.text=widget.getBazarProductModel.price.toString();
    _descriptrionTextEditingController.text=widget.getBazarProductModel.description??'';
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final EditMyProductModel editMyProductModel =
                EditMyProductModel(
                        userId: UserPreferences.userId,
                        productId: widget.getBazarProductModel.id,
                        category: _categoryTextEditingController.text,
                        price: _rentPriceTextEditingController.text,
                        brand: _brandTextEditingController.text,
                        subCategory: _subCategoryTextEditingController.text,
                        description: _descriptrionTextEditingController.text);
                if (_formKey.currentState!.validate()) {
                  editProductPost(ref, editMyProductModel: editMyProductModel);
                }
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
          "Renting Transport",
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  Column(children: [
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
                      textController: _subCategoryTextEditingController,
                      validator: (value) =>
                          Validate.minLength(value: value!, minLen: 2),
                      onTap: () {},
                      hintText: 'Sub Category',
                      onChanged: (val) {},
                    ),
                    15.verticalSpace,
                    AppTextField(
                      textController: _brandTextEditingController,
                      validator: (value) =>
                          Validate.minLength(value: value!, minLen: 2),
                      onTap: () {},
                      hintText: 'Brand',
                      onChanged: (val) {},
                    ),
                    15.verticalSpace,
                  ],),

                AppTextField(
                  textController: _rentPriceTextEditingController,
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      Validate.minLength(value: value!, minLen: 1),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onTap: () {},
                  hintText: 'Enter Rent Price',
                  onChanged: (val) {},
                  suffixIcon: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconEnabledColor: primary,
                      icon: const Icon(
                        Icons.expand_more,
                        color: primary,
                        size: 30,
                      ),
                      value: selectedVal,
                      onChanged: (newValue) {
                        setState(() {
                          selectedVal = newValue;
                        });
                      },
                      items: valueList.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                                color: Color(0xff563E1F), fontSize: 14),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                15.verticalSpace,
                if (widget.getBazarProductModel.status != 'Approved')
                  AppTextField(
                  maxlines: 5,
                  textController: _descriptrionTextEditingController,
                  onTap: () {},
                  hintText: 'Description',
                  onChanged: (val) {},
                ),
                15.verticalSpace,
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
