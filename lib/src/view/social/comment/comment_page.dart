import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';

import '../../../../global_providers.dart';
import '../../../model/social/post/post_model.dart';
import 'widgets/bottom_persist_field.dart';
import 'widgets/paged_comment.dart';

@RoutePage()
class CommentPage extends ConsumerStatefulWidget {
  final String postId;
  const CommentPage({super.key, required this.postId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommentPageState();
}

class _CommentPageState extends ConsumerState<CommentPage> {
  Post? posts;

  @override
  void initState() {
    super.initState();

    _getData();
  }

  Future<void> _getData() async {
    try {
      posts = await ref.read(postProvider).getPostDetail(postId: widget.postId, stalkerId: UserPreferences.userId);
      setState(() {});
    } on Exception {
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
              )),
          centerTitle: false,
          title: Text(
            "Comments",
            style: TextStyle(
              fontSize: 20.sp,
              color: const Color(0xff777777),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: posts != null
            ? Column(
                children: [
                  Expanded(child: Consumer(builder: (context, ref, child) {
                    final cntrl = ref
                        .watch(commentListProvider(widget.postId))
                        .controller;
                    return CustomScrollView(
                      controller: cntrl,
                      slivers: [
                        PagedComment(
                          entityId: posts!.postId,
                          post: posts,
                        ),
                      ],
                    );
                  })),
                  Consumer(builder: (context, ref, child) {
                    return BottomPersistField(
                      hintText: "Write a Comment...",
                      onTap: (msg) async {
                        await ref
                            .read(perticularPostController(posts!).notifier)
                            .addComment(
                              comment: msg,
                              entityId: widget.postId,
                            );
                        // ref.read(commentListProvider(post.postId).notifier).refresh();
                      },
                    );
                  }),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(
                color: Color(0xffe26b26),
              )));
  }
}
