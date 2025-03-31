import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplicativo imc",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nome = TextEditingController();
  TextEditingController altura = TextEditingController();
  TextEditingController peso = TextEditingController();
  String msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicativo IMC"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                "https://image.winudf.com/v2/image/Y29tLml3b3Jrc3lzLmltY19pY29uXzl3cWgzbGxk/icon.png?w=170&fakeurl=1",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nome,
                decoration: InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: altura,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: peso,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final imc =
                    double.parse(peso.text) /
                    (double.parse(altura.text) * double.parse(altura.text));
                print("Botão pressionado!");
                setState(() {
                  msg =
                      "Olá ${nome.text}, seu imc é: ${imc.toStringAsFixed(2)}, voce está: ${estado(imc)}";
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: const Text("Calcular"),
            ),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(msg)),
          ],
        ),
      ),
    );
  }

  String estado (double valor) {
    if (valor <= 18.5) {
      return "Magro";
    }
    else if (valor > 18.5 && valor < 24.9) {
      return "Normal";
    }
    else  {
      return "Sobrepeso";
    }
  }
}