import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/model/search/search_user_model.dart';

import '../../http/api_provider.dart';

class SearchUserRepo {
  SearchUserRepo(
    this.ref,
  );

  final Ref ref;

  Future<List<SearchUserModel>> searchUser(
      {required int page, required final String searchQuery}) async {
    List<SearchUserModel> followerList = [];

    final res = await ref.read(apiProvider).get(
          '/search/$page/${20}/$searchQuery',
        );

    res.when(
      success: (source) {
        debugPrint(source.toString());

        final List<SearchUserModel> data = List<SearchUserModel>.from(
            source.map((x) => SearchUserModel.fromJson(x)));


        debugPrint(data.toString());
        followerList = data;
      },
      error: (error) {
        throw error;
      },
    );
    return followerList;
  }
}
