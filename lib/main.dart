import 'package:agii_alpha/screens/welcome_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AGII',
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
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const WelcomeScreen()));
    });

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeIn(
                    animate: true,
                    duration: const Duration(seconds: 3),
                    child: FadeOut(
                      animate: true,
                      delay: const Duration(seconds: 4),
                      duration: const Duration(seconds: 2),
                      child: const SizedBox(
                          width: 250,
                          height: 250,
                          child: Image(
                            image: AssetImage('assets/logoulshdgrande.png'),
                          )),
                    ))
              ],
            )),
          );
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeIn(
                    animate: true,
                    duration: const Duration(seconds: 2),
                    child: FadeOut(
                      animate: true,
                      delay: const Duration(seconds: 3),
                      duration: const Duration(seconds: 3),
                      child: const SizedBox(
                          width: 400,
                          height: 400,
                          child: Image(
                            image: AssetImage('assets/logoulshdgrande.png'),
                          )),
                    ))
              ],
            )),
          );
        }
        return Container(
          width: 200,
          height: 200,
          color: Colors.purple,
        );
      },
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
