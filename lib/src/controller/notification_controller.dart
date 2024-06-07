import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/model/notification/new_notification_model.dart';

import '../infrastructure/http/app_exception.dart';
// final notificationList = StateProvider<List<NotificationItem>>((ref) => []);
class UserNotificationNotifier extends ChangeNotifier {
  UserNotificationNotifier(
    this.ref, {
    required this.userId,
  }) {
    _initState();
  }

  final Ref ref;
  final String userId;

  late ScrollController controller;

  // At the beginning, we fetch the first 30 posts
  int _page = 1;
  int size = 20;
  // int _limit = 30;

  // There is next page or not
  bool _hasNextPage = true;
  bool get hasNextPage => _hasNextPage;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;
  bool get isFirstLoadRunning => _isFirstLoadRunning;

  // Used to display error when firstloadError ouccurs
  bool _isFirstError = false;
  bool get isFirstError => _isFirstError;

  // First error message
  String _firstErrorMessage = '';
  String get firstErrorMessage => _firstErrorMessage;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;
  bool get isLoadMoreRunning => _isLoadMoreRunning;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreError = false;
  bool get isLoadMoreError => _isLoadMoreError;

  // Load More error message
  String _loadMoreErrorMessage = '';
  String get loadMoreErrorMessage => _loadMoreErrorMessage;

  // This holds the order fetched from the server
  NotificationModel ? _orderList ;

  NotificationModel? get orderList => _orderList;

  void _initState() {
    _firstLoad();
    controller = ScrollController()..addListener(_loadMore);
  }


  Future<bool> markAllRead() async {

    bool status = false;

    try{
      status = await ref.read(usernotificationProvider).markAsAllRead(userId: userId);
      _initState();
    } on AppException catch (error) {
      error.whenOrNull(
        connectivity: (){

        }
      );
    }
    return status;

  }

  // This function will be called when the app launches (see the initState function)
  Future<void> _firstLoad() async {
    _isFirstLoadRunning = true;
    notifyListeners();
    try {
      _orderList = await ref
          .read(usernotificationProvider)
          .getNotificationData(page: _page, size: 20);
      if (_orderList!.list.length < 20) {
        _hasNextPage = false;
      }
      notifyListeners();
    } on AppException catch (err) {
      _isFirstError = true;
      err.whenOrNull(
        connectivity: () {
          _firstErrorMessage = "Please check your internet connection";
        },
        errorWithMessage: (message) {
          _firstErrorMessage = message;
        },
        error: () {
          _firstErrorMessage = "Something went wrong";
        },
        unauthorized: () {
          _firstErrorMessage = "Session Expired...";
        },
      );
    }
    _isFirstLoadRunning = false;
    notifyListeners();
  }

  // This function will be triggered whenever the user scroll
  // to near the bottom of the list view
  Future<void> _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        controller.position.pixels == controller.position.maxScrollExtent) {
      _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      notifyListeners();
      _page += 1; // Increase _page by 1
      try {
        final attend = await ref
            .read(usernotificationProvider)
            .getNotificationData(page: _page, size: 20);
        if (attend!.list.isNotEmpty) {
          _orderList!.list.addAll(attend.list);
          notifyListeners();
        } else {
          // This means there is no more data
          // and 9therefore, we will not send another GET request
          _hasNextPage = false;
          notifyListeners();
        }
      } on AppException catch (err) {
        _isLoadMoreError = true;
        err.whenOrNull(
          connectivity: () {
            _loadMoreErrorMessage = "Please check your internet connection";
          },
          errorWithMessage: (message) {
            _loadMoreErrorMessage = message;
          },
          error: () {
            _loadMoreErrorMessage = "Something went wrong";
          },
        );
      }

      _isLoadMoreRunning = false;
      notifyListeners();
    }
  }

  void scrollToTop() {
    controller.animateTo(0,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  Future<void> refresh(BuildContext context) async {
    // Reverting back to initial state
    _page = 1;
    _hasNextPage = true;
    _isFirstLoadRunning = false;
    _isFirstError = false;
    _firstErrorMessage = '';
    _isLoadMoreRunning = false;
    _isLoadMoreError = false;
    _loadMoreErrorMessage = '';
    _orderList = null;



    await _firstLoad();
  }

  void deletenotification(String route) {
    //   _orderList.removeWhere((element) => element.list. == route);
    //   notifyListeners();
  }
}

//


 

// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kisaan_station/src/controller/post/provider/perticular_post_controller.dart';
// import 'package:kisaan_station/src/model/notification/user_notification_model.dart';

// import '../../../global_providers.dart';
// import '../util/services/shared_preferences.dart';

// class UserNotificationNotifier
//     extends StateNotifier<AsyncValue<List<UserNotificationModel>>> {
//   UserNotificationNotifier(this.ref) : super(const AsyncLoading()) {
//     _initBlockUser();
//   }

//   final Ref ref;

//   final stalkerId = UserPreferences.userId;

//   // final List<BlockedListModel> _blocked = [];

//   // List<BlockedListModel> get blocked => _blocked;

//   Future<void> _initBlockUser() async {
//     try {
//       final _usr =
//           
//       state = AsyncData(_usr);
//     } on Exception catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//   }

//   // Future<void> blockUser({
//   //   required String blockedUserId,
//   //   required String blockedByUserId,
//   // }) async {
//   //   try {
//   //     await ref
//   //         .read(userRepoProvider)
//   //         .blockUser(blockedByUserId: stalkerId, blockedUserId: blockedUserId);

//   //     block(blockedUserId);
//   //   } on Exception catch (e) {
//   //     developer.log(e.toString());
//   //   }
//   // }

//   // Future<void> unblockUser({
//   //   required String otherUserId,
//   //   required String stalkerId,
//   // }) async {
//   //   try {
//   //     await ref
//   //         .read(userRepoProvider)
//   //         .unBlockUser(stalkerId: stalkerId, blockedUserId: otherUserId);
//   //     unblock(otherUserId);
//   //   } on Exception catch (e) {
//   //     developer.log(e.toString());
//   //   }
//   // }

//   // void block(String id) {
//   //   final List<BlockedListModel> blockuserList = state.asData!.value;
//   //   var newList = blockuserList;
//   //   var newUsr = blockuserList.firstWhere((element) => element.id == id);
//   //   var index = blockuserList.indexWhere((element) => element.id == id);
//   //   var newusr2 = newUsr.copyWith(isBlocked: true);
//   //   newList[index] = newusr2;

//   //   // for (var element in newList) {
//   //   //   if (element.id == id) {
//   //   //     element = element.copyWith(isBlocked: false);
//   //   //     print("unblock mein ja rha h");
//   //   //   }
//   //   // }
//   //   // debugPrint(newList.toString());
//   //   state = AsyncValue.data(newList);
//   // }

//   // void unblock(String id) {
//   //   final List<BlockedListModel> blockuserList = state.asData!.value;
//   //   var newList = blockuserList;
//   //   var newUsr = blockuserList.firstWhere((element) => element.id == id);
//   //   var index = blockuserList.indexWhere((element) => element.id == id);
//   //   var newusr2 = newUsr.copyWith(isBlocked: false);
//   //   newList[index] = newusr2;

//   //   // for (var element in newList) {
//   //   //   if (element.id == id) {
//   //   //     element = element.copyWith(isBlocked: false);
//   //   //     print("unblock mein ja rha h");
//   //   //   }
//   //   // }
//   //   // debugPrint(newList.toString());
//   //   state = AsyncValue.data(newList);
//   // }
// }
