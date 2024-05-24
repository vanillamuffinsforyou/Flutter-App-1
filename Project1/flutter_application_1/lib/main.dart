import 'package:flutter/material.dart';
import 'package:flutter_application_1/Theme/Theme_provider.dart';
// import 'package:flutter_application_1/Theme/dark_mode.dart';
// import 'package:flutter_application_1/Theme/light_mode.dart';
import 'package:flutter_application_1/model/playlist_provider.dart';
import 'pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => PlaylistProvider()),
    ],
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
