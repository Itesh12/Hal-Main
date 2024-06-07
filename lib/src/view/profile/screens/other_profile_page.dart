import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';

import '../../../../global_providers.dart';
import '../../../constants/colors.dart';
import '../../../util/bottomsheet/bottom_sheet.dart';
import '../../../util/utlis.dart';
import '../../Farm/farm_list_page.dart';
import '../../Farm/widget/farm_tile.dart';
import '../../market/my_product_list_page.dart';
import '../../social/post/widgets/custom_ReportForm.dart';
import '../../social/post/widgets/user_paged_post.dart';
import '../widgets/user_info.dart';

List<String> reportReason = [
  'False Information',
  'Suicided or self-injury',
  'Nudity or Sexual Content',
  'Inappropriate Content',
  'Bullying or harassment',
  'Hate speech',
  'Other'
];

@RoutePage()
class OtherProfilePage extends ConsumerWidget {
  OtherProfilePage({Key? key, required this.userId}) : super(key: key);

  final String userId;

  List<Widget> tabs() {
    const List<Widget> list = [
      Tab(
        height: 26,
        text: 'Posts',
      ),
      Tab(
        height: 26,
        text: 'Products',
      ),
      Tab(
        height: 26,
        text: 'Farm',
      ),
    ];
    return list;
  }

  final TextEditingController _farmsearchTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _myProducttListController = ref.watch(getMyProductProvider(userId));

    final _userPostListController = ref.watch(userPostListProvider(userId));
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, bodyIsScrolled) {
            return [
              SliverAppBar(
                leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    )),
                title: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      buildShowModalBottomSheet(context, (controller) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Material(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.pop(context);
                                    final bool? blockres =
                                        await Report.blockConfirm(
                                            context: context, userId: userId);
                                    if (blockres ?? false) {
                                      Utils.farmAddedMessage(
                                              'User Block Successfully',
                                              context)
                                          .then((value) => context.popRoute());
                                    }
                                  },
                                  child: SizedBox(
                                    width: double.maxFinite,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/block_userm.svg"),
                                          const SizedBox(width: 10),
                                          Text(
                                            "Block",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff563E1F)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(
                                  color: Color(0xffF4F4F4), thickness: 2),
                              Material(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.pop(context);
                                    buildShowModalBottomSheet(context,
                                        (context) {
                                      return ReportViewWidgett(
                                        userId: userId,
                                        reportCall: (data) {
                                          ref
                                              .read(userController(
                                                      UserPreferences.userId)
                                                  .notifier)
                                              .reportaccount(
                                                otherUserId: userId,
                                                reportReason: data,
                                              );
                                        },
                                      );
                                    }, initialHeight: 0.73);
                                  },
                                  child: SizedBox(
                                    width: double.maxFinite,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/report_1.svg"),
                                          const SizedBox(width: 10),
                                          Text(
                                            "Report",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xffEA1F44)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }, initialHeight: 0.2);
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      color: brown,
                    ),
                  ),
                ],
              ),
              SliverAppBar(
                pinned: true,
                floating: true,
                toolbarHeight: 0,
                expandedHeight: 230.h,
                forceElevated: bodyIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  background: UserInfo(
                    userId: userId,
                    isOthers: true,
                  ),
                  collapseMode: CollapseMode.pin,
                ),
                bottom: TabBar(
                  tabs: tabs(),
                  // isScrollable: true,
                  labelStyle: TextStyle(
                    color: primary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelColor: brown,
                  labelColor: primary,
                  indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                    width: 2,
                    color: primary,
                  )),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Builder(builder: (context) {
                return RefreshIndicator(
                  onRefresh: () => Future.sync(
                    () async {
                      await ref
                          .read(userController(userId).notifier)
                          .initUser();
                      _userPostListController.refresh(context);
                    },
                  ),
                  triggerMode: RefreshIndicatorTriggerMode.anywhere,
                  child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        UserPagedPost(
                          userId: userId,
                        ),
                      ]),
                );
              }),
              Builder(builder: (context) {
                return RefreshIndicator(
                  onRefresh: () => Future.sync(
                    () => _myProducttListController.refresh(context),
                  ),
                  triggerMode: RefreshIndicatorTriggerMode.anywhere,
                  child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        MyProductListPage(
                          userId: userId,
                        ),
                      ]),
                );
              }),
              Builder(builder: (context) {
                final val = ref.watch(userController(userId));
                return val.when(
                  data: (user) {
                    return RefreshIndicator(
                      onRefresh: () => Future.sync(
                        () => _myProducttListController.refresh(context),
                      ),
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      child: CustomScrollView(
                          physics: const BouncingScrollPhysics(),
                          slivers: [
                            SliverToBoxAdapter(
                              child: Consumer(
                                builder: (context, ref, child) {
                                  final res = ref
                                      .watch(farmListProvider(user.mobileNo));
                                  return res.isLoadMoreRunning
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : res.farmsList.isNotEmpty
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.h,
                                                      horizontal: 20.w),
                                                  child: FarmTile(
                                                    farm: res.farmsList[index],
                                                    onTapDisabled: false,
                                                  ),
                                                );
                                              },
                                              itemCount: res.farmsList.length,
                                            )
                                          : NoFarmWidget(
                                              farmsearchController:
                                                  _farmsearchTextEditingController);
                                },
                              ),
                            ),
                          ]),
                    );
                  },
                  error: (error,st){
                    return NoFarmWidget(
                        farmsearchController:
                        _farmsearchTextEditingController);
                  },
                  loading: (){
                    return const Center(child: CircularProgressIndicator());
                  }
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportViewWidgett extends StatefulWidget {
  const ReportViewWidgett({
    Key? key,
    required this.userId,
    required this.reportCall,
  }) : super(key: key);

  final String userId;
  final Function(String) reportCall;

  @override
  State<ReportViewWidgett> createState() => _ReportViewWidgettState();
}

