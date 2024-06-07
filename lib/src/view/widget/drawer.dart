import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/shimmer/drawer_profile.shimmer.dart';
import 'package:kisaan_station/src/view/widget/profile_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../global_providers.dart';
import '../../app/router/router.gr.dart';
import '../../l10n/l10n.dart';
import '../drawer/widgets/station_partner_widget.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({Key? key}) : super(key: key);

  //
  // static const Map<String, String> options = {
  //   "Profile": "profile_icon",
  //   "Ask expert": "ask_expert",
  //   "My order": "my_order",
  //   "My products": "my_products",
  //   "Saved product": "saved",
  //   "My wishlist": "my_wishlist",
  //   "Kyc": "kyc",
  //   "Invite friends": "invite_friends",
  //   "Career": "career",
  // };

  Map<String, String> optionss(BuildContext context) {
    return {
      AppLocalizations.of(context)!.profile: "profile_icon",
      AppLocalizations.of(context)!.ask_expert: "ask_expert",
      AppLocalizations.of(context)!.my_order: "my_order",
      AppLocalizations.of(context)!.my_products: "my_products",
      // AppLocalizations.of(context)!.saved_products: "saved",
      // AppLocalizations.of(context)!.my_wishlist: "my_wishlist",
      // AppLocalizations.of(context)!.kyc: "kyc",
      AppLocalizations.of(context)!.invite_friends: "invite_friends",
      // AppLocalizations.of(context)!.language_change: "language_change",
      AppLocalizations.of(context)!.settings: "setting_d",
      'Downloads':"download",
      if(UserPreferences.hasDcAccess.contains(UserPreferences.userId))
        "Add New DC":"add"
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: [
          Consumer(builder: (context, ref, child) {
            final val = ref.watch(userController(UserPreferences.userId));
            return val.when(
              data: (user) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 20, 20),
                  child: Row(
                    children: [
                      ProfilePicWidget(
                        url: user.profilePic,
                        size: 69,
                        fizedSize: true,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              3.verticalSpace,
                              Text(
                                "${user.address.district}, ${user.address.state}",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: grey,
                                ),
                              ),
                              3.verticalSpace,
                              InkWell(
                                onTap: () {
                                  context.router
                                      .popAndPush(const EditProfileRoute());
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.edit_profile,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (_, __) => const Text("Could not fetch your info"),
              loading: () => const DrawerProfileShimmer(),
            );
          }),
          ...optionss(context)
              .entries
              .map((entry) => DrawerTile(label: entry.key, icon: entry.value))
              .toList(),
          15.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: const HalSaathiWidget(),
          ),
          20.verticalSpace,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 4, 10, 10),
            child: Row(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    await ref.read(authController.notifier).logout();
                    context.router.replaceAll([const SignInRoute()]);
                  },
                  icon: SvgPicture.asset(
                    "assets/images/signout.svg",
                    // height: 23.w,
                  ),
                  label: Text(
                    AppLocalizations.of(context)!.logout,
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({Key? key, required this.label, required this.icon})
      : super(key: key);

  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: CircleAvatar(
          backgroundColor: const Color(0xfffef1de),
          child: SvgPicture.asset("assets/images/$icon.svg",color: mediumOrange,),
        ),
      ),
      title: Text(label),
      onTap: () async {
        final localCntxt = AppLocalizations.of(context)!;
        if (label == localCntxt.career) {
          await context.router.push(const CareerRoute());
          context.router.pop();
        }
        if (label == localCntxt.profile) {
          context.router.pop();

          await context.router.push(const ProfileRoute());
        }
        if (label == localCntxt.my_products) {
          context.router.pop();

          await context.router.push(const MyProductListDrawerRoute());
        }
        if (label == localCntxt.language_change) {
          context.router.push(ChooseLanguageRoute(fromSetting: true));
        }
        if (label == localCntxt.ask_expert) {
          context.router.pop();

          final Uri contactUrl = Uri(
            scheme: 'tel',
            path: "+91 135 617 0900",
          );
          await launchUrl(contactUrl);
        }
        if (label == localCntxt.invite_friends) {
          await context.router.push(const InviteFriendRoute());
          context.router.pop();
        }
        if (label == localCntxt.kyc) {
          await context.router.push(const KycRoute());
          context.router.pop();
        }
        if (label == localCntxt.my_order) {
          await context.router.push(const MyOrderRoute());
          context.router.pop();
        }
        if (label == localCntxt.settings) {
          await context.router.push(const SettingsRoute());
          context.router.pop();
        }
        if(label=="Downloads"){
          await context.router.push(DownloadsRoute());
          context.router.pop();

        }
        if(label == "Add New DC"){
          context.router.push(const StationPatnerFormRoute());
          context.router.pop();
        }
      },
    );
  }
}
