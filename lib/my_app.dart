import 'package:clean/features/mobx/data/data_sources/remote/mobx_remote_data_source.dart';
import 'package:clean/features/mobx/data/repository/comments_repository_impl.dart';
import 'package:clean/features/mobx/domain/usecases/comments_usecases.dart';
import 'package:clean/features/mobx/presentation/mobx/comments_store.dart';
import 'package:clean/features/mobx/presentation/screens/mobx_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final MobxRemoteDataSourceImpl dataSourceImpl;
  final CommentsRepositoryImpl repository;
  final CommentsStore commentsStore;

  MyApp({super.key})
      : dataSourceImpl = MobxRemoteDataSourceImpl(),
        repository = CommentsRepositoryImpl(MobxRemoteDataSourceImpl()),
        commentsStore = CommentsStore(CommentsUseCases(CommentsRepositoryImpl(MobxRemoteDataSourceImpl())));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CommentsScreen(commentsStore: commentsStore),
    );
  }
}
