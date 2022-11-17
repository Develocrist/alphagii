import 'package:flutter/material.dart';

class AppDetails extends StatelessWidget {
  const AppDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acerca de"),
        centerTitle: true,
        elevation: 5,
        backgroundColor: const Color.fromRGBO(8, 75, 129, 10),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: SizedBox(
              child: Text(
                'Aplicación creada por la Unidad de Mejoramiento Docente en un trabajo colaborativo con docentes, estudiantes de pregrado y profesionales.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }
}
