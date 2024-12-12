import 'package:clean/features/mobx/presentation/mobx/comments_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CommentsScreen extends StatelessWidget {
  final CommentsStore commentsStore;

  const CommentsScreen({super.key, required this.commentsStore});

  @override
  Widget build(BuildContext context) {
    final commentsObservareStore = context.read<CommentsStore>;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Comments')),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () => commentsStore.fetchComms(),
              child: const Text('Fetch Comments'),
            ),
            Observer(
              builder: (_) {
                if (commentsStore.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (commentsStore.errorMessage != null) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Error: ${commentsStore.errorMessage}',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                return Expanded(
                  child: Observer(
                    builder: (_) {
                      if (commentsStore.isCommentsEmpty) {
                        return Center(child: Text('No comments available.'));
                      }

                      return ListView.builder(
                        itemCount: commentsStore.comments.length,
                        itemBuilder: (context, index) {
                          final comment = commentsStore.comments[index];
                          return ListTile(
                            title: Text('${comment.id}'),
                            subtitle: Text(comment.body ?? ''),
                            leading: Text('${comment.postId}'),
                            trailing: Text('${comment.email}'),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
