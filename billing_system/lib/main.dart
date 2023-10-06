import 'package:billing_system/dbHelper/MongoDatabase.dart';
import 'package:flutter/material.dart';
import 'Configs/product.dart';
import 'screens/CounterPage.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Billing System'),
    );
  }
}




