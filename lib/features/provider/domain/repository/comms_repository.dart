import 'package:clean/core/resources/location/data_state.dart';
import 'package:clean/features/provider/domain/entity/comms_entity.dart';

abstract class CommentsRepository {
  Future<DataState<List<CommentEntity>>> getComms();
}
