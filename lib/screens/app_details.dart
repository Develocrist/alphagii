import 'package:flutter/material.dart';

//VENTANA CORRESPONDIENTE A LOS DETALLES DE LA APLICACIÓN, QUIENES PARTICIPARON, COMO SE GENERÓ Y QUE ES LO QUE HACE
//LA APLICACIÓN

class AppDetails extends StatelessWidget {
  const AppDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Acerca de",
          style: TextStyle(
            fontFamily: 'MuseoSans',
          ),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: const Color.fromRGBO(2, 102, 255, 1),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Image(
                      image: AssetImage('assets/logoulsoficial.png'),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Image(
                      image: AssetImage('assets/logofinal.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'AGII (Apoyo a la Gestión de Ingeniería en Inventarios) entrega resultados referentes a los modelos de inventarios, apoyando y validando el proceso de cálculo y comprension de las variables involucradas.\n\n Esta aplicacion dirigida a estudiantes de la Universidad de La Serena, fue desarrollada en la Unidad de Mejoramiento Docente (UMD) en un trabajo colaborativo con docentes, estudiantes de pregrado y profesionales de: \n\n - Departamento de Ingeniería Industrial. \n - Escuela de Ingeniería Civil. \n - Escuela de Diseño. \n - Carrera de Ingeniería en Computación e Informatica. \n ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontFamily: 'MuseoSans'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
