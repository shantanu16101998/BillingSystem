import 'package:billing_system/Configs/Constants.dart';
import 'package:billing_system/components/GraphContainer.dart';
import 'package:flutter/material.dart';

import '../services/Google.dart';
import 'Password.dart';

class HomeState extends StatefulWidget {
  const HomeState({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePage();
}

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(
          Icons.notifications,
          size: 50.0, // Adjust the size of the icon as needed
          color: Colors.white, // Set the color of the icon
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 23.0, // Adjust the width of the dot as needed
            height: 23.0, // Adjust the height of the dot as needed
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black, // Set the color to #55AABB
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 20.0, // Adjust the width of the dot as needed
            height: 20.0, // Adjust the height of the dot as needed
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF55AABB), // Set the color to #55AABB
            ),
          ),
        ),
      ],
    );
  }
}

class HomePage extends State<HomeState> {
  final TextEditingController usernameController = TextEditingController();
  double containerHeightPercentage = 70.0;
  double screenHeight = 0.0;
  double keyboardHeight = 0.0;

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Colors.white,
                    size: 50,
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    const NotificationIcon(),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.logout_rounded,
                          color: Colors.white,
                          size: 50,
                        )),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 74,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft, // Align text to the left
              child: Text(
                'Overview',
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
                  const GraphContainer(),
                  const SizedBox(
                    height: 48 * figmaHeightFactor,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 356,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Bill Generate'),
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
