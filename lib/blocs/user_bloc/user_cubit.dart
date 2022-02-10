import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightspeed_demo/typicode_api/typicode_handler.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final TypicodeApiHandler handler = TypicodeApiHandler();

  UserCubit() : super(UserState.loading(users: {}, expandedIds: {})) {
    _getUserData();
  }

  _getUserData() async {
    var users = await handler.users();
    if (users.isNotEmpty) {
      emit(UserState(users: users, expandedIds: {}));
    }
  }
}
