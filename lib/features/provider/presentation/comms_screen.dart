import 'package:clean/features/provider/presentation/state/comms_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comments')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => context.read<CommentsProvider>().fetchComms(),
            child: Text('Fetch Comments'),
          ),
          Expanded(
            child: Consumer<CommentsProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (provider.errorMessage != null) {
                  return Center(
                    child: Text(
                      provider.errorMessage! as String,
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }

                if (provider.comments.isEmpty) {
                  return Center(child: Text('No comments available'));
                }

                return ListView.builder(
                  itemCount: provider.comments.length,
                  itemBuilder: (context, index) {
                    final comment = provider.comments[index];
                    return ListTile(
                      title: Text('${comment.id}'),
                      subtitle: Text(comment.body ?? ''),
                      trailing: Text(comment.email ?? ''),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
