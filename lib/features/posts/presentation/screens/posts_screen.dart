import 'package:clean/core/resources/location/data_state.dart';
import 'package:clean/features/posts/domain/entities/post.dart';
import 'package:clean/features/posts/presentation/providers/posts_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostsScreen extends ConsumerWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postsProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Posts')),
        body: Center(
          child: postsAsyncValue.when(
            data: (dataState) {
              if (dataState is DataSuccess<List<PostEntity>>) {
                final posts = dataState.data;
                if (posts == null || posts.isEmpty) {
                  return const Center(child: Text('No posts found'));
                }
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return ListTile(
                      title: Text(post.title ?? ''),
                      leading: Text('${post.userId}'),
                      trailing: Text('${post.id}'),
                      subtitle: Text(post.body ?? ''),
                    );
                  },
                );
              }
            },
            error: (error, stack) => Center(child: Text('Error: $error')),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
