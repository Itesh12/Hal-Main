import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';

import '../../../../app/router/router.gr.dart';
import '../../../../constants/colors.dart';
import '../../../../model/social/post/post_model.dart';
import '../../../widget/profile_image.dart';

class CommentBottom extends StatelessWidget {
  const CommentBottom({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 10),
      child: Row(
        children: [
          ProfilePicWidget(
            url: UserPreferences.profilePic,
            size: 32,
            fizedSize: true,
          ),
          Expanded(
            child: Container(
                height: 32,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffD4DEE3)),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 10,
                        ),
                        child: TextField(
                          onSubmitted: (val) {
                            // _addComment();
                          },
                          onTap: () {
                            context
                                .pushRoute(CommentRoute(postId: post.postId));
                          },
                          readOnly: true,
                          keyboardType: TextInputType.multiline,
                          // controller: controller,
                          // focusNode: _focusNode,
                          maxLines: null,
                          // autofocus: widget.fromComment,
                          scrollPadding: EdgeInsets.zero,
                          style: const TextStyle(fontSize: 11),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isCollapsed: true,
                            hintText: 'write a comment...',
                            hintStyle: TextStyle(color: Color(0xffCACACA)),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(11, 8, 6, 8),
                    //   child: SvgPicture.asset(
                    //     'assets/images/mic.svg',
                    //     color: grey,
                    //   ),
                    // ),
                  ],
                )),
          ),
          Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: primary,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(11, 8, 7, 8),
                child: SvgPicture.asset(
                  'assets/images/send.svg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
