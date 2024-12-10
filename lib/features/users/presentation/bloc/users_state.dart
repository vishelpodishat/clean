part of 'users_bloc.dart';

class UsersState extends Equatable {
  final List<UserEntity>? users;
  final FlutterError? error;
  const UsersState({this.users, this.error});

  @override
  List<Object> get props => [
        users ?? [],
        error ?? FlutterError('ERRROR'),
      ];
}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  const UsersLoadedState(List<UserEntity>? users) : super(users: users);
}

class UsersLoadFailire extends UsersState {
  const UsersLoadFailire(FlutterError error) : super(error: error);
}
