



import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/infrastructure/http/app_exception.dart';
import 'package:kisaan_station/src/model/disease_detection/diease_detection_model.dart';

import '../../../global_providers.dart';

final uploadDiseaseProvider = StateProvider<DiseaseUploadModel?>((ref) => null);
final diseaseImageProvider = StateProvider<List<File>>((ref) => []);

final showFormFlagProvider = StateProvider<bool>((ref) => false);


class DiseaseDetectionNotifier extends ChangeNotifier{


  DiseaseDetectionNotifier(this.ref){
    _initState();
  }
  final Ref ref;
  late ScrollController controller;

  // At the beginning, we fetch the first 30 posts
  int _page = 1;
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


  List<DiseaseGetModel> _diseaseCropList = [];
  List<DiseaseGetModel> get diseaseCropList => _diseaseCropList;


  _initState(){
    _firstLoad();
    controller = ScrollController()..addListener(_loadMore);
  }
  

  Future<void> _firstLoad() async {
    _isFirstLoadRunning = true;
    notifyListeners();
    final showForm = ref.read(showFormFlagProvider);
    if(!showForm){
      try {
        _diseaseCropList = await ref
            .read(diseaseDetectionRepoProvider)
            .getDiseaseCrop(_page);
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
            .read(diseaseDetectionRepoProvider)
            .getDiseaseCrop(_page);
        if (attend.isNotEmpty) {
          _diseaseCropList.addAll(attend);
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



  Future<List<SearchResults>>getResults(String value) async{
    List<SearchResults> results = [];
    try{
      final res = await ref.read(diseaseDetectionRepoProvider).searchDisease(value);

      results.clear();
      for (final element in results) {
        res.add(element);
      }
      // notifyListeners();
      results = res;
    } on AppException catch(err){
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
    return results;

  }

  Future<bool> uploadDisease() async{

    bool response = false;
    try{
      final res = await ref.read(diseaseDetectionRepoProvider).uploadDiseaseCrop();
      response = res;
    } on AppException catch(err){
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
    return response;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}


final selectedCropNameProvider = StateProvider<String>((ref) => "");