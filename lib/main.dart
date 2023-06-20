import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './layout/screen_layout.dart';
import './utilities/stock_colors.dart';
import './views/screens/loading_screen.dart';
import './views/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyArpE3pBNlDeJWcqDS0Aoog274M_AzVHOA",
        appId: "1:942247208101:web:425d6fae5afc1b59f6994c",
        messagingSenderId: "942247208101",
        projectId: "krishna-electronics-7f8e2",
        storageBucket: "krishna-electronics-7f8e2.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const KrishnaElectronics());
}

class KrishnaElectronics extends StatelessWidget {
  const KrishnaElectronics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Krishna',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: SC.background,
      ),
      home: Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> networkState) {
            if (networkState.connectionState == ConnectionState.waiting) {
              return const LoadingScreen();
            } else if (networkState.hasData) {
              // FirebaseAuth.instance.signOut();
              return const ScreenLayout();
            } else {
              return const SplashScreen();
            }
          },
        ),
      ),
    );
  }
}
