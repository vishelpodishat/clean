import 'package:clean/features/mobx/data/data_sources/remote/mobx_remote_data_source.dart';
import 'package:clean/features/provider/data/repository/comms_repo_impl.dart';
import 'package:clean/features/mobx/domain/usecases/comments_usecases.dart';
import 'package:clean/features/mobx/presentation/mobx/comments_store.dart';
import 'package:clean/features/provider/data/data_sources/remote/comms_remote_data_source.dart';
import 'package:clean/features/provider/domain/repository/comms_repository.dart';
import 'package:clean/features/provider/domain/usecases/comms_usecases.dart';
import 'package:clean/features/provider/presentation/comms_screen.dart';
import 'package:clean/features/provider/presentation/state/comms_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CommsRemoteDataSource>(
          create: (_) => CommsRemoteDataSourceImpl(),
        ),
        ProxyProvider<CommsRemoteDataSource, CommentsRepository>(
          update: (_, remoteDataSource, __) => CommentsRepositoryImpl(remoteDataSource as CommsRemoteDataSourceImpl),
        ),
        ProxyProvider<CommentsRepository, CommsUsecases>(
          update: (_, repository, __) => CommsUsecases(repository),
        ),
        ChangeNotifierProxyProvider<CommsUsecases, CommentsProvider>(
          create: (context) => CommentsProvider(
            getCommentUseCases: context.read<CommsUsecases>(),
          ),
          update: (_, commsUseCases, previousProvider) => CommentsProvider(getCommentUseCases: commsUseCases),
        ),
      ],
      child: MaterialApp(
        title: 'Clean Architecture Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CommentsScreen(),
      ),
    );
  }
}
