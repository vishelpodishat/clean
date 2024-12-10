import 'package:clean/core/resources/location/data_state.dart';
import 'package:clean/features/mobx/domain/entity/comments.dart';

abstract class CommentsRepository {
  Future<DataState<List<CommentEntity>>> getComms();
}
