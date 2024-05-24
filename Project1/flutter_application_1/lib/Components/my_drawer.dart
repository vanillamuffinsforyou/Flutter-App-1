import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(children: [
        //logo
        DrawerHeader(
          child: Center(
            child: Icon(
              Icons.music_note,
              size: 40,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
        //home tile
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 0),
          child: ListTile(
            title: const Text(" H o m e "),
            // textColor:Colors.grey.shade200,
            // iconColor:Colors.grey.shade200,
            textColor: Theme.of(context).colorScheme.inversePrimary,
            iconColor: Theme.of(context).colorScheme.inversePrimary,
            leading: const Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 0),
          child: ListTile(
            title: const Text(" S e t t i n g s "),
          
            textColor: Theme.of(context).colorScheme.inversePrimary,
            iconColor: Theme.of(context).colorScheme.inversePrimary,

            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
            }
          ),
        ),
      ]),
    );
  }
}
