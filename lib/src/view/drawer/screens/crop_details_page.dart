import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../constants/page_padding.dart';
import '../../widget/textfield_widget.dart';

@RoutePage()
class CropDetailsPage extends StatelessWidget {
  const CropDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Crop Details',
            style: TextStyle(color: primary),
          ),
          actions: const [Icon(Icons.more_vert)],
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
              )),
        ),
        body: const SingleChildScrollView(child: CropDetailsPageBody()));
  }
}

class CropDetailsPageBody extends StatelessWidget {
  const CropDetailsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.verticalSpace,
          const Text(' Produced crop'),
          12.verticalSpace,
          const AppTextField(
            hintText: 'Enter name here',
          ),
          12.verticalSpace,
          const Text(' Quantity'),
          12.verticalSpace,
          const AppTextField(
            hintText: 'Enter name here',
          ),
          12.verticalSpace,
          const Text(' Rate MSP/others'),
          12.verticalSpace,
          const AppTextField(
            hintText: 'Enter name here',
          ),
          12.verticalSpace,
          const Text('Sale center Name and Details'),
          12.verticalSpace,
          const AppTextField(),
          12.verticalSpace,
          const Text(' Warehouse status'),
          12.verticalSpace,
          const AppTextField(),
          12.verticalSpace,
          const Text(' Costing of transport'),
          12.verticalSpace,
          const AppTextField(),
          45.verticalSpace,
          Center(
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Submit'))),
          19.verticalSpace,
          const Center(child: Text('Save for later')),
          37.verticalSpace,
        ],
      ),
    );
  }
}
