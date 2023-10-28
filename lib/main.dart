import 'package:flutter/material.dart';

void main() {
  runApp(Calculadora());
}

class Calculadora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora",
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String operacion = 'Suma';
  String Resultado = '';
  TextEditingController ctrlNum1 = TextEditingController();
  TextEditingController ctrlNum2 = TextEditingController();

  void Calcular() {
    double num1 = double.parse(ctrlNum1.text);
    double num2 = double.parse(ctrlNum2.text);
    double resultado;
    switch (operacion) {
      case 'Suma':
        resultado = num1 + num2;
        break;
      case 'Resta':
        resultado = num1 - num2;
        break;
      case 'Multiplicacion':
        resultado = num1 * num2;
        break;
      case 'Division':
        resultado = num1 / num2;
        break;
      default:
        resultado = 0;
    }
    setState(() {
      Resultado = 'Resultado: $resultado';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Operaciones Artimeticas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: ctrlNum1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Primer Numero"),
            ),
            TextField(
              controller: ctrlNum2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Segundo Numero"),
            ),
            DropdownButton<String>(
              value: operacion,
              onChanged: (String? nuevoValor) {
                setState(() {
                  operacion = nuevoValor!;
                });
              },
              items: <String>['Suma', 'Resta', 'Multiplicacion', 'Division']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: Calcular,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 20),
            Text(Resultado),
          ],
        ),
      ),
    );
  }
}
