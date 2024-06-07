import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';

import '../../../../global_providers.dart';
import '../../../model/social/post/comment_model.dart';
import '../../../model/social/post/post_model.dart';
import 'widgets/bottom_persist_field.dart';
import 'widgets/paged_reply.dart';

@RoutePage()
class ReplyPage extends ConsumerStatefulWidget {
  final String postId;
  final Comment comment;
  const ReplyPage({super.key, required this.postId, required this.comment});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReplyPageState();
}

class _ReplyPageState extends ConsumerState<ReplyPage> {
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
            "Replies",
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
                  Expanded(
                      child: PagedReply(
                    entityId: widget.comment.id,
                    post: posts!,
                    parentComment: widget.comment,
                  )),
                  Consumer(builder: (context, ref, child) {
                    return BottomPersistField(
                      hintText: "Write a Reply...",
                      onTap: (msg) async {
                        await ref
                            .read(perticularCommentController(widget.comment)
                                .notifier)
                            .replyOnComment(
                              reply: msg,
                              entityId: widget.comment.id,
                            );
                        // ref.read(replyListProvider(comment.id).notifier).refresh();
                        ref
                            .read(perticularPostController(posts!).notifier)
                            .increamentCommentCount();
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
