import 'package:clean/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class Initializer {
  Future<void> firebaseInitializer() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
