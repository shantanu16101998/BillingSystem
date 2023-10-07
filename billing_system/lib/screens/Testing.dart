import 'package:billing_system/services/Google.dart';
import 'package:billing_system/services/local_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricsState extends StatefulWidget {
  const BiometricsState({super.key});

  @override
  State<StatefulWidget> createState() => Biometrics();
}

class Biometrics extends State<BiometricsState> {


  Future<void> performAuth() async {
    await LocalAuth.authenticate();
  }

  Future<void> performGoogleAuth() async {
    await Google.signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: performAuth, child: const Text('test what u wanna!'))
          ],
        ),
      ),
    );
  }
}
