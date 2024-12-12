import 'package:clean/features/mobx/data/data_sources/remote/mobx_remote_data_source.dart';
import 'package:clean/features/mobx/data/repository/comments_repository_impl.dart';
import 'package:clean/features/mobx/domain/usecases/comments_usecases.dart';
import 'package:clean/features/mobx/presentation/mobx/comments_store.dart';
import 'package:clean/features/mobx/presentation/screens/mobx_screen.dart';
import 'package:clean/features/posts/presentation/screens/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  final dataSourceImpl = MobxRemoteDataSourceImpl();
  final repository = CommentsRepositoryImpl(dataSourceImpl);
  final commentsStore = CommentsStore(CommentsUseCases(repository));

  // Run the app with the store
  runApp(CommentsScreen(commentsStore: commentsStore));
}
