import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/util/download/download_pdf.dart';
import 'package:url_launcher/url_launcher.dart';

// import '../../model/farm/crop_detail.dart';
import '../../model/farm/crop_report_model.dart';
import '../../model/farm/farm_entity.dart';

final cropReportProvider = FutureProvider.family
    .autoDispose<List<CropReport>, String>((ref, cropId) async {
  final val = await ref.read(farmRepoProvider).getCropReport(cropId);

  return val;
});

final downloadProgressProvider =
    StateNotifierProvider.family<DownloadNotifier, double, String>(
        (ref, cropId) {
  return DownloadNotifier(cropId);
});

@RoutePage()
class CropReportPage extends StatelessWidget {
  const CropReportPage({super.key, required this.crop});

  final CropDetail crop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
          onPressed: () => context.popRoute(),
        ),
        title: const Text(
          "Reports",
          style: TextStyle(
            color: primary,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text(
              "Recents",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              final res = ref.watch(cropReportProvider(crop.id!));
              return res.when(
                data: (data) {
                  if (data.isNotEmpty) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return ReportTile(
                          cropReport: data[index],
                          cropTitle: crop.nameOfCrop,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const Divider(thickness: 1.5),
                      itemCount: data.length,
                    );
                  } else {
                    return const Center(child: Text("No Reports "));
                  }
                },
                error: (error, st) {
                  debugPrint(error.toString());
                  return const Center(child: Text("No Reports Available"));
                },
                loading: () => const Center(child: CircularProgressIndicator()),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class ReportTile extends StatelessWidget {
  const ReportTile(
      {super.key, required this.cropReport, required this.cropTitle});

  final CropReport cropReport;
  final String cropTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/report_doc.png",
              height: 28,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cropTitle,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          DateFormat("d MMM y").format(cropReport.createdAt),
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: grey,
                          ),
                        ),
                      ],
                    ),
                    Consumer(builder: (context, ref, child) {
                      final currentProgress =
                          ref.watch(downloadProgressProvider(cropReport.id));
                      ref.listen(downloadProgressProvider(cropReport.id),
                          (previous, next) {
                        if (next == 1.0) {
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(const SnackBar(
                                content:
                                    Text("Report Downloaded Successfully")));
                        }
                      });
                      return InkWell(
                        onTap: () async {
                          print("Downloading..");

                          await launchUrl(Uri.parse(cropReport.url));
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset('assets/images/download.svg'),
                            CircularProgressIndicator(
                              value: currentProgress,
                              strokeWidth: 2,
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
                4.verticalSpace,
              ],
            ),
          )
        ],
      ),
    );
  }
}
