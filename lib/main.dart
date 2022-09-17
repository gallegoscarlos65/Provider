import 'package:flutter/material.dart';
import 'package:provider2/src/pages/tabs_page.dart';
import 'package:provider2/src/theme/tema.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: miTema,
      home: TabsPage(),
    );
  }
}