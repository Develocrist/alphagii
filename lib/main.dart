import 'package:agii_alpha/screens/listview1_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Home(),
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
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const Listview1Screen()));
    });

    return Scaffold(
      backgroundColor: Colors.white,
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
                    delay: const Duration(seconds: 3),
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





//--------------------------
// import 'package:flutter/material.dart';

// import 'package:agii_alpha/screens/listview1_screen.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

// void main() => runApp(const MyApp());

// // Future main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   // ignore: deprecated_member_use
// //   FlutterNativeSplash.removeAfter(initialization);

// //   runApp(const MyApp());
// // }

// // Future initialization(BuildContext? context) async {
// //   await Future.delayed(const Duration(seconds: 2));
// // }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'AGII Alpha',
//         home: Listview1Screen());
//   }
// }
