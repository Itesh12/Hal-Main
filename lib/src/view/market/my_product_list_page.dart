import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/view/market/widgets/my_product_tile.dart';

import '../../constants/colors.dart';
import '../shimmer/post_shimmer.dart';
import '../widget/no_item_widget.dart';



class MyProductListPage extends ConsumerStatefulWidget  {
  const MyProductListPage( {Key? key,required this.userId,}) : super(key: key);

  final String userId;

  @override
  _MyProductListPage createState() => _MyProductListPage();
}

class _MyProductListPage extends ConsumerState<MyProductListPage> {
  final List<Widget> dots = [const Icon(Icons.add)];
  int activePage = 0;
  int currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    final _myProducttListController = ref.watch(getMyProductProvider(widget.userId));



    final list =_myProducttListController.myProducts;

    final myProductList = [];

    for (final element in list) {
      if(element.status != "Pending"){
        if(element.status != "Rejected"){
          myProductList.add(element);
        }
      }
    }

    return _myProducttListController.isFirstLoadRunning
        ? const SliverToBoxAdapter(
      child: PostShimmer(),
    )
        : _myProducttListController.isFirstError
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
                  _myProducttListController.firstErrorMessage,
                  style: const TextStyle(color: redError),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_myProducttListController.firstErrorMessage !=
                      "Session Expired...") {
                    _myProducttListController.refresh(context);
                  } else {}
                },
                child: Text(_myProducttListController.firstErrorMessage ==
                    "Session Expired..."
                    ? "SignIn Again"
                    : "Retry"),
              )
            ],
          ),
        ),
      ),
    )
        : myProductList.isNotEmpty
        ? SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {

          if (index == myProductList.length) {
            if (_myProducttListController.isLoadMoreRunning) {
              return const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 40),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (_myProducttListController.isLoadMoreError) {
              return Container(
                padding:
                const EdgeInsets.only(top: 30, bottom: 40),
                color: Colors.white,
                child: Center(
                  child: Text(
                    _myProducttListController.loadMoreErrorMessage,
                    style: const TextStyle(color: redError),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          } else {
            return MyProductTile(allBazarPost: myProductList[index],);
          }
        },
        childCount: myProductList.length + 1,
      ),
    )
        : const SliverToBoxAdapter(
      child: SizedBox(
        height: 400,
        child: NoItemWidget(
          title: "No Products",
          subTitle: "Post your first item for sell or rent",
        ),
      ),
    );

  }
}
