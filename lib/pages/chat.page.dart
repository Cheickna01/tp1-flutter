import 'package:flutter/material.dart';
import 'package:my_first_app/widgets/appBar.widget.dart';

import '../widgets/drawer.widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidgets(title: "Chat"),
      drawer: drawerWidget(),
      body: Center(
        child: Text("Chat", style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}
