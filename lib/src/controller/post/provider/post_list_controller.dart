import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kisaan_station/global_providers.dart';
import '../../../infrastructure/http/app_exception.dart';
import '../../../model/social/post/post_model.dart';
import '../../../util/services/shared_preferences.dart';

class PostListNotifier extends ChangeNotifier {
  PostListNotifier(this.ref) {
    box = Hive.box<Post>('postsBox');
    controller = ScrollController()..addListener(_handleScroll);
    _firstLoad();
  }

  final Ref ref;
  final String userId = UserPreferences.userId;
  late final ScrollController controller;

  int _page = 1;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isFirstError = false;
  String _firstErrorMessage = '';
  bool _isLoadMoreRunning = false;
  bool _isLoadMoreError = false;
  String _loadMoreErrorMessage = '';
  List<Post> _posts = [];

  bool get hasNextPage => _hasNextPage;
  bool get isFirstLoadRunning => _isFirstLoadRunning;
  bool get isFirstError => _isFirstError;
  String get firstErrorMessage => _firstErrorMessage;
  bool get isLoadMoreRunning => _isLoadMoreRunning;
  bool get isLoadMoreError => _isLoadMoreError;
  String get loadMoreErrorMessage => _loadMoreErrorMessage;
  List<Post> get posts => _posts;

  late Box<Post> box =  Hive.box<Post>('postsBox');

  static const int _maxPostsInMemory = 15;
  static const int _fetchThreshold = 200;

  void _handleScroll() {
    if (controller.position.pixels == controller.position.maxScrollExtent && _hasNextPage) {
      _loadMore();
    } else if (controller.position.pixels == controller.position.minScrollExtent+500 && _page > 1) {
      _loadPrevious();
    }
  }

  Future<void> _firstLoad() async {
    _updateLoadingState(isFirstLoadRunning: true);
    try {
      if (box.isNotEmpty && !isDataStale(box.values.first)) {
        _posts = box.values.toList();
      } else {
        _posts = await ref.read(postProvider).getPosts(_page);
        // Clear the box and add new items to it
        await box.clear();
        await box.addAll(_posts);

      }
      _updateLoadingState();
    } catch (e) {
      print(e.toString());
      _handleError(e, isInitialLoad: true);
    }
  }
  bool isDataStale(Post post) {

    return false;
    // Implement your logic to determine if the data is stale
    // For example, if the post timestamp is older than a certain threshold
  }


  Future<void> _loadMore() async {
    if (!_isLoadMoreRunning && !_isFirstLoadRunning) {
      _isLoadMoreRunning = true;
      notifyListeners();
      _page += 1;


        _fetchPosts();
    }
  }

  Future<void> _loadPrevious() async {
    if (!_isLoadMoreRunning && !_isFirstLoadRunning) {
      _isLoadMoreRunning = true;
      notifyListeners();
      _page -= 1;
      await _fetchPosts(isLoadingPrevious: true);
    }
  }
  void _updateLoadingState({bool isFirstLoadRunning = false, bool isLoadMoreRunning = false}) {
    _isFirstLoadRunning = isFirstLoadRunning;
    _isLoadMoreRunning = isLoadMoreRunning;
    notifyListeners();
  }

  Future<void> _fetchPosts({bool isLoadingPrevious = false}) async {
    try {
      final newPosts = await ref.read(postProvider).getPosts(_page);
      if (newPosts.isEmpty) {
        _hasNextPage = false;
      } else {
        if (isLoadingPrevious) {
          _posts.insertAll(0, newPosts);
        } else {
          _posts.addAll(newPosts);
          await box.addAll(newPosts); // Add new posts to the box
        }
        // Truncate _posts and box to _maxPostsInMemory if needed
      }
    } catch (err) {
      _isLoadMoreError = true;
      // Handle the error appropriately
    }
    _isLoadMoreRunning = false;
    notifyListeners();
  }

