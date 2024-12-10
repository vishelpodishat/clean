import 'package:clean/core/resources/location/data_state.dart';
import 'package:clean/core/resources/location/usecase/usecase.dart';
import 'package:clean/features/users/domain/entities/user.dart';
import 'package:clean/features/users/domain/repository/user_repository.dart';

class GetUsersUseCase implements UseCase<DataState<List<UserEntity>>, void> {
  final UserRepository _userRepository;
  GetUsersUseCase(this._userRepository);

  @override
  Future<DataState<List<UserEntity>>> call({void params}) {
    return _userRepository.getUsers();
  }
}
