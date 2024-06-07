import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../global_providers.dart';
import '../../../constants/colors.dart';
import '../../../controller/disease_detection/disease_detection_controller.dart';
import '../../../controller/farm/area_validator.dart';
import '../../../util/text_validation/text_validation.dart';
import '../../widget/textfield_widget.dart';
import 'crop_field.dart';

final areaValidateProvider =
    ChangeNotifierProvider.autoDispose<AreaNotifier>((ref) {
  return AreaNotifier();
});

class CropObject extends ConsumerStatefulWidget {
  const CropObject({
    Key? key,
    required this.cropName,
    required this.cropArea,
    required this.cropUnit,
    required this.showingDate,
    required this.onTap,
    required this.cropDesc,
    this.validation = true
  }) : super(key: key);

  final TextEditingController cropName;
  final TextEditingController cropArea;
  final TextEditingController cropUnit;
  final TextEditingController cropDesc;
  final TextEditingController showingDate;
  final bool validation;
  final Function() onTap;

  @override
  ConsumerState<CropObject> createState() => _CropObjectState();
}

class _CropObjectState extends ConsumerState<CropObject> {
  String currentcropUnit = "acre";
  String? currentcropType;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  List<String> cropsTypes = [
    "Paddy",
    "Sugarcane",
    "Cotton",
    "Wheat",
    "Soybean",
    "Vegetables",
    "Horticulture"
  ];
  List<String> units = ["acre"];

  DateTime? showingDate;

  Future<void> openDatePicker() async {
    final DateTime today = DateTime.now();

    showingDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2022, 3),
      initialDate: today,
      lastDate: today,
    );
    if (showingDate != null) {
      widget.showingDate.text = showingDate.toString();
      _dateController.text = showingDate.toString();
      dateController.text = DateFormat.yMMMMd().format(showingDate!);
    }
    setState(() {});
  }

   bool loading = true;


  @override
  void initState() {
    super.initState();
    widget.cropUnit.text = currentcropUnit;
    _dateController.text = widget.showingDate.text;

    if (widget.showingDate.text != "") {
      dateController.text = DateFormat.yMMMMd()
          .format(DateTime.tryParse(widget.showingDate.text) ?? DateTime.now())
          .toString();
    } else {
      widget.showingDate.text = "";
    }
  }

  @override
  void dispose() {
    super.dispose();
    // widget.cropName.dispose();
    // widget.cropArea.dispose();
    // widget.cropUnit.dispose();
    // widget.cropDesc.dispose();
    // widget.showingDate.dispose();
    // _dateController.dispose();
  }

  List searchResult = [];
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xffF9F9F9),
      ),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: widget.onTap,
            child: Icon(
              Icons.close,
              color: Colors.grey[400],
            ),
          ),
          12.verticalSpace,
          Consumer(builder: (context, ref, child) {
            return AppTextField(
              fillColor: Colors.white,
              textController: widget.cropName,
              showBorder: false,
              hintText: 'Search crop name...',
              validator: (value) => Validate.empty(value!),
              keyboardType: TextInputType.streetAddress,
              onChanged: (value) async {
                searchResult = await ref
                    .read(diseaseSearchResultProvider)
                    .getResults(value);
                setState(() {});
              },
              onSubmit: (value) {
                searchResult = [];
                ref.read(selectedCropNameProvider.notifier).state = value;
                setState(() {});
              },
            );
          }),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffF1F2F3),
                borderRadius: BorderRadius.circular(5)),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 400),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: searchResult.length,
                itemBuilder: (context, index) {
                  final result = searchResult[index];
                  return ListTile(
                    onTap: () {
                      ref.read(selectedCropNameProvider.notifier).state =
                          result.english;
                      widget.cropName.text = result.english;
                      searchResult.clear();
                      setState(() {});
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    tileColor: const Color(0xffF1F2F3),
                    leading: const Icon(
                      Icons.grass,
                      color: primary,
                    ),
                    title: Text(
                      result.english,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 16,
                          color: primary,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis),
                    ),
                    trailing: Text(
                      result.hindi,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(),
                ),
              ),
            ),
          ),
          12.verticalSpace,
          CropTextField(
            textController: dateController,
            // hintText: AppLocalizations.of(context)!.enter_your_name,
            hintText: "Sowing date",
            readOnly: true,
            maxlines: 1,
            onTap: () async {
              await openDatePicker();
            },
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                Icons.calendar_month,
                color: Colors.grey[400],
              ),
            ),
            textCapitalization: TextCapitalization.words,
            validator: (value) => Validate.empty(value!),
          ),
          12.verticalSpace,
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Consumer(builder: (context, ref, child) {
                  return CropTextField(
                      textController: widget.cropArea,
                      // hintText: AppLocalizations.of(context)!.enter_your_name,
                      hintText: "Crop area",
                      maxlines: 1,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                      ],
                      onChanged: (val) {
                       if(widget.validation){
                         ref.read(areaValidateProvider).setCropAreas(
                             {widget.key!: double.tryParse(val) ?? 0.0});
                       }
                      },
                      validator: (value) => ref
                          .read(areaValidateProvider)
                          .validateCropAreaField(value!));
                }),
              ),
              8.horizontalSpace,
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: const Color(0xffF4F4F4),
                    ),
                    color: const Color(0xffF9F9F9),
                  ),
                  child: Text(
                    "acre",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 12.sp),
                  ),
                ),
              ),
            ],
          ),
          12.verticalSpace,
          CropTextField(
            textController: widget.cropDesc,
            // hintText: AppLocalizations.of(context)!.enter_your_name,
            hintText: "Crop Description",
            maxlines: 2,
            textCapitalization: TextCapitalization.words,
            validator: (value) => Validate.empty(value!),
          ),
        ],
      ),
    );
  }
}
