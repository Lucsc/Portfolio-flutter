import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Components/pages/home_page.dart';
import 'package:portfolio/Components/pages/profile.dart';
import 'package:portfolio/Components/pages/contact.dart';
import 'package:portfolio/Components/pages/projects.dart';


class App extends StatelessWidget {
  static const String _title = 'Area flutter';

  const App({super.key});

  @override
  Widget build(BuildContext context) => AdaptiveTheme(
    light: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
    ),
    dark: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
    ),
    initial: AdaptiveThemeMode.light,
    builder: (theme, darkTheme) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: theme,
      darkTheme: darkTheme,
      home: HomePage(),
      routes : {
        '/home' : (context) => HomePage(),
        '/profile' : (context) => Profile(),
        '/projects' : (context) => Projects(),
        '/contact' : (context) => ContactMe(),
      },
    ),
  );
}