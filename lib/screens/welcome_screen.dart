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
          body: MediaQuery.of(context).orientation == Orientation.portrait
              ? Column(
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
                            width: 240,
                            height: 240,
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
                                image: AssetImage('assets/logofinal.png'),
                              ),
                            )),
                      ),
                    ),
                    FadeIn(
                      animate: true,
                      duration: const Duration(seconds: 2),
                      child: const Text(
                        'Comencemos',
                        style: TextStyle(
                          fontFamily: 'MuseoSans',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    SizedBox(
                      width: 220,
                      height: 70,
                      child: FadeIn(
                          animate: true,
                          duration: const Duration(seconds: 3),
                          child: const Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/logoumdoficial2.png'),
                          )),
                    ),
                  ],
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeIn(
                          animate: true,
                          duration: const Duration(seconds: 3),
                          child: Center(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 240,
                                  height: 240,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          PageRouteBuilder(
                                              transitionDuration:
                                                  const Duration(
                                                      milliseconds: 900),
                                              transitionsBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) {
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
                                      image: AssetImage('assets/logofinal.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        SizedBox(
                          width: 220,
                          height: 70,
                          child: FadeIn(
                              animate: true,
                              duration: const Duration(seconds: 3),
                              child: const Image(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/logoumdoficial2.png'),
                              )),
                        ),
                      ],
                    ),
                    FadeIn(
                      animate: true,
                      duration: const Duration(seconds: 2),
                      child: const Text(
                        'Comencemos',
                        style: TextStyle(
                          fontFamily: 'MuseoSans',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
        );
      }
      if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: MediaQuery.of(context).orientation == Orientation.portrait
              ? Column(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    GestureDetector(
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
                                pageBuilder:
                                    ((context, animation, secondaryAnimation) {
                                  return const Listview1Screen();
                                })));
                      },
                      child: SizedBox(
                        width: 500,
                        height: 500,
                        child: FadeIn(
                            animate: true,
                            duration: const Duration(seconds: 3),
                            child: const Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/logofinal.png'),
                            )),
                      ),
                    ),
                    FadeIn(
                      animate: true,
                      duration: const Duration(seconds: 3),
                      child: const Text(
                        'Comencemos',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 300,
                    ),
                    FadeIn(
                      animate: true,
                      duration: const Duration(seconds: 3),
                      child: const Center(
                        child: SizedBox(
                            width: 400,
                            height: 130,
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/logoumdoficial2.png'),
                            )),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    FadeIn(
                      animate: true,
                      duration: const Duration(seconds: 3),
                      child: const Center(
                        child: SizedBox(
                            width: 400,
                            height: 130,
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/logoumdoficial2.png'),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
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
                                pageBuilder:
                                    ((context, animation, secondaryAnimation) {
                                  return const Listview1Screen();
                                })));
                      },
                      child: SizedBox(
                        width: 500,
                        height: 500,
                        child: FadeIn(
                            animate: true,
                            duration: const Duration(seconds: 3),
                            child: const Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/logofinal.png'),
                            )),
                      ),
                    ),
                    FadeIn(
                      animate: true,
                      duration: const Duration(seconds: 3),
                      child: const Text(
                        'Comencemos',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
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
