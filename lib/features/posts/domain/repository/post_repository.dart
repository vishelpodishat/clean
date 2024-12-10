import 'package:clean/core/resources/location/data_state.dart';
import 'package:clean/features/posts/domain/entities/post.dart';

abstract class PostRepository {
  Future<DataState<List<PostEntity>>> getPost();
}
