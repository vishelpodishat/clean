import 'package:clean/features/mobx/presentation/mobx/comments_store.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CommentsScreen extends StatefulWidget {
  final CommentsStore commentsStore;

  const CommentsScreen({super.key, required this.commentsStore});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _requestPermission();
    _setupFirebaseMessaging();
  }

  void _setupFirebaseMessaging() async {
    _requestPermission();
    // Получение FCM токена
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      String? apnsToken = await _firebaseMessaging.getAPNSToken();
      print('APNS Token: $apnsToken');
    }

    // Обработка уведомлений, полученных, пока приложение работает
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received message: ${message.notification?.title}');
    });
  }

  void _requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Notification permissions granted');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('Provisional notification permissions granted');
    } else {
      print('Notification permissions not granted');
    }
  }

  @override
  Widget build(BuildContext context) {
    final commentsObservareStore = context.read<CommentsStore>;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Comments')),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () => widget.commentsStore.fetchComms(),
              child: const Text('Fetch Comments'),
            ),
            Observer(
              builder: (_) {
                if (widget.commentsStore.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (widget.commentsStore.errorMessage != null) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Error: ${widget.commentsStore.errorMessage}',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                return Expanded(
                  child: Observer(
                    builder: (_) {
                      if (widget.commentsStore.isCommentsEmpty) {
                        return Center(child: Text('No comments available.'));
                      }

                      return ListView.builder(
                        itemCount: widget.commentsStore.comments.length,
                        itemBuilder: (context, index) {
                          final comment = widget.commentsStore.comments[index];
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
