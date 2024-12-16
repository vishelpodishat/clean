import 'package:clean/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Initializer {
  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  Future<void> firebaseInitializer() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(alert: true, badge: true, sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Уведомления разрешены');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('Уведомления временно разрешены');
    } else {
      print('Уведомления запрещены');
    }
  }

  void setupFirebaseMessaging() {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    messaging.getToken().then((token) {
      print('FCM: Token $token');
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Сообщение получено: ${message.notification?.title}");
      print("Тело: ${message.notification?.body}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Уведомление открыто: ${message.notification?.title}");
    });
  }
}
