import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/global_providers.dart';

import '../../../constants/colors.dart';
import '../../shimmer/post_shimmer.dart';
import '../../widget/no_item_widget.dart';
import '../widgets/bazar_all_tile.dart';

class AllBazarPage extends ConsumerStatefulWidget  {
  const AllBazarPage({Key? key}) : super(key: key);

  @override
  _AllBazarPageState createState() => _AllBazarPageState();
}

class _AllBazarPageState extends ConsumerState<AllBazarPage> {
  final List<Widget> dots = [const Icon(Icons.add)];
  int activePage = 0;
  int currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    final _bazarAllListController=ref.watch(bazarAllProductListProvider);
    final bazarAllList=_bazarAllListController.allBazarPost;



    return _bazarAllListController.isFirstLoadRunning
        ? const SliverToBoxAdapter(
      child: PostShimmer(),
    )
        : _bazarAllListController.isFirstError
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
                  _bazarAllListController.firstErrorMessage,
                  style: const TextStyle(color: redError),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_bazarAllListController.firstErrorMessage !=
                      "Session Expired...") {
                    _bazarAllListController.refresh(context);
                  } else {}
                },
                child: Text(_bazarAllListController.firstErrorMessage ==
                    "Session Expired..."
                    ? "SignIn Again"
                    : "Retry"),
              )
            ],
          ),
        ),
      ),
    )
        : bazarAllList.isNotEmpty
        ? SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          if (index == bazarAllList.length) {
            if (_bazarAllListController.isLoadMoreRunning) {
              return const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 40),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (_bazarAllListController.isLoadMoreError) {
              return Container(
                padding:
                const EdgeInsets.only(top: 30, bottom: 40),
                color: Colors.white,
                child: Center(
                  child: Text(
                    _bazarAllListController.loadMoreErrorMessage,
                    style: const TextStyle(color: redError),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          } else {
            return BazarAllTile(allBazarPost: bazarAllList[index],);
          }
        },
        childCount: bazarAllList.length + 1,
      ),
    )
        : const SliverToBoxAdapter(
      child: SizedBox(
        height: 400,
        child: NoItemWidget(
          title: "No seller",
          subTitle: "Post your first item for sell or rent",
        ),
      ),
    );
  }
}
