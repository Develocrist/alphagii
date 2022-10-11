import 'package:flutter/material.dart';

import 'package:agii_alpha/screens/listview1_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AGII Alpha',
        home: Listview1Screen());
  }
}
