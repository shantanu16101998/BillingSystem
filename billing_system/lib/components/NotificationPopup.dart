import 'package:billing_system/Configs/Constants.dart';
import 'package:flutter/material.dart';
import 'package:billing_system/components/NotificationIcon.dart';

class NotificationPopup extends StatelessWidget {
  const NotificationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: figmawhite,
      offset: const Offset(0, 50), // Adjust the offset here
      onSelected: (value) {
        // Handle the selected menu item here
        if (value == 'menuItem1') {
          // Handle menuItem1
        } else if (value == 'menuItem2') {
          // Handle menuItem2
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
            value: 'menuItem1',
            child: Center(
              child: Text('Bill for customer XXX is generated'),
            )),
        const PopupMenuItem<String>(
            value: 'menuItem2',
            child: Center(
              child: Text('Bill for customer YYY is generated'),
            )),
        PopupMenuItem<String>(
            value: 'menuItem2',
            child: Center(
                child: Container(
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
                  )),
            ))),
      ],
      child: const NotificationIcon(),
    );
  }
}
