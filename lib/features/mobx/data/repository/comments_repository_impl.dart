import 'package:clean/features/mobx/data/data_sources/remote/mobx_remote_data_source.dart';
import 'package:clean/features/mobx/domain/entity/comments.dart';
import 'package:clean/core/resources/location/data_state.dart';
import 'package:clean/features/mobx/domain/repository/comments_repository.dart';
import 'package:flutter/material.dart';

class CommentsRepositoryImpl extends CommentsRepository {
  final MobxRemoteDataSourceImpl _commsRemoteDataSource;

  CommentsRepositoryImpl(this._commsRemoteDataSource);

  @override
  Future<DataState<List<CommentEntity>>> getComms() async {
    try {
      var result = await _commsRemoteDataSource.getComments();
      return DataSuccess(result);
    } on FlutterError catch (e) {
      return DataFailed(e);
    }
  }
}
