import 'package:flutter_riverpod/flutter_riverpod.dart';

final userFollowProvider =
    StateNotifierProvider.family<UserFollNotifier, bool, String>((ref, userId) {
  return UserFollNotifier(userId);
});

class UserFollNotifier extends StateNotifier<bool> {
  UserFollNotifier(this.userId) : super(false);

  final String userId;

  @override
  set state(bool value) => super.state = value;
}
