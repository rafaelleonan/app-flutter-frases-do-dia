import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _frases = [
    "Sou apenas um pequeno planeta que se perde diariamente em todo o seu universo.",
    "Novas amizades serão sempre bem-vindas para darem cor e alegria ao meu dia a dia.",
    "Gratidão não é pagamento, mas um reconhecimento que se demonstra no dia a dia.",
    "Nem toda mudança importante acontece de repente e faz barulho, algumas são silenciosas e vão se fazendo no dia a dia."
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase(){
    var numeroSorteado = Random().nextInt( _frases.length );
    setState(() {
      _fraseGerada = _frases[ numeroSorteado ];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          //width: double.infinity,
          /*decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.amber)
          ),*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/logo.png"),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green),
                ),
                onPressed: _gerarFrase,
                child: const Text(
                  "Nova Frase",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
