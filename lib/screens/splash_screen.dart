import 'package:agii_alpha/screens/listview1_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Listview1Screen(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const Listview1Screen()));
    });

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              FadeIn(
                  animate: true,
                  duration: const Duration(seconds: 2),
                  child: FadeOut(
                    animate: true,
                    delay: const Duration(seconds: 4),
                    duration: const Duration(seconds: 2),
                    child: const SizedBox(
                      width: 200,
                      height: 200,
                      // color: Colors.red
                      child: Image(image: AssetImage('assets/logouls.png')),
                    ),
                  )),
            ],
          )
        ],
      )),
    );
  }
}
