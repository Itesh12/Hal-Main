import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/agriNews/top_news_model.dart';
import '../../http/api_provider.dart';

class NewsDataRepository {
  NewsDataRepository(this.ref);

  final Ref ref;

  Future<List<TopNewsModel>> getAgriNewsData() async {
    List<TopNewsModel> newsData = [];

    final res = await ref.read(apiProvider).get(
          '/admin/news/published',
        );

    res.when(
      success: (source) {
        newsData = List<TopNewsModel>.from(
            source.map((x) => TopNewsModel.fromJson(x)));


        debugPrint(newsData.toString());
      },
      error: (error) {
        throw error;
      },
    );
    return newsData;
  }
}
