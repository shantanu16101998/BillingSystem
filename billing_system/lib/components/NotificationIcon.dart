import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(
          Icons.notifications,
          size: 50.0,
          color: Colors.white,
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 23.0,
            height: 23.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 20.0,
            height: 20.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF55AABB),
            ),
          ),
        ),
      ],
    );
  }
}
