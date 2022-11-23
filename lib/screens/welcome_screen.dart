import 'package:agii_alpha/screens/screens.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              FadeIn(
                animate: true,
                duration: const Duration(seconds: 3),
                child: Center(
                  child: SizedBox(
                      width: 250,
                      height: 250,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 900),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                  pageBuilder: ((context, animation,
                                      secondaryAnimation) {
                                    return const Listview1Screen();
                                  })));
                        },
                        child: const Image(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/iconagii4.png'),
                        ),
                      )),
                ),
              ),
              FadeIn(
                  animate: true,
                  duration: const Duration(seconds: 2),
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                width: 350,
                height: 200,
                child: FadeIn(
                    animate: true,
                    duration: const Duration(seconds: 3),
                    child: const Image(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/logoumd.png'),
                    )),
              ),
            ],
          ),
        );
      }
      if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Positioned(
                child: SizedBox(
                  width: 500,
                  height: 350,
                  child: FadeIn(
                      animate: true,
                      duration: const Duration(seconds: 3),
                      child: const Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/logoumd.png'),
                      )),
                ),
              ),
              FadeIn(
                animate: true,
                duration: const Duration(seconds: 3),
                child: Center(
                  child: SizedBox(
                      width: 400,
                      height: 400,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 900),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                  pageBuilder: ((context, animation,
                                      secondaryAnimation) {
                                    return const Listview1Screen();
                                  })));
                        },
                        child: const Image(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/iconagii4.png'),
                        ),
                      )),
                ),
              ),
              FadeIn(
                  animate: true,
                  duration: const Duration(seconds: 3),
                  child: const Text(
                    'Click en el logo para comenzar',
                    style: TextStyle(fontSize: 30),
                  ))
            ],
          ),
        );
      }
      return Container(
        width: 200,
        height: 200,
        color: Colors.purple,
      );
    });
  }
}
