import 'package:flutter/material.dart';

import '../widgets/appBar.widget.dart';
import '../widgets/drawer.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidgets(title: 'Home'),
      drawer: drawerWidget(),
      body: Center(
        child: Text("Home", style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}
