import 'package:clean/core/resources/location/data_state.dart';
import 'package:clean/core/resources/location/usecase/usecase.dart';
import 'package:clean/features/posts/domain/entities/post.dart';
import 'package:clean/features/posts/domain/repository/post_repository.dart';

class GetPostsUseCase extends UseCase<DataState<List<PostEntity>>, void> {
  final PostRepository _postRepository;
  GetPostsUseCase(this._postRepository);

  @override
  Future<DataState<List<PostEntity>>> call({void params}) async {
    return _postRepository.getPost();
  }
}
