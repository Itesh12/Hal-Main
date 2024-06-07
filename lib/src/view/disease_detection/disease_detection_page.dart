import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/controller/disease_detection/disease_detection_controller.dart';
import 'package:kisaan_station/src/util/custom_image_grid.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/util/text_validation/text_validation.dart';
import 'package:kisaan_station/src/view/widget/dialogs/fail_dialog.dart';
import 'package:kisaan_station/src/view/widget/dialogs/loading_dialog.dart';
import 'package:kisaan_station/src/view/widget/dialogs/success_dialog.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

import '../../app/router/router.gr.dart';
import '../../constants/colors.dart';
import '../../controller/farm/farm_list_controller.dart';
import '../../model/disease_detection/diease_detection_model.dart';
import '../widget/textfield_widget.dart';

@RoutePage()
class DiseaseDetectionPage extends ConsumerStatefulWidget {
  const DiseaseDetectionPage({super.key});

  @override
  ConsumerState<DiseaseDetectionPage> createState() =>
      _DiseaseDetectionPageState();
}

class _DiseaseDetectionPageState extends ConsumerState<DiseaseDetectionPage> {
  @override
  void initState() {
    ref.read(showFormFlagProvider.notifier).state = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool showForm = ref.watch(showFormFlagProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
              )),
          // centerTitle: false,
          title: Text(
            'Crop Intelligence',
            style: TextStyle(color: primary, fontSize: 20.sp),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            ref.read(showFormFlagProvider.notifier).state = true;
          },
        ),
        body: showForm ? const DiseaseForm() : const DiseaseCropDisplay());
  }
}

class DiseaseForm extends ConsumerStatefulWidget {
  const DiseaseForm({super.key});

  @override
  ConsumerState<DiseaseForm> createState() => _DiseaseFormState();
}

class _DiseaseFormState extends ConsumerState<DiseaseForm> {
  String selectedCropType = "";
  List category = [];

  List<SearchResults> searchResult = [];
  final TextEditingController cropNameController = TextEditingController();
  final TextEditingController diseaseNameController = TextEditingController();
  final TextEditingController _locationTextEditingController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const Text('Add Crop Details for analysis',
                      style: TextStyle(
                          fontSize: 16,
                          color: primary,
                          fontWeight: FontWeight.w600)),
                  10.verticalSpace,
                  const Text('Crop Name',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff563e1f),
                          fontWeight: FontWeight.w600)),
                  10.verticalSpace,
                  AppTextField(
                    textController: cropNameController,
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
                  ),
                  5.verticalSpace,
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
                              ref
                                  .read(selectedCropNameProvider.notifier)
                                  .state = result.english;
                              cropNameController.text = result.english;
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
                  10.verticalSpace,
                  const Text('Disease Name (Optional)',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff563e1f),
                          fontWeight: FontWeight.w600)),
                  10.verticalSpace,
                  AppTextField(
                    textController: diseaseNameController,
                    showBorder: false,
                    hintText: 'Enter disease name',
                    keyboardType: TextInputType.streetAddress,
                  ),
                  20.verticalSpace,
                  const Text('Select Farm',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff563e1f),
                          fontWeight: FontWeight.w600)),
                  10.verticalSpace,
                  Consumer(builder: (context, ref, child) {
                    return AppTextField(
                      hintText: "Select Farm",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Location is required';
                        } else {
                          return null;
                        }
                      },
                      readOnly: true,
                      textController: _locationTextEditingController,
                      onTap: () {
                        context.router
                            .push(const SelectFarmRoute())
                            .then((value) {
                          final farmEntity = ref.read(farmEntityProvider);
                          if (farmEntity != null) {
                            _locationTextEditingController.text =
                                farmEntity.farmDetails.farmName;
                          }
                          setState(() {});
                        });
                      },
                      suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: SvgPicture.asset('assets/images/my_farm.svg')),
                    );
                  }),
                  20.verticalSpace,
                  const CustomImageGrid(
                    length: 3,
                    hintText: "Add crop images",
                  ),
                  20.verticalSpace,
                  ElevatedButton(
                      onPressed: () async {
                        final cropImages = ref.read(pickedImageProvider);

                        if (cropImages.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: primary,
                                  content: Text("Please Add Images.")));
                        } else if (_formKey.currentState!.validate()) {
                          ref.read(diseaseImageProvider.notifier).state =
                              cropImages;

                          final diseaseModel = DiseaseUploadModel(
                              cropName: cropNameController.text.trim(),
                              diseaseName: diseaseNameController.text.trim(),
                              userId: UserPreferences.userId);

                          ref.read(uploadDiseaseProvider.notifier).state =
                              diseaseModel;
                          showLoading(context);
                          final status = await ref
                              .read(diseaseSearchResultProvider)
                              .uploadDisease();
                          if (status) {
                            await context.router.pop();
                            successDialog(context, onPressed: () {
                              Navigator.of(context).pop();
                              ref.read(showFormFlagProvider.notifier).state =
                                  false;
                            });
                          } else {
                            await context.router.pop();
                            failDialog(context, onPressed: () {
                              Navigator.of(context).pop();
                              ref.read(showFormFlagProvider.notifier).state =
                                  true;
                            });
                          }
                        }
                      },
                      child: const Text('Submit'))
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class DiseaseCropDisplay extends ConsumerStatefulWidget {
  const DiseaseCropDisplay({super.key});

  @override
  ConsumerState<DiseaseCropDisplay> createState() => _DiseaseCropDisplayState();
}

