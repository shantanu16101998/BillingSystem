import 'package:billing_system/components/MenuItems.dart';
import 'package:flutter/material.dart';
import 'package:billing_system/Configs/Constants.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // Center horizontally
                  children: [
                    Text(
                      'Shantanu Mukherjee',
                      style: TextStyle(
                        color: figmawhite, // Use the defined constant color
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Owner',
                      style: TextStyle(
                        color: figmawhite, // Use the defined constant color
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            // Center both horizontally and vertically
            child: Column(
              children: [
                MenuItem(title: 'Profile'),
                MenuItem(title: 'Add Product'),
                MenuItem(title: 'Add Notification'),
                MenuItem(title: 'Homepage'),
                MenuItem(title: 'Bill Generate'),
                MenuItem(title: 'Payment'),
                MenuItem(title: 'Insights'),
                MenuItem(title: 'Contact Us'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
