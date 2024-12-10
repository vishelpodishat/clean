import 'package:clean/features/posts/data/data_sources/remote/posts_remote_data_sources.dart';
import 'package:clean/features/posts/domain/entities/post.dart';
import 'package:clean/core/resources/location/data_state.dart';
import 'package:clean/features/posts/domain/repository/post_repository.dart';
import 'package:flutter/material.dart';

class PostRepositoryImpl extends PostRepository {
  final PostsRemoteDataSourcesImpl _postsRemoteDataSources;

  PostRepositoryImpl(this._postsRemoteDataSources);

  @override
  Future<DataState<List<PostEntity>>> getPost() async {
    try {
      var result = await _postsRemoteDataSources.getPosts();
      return DataSuccess(result);
    } on FlutterError catch (e) {
      return DataFailed(e);
    }
  }
}