  void _handleError(Object e, {required bool isInitialLoad}) {
    final isError = isInitialLoad ? _isFirstError : _isLoadMoreError;
    String? errorMessage;

    if (e is AppException) {
      e.whenOrNull(
        connectivity: () => errorMessage = "Please check your internet connection",
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


  int deletePost(Post post) {
    final index = _posts.indexOf(post);
    _posts.remove(post);
    notifyListeners();
    return index;
  }

  void scrollToTop() {
    controller.animateTo(0, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }
  Future<void> hide({
    required String postId,
    required BuildContext context,
    required String otherUserId,
  }) async {
    final thisPost = await ref
        .read(postProvider)
        .getPostDetail(postId: postId, stalkerId: userId);

    if (thisPost != null) {
      final index = deletePost(thisPost);
      bool undo = false;
      final snackBar = SnackBar(
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3),
        content: const Text("You want to undo this action",
            style: TextStyle(color: Colors.black)),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            undo = true;
            _posts.insert(index, thisPost);
            notifyListeners();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      await Future.delayed(const Duration(seconds: 3), () async {
        if (!undo) {
          await ref
              .read(postProvider)
              .hidePost(otherUserId: otherUserId, userId: userId, postId: postId);
        }
      });
    }
  }

  Future<void> refresh(BuildContext context) async {
    _page = 1;
    _hasNextPage = true;
    _firstErrorMessage = '';
    _loadMoreErrorMessage = '';
    _posts.clear();
    await Hive.box<Post>('postsBox').clear();
    await _firstLoad();
  }


  @override
  void dispose() {
    controller.removeListener(_handleScroll);
    controller.dispose();
    super.dispose();
  }
}













// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kisaan_station/global_providers.dart';
//
// import '../../../infrastructure/http/app_exception.dart';
// import '../../../model/social/post/post_model.dart';
// import '../../../util/services/shared_preferences.dart';
// import '../../user/follow_controller.dart';
//
// class PostListNotifier extends ChangeNotifier {
//   PostListNotifier(
//     this.ref,
//   ) {
//     _initState();
//   }
//
//   final Ref ref;
//   final userId = UserPreferences.userId;
//
//   late ScrollController controller;
//
//   // At the beginning, we fetch the first 30 posts
//   int _page = 1;
//
//   // int _limit = 30;
//
//   // There is next page or not
//   bool _hasNextPage = true;
//
//   bool get hasNextPage => _hasNextPage;
//
//   // Used to display loading indicators when _firstLoad function is running
//   bool _isFirstLoadRunning = false;
//
//   bool get isFirstLoadRunning => _isFirstLoadRunning;
//
//   // Used to display error when firstloadError ouccurs
//   bool _isFirstError = false;
//
//   bool get isFirstError => _isFirstError;
//
//   // First error message
//   String _firstErrorMessage = '';
//
//   String get firstErrorMessage => _firstErrorMessage;
//
//   // Used to display loading indicators when _loadMore function is running
//   bool _isLoadMoreRunning = false;
//
//   bool get isLoadMoreRunning => _isLoadMoreRunning;
//
//   // Used to display loading indicators when _loadMore function is running
//   bool _isLoadMoreError = false;
//
//   bool get isLoadMoreError => _isLoadMoreError;
//
//   // Load More error message
//   String _loadMoreErrorMessage = '';
//
//   String get loadMoreErrorMessage => _loadMoreErrorMessage;
//
//   // This holds the posts fetched from the server
//   List<Post> _posts = [];
//
//   List<Post> get posts => _posts;
//
//   void _initState() {
//     _firstLoad();
//     controller = ScrollController()..addListener(_loadMore);
//   }
//
//   // This function will be called when the app launches (see the initState function)
//   Future<void> _firstLoad() async {
//     _isFirstLoadRunning = true;
//     notifyListeners();
//     try {
//       _posts = await ref.read(postProvider).getPosts(_page);
//       for (final element in _posts) {
//         // ref.watch(userFollowProvider(element.userId).notifier).state = element.followingStatus;
//       }
//       notifyListeners();
//     } on AppException catch (err) {
//       _isFirstError = true;
//       err.whenOrNull(
//         connectivity: () {
//           _firstErrorMessage = "Please check your internet connection";
//         },
//         errorWithMessage: (message) {
//           _firstErrorMessage = message;
//         },
//         error: () {
//           _firstErrorMessage = "Something went wrong";
//         },
//         unauthorized: () {
//           _firstErrorMessage = "Session Expired...";
//         },
//       );
//     }
//     _isFirstLoadRunning = false;
//     notifyListeners();
//   }
//
//   //This function will be called when the app launches
//   // Future<void> reportPost({
//   //   required BuildContext context ,
//   //   required String otherUserId,
//   //   required String postId,
//   // }) async {
//   //   try {
//   //     await ref
//   //         .read(postProvider)
//   //         .reportPost(otherUserId: otherUserId, userId: userId, postId: postId);
//   //     report(postId:postId,context:context);
//   //   } on Exception catch (e) {
//   //     developer.log(e.toString());
//   //   }
//   // }
//
//   Future<void> hide({
//     required String postId,
//     required BuildContext context,
//     required String otherUserId,
//   }) async {
//     final thisPost = await ref
//         .read(postProvider)
//         .getPostDetail(postId: postId, stalkerId: userId);
//
//     final index = deletePost(thisPost!);
//     print("index: $index");
//     bool undo = false;
//     final snackBar = SnackBar(
//       backgroundColor: Colors.white,
//       duration: const Duration(seconds: 3),
//       content: const Text("You want to undo this action",
//           style: TextStyle(color: Colors.black)),
//       action: SnackBarAction(
//         label: 'Undo',
//         onPressed: () {
//           undo = true;
//           _posts.insert(index, thisPost);
//           notifyListeners();
//         },
//       ),
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     await Future.delayed(const Duration(seconds: 3), () async {
//       if (!undo) {
//         await ref
//             .read(postProvider)
//             .hidePost(otherUserId: otherUserId, userId: userId, postId: postId);
//       }
//     });
//   }
//
//   // This function will be triggered whenever the user scroll
//   // to near the bottom of the list view
//   Future<void> _loadMore() async {
//     if (_hasNextPage == true &&
//         _isFirstLoadRunning == false &&
//         _isLoadMoreRunning == false &&
//         controller.position.maxScrollExtent == controller.position.pixels) {
//       _isLoadMoreRunning = true; // Display a progress indicator at the bottom
//       notifyListeners();
//       _page += 1; // Increase _page by 1
//       try {
//         final attend = await ref.read(postProvider).getPosts(_page);
//         if (attend.isNotEmpty) {
//           _posts.addAll(attend);
//         } else {
//           // This means there is no more data
//           // and therefore, we will not send another GET request
//           _hasNextPage = false;
//         }
//         for (final element in _posts) {
//           // ref.watch(userFollowProvider(element.userId).notifier).state = element.followingStatus;
//         }
//       } on AppException catch (err) {
//         _isLoadMoreError = true;
//         err.whenOrNull(
//           connectivity: () {
//             _loadMoreErrorMessage = "Please check your internet connection";
//           },
//           errorWithMessage: (message) {
//             _loadMoreErrorMessage = message;
//           },
//           error: () {
//             _loadMoreErrorMessage = "Something went wrong";
//           },
//         );
//       }
//
//       _isLoadMoreRunning = false;
//       notifyListeners();
//     }
//   }
//
//   int deletePost(Post pst) {
//     final index = _posts.indexOf(pst);
//     final bool c = _posts.remove(pst);
//     print(c);
//     notifyListeners();
//     return index;
//   }
//
//   void scrollToTop() {
//     controller.animateTo(0,
//         duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
//   }
//
//   Future<void> refresh(BuildContext context) async {
//     // Reverting back to initial state
//     _page = 1;
//     _hasNextPage = true;
//     _isFirstLoadRunning = false;
//     _isFirstError = false;
//     _firstErrorMessage = '';
//     _isLoadMoreRunning = false;
//     _isLoadMoreError = false;
//     _loadMoreErrorMessage = '';
//     _posts = [];
//
//     await _firstLoad();
//   }
//
//   @override
//   void dispose() {
//     controller.removeListener(_loadMore);
//     controller.dispose();
//     super.dispose();
//   }
// }