class _ReportViewWidgettState extends State<ReportViewWidgett> {
  int _currentIndex = -1;
  bool isVisible = false;
  final otherText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Report',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.normal,
                            color: Colors.black)),
                    if (isVisible)
                      InkWell(
                        onTap: () {
                          isVisible = false;
                          _currentIndex = -1;
                          setState(() {});
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          "assets/images/cut.svg",
                          color: Colors.black,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 2),
                const Text('Why are you reporting this post?',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45)),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.grey,
                )
              ],
            ),
          ),
          if (!isVisible) ...{
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height*
              //     0.55,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(right: 35),
                itemCount: reportReason.length,
                itemBuilder: (BuildContext context, int index) {
                  return RadioListTile(
                    value: index,
                    groupValue: _currentIndex,
                    title: Text(
                      reportReason[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                    onChanged: (val) {
                      setState(() {
                        _currentIndex = val!;
                        if (val == 6) {
                          isVisible = true;
                        } else {
                          isVisible = false;
                        }
                      });
                    },
                  );
                },
              ),
            ),
          },
          if (isVisible)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.orange,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: const EdgeInsets.all(18),
                child: TextFormField(
                  controller: otherText,
                  decoration: const InputDecoration(
                    hintText: "Tell us more about what is happening",
                    hintStyle: TextStyle(fontSize: 14),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                  ),
                  maxLength: 50,
                ),
              ),
            ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  height: 36,
                  width: 101,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      // isVisible = false;
                      // _currentIndex = -1;
                      // setState(() {});
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  )),
              Consumer(builder: (context, ref, child) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                    height: 36,
                    width: 101,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFE26B26)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(27.0),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 209, 110, 110))))),
                      onPressed: () {
                        String data;
                        if (isVisible) {
                          data = otherText.text;
                        } else {
                          data = reportReason[_currentIndex];
                        }
                        widget.reportCall(data);
                        Utils.farmAddedMessage(
                                'Report sent Successfully', context)
                            .then((value) => Navigator.pop(context));
                      },
                      child: const Text('Report',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
