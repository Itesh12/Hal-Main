import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../global_providers.dart';
import '../../../app/router/router.gr.dart';
import '../../market/screens/sellproduct/widget.dart';

@RoutePage()
class MyStationSellCategoriesPage extends StatefulWidget {
  const MyStationSellCategoriesPage({Key? key}) : super(key: key);

  @override
  State<MyStationSellCategoriesPage> createState() => _MyStationSellCategoriesPageState();
}

class _MyStationSellCategoriesPageState extends State<MyStationSellCategoriesPage> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        backgroundColor: Colors.transparent,
      ),
      body:
      ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          const Text(
            "What Services do you want to sell ?",
            style: TextStyle(
                color: Color(0xff563E1F),
                fontWeight: FontWeight.w500,
                fontSize: 18,
                fontFamily: "Poppins"),
          ),
          Consumer(builder: (context, ref, child) {
            final res = ref.watch(stationSellCategoryRepoProvider('sellservices'));
            return res.when(
                data: (data) => GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 25.0,
                        mainAxisSpacing: 15.0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                         if(data[index].title=='Drone Spray') {
                           context.router
                              .push(const DroneSprayingServiceFormRoute());
                         }
                          // context.router.push( SellingItem(categoryText: data[index].title??'No Category'));
                        },
                        child: SelectSellingWidget(
                          name: data[index].title ?? 'No title',
                          image: data[index].image ?? 'no',
                          index: index,
                          currentIndex: currentIndex,
                        ),
                      );
                    }),
                error: (e, st) => Text(e.toString()),
                loading: () => const LinearProgressIndicator());
          }),
        ],
      ),
    );


  }
}

