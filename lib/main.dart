// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(ConversorApp());
}

class ConversorApp extends StatelessWidget {

  void converter() {}

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
                decoration: InputDecoration(
                  labelText: "Reais",
                  border: OutlineInputBorder(),
                ),
              ),
              Container(height: 10,),
              TextField(
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