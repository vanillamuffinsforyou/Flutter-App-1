import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Theme/Theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' S e t t i n g s '),
      ),
      body: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(25),
          child: Row(
            children: [
              // mainAxisAlignment: MainAxisAlignment.spaceBetween
              const Text(" P i n k  M o d e",
                  style: TextStyle(fontWeight: FontWeight.normal)),
              CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: false)
                      .isDarkMode,
                  onChanged: (value) =>
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme())
            ],
          )),
    );
  }
}