class _DiseaseCropDisplayState extends ConsumerState<DiseaseCropDisplay> {
  @override
  Widget build(BuildContext context) {
    final res = ref.watch(diseaseCropListProvider);
    final cropList = res.diseaseCropList;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Added Crops',
              style: TextStyle(
                  fontSize: 16, color: primary, fontWeight: FontWeight.w600)),
          Expanded(
              child: res.isFirstLoadRunning
                  ? const Center(child: CircularProgressIndicator())
                  : cropList.isEmpty
                      ? const Center(
                          child: Text(
                          'Please Add Crop for Disease Detection.',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ))
                      : ListView.builder(
                          controller: res.controller,
                          itemBuilder: (context, index) {
                            final cropModel = cropList[index];

                            if (res.isLoadMoreRunning && cropList.isEmpty) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 40),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else if (res.isFirstLoadRunning &&
                                cropList.isEmpty) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 40),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else if (res.isLoadMoreError ||
                                res.isFirstError) {
                              return Container(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 40),
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    res.isFirstError
                                        ? res.firstErrorMessage
                                        : res.loadMoreErrorMessage,
                                    style: const TextStyle(color: redError),
                                  ),
                                ),
                              );
                            } else if (index == cropList.length - 1 &&
                                res.isLoadMoreRunning) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 40),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else {
                              final List<String> images = [];
                              for (final element in cropModel.images!) {
                                images.add(element.url!);
                              }
                              return Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        // spreadRadius: 7,
                                        blurRadius: 7)
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 200.h,
                                      child: DiseaseImagePlaceHolder(
                                          images: images),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 5.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                textBaseline:
                                                    TextBaseline.alphabetic,
                                                children: [
                                                  SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child: SvgPicture.asset(
                                                      'assets/images/crop.svg',
                                                      color: primary,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  10.horizontalSpace,
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0),
                                                    child: Text(
                                                      cropModel.cropName!,
                                                      maxLines: 1,
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                textBaseline:
                                                    TextBaseline.alphabetic,
                                                children: [
                                                  SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child: SvgPicture.asset(
                                                      'assets/images/bug.svg',
                                                      color: primary,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  10.horizontalSpace,
                                                  if (cropModel.diseaseName ==
                                                          null ||
                                                      cropModel
                                                          .diseaseName!.isEmpty)
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5.0),
                                                      child: Text(
                                                        "Not Available",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    )
                                                  else
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5.0),
                                                      child: Text(
                                                        cropModel.diseaseName!,
                                                        maxLines: 1,
                                                        style: const TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    )
                                                ],
                                              )
                                            ],
                                          ),
                                          const Row(
                                            children: [
                                              Text(
                                                'Report Status : ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                'Pending',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color: primary),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                          itemCount: cropList.length))
        ],
      ),
    );
  }
}

class DiseaseImagePlaceHolder extends ConsumerWidget {
  const DiseaseImagePlaceHolder({Key? key, required this.images})
      : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width - 52;

    return Container(
      width: width,
      height: images.length == 1 ? width * 0.6 : width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.router.push(PostImagePreviewerRoute(
                                urls: images, initialPage: 0));
                          },
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: images[0],
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress)),
                            errorWidget: (context, url, error) => const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.error),
                                Text('Unable to Load Image')
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (images.length == 2 || images.length > 4)
                        Container(
                          width: 1,
                          color: Colors.white,
                        ),
                      if (images.length == 2 || images.length > 4)
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              context.router.push(PostImagePreviewerRoute(
                                  urls: images, initialPage: 1));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    images[1],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (images.length > 2)
                  Container(
                    width: 1,
                    color: Colors.white,
                  ),
                if (images.length > 2)
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              context.router.push(PostImagePreviewerRoute(
                                  urls: images, initialPage: 2));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    images.length == 4 || images.length == 3
                                        ? images[1]
                                        : images[2],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (images.length > 2)
                          Container(
                            width: 1,
                            height: 2,
                            color: Colors.white,
                          ),
                        if (images.length > 2)
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                context.router.push(PostImagePreviewerRoute(
                                    urls: images, initialPage: 2));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      images.length == 4 || images.length == 3
                                          ? images[2]
                                          : images[3],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (images.length > 3)
                          Container(
                            width: 1,
                            color: Colors.white,
                          ),
                        if (images.length > 3)
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        images.length == 4
                                            ? images[3]
                                            : images[4],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                if (images.length > 5)
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.black54,
                                    ),
                                    child: Center(
                                        child: Text(
                                      "+${images.length - 5}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    )),
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
