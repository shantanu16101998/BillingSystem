import 'package:billing_system/dbHelper/MongoDatabase.dart';
import 'package:billing_system/screens/CounterPage.dart';
import 'package:billing_system/screens/Login.dart';
import 'package:billing_system/screens/Home.dart';
import 'package:billing_system/screens/Password.dart';
import 'package:billing_system/screens/Testing.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Billing System'),
      // home: const PinPage(),
      home: const LoginState(),
      routes: {
        '/login': (context) => const LoginState(),
        '/pin': (context) => const PinState(),
        '/home': (context) => const HomeState()
        // Add other routes if needed
      },
    );
  }
}
