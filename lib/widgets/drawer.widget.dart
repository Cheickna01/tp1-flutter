import 'package:flutter/material.dart';
import 'package:my_first_app/widgets/drawer.header.dart';

class drawerWidget extends StatelessWidget {
  const drawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          drawerHeaderWidget(),
          ListTile(
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward),
            hoverColor: Colors.teal,
            title: Text("Home", style: Theme.of(context).textTheme.bodySmall),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/");
            },
          ),
          Divider(height: 1, color: Colors.teal),
          ListTile(
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.arrow_forward),
            hoverColor: Colors.teal,
            title: Text(
              "Counter",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/counter");
            },
          ),
          Divider(height: 1, color: Colors.teal),
          ListTile(
            leading: Icon(Icons.message),
            trailing: Icon(Icons.arrow_forward),
            hoverColor: Colors.teal,
            title: Text("Chat", style: Theme.of(context).textTheme.bodySmall),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/chat");
            },
          ),
        ],
      ),
    );
  }
}
