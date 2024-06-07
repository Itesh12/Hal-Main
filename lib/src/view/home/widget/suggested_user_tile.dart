import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/networkImages.dart';

import '../../../l10n/l10n.dart';

class SuggestedUserTile extends StatelessWidget {
  const SuggestedUserTile({Key? key, required this.isFollowing})
      : super(key: key);
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 190,
      height: 80,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 58.h,
                width: 58.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(urlImages[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              22.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vikas Gupta',
                    style: textTheme.labelLarge,
                  ),
                  Text(
                    'asf',
                    style: textTheme.bodyMedium!
                        .copyWith(color: const Color(0xffA6A4A4)),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(83, 30)),
                child: Text(
                  isFollowing
                      ? AppLocalizations.of(context)!.follow
                      : AppLocalizations.of(context)!.follow_back,
                  softWrap: false,
                  style: textTheme.labelSmall!.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
