import 'package:clean/core/resources/location/data_state.dart';
import 'package:clean/features/users/domain/entities/user.dart';

abstract class UserRepository {
  Future<DataState<List<UserEntity>>> getUsers();
}
