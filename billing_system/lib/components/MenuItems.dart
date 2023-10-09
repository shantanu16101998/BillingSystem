import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;

  const MenuItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                // Customize the text style as needed
                ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
