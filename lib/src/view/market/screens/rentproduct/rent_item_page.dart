import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/market/screens/sellproduct/widget.dart';
import 'package:kisaan_station/src/view/widget/textfield_widget.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

import '../../../../constants/colors.dart';
import '../../../../model/market/rent_item_textField_model.dart';
import '../../../../util/image_picker/image_picker.dart';
import '../../../../util/text_validation/text_validation.dart';

@RoutePage()
class RentItemPage extends ConsumerStatefulWidget {
  const RentItemPage({
    Key? key,
    required this.categoryText,
  }) : super(key: key);
  final String categoryText;

  @override
  _RentItemState createState() => _RentItemState();
}

class _RentItemState extends ConsumerState<RentItemPage> {
  final _formKey = GlobalKey<FormState>();

  List<String> valueList = ['Rupee'];
  String? selectedVal = 'Rupee';

  final List<File> _pickedImages = [];

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

  Future<void> chooseImage({required bool isCamera}) async {
    File? pickedFile;
    if (isCamera) {
      pickedFile = await ref.read(mediaProvider).captureMedia();
    } else {
      pickedFile = await ref.read(mediaProvider).pickImage();
    }
    if (pickedFile != null) {
      _pickedImages.add(pickedFile);
      setState(() {});
    }
  }

  Future<void> chooseMultiImage({required int imageCount}) async {
    final pickedFile = await ref
        .read(mediaProvider)
        .pickMultiImage(count: imageCount, context: context);

    if (pickedFile.isNotEmpty) {
      _pickedImages.addAll(pickedFile);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    _categoryTextEditingController.text = widget.categoryText;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final RentItemTextFieldModel rentItemTextFieldModel =
                    RentItemTextFieldModel(
                        userId: UserPreferences.userId,
                        category: _categoryTextEditingController.text,
                        price: _rentPriceTextEditingController.text,
                        brand: _brandTextEditingController.text,
                        subCategory: _subCategoryTextEditingController.text,
                        description: _descriptrionTextEditingController.text);
                if (_formKey.currentState!.validate()) {
                  context.router.push(SelectAddressRoute(
                      rentItemTextFieldModel: rentItemTextFieldModel,
                      pickedImages: _pickedImages,
                      fromSellPage: false));
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
                AppTextField(
                  maxlines: 5,
                  textController: _descriptrionTextEditingController,
                  onTap: () {},
                  hintText: 'Description',
                  onChanged: (val) {},
                ),
                15.verticalSpace,
                Row(
                  children: [
                    InkWell(
                      onTap: _pickedImages.length == 4
                          ? null
                          : () async {
                              final isCamera = await ref
                                  .read(mediaProvider)
                                  .chooseSource(context);
                              if (isCamera != null) {
                                if (isCamera) {
                                  chooseImage(isCamera: isCamera);
                                  setState(() {});
                                } else {
                                  final length = 4 - _pickedImages.length;
                                  chooseMultiImage(imageCount: length);
                                  setState(() {});
                                }
                              }
                            },
                      child: Container(
                        height: 55.h,
                        width: 180.w,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: _pickedImages.length == 4
                              ? const Color(0XFFF4F4F4)
                              : const Color(0xffFFF0DB),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.image_outlined,
                              color: _pickedImages.length == 4
                                  ? Colors.black54
                                  : const Color(0xffFAA326),
                            ),
                            15.horizontalSpace,
                            Text(
                              "Add Image",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  color: _pickedImages.length == 4
                                      ? Colors.black54
                                      : const Color(0xffFAA326)),
                            ),
                            5.horizontalSpace,
                            Text(
                              '(${_pickedImages.length}/4)',
                              style: TextStyle(
                                  color: _pickedImages.length == 4
                                      ? Colors.black54
                                      : const Color(0xffFAA326),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (_pickedImages.isNotEmpty)
                  ReorderableGridView.extent(
                    shrinkWrap: true,
                    maxCrossAxisExtent: 100,
                    onReorder: (old, newi) {
                      setState(() {
                        final _reorderedImage = _pickedImages.removeAt(old);
                        _pickedImages.insert(newi, _reorderedImage);
                      });
                    },
                    children: _pickedImages.map((item) {
                      return SizedBox(
                        key: ValueKey(item),
                        child: Center(
                          child: ImageView(
                            ontap: () {
                              _pickedImages.remove(item);
                              setState(() {});
                            },
                            image: item,
                          ),
                        ),
                      );
                    }).toList(),
                  )
                else
                  const SizedBox(),
                30.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
