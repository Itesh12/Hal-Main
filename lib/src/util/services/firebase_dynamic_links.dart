// import 'package:auto_route/auto_route.dart';
// import 'package:firebase_dynamic_links/c.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kisaan_station/global_providers.dart';
// import 'package:kisaan_station/src/app/router/router.gr.dart';
// import 'package:kisaan_station/src/util/services/shared_preferences.dart';
//
// class DynamicLinksService {
//   final Ref ref;
//
//   DynamicLinksService(this.ref);
//
//   Future<Uri> createDynamicLinkAppShare({required String referralCode}) async {
//     final dynamicLinkParams = DynamicLinkParameters(
//       uriPrefix: 'https://kisaanstations.page.link',
//       link: Uri.parse('https://kisaanstation/?referral=$referralCode'),
//       androidParameters: const AndroidParameters(
//         packageName: 'com.kisaanstation.kisaanstation',
//         minimumVersion: 1,
//       ),
//       iosParameters:
//           const IOSParameters(bundleId: "com.kisaanstation.kisaanstation.ios"),
//     );
//
//     final shortLink = await FirebaseDynamicLinks.instance.buildShortLink(
//       dynamicLinkParams,
//       shortLinkType: ShortDynamicLinkType.unguessable,
//     );
//
//     final Uri dynamicUrl = shortLink.shortUrl;
//
//     return dynamicUrl;
//   }
//
//   Future<Uri> createDynamicLinkSharePost({
//     required String postId,
//   }) async {
//     final dynamicLinkParams = DynamicLinkParameters(
//       uriPrefix: 'https://kisaanstations.page.link',
//       link: Uri.parse('https://kisaanstations.page.link'),
//       androidParameters: const AndroidParameters(
//         packageName: 'com.kisaanstation.kisaanstation',
//         minimumVersion: 1,
//       ),
//       iosParameters:
//           const IOSParameters(bundleId: "com.kisaanstation.kisaanstation.ios"),
//     );
//     final shortLink =
//         await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
//
//     final Uri dynamicUrl = shortLink.shortUrl;
//
//     return dynamicUrl;
//   }
//
//   Future<Uri> createDynamicLinkUserProfile({required String userId}) async {
//     final dynamicLinkParams = DynamicLinkParameters(
//       uriPrefix: 'https://kisaanstations.page.link',
//       link: Uri.parse('https://kisaanstation/?userId=$userId'),
//       androidParameters: const AndroidParameters(
//         packageName: 'com.kisaanstation.kisaanstation',
//         minimumVersion: 1,
//       ),
//       iosParameters:
//           const IOSParameters(bundleId: "com.kisaanstation.kisaanstation.ios"),
//     );
//     final shortLink =
//         await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
//
//     final Uri dynamicUrl = shortLink.shortUrl;
//
//     return dynamicUrl;
//   }
//
//   Future<void> retrieveDynamicLink(BuildContext context) async {
//     try {
//       await Future.delayed(const Duration(seconds: 2), () {});
//       final PendingDynamicLinkData? data =
//           await FirebaseDynamicLinks.instance.getInitialLink();
//       final deepLink = data?.link;
//       if (deepLink != null) {
//         if (deepLink.queryParameters.containsKey('referral')) {
//           final String? referralCode = deepLink.queryParameters['referral'];
//           if (referralCode != null) {
//             UserPreferences.setReferral(referralCode);
//           }
//           debugPrint("REferal could not set to preferences.");
//         } else if (deepLink.queryParameters.containsKey('postId')) {
//           final String? postId = deepLink.queryParameters['postId'];
//           postDetailPageDynamic(postId: postId!, context: context);
//         } else if (deepLink.queryParameters.containsKey('userId')) {
//           final String? userId = deepLink.queryParameters['userId'];
//           userProfilePageDynamic(userId: userId!, context: context);
//         }
//       }
//
//       FirebaseDynamicLinks.instance.onLink.listen(
//           (PendingDynamicLinkData? dynamicLink) async {
//         final Uri? deepLink = dynamicLink?.link;
//         if (deepLink != null) {
//           if (deepLink.queryParameters.containsKey('referral')) {
//             final String? referralCode = deepLink.queryParameters['referral'];
//             if (referralCode != null) {
//               UserPreferences.setReferral(referralCode);
//             }
//           } else if (deepLink.queryParameters.containsKey('postId')) {
//             final String? postId = deepLink.queryParameters['postId'];
//             postDetailPageDynamic(postId: postId!, context: context);
//           } else if (deepLink.queryParameters.containsKey('userId')) {
//             final String? userId = deepLink.queryParameters['userId'];
//             userProfilePageDynamic(userId: userId!, context: context);
//           }
//         }
//       }, onError: (e) async {
//         debugPrint(e.toString());
//       });
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   Future<void> postDetailPageDynamic(
//       {required String postId, required BuildContext context}) async {
//     try {
//       final postVal = await ref
//           .read(postProvider)
//           .getPostDetail(postId: postId, stalkerId: UserPreferences.userId);
//       if (postVal != null) {
//         context.router.push(PostDetailRoute(postId: postVal.postId));
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   Future<void> userProfilePageDynamic(
//       {required String userId, required BuildContext context}) async {
//     if (userId == UserPreferences.userId) {
//       context.router.push(OtherProfileRoute(userId: userId));
//     } else {
//       context.router.push(const ProfileRoute());
//     }
//   }
// }
