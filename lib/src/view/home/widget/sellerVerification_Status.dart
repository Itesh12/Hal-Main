import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/util/utlis.dart';

@RoutePage()
class SellerStatusPage extends ConsumerStatefulWidget {
  const SellerStatusPage({super.key});

  @override
  ConsumerState<SellerStatusPage> createState() => _SellerStatusPageState();
}

class _SellerStatusPageState extends ConsumerState<SellerStatusPage> {
  @override
  Widget build(BuildContext context) {
    final res = ref.watch(sellerStatusProvider);
    return res.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => {
                      context.router.replaceAll([const KisaanHomeRoute()])
                    },
                icon: const Icon(
                  Icons.close,
                )),
            centerTitle: true,
            title: Text(
              "Hal Saathi Verification",
              style: TextStyle(
                fontSize: 20.sp,
                color: primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Status:",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xff8c8c8c),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 26,
                      // padding: ,
                      width: 73,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(13)),
                          color: data.status == "Pending"
                              ? const Color(0xfff39a00).withOpacity(0.1)
                              : const Color(0xffff005c).withOpacity(0.1)),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          data.status,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: data.status == "Pending"
                                ? const Color(0xfff39a00)
                                : const Color(0xffdb104d),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    "Reason:",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xff9999999),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    data.rejectReason ?? "Under Review",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xff563e1f),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  33.verticalSpace,
                  Center(
                      child: data.status == "Rejected"
                          ? SizedBox(
                              height: 48,
                              width: 320,
                              child: ElevatedButton(
                                  onPressed: () => {
                                        context.router
                                            .push(const SellerVericationRoute())
                                      },
                                  child: const Text(
                                    'Re-Verify',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )),
                            )
                          : SizedBox(
                              height: 48,
                              width: 320,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffcfcfcf)),
                                  onPressed: () => {
                                        Utils.farmAddedMessage(
                                            "Your profile under review",
                                            context)
                                      },
                                  child: const Text(
                                    'Re-verify',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )),
                            ))
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => {Navigator.pop(context)},
                  icon: const Icon(
                    Icons.close,
                  )),
              centerTitle: true,
              title: Text(
                "Hal Saathi Verification",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: const Text("Hal Saathi not Apporved"));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
