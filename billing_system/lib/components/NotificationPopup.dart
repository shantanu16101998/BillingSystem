import 'package:flutter/material.dart';
import 'package:billing_system/components/NotificationIcon.dart';

class NotificationPopup extends StatelessWidget {
  const NotificationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
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
          child: Text('Menu Item 1'),
        ),
        const PopupMenuItem<String>(
          value: 'menuItem2',
          child: Text('Menu Item 2'),
        ),
      ],
      child: NotificationIcon(),
    );
  }
}
