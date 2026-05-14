import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class BadgesDemo extends StatelessWidget {
  const BadgesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: badges.Badge(
        badgeContent: Text('9', style: TextStyle(color: Colors.white)),
        child: Icon(Icons.notifications, size: 72),
      ),
    );
  }
}
