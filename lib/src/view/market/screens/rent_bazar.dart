import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../global_providers.dart';
import '../../../constants/colors.dart';
import '../../shimmer/post_shimmer.dart';
import '../../widget/no_item_widget.dart';
import '../widgets/bazar_all_tile.dart';

class RentBazarPage extends ConsumerStatefulWidget {
  const RentBazarPage({Key? key}) : super(key: key);

  @override
  _RentBazarPageState createState() => _RentBazarPageState();
}

class _RentBazarPageState extends ConsumerState<RentBazarPage> {
  final List<Widget> dots = [const Icon(Icons.add)];
  int activePage = 0;
  int currentIndex = 0;

 @override
  Widget build(BuildContext context) {
    final _bazarRentListController = ref.watch(bazarRentProductListProvider);
    final bazarRentList = _bazarRentListController.allBazarPost;

    if (_bazarRentListController.isFirstLoadRunning) {
      return const SliverToBoxAdapter(
      child: PostShimmer(),
    );
    } else {
      return _bazarRentListController.isFirstError
        ? SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(top: 30, bottom: 40),
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  _bazarRentListController.firstErrorMessage,
                  style: const TextStyle(color: redError),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_bazarRentListController.firstErrorMessage !=
                      "Session Expired...") {
                    _bazarRentListController.refresh(context);
                  } else {}
                },
                child: Text(
                    _bazarRentListController.firstErrorMessage ==
                        "Session Expired..."
                        ? "SignIn Again"
                        : "Retry"),
              )
            ],
          ),
        ),
      ),
    )
        : bazarRentList.isNotEmpty
        ? SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          if (index == bazarRentList.length) {
            if (_bazarRentListController.isLoadMoreRunning) {
              return const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 40),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (_bazarRentListController.isLoadMoreError) {
              return Container(
                padding:
                const EdgeInsets.only(top: 30, bottom: 40),
                color: Colors.white,
                child: Center(
                  child: Text(
                    _bazarRentListController.loadMoreErrorMessage,
                    style: const TextStyle(color: redError),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          } else {
            return BazarAllTile(
              allBazarPost: bazarRentList[index],

            );
          }
        },
        childCount: bazarRentList.length + 1,
      ),
    )
        : const SliverToBoxAdapter(
      child: SizedBox(
        height: 400,
        child: NoItemWidget(
          title: "No Renter",
          subTitle: "post your item for rent",
        ),
      ),
    );
    }
  }


}


