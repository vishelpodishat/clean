import 'package:clean/features/posts/data/data_sources/remote/posts_remote_data_sources.dart';
import 'package:clean/features/posts/data/repository/post_repository_impl.dart';
import 'package:clean/features/posts/domain/usecases/get_posts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postRemoteDataSourceProvider = Provider((ref) => PostsRemoteDataSourcesImpl());

final postRepositoryProvider = Provider((ref) {
  final remoteDataSource = ref.watch(postRemoteDataSourceProvider);
  return PostRepositoryImpl(remoteDataSource);
});

final getPostsUseCaseProvider = Provider((ref) {
  final repository = ref.watch(postRepositoryProvider);
  return GetPostsUseCase(repository);
});

final postsProvider = FutureProvider((ref) async {
  final getPostsUseCase = ref.watch(getPostsUseCaseProvider);
  return getPostsUseCase();
});
