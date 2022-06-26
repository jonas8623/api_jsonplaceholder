

import 'package:api_json/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class UserInitEvent extends UserEvent {}

class LoadedListUserEvent extends UserEvent {}