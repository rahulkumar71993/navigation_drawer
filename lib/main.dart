import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation_drawer/dashboard.dart';

main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NavigationDrawer Demo io',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new HomePage(),
    );
  }
}
