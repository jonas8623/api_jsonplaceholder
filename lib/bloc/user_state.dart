

import 'package:equatable/equatable.dart';

import '../models/user_model.dart';

abstract class UserState extends Equatable {

  @override
  List<Object> get props => [];
}

class UserInitState extends UserState {}

class LoadingUserState extends UserState {}

class FetchUserState extends UserState {

  final List<User>? users;

  FetchUserState({this.users});
}

class ListUserEmptyState extends UserState {

  final String message;
  ListUserEmptyState({required this.message});
}

class ErrorListUserState extends UserState {

  final String message;
  ErrorListUserState({required this.message});
}