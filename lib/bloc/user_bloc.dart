

import 'package:api_json/bloc/bloc.dart';
import 'package:api_json/models/models.dart';
import 'package:api_json/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  final AbstractUserService _service = UserService();

  UserBloc() : super(UserInitState()) {

    on<UserInitEvent>((event, emit) => UserInitState());
    on<LoadedListUserEvent>((event, emit) => _mapFetchUser(event, emit));
  }

  Future<void> _mapFetchUser(LoadedListUserEvent event, Emitter<UserState> emitter) async {

    emitter(LoadingUserState());

    try {

      List<User>? userList = await _service.fetchUser();

      if (userList.isEmpty) {
        emitter(ListUserEmptyState(message: 'A lista está vazia'));
      } else {
        emitter(FetchUserState(users: userList));
      }

    } catch(error) {
      emitter(ErrorListUserState(message: 'Erro ao carregar a lista'));
    }

  }

}