import 'package:clean/core/resources/location/data_state.dart';
import 'package:clean/core/resources/location/usecase/usecase.dart';
import 'package:clean/features/mobx/domain/entity/comments.dart';
import 'package:clean/features/mobx/domain/repository/comments_repository.dart';

class CommentsUseCases extends UseCase<DataState<List<CommentEntity>>, void> {
  final CommentsRepository _repository;

  CommentsUseCases(this._repository);

  @override
  Future<DataState<List<CommentEntity>>> call({void params}) async {
    return await _repository.getComms();
  }
}
