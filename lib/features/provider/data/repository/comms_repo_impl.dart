import 'package:clean/core/resources/location/data_state.dart';
import 'package:clean/features/provider/data/data_sources/remote/comms_remote_data_source.dart';
import 'package:clean/features/provider/domain/entity/comms_entity.dart';
import 'package:clean/features/provider/domain/repository/comms_repository.dart';
import 'package:flutter/material.dart';

class CommentsRepositoryImpl extends CommentsRepository {
  final CommsRemoteDataSourceImpl _commsRemoteDataSource;

  CommentsRepositoryImpl(this._commsRemoteDataSource);

  @override
  Future<DataState<List<CommentEntity>>> getComms() async {
    try {
      print("getComms");
      var result = await _commsRemoteDataSource.getComms();
      return DataSuccess(result);
    } on FlutterError catch (e) {
      return DataFailed(e);
    }
  }
}
