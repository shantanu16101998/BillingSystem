import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/Google.dart';

class PinState extends StatefulWidget {
  const PinState({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PinPageState();
}

class PinPageState extends State<PinState> {
  final List<FocusNode> pinFocusNodes =
  List.generate(6, (index) => FocusNode());
  final List<TextEditingController> pinControllers =
  List.generate(6, (index) => TextEditingController());
  double containerHeightPercentage = 60.0;

  Future<void> _performGoogleAuth() async {
    await Google.signInWithGoogle();
  }

  @override
  void dispose() {
    for (final focusNode in pinFocusNodes) {
      focusNode.dispose();
    }
    for (final controller in pinControllers) {
      controller.dispose();
    }
    super.dispose();
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
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter PIN',
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
                  Padding(
                    padding: const EdgeInsets.only(top: 29.0),
                    // Add vertical margin here
                    child: Image.asset(
                      'assets/images/default_login_profile.png',
                      width: 130,
                      height: 130,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        6,
                            (index) => Container(
                          width: 30,
                          // Adjust the width of each digit container
                          height: 40,
                          // Adjust the height of each digit container
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2.0,
                                color: Colors.black, // Color of the dashed line
                              ),
                            ),
                          ),
                          child: Center(
                            child: TextField(
                              controller: pinControllers[index],
                              focusNode: pinFocusNodes[index],
                              keyboardType: TextInputType.number,
                              onChanged: (text) {
                                if (text.isEmpty) {
                                  // If the current box is empty, move focus to the previous box
                                  if (index > 0) {
                                    pinFocusNodes[index].unfocus();
                                    pinFocusNodes[index - 1].requestFocus();
                                  }
                                } else if (text.length == 1 && index < 5) {
                                  // If a digit is entered, move focus to the next box
                                  pinFocusNodes[index].unfocus();
                                  pinFocusNodes[index + 1].requestFocus();
                                }
                              },
                              style: const TextStyle(
                                fontSize: 24, // Adjust the font size
                                fontWeight: FontWeight.bold,
                              ),
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
                        onPressed: () {Navigator.pushNamed(context, '/home');},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text('Submit'),
                      ),
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

