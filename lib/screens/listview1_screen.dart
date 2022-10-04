import 'package:flutter/material.dart';

import 'calculator1_screen.dart';
import 'package:agii_alpha/screens/options_screen.dart';
import 'package:agii_alpha/screens/calculator2_screen.dart';

class Listview1Screen extends StatelessWidget {
  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("AGII"),
          centerTitle: true,
          elevation: 5,
          backgroundColor: const Color.fromRGBO(8, 75, 129, 10)),
      body: ListView(
        children: [
          ListTile(
            iconColor: const Color.fromRGBO(8, 75, 129, 10),
            leading: const Icon(Icons.calculate_outlined),
            title: const Text('Calculadora EOQ Básica'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              final route = MaterialPageRoute(
                builder: (context) => const CalculatorScreen(),
              );
              Navigator.push(context, route);
            },
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            iconColor: const Color.fromRGBO(8, 75, 129, 10),
            leading: const Icon(Icons.calculate_outlined),
            title: const Text('Calculadora EOQ con Faltante'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              final route = MaterialPageRoute(
                builder: (context) => const Calculator2Screen(),
              );
              Navigator.push(context, route);
            },
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            iconColor: const Color.fromRGBO(8, 75, 129, 10),
            leading: const Icon(Icons.engineering_outlined),
            title: const Text('Opciones'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              final route = MaterialPageRoute(
                builder: (context) => const OptionScreen(),
              );
              Navigator.push(context, route);
            },
          ),
          const Divider(
            height: 1,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.info_outline,
          size: 30,
        ),
        onPressed: () => displayDialog(context),
      ),
    );
  }
}

void displayDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          elevation: 5,
          icon: const Icon(Icons.info_outlined),
          title: const Text(
            "Información",
            textAlign: TextAlign.center,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Column(
            mainAxisSize: MainAxisSize.max,
            children: const [
              Divider(
                height: 10,
              ),
              Text(
                "Modelos de Inventario: ",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              Text(
                  'Son técnicas de administración de inventarios que proporcionan no solo las cantidades de pedidos y puntos de nuevos pedidos, sino también un calendario de cuando se necesita cada articulo y en que cantidades durante un proceso de producción.'),
              Divider(
                height: 10,
              ),
              Text(
                'Modelo EOQ: ',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              Text(
                  'El Módelo de Wilson, también denominado Sistema EOQ (Economic Order Quantity) es una de las herramientas que se utilizan para determinar el monto óptimo de pedido para un articulo de inventario. Este, tiene en cuenta los diferentes costos financieros, de operación y determina el monto de pedido que minimice los costos de inventario de la empresa.'),
              Text(''),
              Text(
                  'Para poder desarrollar el método EOQ se deben cumplir las siguientes condiciones o supuestos básicos en la empresa, de lo contrario los cálculos no se podrán llevar a cabo de forma precisa :'),
              Text(''),
              Text(
                  '1.- La demanda es conocida, independiente y sin grandes fluctuaciones a lo largo del año, por lo tanto, constante.'),
              Text(
                  '2.- El coste unitario de cada producto o compra tambien debe ser conocido y fijo.'),
              Text(
                  '3.- Los costes de almacenamiento tambien son conocidos y dependen del nivel de existencias'),
              Text(
                  '4.- No se consideran (al menos en el módelo básico) potenciales descuentos por volumen de compra o pedido.'),
              Text(
                  '5.- Los tiempos de abastecimiento y carga del proveedor se consideran tambien constantes y conocidos.'),
              Text(
                  '6.- Se toma el supuesto de que no hay roturas de stock y de que en cualquier momento se puede solicitar cualquier cantidad de producto al proveedor.'),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cerrar'))
          ],
        );
      }); //builder es un codigo que regresa un widget
}
