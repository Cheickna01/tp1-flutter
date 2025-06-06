import 'package:flutter/material.dart';

class drawerHeaderWidget extends StatelessWidget {
  const drawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("../images/profil.jpg"),
            radius: 50,
          ),
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Theme.of(context).primaryColor],
        ),
      ),
    );
  }
}
