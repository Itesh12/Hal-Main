import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';

import '../../../model/station/listingproduct_details_model.dart';

@RoutePage()
class ListingDetailsPage extends ConsumerStatefulWidget {
  final String droneId;
  const ListingDetailsPage({super.key, required this.droneId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ListingDetailsPageState();
}

class _ListingDetailsPageState extends ConsumerState<ListingDetailsPage> {
  ListingproductDetailsModel? listingproductDetailsModel;

  @override
  void initState() {
    super.initState();

    _getData();
  }

  Future<void> _getData() async {
    final val = await ref.read(droneServiceRepoProvider).getSellerStatus();
    try {
      listingproductDetailsModel = await ref
          .read(droneServiceRepoProvider)
          .getProductDetail(sellerId: val.id, productId: widget.droneId);
      setState(() {});
      print("debug coming");
    } on Exception {
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    // final res = ref.watch(sellerListingDetailsProvider);
    // ignore: unnecessary_parenthesis
    // return res.when(data: (data) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  5.horizontalSpace,
                  const Text(
                    'Drone spraying',
                    style: TextStyle(
                        color: Color(0xff563E1F),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.verticalSpace,
              Text(
                'Service ID: ${listingproductDetailsModel?.sellingProductId}',
                style: const TextStyle(
                    color: Color(0xff000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              12.verticalSpace,
              const Text(
                'Kisan Stations',
                style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              12.verticalSpace,
              for (final selectedStation
                  in listingproductDetailsModel?.selectedStations ??
                      <SelectedStation>[])
                Row(
                  children: [
                    SvgPicture.asset('assets/images/seller_home.svg'),
                    12.horizontalSpace,
                    Flexible(
                      child: Text(
                        selectedStation.ksLocation.address,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff563E1F),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              12.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Drone Reg. No.',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600),
                  ),
                  6.verticalSpace,
                  Text(
                    '${listingproductDetailsModel?.droneRegNo}',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff563E1F),
                        fontWeight: FontWeight.w400),
                  ),
                  12.verticalSpace,
                  const Text(
                    'Drone Images',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              10.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final selectedStationImages
                      in listingproductDetailsModel?.droneImages ??
                          <SelectedStation>[])
                    Container(
                      height: 59.w,
                      width: 59.w,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(9.r)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  selectedStationImages.toString()),
                              fit: BoxFit.cover)),
                    ),
                ],
              ),
              12.verticalSpace,
              const Text(
                'Description',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff000000)),
              ),
              8.verticalSpace,
              Text(
                '${listingproductDetailsModel?.serviceDescription}',
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff563E1F)),
              ),
              130.verticalSpace,
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)), backgroundColor: const Color(0xffE26B26),
                      elevation: 5,
                      minimumSize: const Size(308, 48)),
                  child: const Text(
                    'View Responses',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //   }, error: (error, stackTrace) {
    //     return const Scaffold(body: Text("Error"));
    //   }, loading: () {
    //     return Center(child: const CircularProgressIndicator());
    //   });
    // }
  }
}
