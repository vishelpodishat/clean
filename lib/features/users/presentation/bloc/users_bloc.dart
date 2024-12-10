import 'package:bloc/bloc.dart';
import 'package:clean/features/users/domain/entities/user.dart';
import 'package:clean/features/users/domain/usecases/get_users.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUseCase _getUsersUseCase;

  UsersBloc(this._getUsersUseCase) : super(UsersLoadingState()) {
    on<OnUserGetEvent>(getUsers);
  }

  Future<void> getUsers(event, emit) async {
    emit(UsersLoadingState());
    final result = await _getUsersUseCase.call();
    if (result.error != null) {
      emit(UsersLoadFailire(result.error ?? FlutterError('ERROR')));
    } else if (result.data != null) {
      emit(UsersLoadedState(result.data!));
    }
  }
}
