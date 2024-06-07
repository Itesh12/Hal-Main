import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/profile/widgets/user_info.dart';

import '../../../../global_providers.dart';
import '../../../app/router/router.gr.dart';
import '../../../l10n/l10n.dart';
import '../../../util/bottomsheet/bottom_sheet.dart';
import '../../Farm/farm_list_page.dart';
import '../../Farm/widget/farm_tile.dart';
import '../../market/my_product_list_page.dart';
import '../../social/post/widgets/user_paged_post.dart';

@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  List<Widget> tabs(BuildContext context) {
    final List<Widget> list = [
      Tab(
        height: 26,
        text: AppLocalizations.of(context)!.posts,
      ),
      Tab(
        height: 26,
        text: AppLocalizations.of(context)!.my_orders,
      ),
      // Tab(
      //   height: 26,
      //   text: AppLocalizations.of(context)!.selling_products,
      // ),
      Tab(
        height: 26,
        text: AppLocalizations.of(context)!.my_farm,
      ),
    ];
    return list;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _farmsearchTextEditingController =
        TextEditingController();

    final _userPostListController = ref.watch(userPostListProvider(
      UserPreferences.userId,
    ));
    final _myProducttListController =
        ref.watch(getMyProductProvider(UserPreferences.userId));

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          controller: _userPostListController.controller,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    )),
                title: Text(
                  AppLocalizations.of(context)!.my_profile,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: buildActions(context),
              ),
              SliverAppBar(
                pinned: true,
                floating: true,
                toolbarHeight: 0,
                expandedHeight: 185.h,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  background: UserInfo(
                    userId: UserPreferences.userId,
                    isOthers: false,
                    // isOthers: true,
                  ),
                  collapseMode: CollapseMode.pin,
                ),
                bottom: TabBar(
                  tabs: tabs(context),
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
                          .read(userController(UserPreferences.userId).notifier)
                          .initUser();

                      _userPostListController.refresh(context);
                    },
                  ),
                  child: CustomScrollView(
                    slivers: [
                      // SliverOverlapInjector(
                      //   // This is the flip side of the SliverOverlapAbsorber
                      //   // above.
                      //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      //       context),
                      // ),
                      UserPagedPost(
                        userId: UserPreferences.userId,
                      ),
                    ],
                  ),
                );
              }),
              // Center(
              //   child: Text(
              //     AppLocalizations.of(context)!.my_orders,
              //     style: const TextStyle(fontSize: 40),
              //   ),
              // ),
              Builder(builder: (context) {
                return RefreshIndicator(
                  onRefresh: () => Future.sync(
                    () => _myProducttListController.refresh(context),
                  ),
                  child: CustomScrollView(
                    slivers: [
                      // SliverOverlapInjector(
                      //   // This is the flip side of the SliverOverlapAbsorber
                      //   // above.
                      //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      //       context),
                      // ),
                      MyProductListPage(userId: UserPreferences.userId)
                    ],
                  ),
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
                        SliverToBoxAdapter(
                          child: Consumer(
                            builder: (context, ref, child) {
                              final res = ref.watch(
                                  farmListProvider(UserPreferences.mobileNo));
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
                                                  vertical: 10.h, horizontal: 20.w),
                                              child: FarmTile(
                                                farm: res.farmsList[index],
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
              }),
            ],
          ),
        ),
      ),
    );
  }

  List<IconButton> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          context.router.push(const CreatePostRoute());
        },
        icon: SvgPicture.asset("assets/images/add.svg"),
      ),
      IconButton(
        onPressed: () {
          buildShowModalBottomSheet(
              context,
              (controller) => Padding(
                    padding:
                        EdgeInsets.only(left: 29.w, bottom: 26.h, top: 24.h),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            context.router.popAndPush(const SettingsRoute());
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/setting.svg',
                                height: 20.h,
                              ),
                              10.horizontalSpace,
                              Text(
                                AppLocalizations.of(context)!.settings,
                                // style: textTheme
                                //     .titleSmall!
                                //     .copyWith(
                                //     color:
                                //     primary),
                              )
                            ],
                          ),
                        ),
                        6.verticalSpace,
                        const Divider(),
                        6.verticalSpace,
                        InkWell(
                          onTap: () {
                            context.router.popAndPush(const EditProfileRoute());
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/editSquare.svg',
                                height: 20.h,
                              ),
                              10.horizontalSpace,
                              Text(
                                AppLocalizations.of(context)!.edit_profile,

                                // style: textTheme
                                //     .titleSmall!
                                //     .copyWith(
                                //     color:
                                //     primary),
                              ),
                            ],
                          ),
                        ),
                        6.verticalSpace,
                        const Divider(),
                      ],
                    ),
                  ),
              initialHeight: 0.23);
        },
        icon: const Icon(
          Icons.more_vert,
          color: brown,
        ),
      ),
    ];
  }
}
