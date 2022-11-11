import 'package:flutter/material.dart';

import 'package:agii_alpha/screens/listview1_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

//void main() => runApp(const MyApp());

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ignore: deprecated_member_use
  FlutterNativeSplash.removeAfter(initialization);

  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 2));
}

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
