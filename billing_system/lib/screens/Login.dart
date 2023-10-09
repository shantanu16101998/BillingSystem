import 'package:billing_system/services/facebook.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../services/Google.dart';
import 'Password.dart';

class LoginState extends StatefulWidget {
  const LoginState({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginPage();
}

class LoginPage extends State<LoginState> {
  final TextEditingController usernameController = TextEditingController();
  double containerHeightPercentage = 60.0;
  double screenHeight = 0.0;
  double keyboardHeight = 0.0;

  Future<void> _performGoogleAuth(BuildContext context) async {
    try {
      await Google.signInWithGoogle();
      if (Google.isAuthenticated()) {
        // If authentication is successful, navigate to the homepage
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      print('Error performing Google authentication: $e');
    }
  }

  Future<void> _performFacebookAuth() async {
    await Facebook.loginWithFacebook();
  }

  @override
  Widget build(BuildContext context) {
    double visibleScreenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;

    // Calculate the container height as a percentage of the screen height
    double containerHeight =
        (visibleScreenHeight * containerHeightPercentage) / 100.0;

    // Determine if the keyboard is visible
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft, // Align text to the left
              child: Text(
                'Enter Username',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),
          Container(
            height: containerHeight,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(243, 243, 243, 1.0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 29.0),
                    child: Image.asset(
                      'assets/images/default_login_profile.png',
                      width: 130,
                      height: 130,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      width: 356,
                      child: TextField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black, // Customize the border color
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: 356,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return const PinState(); // Your PinState widget.
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(
                                    1.0, 0.0); // Slide from right to left
                                const end = Offset.zero;
                                const curve = Curves.easeInOut;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));

                                var offsetAnimation = animation.drive(tween);

                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text('Login'),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !isKeyboardVisible,
                    // Hide when the keyboard is visible
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          width: 56,
                          height: 56,
                          child: GestureDetector(
                            onTap: () {
                              _performGoogleAuth(context);
                            },
                            child: Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // Set the background color of the container
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/google_logo.jpg',
                                  width: 32,
                                  height: 32,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30, left: 30),
                          width: 56,
                          height: 56,
                          child: GestureDetector(
                            onTap: _performFacebookAuth,
                            child: Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // Set the background color of the container
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/google_logo.jpg',
                                  width: 32,
                                  height: 32,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30, left: 30),
                          width: 56,
                          height: 56,
                          child: GestureDetector(
                            onTap: () {
                              _performGoogleAuth(context);
                            },
                            child: Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // Set the background color of the container
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/google_logo.jpg',
                                  width: 32,
                                  height: 32,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
