import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lightspeed_demo/typicode_api/models/todo.dart';
import 'package:lightspeed_demo/typicode_api/models/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  factory UserState({required Map<int, User> users, required Set<int> expandedIds, required Map<int, List<Todo>> todos}) = UserStateLoaded;
  factory UserState.loading({required Map<int, User> users, required Set<int> expandedIds, required Map<int, List<Todo>> todos}) = UserStateLoading;
}

