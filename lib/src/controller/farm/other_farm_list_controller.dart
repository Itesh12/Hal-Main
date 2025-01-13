import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/model/farm/farm_entity.dart';

import '../../infrastructure/http/app_exception.dart';

class OtherFarmListNotifier extends ChangeNotifier {
  OtherFarmListNotifier(
    this.ref, {
    required this.hsId,
  }) {
    initState();
  }

  final Ref ref;
  final String hsId;

  late ScrollController controller;

  int _page = 1;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isFirstError = false;
  String _firstErrorMessage = '';
  bool _isLoadMoreRunning = false;
  bool _isLoadMoreError = false;
  String _loadMoreErrorMessage = '';
  List<FarmEntity> _farmsList = [];

  bool get hasNextPage => _hasNextPage;
  bool get isFirstLoadRunning => _isFirstLoadRunning;
  bool get isFirstError => _isFirstError;
  String get firstErrorMessage => _firstErrorMessage;
  bool get isLoadMoreRunning => _isLoadMoreRunning;
  bool get isLoadMoreError => _isLoadMoreError;
  String get loadMoreErrorMessage => _loadMoreErrorMessage;
  List<FarmEntity> get farmsList => _farmsList;

  initState() {
    _firstLoad();
    controller = ScrollController()..addListener(_loadMore);
  }

  Future<void> _firstLoad() async {
    _updateLoadingState(isFirstLoadRunning: true);
    try {
      final list = await ref
          .read(farmRepoProvider)
          .getMyFarmByHsId(page: _page, hsId: hsId);
      if (list.isNotEmpty) {
        _farmsList = list;
        notifyListeners();
      }
      _updateLoadingState();
    } catch (e) {
      _handleError(e, isInitialLoad: true);
    }
  }

  Future<void> _loadMore() async {
    if (!_isLoadMoreRunning &&
        !_isFirstLoadRunning &&
        controller.position.pixels == controller.position.maxScrollExtent) {
      _isLoadMoreRunning = true;
      notifyListeners();
      _page += 1;
      _fetchPosts();
    }
  }

  Future<void> _fetchPosts() async {
    try {
      final list = await ref
          .read(farmRepoProvider)
          .getMyFarmByHsId(hsId: hsId, page: _page);
      if (list.isNotEmpty) {
        _farmsList = list;
      }
      notifyListeners();
    } on AppException {
      notifyListeners();
    }
    _isLoadMoreRunning = false;
    notifyListeners();
  }

  void _updateLoadingState(
      {bool isFirstLoadRunning = false, bool isLoadMoreRunning = false}) {
    _isFirstLoadRunning = isFirstLoadRunning;
    _isLoadMoreRunning = isLoadMoreRunning;
    notifyListeners();
  }

  void _handleError(Object e, {required bool isInitialLoad}) {
    // final isError = isInitialLoad ? _isFirstError : _isLoadMoreError;
    String? errorMessage;

    if (e is AppException) {
      e.whenOrNull(
        connectivity: () =>
            errorMessage = "Please check your internet connection",
        errorWithMessage: (message) => errorMessage = message,
        error: () => errorMessage = "Something went wrong",
        unauthorized: () => errorMessage = "Session Expired...",
      );
    } else {
      errorMessage = "An unexpected error occurred";
    }

    if (isInitialLoad) {
      _firstErrorMessage = errorMessage!;
      _isFirstError = true;
    } else {
      _loadMoreErrorMessage = errorMessage!;
      _isLoadMoreError = true;
    }
    _updateLoadingState();
  }

  @override
  void dispose() {
    controller.removeListener(_loadMore);
    controller.dispose();
    super.dispose();
  }
}

final farmEntityProvider = StateProvider<FarmEntity?>((ref) => null);
