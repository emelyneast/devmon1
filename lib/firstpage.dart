import 'package:devmon/jeux/perso.dart';

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController textFieldController = TextEditingController();
  Perso p = new Perso();
  String n = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Entrez votre nom :',
              style: TextStyle(
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: "Zone de saisie", labelText: "Label"),

              onSubmitted: (value) {
                setState(() {
                  this.p.nom = value;
                });
              },

              //controller: _contoller,
            ),
            const Padding(padding: EdgeInsets.only(top: 50)),
            Text(
              'Bienvenu :' + this.p.nom,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(p.affiche()),
            const Padding(padding: EdgeInsets.only(bottom: 25)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/route2');
                },
                child: const Text("Ecran 2"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red))),
          ],
        ),
      ),
    );
  }
}
