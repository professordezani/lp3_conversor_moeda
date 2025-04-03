// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(ConversorApp());

class ConversorApp extends StatelessWidget {

  var txtReais = TextEditingController();
  var txtDolares = TextEditingController();

  void converter() async {

    // obtém a cotação do dolar via API
    var url = 'https://economia.awesomeapi.com.br/json/last/USD-BRL';
    var response = await http.get(Uri.parse(url));
    var dados = json.decode(response.body);
    double cotacao = double.parse(dados["USDBRL"]["bid"]);

    // calcula o valor a partir da cotação
    double reais = double.parse(txtReais.text);
    double resultado = reais / cotacao;
    txtDolares.text = resultado.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Conversor")),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: txtReais,
                decoration: InputDecoration(
                  labelText: "Reais",
                  border: OutlineInputBorder(),
                ),
              ),
              Container(height: 10,),
              TextField(
                controller: txtDolares,
                decoration: InputDecoration(
                  labelText: "Dólar",
                  border: OutlineInputBorder(),
                ),
              ),
              Container(height: 10,),
              ElevatedButton(
                onPressed: converter,
                child: Text("Converter"),
              )
            ],
          ),
        ),
      ),
    );
  }
}