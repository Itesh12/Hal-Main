import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../constants/page_padding.dart';
import '../../widget/textfield_widget.dart';

@RoutePage()
class FarmDetailsPage extends StatelessWidget {
  const FarmDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Farm Details',
            style: TextStyle(color: primary),
          ),
          actions: const [Icon(Icons.more_vert)],
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
              )),
        ),
        body: const SingleChildScrollView(child: FarmDetailsPageBody()));
  }
}

class FarmDetailsPageBody extends StatelessWidget {
  const FarmDetailsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.verticalSpace,
          const Text(' Farmer credit card limit'),
          12.verticalSpace,
          const AppTextField(
            hintText: 'Enter name here',
          ),
          12.verticalSpace,
          const Text(' Farming instrument'),
          12.verticalSpace,
          const AppTextField(
            hintText: 'Enter name here',
          ),
          12.verticalSpace,
          const Text(' Crop type'),
          12.verticalSpace,
          const AppTextField(
            hintText: 'Enter name here',
          ),
          12.verticalSpace,
          const Text('Crop name'),
          12.verticalSpace,
          const AppTextField(),
          12.verticalSpace,
          const Text(' Land in Acre'),
          12.verticalSpace,
          const AppTextField(),
          12.verticalSpace,
          const Text(' Land type'),
          12.verticalSpace,
          const AppTextField(
            hintText: 'Land type',
          ),
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
