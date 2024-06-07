// import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';

import '../../../../util/utlis.dart';

class Report {
  static Future<bool?> blockConfirm(
      {required BuildContext context, required String userId}) async {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return SizedBox(
                height: 239,
                width: 377,
                child: Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Are you sure you want to block",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff563E1F)),
                          ),
                          const SizedBox(height: 3),
                          Consumer(builder: (context, ref, child) {
                            final res = ref.watch(userController(userId));
                            return res.when(
                              data: (user) {
                                return Text(
                                  "${user.username} ?",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffF39A00),
                                  ),
                                );
                              },
                              error: (error, st) {
                                return const Text(
                                  "...",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffF39A00),
                                  ),
                                );
                              },
                              loading: () {
                                return const Text(
                                  "...",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffF39A00),
                                  ),
                                );
                              },
                            );
                          }),
                          const SizedBox(height: 20),
                          Consumer(builder: (context, ref, child) {
                            return SizedBox(
                              height: 47.5,
                              width: 257.33,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE26B26),
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                ),
                                onPressed: () async {
                                  // context.popRoute();
                                  // context.popRoute();
                                  await ref
                                      .read(
                                          userController(UserPreferences.userId)
                                              .notifier)
                                      .blockUser(
                                          blockedByUserId:
                                              UserPreferences.userId,
                                          blockedUserId: userId);
                                  Navigator.pop(context, true);

                                  // ref.refresh(
                                  //     userController(UserPreferences.userId));
                                  // ref.refresh(userController(userId));
                                  Utils.farmAddedMessage(
                                          'User Block Successfully', context)
                                      .then((value) => context.popRoute());
                                },
                                child: const Text("Block"),
                              ),
                            );
                          }),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 28,
                            width: 57,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context, false);
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
