import 'package:clean/core/resources/location/data_state.dart';
import 'package:clean/core/resources/location/usecase/usecase.dart';
import 'package:clean/features/provider/domain/entity/comms_entity.dart';
import 'package:clean/features/provider/domain/repository/comms_repository.dart';

class CommsUsecases with UseCase<DataState<List<CommentEntity>>, void> {
  final CommentsRepository _repository;

  CommsUsecases(this._repository);

  @override
  Future<DataState<List<CommentEntity>>> call({void params}) async {
    return await _repository.getComms();
  }
}
