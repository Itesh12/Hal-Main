import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/controller/post/provider/create_post_page_controller.dart';

import '../../../../l10n/l10n.dart';
import 'image_placeholder.dart';
import 'video_placeholder.dart';
import 'youtube_placeholder.dart';

class CreatePostBody extends ConsumerStatefulWidget {
  const CreatePostBody({Key? key}) : super(key: key);

  @override
  _CreatePostBodyState createState() => _CreatePostBodyState();
}

class _CreatePostBodyState extends ConsumerState<CreatePostBody> {
  @override
  Widget build(BuildContext context) {
    final val = ref.watch(createPostController);
    final url = val.youtubeUrl;

    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 20.h),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 1,
              onChanged: (value) {
                final val = value.trim();
                ref.read(createPostController).changeDescription(val);
              },
              style: TextStyle(
                fontSize: 17.sp,
              ),
              textCapitalization: TextCapitalization.sentences,
              decoration:  InputDecoration(
                  fillColor: const Color(0xffF8F8F8),
                  filled: true,
                  hintText: AppLocalizations.of(context)!.whats_on_your_mind,
                  border: InputBorder.none,
                  hintStyle: const TextStyle(color: Color(0xffA6A4A4))),
            ),
            if (val.pickedImages.isNotEmpty)
              ImagePlaceholder(images: val.pickedImages),
            if (url.isNotEmpty)
              YoutubePlaceholder(
                videoURL: url,
                canEdit: true,
                onTap: () {
                  ref.read(createPostController).removeYoutube();
                },
              ),
            if (val.pickedVideo != null)
              VideoPlaceholder(video: val.pickedVideo!),
          ],
        ),
      ),
    );
  }
}
