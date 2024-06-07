import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';

import '../../../../global_providers.dart';
import '../../../constants/colors.dart';
import '../../widget/textfield_widget.dart';

@RoutePage()
class PersonalDetailsPage extends StatelessWidget {
  const PersonalDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Personal Details',
            style: TextStyle(color: primary),
          ),
          actions: const [Icon(Icons.more_vert)],
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
              )),
        ),
        body: const SingleChildScrollView(child: PersonalDetailsPageBody()));
  }
}

class PersonalDetailsPageBody extends ConsumerStatefulWidget {
  const PersonalDetailsPageBody({Key? key}) : super(key: key);

  @override
  _PersonalDetailsPageBodyState createState() =>
      _PersonalDetailsPageBodyState();
}

class _PersonalDetailsPageBodyState
    extends ConsumerState<PersonalDetailsPageBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.verticalSpace,
          const Text(' Name of FPO manager'),
          12.verticalSpace,
          const AppTextField(
            hintText: 'Enter name here',
          ),
          12.verticalSpace,
          const Text(' Farmer Name'),
          12.verticalSpace,
          const AppTextField(
            hintText: 'Enter name here',
          ),
          12.verticalSpace,
          const Text(' Father Name'),
          12.verticalSpace,
          const AppTextField(
            hintText: 'Enter name here',
          ),
          12.verticalSpace,
          const Text('Aadhar card number'),
          12.verticalSpace,
          const AppTextField(),
          12.verticalSpace,
          const Text(' Mobile number'),
          12.verticalSpace,
          const AppTextField(),
          40.verticalSpace,
          InkWell(
            onTap: () async {
              Navigator.pop(context);
              final postion = await ref.read(locationProvider).getLocation();
              if (postion != null) {
                ref.read(addressProvider.notifier).getAddress(postion);
              }
            },
            child: Row(
              children: [
                const Text('Select your current location'),
                10.horizontalSpace,
                Image.asset(
                  'assets/images/gps.png',
                  height: 18.h,
                )
              ],
            ),
          ),
          25.verticalSpace,
          const AppTextField(
            hintText: 'House No',
          ),
          12.verticalSpace,
          const AppTextField(
            hintText: 'Area',
          ),
          12.verticalSpace,
          Row(
            children: [
              const Expanded(
                  child: AppTextField(
                    hintText: 'District',
                    suffixIcon: Icon(
                      Icons.expand_more,
                      color: primary,
                    ),
                  )),
              12.75.horizontalSpace,
              const Expanded(
                  child: AppTextField(
                    hintText: 'Pin Code',
                  )),
            ],
          ),
          12.verticalSpace,
          const AppTextField(
            hintText: 'State',
            suffixIcon: Icon(
              Icons.expand_more,
              color: primary,
            ),
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
