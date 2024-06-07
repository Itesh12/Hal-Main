import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/model/station/seller_orderlist_model.dart';

import '../../infrastructure/http/app_exception.dart';

class SellerOrderNotifier extends ChangeNotifier {
  SellerOrderNotifier(
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
  List<SellerOrderlistModel> _orderList = [];

  List<SellerOrderlistModel> get orderList => _orderList;

  void _initState() {
    _firstLoad();
    controller = ScrollController()..addListener(_loadMore);
  }

  // This function will be called when the app launches (see the initState function)
  Future<void> _firstLoad() async {
    _isFirstLoadRunning = true;
    notifyListeners();
    try {
      final val = await ref.read(droneServiceRepoProvider).getSellerStatus();
      _orderList = await ref
          .read(orderListProvider)
          .getSellerOrderList(page: _page, sellerId: val.id, size: size);
      if (_orderList.length < 20) {
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

  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  Future<void> _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        controller.position.extentAfter < 300) {
      _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      notifyListeners();
      _page += 1; // Increase _page by 1
      try {
        final val = await ref.read(droneServiceRepoProvider).getSellerStatus();
        final attend = await ref
            .read(listingProvider)
            .getSellerOrderList(page: _page, sellerId: val.id, size: size);
        if (attend.isNotEmpty) {
          _orderList.addAll(attend);
          notifyListeners();
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
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

  void deleteOrd(String ordId) {
    _orderList.removeWhere((element) => element.id == ordId);
    notifyListeners();
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
    _orderList = [];

    await _firstLoad();
  }

  @override
  void dispose() {
    controller.removeListener(_loadMore);
    super.dispose();
  }
}
