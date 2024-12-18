import 'package:clean/features/mobx/data/data_sources/remote/mobx_remote_data_source.dart';
import 'package:clean/features/mobx/data/repository/comments_repository_impl.dart';
import 'package:clean/features/mobx/domain/usecases/comments_usecases.dart';
import 'package:clean/features/mobx/presentation/mobx/comments_store.dart';
import 'package:clean/features/mobx/presentation/screens/mobx_screen.dart';
import 'package:clean/features/posts/presentation/screens/posts_screen.dart';
import 'package:clean/features/provider/data/data_sources/remote/comms_remote_data_source.dart';
import 'package:clean/features/provider/presentation/state/comms_provider.dart';
import 'package:clean/firebase_options.dart';
import 'package:clean/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('Handling a background message: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}