// @override
// Widget build(BuildContext context) {
//   return ListView(
//     padding: const EdgeInsets.only(bottom: 20),
//     children: [
//       SizedBox(
//         height: 80,
//         child: ListView.separated(
//           itemCount: 6,
//           scrollDirection: Axis.horizontal,
//           physics: const ClampingScrollPhysics(),
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           itemBuilder: (BuildContext context, int index) => GestureDetector(
//               behavior: HitTestBehavior.translucent,
//               onTap: () {
//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//               child: ItemSelectorList(
//                 currentIndex: currentIndex,
//                 index: index,
//               )),
//           separatorBuilder: (BuildContext context, int index) =>
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 5),
//           ),
//         ),
//       ),
//       const SizedBox(
//         height: 20,
//       ),
//       GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 20.0,
//               mainAxisSpacing: 15.0),
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: 4,
//           shrinkWrap: true,
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           itemBuilder: (BuildContext ctx, index) {
//             return const RentCard();
//           }),
//       const SizedBox(
//         height: 20,
//       ),
//       CarouselSlider.builder(
//         itemCount: 5,
//         options: CarouselOptions(
//             height: 301.h,
//             enlargeCenterPage: true,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 activePage = index;
//               });
//             }),
//         itemBuilder: (BuildContext context, index, i) {
//           return ClipRRect(
//             borderRadius: BorderRadius.circular(10.sp),
//             child: InkWell(
//               onTap: () {},
//               child: Container(
//                   width: 311.w,
//                   height: 100.h,
//                   // height: 183.h,
//                   // margin: EdgeInsets.symmetric(horizontal: 5.0),
//                   decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         // colorFilter: new ColorFilter.mode(Colors.black.withOpacity(1.0), BlendMode.softLight),
//                           image: NetworkImage(
//                               "https://st.depositphotos.com/1033604/2008/i/450/depositphotos_20087015-stock-photo-sunlit-young-corn-plants.jpg"),
//                           fit: BoxFit.cover)),
//                   child: Stack(children: [
//                     // Image.asset(image??'fdsa',scale: 2,),
//                     Opacity(
//                       opacity: 0.5,
//                       child: Container(
//                         decoration: const BoxDecoration(
//                             gradient: LinearGradient(
//                               begin: Alignment.topRight,
//                               end: Alignment.bottomRight,
//                               colors: [
//                                 Colors.black,
//                                 Colors.transparent,
//                                 Colors.black,
//                               ],
//                             )),
//                       ),
//                     ),
//                     // Image.asset(image??'null',fit: BoxFit.cover,),
//                     if (activePage == 0)
//                       Padding(
//                         padding:
//                         const EdgeInsets.only(left: 25.0, bottom: 25),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Spacer(),
//                             const Text(
//                               "All grains",
//                               style: TextStyle(
//                                   fontSize: 13,
//                                   fontFamily: "Poppins",
//                                   color: Color(0xffFFFFFF),
//                                   fontWeight: FontWeight.w500),
//                             ),
//                             const Text(
//                               "Newest Products",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontFamily: "Poppins",
//                                   color: Color(0xffFFFFFF),
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 30, vertical: 10),
//                               margin: const EdgeInsets.only(top: 10),
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: const Color(0xffE26B26)),
//                               child: const Text(
//                                 "View all",
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontFamily: "Poppins",
//                                     color: Color(0xffFFFFFF),
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                   ])),
//             ),
//           );
//         },
//       ),
//       20.verticalSpace,
//       Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List<Widget>.generate(6, (index) {
//             return Container(
//               margin: const EdgeInsets.all(3),
//               width: 7,
//               height: 7,
//               decoration: BoxDecoration(
//                 color:
//                 activePage == index ? primary : const Color(0xffC6C6C6),
//                 shape: BoxShape.circle,
//               ),
//             );
//           })),
//       const SizedBox(
//         height: 20,
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [
//                 Text(
//                   "Mandi Rates near your area",
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontFamily: "Poppins",
//                       color: Color(0xff563E1F),
//                       fontWeight: FontWeight.w600),
//                 ),
//                 Text(
//                   "See More",
//                   style: TextStyle(
//                       fontSize: 11,
//                       fontFamily: "Poppins",
//                       color: Color(0xffE26B26),
//                       fontWeight: FontWeight.w600),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 260,
//             child: ListView.separated(
//               itemCount: 6,
//               scrollDirection: Axis.horizontal,
//               physics: const ClampingScrollPhysics(),
//               padding:
//               const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//               itemBuilder: (BuildContext context, int index) =>
//               const RateCard(
//                 name: 'Potato',
//                 image:
//                 'https://cdn.pixabay.com/photo/2014/08/06/20/32/potatoes-411975__480.jpg',
//                 highest: '54 Rs/kg',
//                 lowest: '24 Rs/kg',
//               ),
//               separatorBuilder: (BuildContext context, int index) =>
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 5),
//               ),
//             ),
//           ),
//         ],
//       ),
//       const SizedBox(
//         height: 20,
//       ),
//       GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 20.0,
//               mainAxisSpacing: 15.0),
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: 6,
//           shrinkWrap: true,
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           itemBuilder: (BuildContext ctx, index) {
//             return const RentCard();
//           }),
//       const SizedBox(
//         height: 20,
//       ),
//     ],
//   );
// }