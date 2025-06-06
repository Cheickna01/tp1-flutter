import 'package:flutter/material.dart';

class appBarWidgets extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const appBarWidgets({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: Colors.white)),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
