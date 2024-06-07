import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../constants/page_padding.dart';
import '../../widget/textfield_widget.dart';

@RoutePage()
class ExpenseDetailPage extends StatelessWidget {
  const ExpenseDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(
            'Expense Details',
            style: TextStyle(color: primary),
          ),
          actions: const [Icon(Icons.more_vert)],
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
              )),
        ),
        body: const SingleChildScrollView(child: ExpenseDetailsPageBody()));
  }
}

class ExpenseDetailsPageBody extends StatelessWidget {
  const ExpenseDetailsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.verticalSpace,
          const Text(' Item details'),
          12.verticalSpace,
          const AppTextField(
            hintText: 'Enter name here',
          ),
          12.verticalSpace,
          const Text(' Item rate'),
          12.verticalSpace,
          const AppTextField(
            hintText: 'Enter name here',
          ),
          12.verticalSpace,
          const Text('Quantity'),
          12.verticalSpace,
          const AppTextField(),
          12.verticalSpace,
          const Text(' Brand used'),
          12.verticalSpace,
          const AppTextField(),
          12.verticalSpace,
          const Text(' Total purchase cost'),
          12.verticalSpace,
          const AppTextField(),
          12.verticalSpace,
          const Text(' Purchase center'),
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
