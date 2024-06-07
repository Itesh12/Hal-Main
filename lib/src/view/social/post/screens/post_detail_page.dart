import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/social/post/widgets/post_bottom.dart';
import 'package:kisaan_station/src/view/social/post/widgets/post_card.dart';
import 'package:kisaan_station/src/view/social/post/widgets/post_top.dart';

import '../../../../../global_providers.dart';
import '../../../../model/social/post/post_model.dart';
import '../../comment/widgets/bottom_persist_field.dart';
import '../../comment/widgets/paged_comment.dart';

// class PostDetailPage extends ConsumerWidget {
//   const PostDetailPage({Key? key, required this.postId}) : super(key: key);
//   final String postId;
@RoutePage()
class PostDetailPage extends ConsumerStatefulWidget {
  final String postId;
  const PostDetailPage({super.key, required this.postId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends ConsumerState<PostDetailPage> {
  Post? posts;

  bool loading = false;

  @override
  void initState() {
    super.initState();

    _getData();
  }

  Future<void> _getData() async {
    try {
      loading = true;
      setState(() {

      });
      posts = await ref.read(postProvider).getPostDetail(postId: widget.postId, stalkerId: UserPreferences.userId);
      loading = false;
      setState(() {});
    } on Exception {
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    final cntrl = ref.watch(commentListProvider(widget.postId)).controller;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
          ),
          resizeToAvoidBottomInset: true,
          body: loading ? Center(child: CircularProgressIndicator(color: primary,)):
          posts != null
              ? Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        controller: cntrl,
                        slivers: [
                          SliverToBoxAdapter(child: PostTop(post: posts!)),
                          SliverToBoxAdapter(
                            child: MediaDisplayWidget(
                              post: posts!,
                              inDetail: true,
                              context: context,
                              postType: posts!.postType,
                            ),
                          ),
                          SliverToBoxAdapter(
                              child: PostBottom(rawPost: posts!)),
                          PagedComment(entityId: posts!.postId),
                        ],
                      ),
                    ),
                    BottomPersistField(
                      hintText: "write a comment...",
                      onTap: (msg) async {
                        await ref
                            .read(perticularPostController(posts!).notifier)
                            .addComment(
                              comment: msg,
                              entityId: posts!.postId,
                            );
                      },
                      isTyping: false,
                    ),
                  ],
                )
              : const Center(
                  child: Text('User Post is not Available.', style: TextStyle(color: primary, fontWeight: FontWeight.w500, fontSize: 16,)
          )),
    ));
  }
}
