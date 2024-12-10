import 'package:clean/features/users/data/data_sources/remote/remote_data_sources.dart';
import 'package:clean/features/users/domain/entities/user.dart';
import 'package:clean/core/resources/location/data_state.dart';
import 'package:clean/features/users/domain/repository/user_repository.dart';
import 'package:flutter/material.dart';

class UserRepositoryImpl extends UserRepository {
  final UsersRemoteDataSourceImlp _newsRemoteDataSource;
  UserRepositoryImpl(this._newsRemoteDataSource);

  @override
  Future<DataState<List<UserEntity>>> getUsers() async {
    try {
      var result = await _newsRemoteDataSource.getUsers();
      return DataSuccess(result);
    } on FlutterError catch (error) {
      return DataFailed(error);
    }
  }
}
