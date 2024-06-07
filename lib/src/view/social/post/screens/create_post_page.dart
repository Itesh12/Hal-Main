import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/widget/profile_image.dart';

import '../../../../controller/post/provider/create_post_page_controller.dart';
import '../../../../l10n/l10n.dart';
import '../widgets/create_post_body.dart';
import '../widgets/create_post_bottom.dart';
import '../widgets/media_bottom_options.dart';

@RoutePage()
class CreatePostPage extends ConsumerStatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ConsumerState<CreatePostPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final val = ref.watch(createPostController);
    final bool hasContent = val.description.isNotEmpty ||
        val.youtubeUrl.isNotEmpty ||
        val.pickedVideo != null ||
        val.pickedImages.isNotEmpty;

    final bool noMedia = val.youtubeUrl.isEmpty &&
        val.pickedVideo == null &&
        val.pickedImages.isEmpty;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xffF8F8F8),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.create_post,
          style: const TextStyle(color: primary),
        ),
        centerTitle: false,
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 18.w),
              child: OutlinedButton(
                onPressed: hasContent
                    ? () async {
                        await ref.read(createPostController).submit(context);
                        ref.read(postListProvider).refresh(context);
                      }
                    : null,
                style: OutlinedButton.styleFrom(
                  foregroundColor: white,
                  backgroundColor: hasContent ? primary : Colors.white,
                  elevation: 0,
                  minimumSize: Size(71.w, 26),
                  shape: const StadiumBorder(),
                ),
                child: const Text("Post"),
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(22.w, 26.h, 22.w, 8.h),
              child: Row(
                children: [
                  ProfilePicWidget(
                    url: UserPreferences.profilePic,
                    size: 46,
                    fizedSize: true,
                    hasBorder: true,
                    border: Border.all(
                      width: 2,
                      color: borderGrey,
                    ),
                  ),
                  10.horizontalSpace,
                  Text(
                    UserPreferences.userName,
                    style: textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            const CreatePostBody(),
            if (MediaQuery.of(context).viewInsets.bottom == 0 && noMedia)
              const CreatePostBottom(),
            MediaBottomOption(cntxt: context),
          ],
        ),
      ),
    );
  }
}
