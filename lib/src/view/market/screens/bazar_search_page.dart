import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global_providers.dart';
import '../../../constants/colors.dart';
import '../../../util/search_bar.dart';
import '../../shimmer/comment_shimmer.dart';
import '../../widget/no_item_widget.dart';
import '../widgets/bazar_all_tile.dart';


@RoutePage()
class BazarSearchPage extends ConsumerStatefulWidget {
  const BazarSearchPage({Key? key}) : super(key: key);

  @override
  _BazarSearchPageState createState() => _BazarSearchPageState();
}

class _BazarSearchPageState extends ConsumerState<BazarSearchPage> {
  final TextEditingController _searchTextController = TextEditingController();
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Consumer(builder: (context, ref, child) {
            final _searchUserController =
            ref.watch(searchBazarProductProvider(searchQuery));
            final productList = _searchUserController.searchProducts;
            return Column(
              children: [
                Hero(
                    tag: 'abcd',
                    child: Material(
                        child: searchbar(
                            textEditingController: _searchTextController,
                            fillcolor: Colors.white,
                            hintText: 'Search',
                            onchanged: (t) async {
                              searchQuery = t;
                              _searchUserController.refresh();
                            }))
                ),
                15.verticalSpace,
                if (_searchUserController.isFirstLoadRunning)
                  const CommentShimmer()
                else
                  _searchUserController.isFirstError
                      ? const Text(
                  'enter product to search'
                  )
                      : productList.isNotEmpty
                      ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: productList.length ,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index == productList.length) {
                          if (_searchUserController
                              .isLoadMoreRunning) {
                            return const Padding(
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 40),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else if (_searchUserController
                              .isLoadMoreRunning) {
                            return Container(
                              padding: const EdgeInsets.only(
                                  top: 30, bottom: 40),
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  _searchUserController
                                      .loadMoreErrorMessage,
                                  style: const TextStyle(
                                      color: redError),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        } else {
                          return BazarAllTile(allBazarPost: productList[index]);
                        }
                      })
                      : const SizedBox(
                    height: 400,
                    child: NoItemWidget(
                      title: "No resilts",
                      subTitle: "No Product to sell or rent found",
                    ),
                  ),
                43.verticalSpace,
                // Align(
                //     alignment: Alignment.bottomLeft,
                //     child: Text(
                //       AppLocalizations.of(context)!.discover_more,
                //       style: textTheme.titleSmall,
                //     )),
                // Wrap(
                //   children: const [
                //     DiscoverMoreTiles(
                //       title: 'Wheat',
                //     ),
                //     DiscoverMoreTiles(
                //       title: 'Rice',
                //     ),
                //     DiscoverMoreTiles(
                //       title: 'Tomato',
                //     ),
                //     DiscoverMoreTiles(
                //       title: 'Tractors',
                //     ),
                //     DiscoverMoreTiles(
                //       title: 'Cultivators',
                //     ),
                //   ],
                // )
              ],
            );
          }),
        ),
      )
    );
  }
}


// Column(
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(
// vertical: 15.0, horizontal: 15),
// child: Hero(
// tag: 'bazar',
// child: Material(
// child: searchbar(
// textEditingController: searchController,
// fillcolor: const Color(0xffF4F4F4),
// hintText: 'Search Product Name...',
// onchanged: (S) {
// return null;
// }),
// ),
// ),
// )
// ],
// ),