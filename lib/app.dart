import 'package:flutter/material.dart';
import 'package:flutter_project_5/screen/pick_city.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PickCity(),
    );
  }

  static of(BuildContext context) {}
}
