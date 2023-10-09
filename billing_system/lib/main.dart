import 'package:billing_system/dbHelper/MongoDatabase.dart';
import 'package:billing_system/screens/CounterPage.dart';
import 'package:billing_system/screens/Login.dart';
import 'package:billing_system/screens/Home.dart';
import 'package:billing_system/screens/Password.dart';
import 'package:billing_system/services/Google.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await MongoDatabase.connect();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});



  String initialRoute = Google.isAuthenticated() ? '/home' : '/login';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => const LoginState(),
        '/pin': (context) => const PinState(),
        '/home': (context) => const HomeState()
        // Add other routes if needed
      },
    );
  }
}
