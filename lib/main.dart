import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentIndex = 0;
  String resultado = "";

  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC", style: TextStyle(color: Colors.black)),
        elevation: 0.0,
        backgroundColor: Color(0xFFafafa),
        actions: [
          IconButton(
              icon: Icon(Icons.settings), color: Colors.black, onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                radioButtom("Homem", Colors.blue, 0),
                radioButtom("Homem", Colors.pink, 1)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Sua altura em Cm:",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              controller: alturaController,
              decoration: InputDecoration(
                  hintText: "Sua altura em Cm",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Seu peso em Kg:",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              controller: pesoController,
              decoration: InputDecoration(
                  hintText: "Seu peso em Kg",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: FlatButton(
                onPressed: () {
                  double peso = double.parse(pesoController.value.text);
                  double altura = double.parse(alturaController.value.text);
                  calcularImc(peso, altura);
                },
                color: Colors.blue,
                child: Text(
                  "Calcular",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "Seu IMC é:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "$resultado",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calcularImc(double peso, double altura){
    double resultadoFinal = peso / (altura * altura / 10000);
    String imc = resultadoFinal.toStringAsFixed(2);
    setState(() {
      resultado = imc;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget radioButtom(String value, Color color, int index) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      height: 80,
      child: FlatButton(
        color: currentIndex == index ? color : Colors.grey[200],
        child: Text(
          value,
          style: TextStyle(
            color: currentIndex == index ? Colors.white : color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: () {
          changeIndex(index);
        },
      ),
    ));
  }
}
