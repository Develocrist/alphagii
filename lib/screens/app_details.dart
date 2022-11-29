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
        backgroundColor: const Color.fromRGBO(2, 102, 255, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: SizedBox(
              child: Text(
                'AGII (Apoyo a la Gestión de Ingeniería en Inventarios) entrega resultados referentes a los modelos de inventarios, apoyando y validando el proceso de cálculo y comprension de las variables involucradas.\n\n Esta aplicacion dirigida a estudiantes de la Universidad de La Serena, fue desarrollada en la Unidad de Mejoramiento Docente (UMD) en un trabajo colaborativo con docentes, estudiantes de pregrado y profesionales.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
