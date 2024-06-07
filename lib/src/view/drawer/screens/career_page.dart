import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/model/career/job_details_model.dart';
import 'package:kisaan_station/src/model/career/job_models.dart';

import '../../../constants/page_padding.dart';
import '../../../l10n/l10n.dart';
import '../../social/post/widgets/search_bar.dart';
import '../../widget/textfield_widget.dart';

List<JobModel> _jobs = [
  const JobModel(jobtitle: 'UI/uX Design', location: 'Noida'),
  const JobModel(jobtitle: 'Motion Design', location: 'Noida'),
  const JobModel(jobtitle: 'Full Stack Developer', location: 'Noida'),
  const JobModel(jobtitle: 'Full Stack Developer', location: 'Noida'),
];

List<JobDetailsModel> _jobsDetailed = [
  const JobDetailsModel(
      jobtitle: 'UI/UX Design',
      job: 'Remote',
      jobDescription:
          '1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ante tincidunt commodo aliquet sit non ornare. Nec proin tortor liberodolor.',
      jobType: 'Full time',
      joinbydate: '20 july 22'),
  const JobDetailsModel(
      jobtitle: 'Motion Design',
      job: 'Remote',
      jobDescription:
          '1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ante tincidunt commodo aliquet sit non ornare. Nec proin tortor liberodolor.',
      jobType: 'Full time',
      joinbydate: '20 july 22'),
  const JobDetailsModel(
      jobtitle: 'Full Stack Developer ',
      job: 'Remote',
      jobDescription:
          '1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ante tincidunt commodo aliquet sit non ornare. Nec proin tortor liberodolor.',
      jobType: 'Full time',
      joinbydate: '20 july 22'),
  const JobDetailsModel(
      jobtitle: 'UI/UX Design',
      job: 'Remote',
      jobDescription:
          '1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ante tincidunt commodo aliquet sit non ornare. Nec proin tortor liberodolor.',
      jobType: 'Full time',
      joinbydate: '20 july 22'),
];

@RoutePage()
class CareerPage extends StatelessWidget {
  const CareerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.h),
          child: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                )),
            elevation: 1,
            title: const Hero(
              tag: 'abcd',
              child: Material(
                  color: Colors.transparent,
                  child: SearchWidget(hintText: 'Search Job')),
            ),
          ),
        ),
        body: const SingleChildScrollView(child: CareerPageBody()));
  }
}

class CareerPageBody extends StatelessWidget {
  const CareerPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          25.verticalSpace,
          Text(
            AppLocalizations.of(context)!.posted_jobs,
            style: textTheme.titleLarge!.copyWith(color: brown),
          ),
          25.verticalSpace,
          SizedBox(
            height: 130.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 10.h,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JobDescriptionDetailed(
                                index: index,
                              )));
                },
                child: Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: Hero(
                        tag: 'title$index',
                        child: Text(
                          _jobs[index].jobtitle ?? 'notitle',
                          style: textTheme.titleMedium!
                              .copyWith(color: const Color(0xff4A4A4A)),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      _jobs[index].location ?? 'nolocation',
                      style: textTheme.titleMedium!
                          .copyWith(color: const Color(0xff4A4A4A)),
                    ),
                    20.horizontalSpace,
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15.h,
                    ),
                  ],
                ),
              ),
              itemCount: 4,
            ),
          ),
          19.verticalSpace,
          Align(
              alignment: Alignment.topRight,
              child: Text(
                AppLocalizations.of(context)!.see_more,
                style: textTheme.titleSmall!.copyWith(color: primary),
              )),
          Text(
            AppLocalizations.of(context)!.get_in_touch,
            style:
                textTheme.titleSmall!.copyWith(color: brown, fontSize: 16.sp),
          ),
          const GetInTouch(),
        ],
      ),
    );
  }
}

class GetInTouch extends StatelessWidget {
  const GetInTouch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        19.verticalSpace,
        const AppTextField(
          hintText: 'Name',
        ),
        13.verticalSpace,
        const AppTextField(
          hintText: 'Email',
        ),
        13.verticalSpace,
        const AppTextField(
          hintText: 'Subject',
        ),
        13.verticalSpace,
        const AppTextField(
          hintText: 'Your Message',
          maxlines: 5,
        ),
        34.verticalSpace,
        Center(
          child: SizedBox(
              width: 268.w,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Center(child: Text('Submit')))),
        ),
        52.verticalSpace,
      ],
    );
  }
}

class JobDescriptionDetailed extends StatelessWidget {
  const JobDescriptionDetailed({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: brown,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 30.h),
        child: SizedBox(
          width: 238.w,
          height: 47.h,
          child: FloatingActionButton(
            elevation: 3,
            backgroundColor: primary,
            foregroundColor: primary,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.r))),
            child: const Text(
              'Apply',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Hero(
            tag: 'title$index',
            child: Text(
              _jobsDetailed[index].jobtitle ?? 'notitle',
              style:
                  textTheme.headlineLarge!.copyWith(color: brown, fontSize: 20),
            ),
          ),
          15.verticalSpace,
          Material(
            color: Colors.transparent,
            child: Text(
              "${_jobsDetailed[index].jobType}  -  Entry level",
              style: textTheme.titleMedium!.copyWith(color: Colors.black87),
            ),
          ),
          15.verticalSpace,
          Text(
            _jobsDetailed[index].job ?? 'notitle',
            style: textTheme.titleMedium!.copyWith(color: Colors.black87),
          ),
          15.verticalSpace,
          Text(
            _jobsDetailed[index].joinbydate ?? 'notitle',
            style: textTheme.titleMedium!.copyWith(color: Colors.black87),
          ),
          15.verticalSpace,
          Text(
            'About the Job',
            style: textTheme.titleMedium!.copyWith(color: brown),
          ),
          41.verticalSpace,
          Text(
            'Key responsibility:',
            style: textTheme.titleSmall!.copyWith(color: brown),
          ),
          15.verticalSpace,
          Text(
            _jobsDetailed[index].jobDescription ?? 'notitle',
            style: textTheme.bodyMedium!.copyWith(color: brown),
          ),
        ]),
      ),
    );
  }
}
