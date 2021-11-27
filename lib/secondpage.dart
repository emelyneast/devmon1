import 'dart:async';
import 'package:devmon/jeux/level.dart';
import 'package:devmon/jeux/perso.dart';

import 'package:devmon/jeux/attaque.dart';

import 'package:flutter/material.dart';
import 'package:time/time.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Perso p = new Perso();
  Attaque a = new Attaque();
  Level l = new Level();
  Color fond = Colors.white;

  int t = 0;
  String vi = "";

  void niv() {
    setState(() {
      l.exp = l.exp + 100;
      l.nomN();
    });
  }

  Color c() {
    if (p.vie > 0) {
      if (t == 2) {
        fond = Colors.red.shade100;
      }
      if (t == 1) {
        fond = Colors.red.shade200;
      }
    } else {
      fond = Colors.red.shade900;
    }

    return fond;
  }

  void _at() {
    setState(() {
      if (p.vie > 0) {
        if (t == 1) {
          p.vie = p.vie + a.boucleInfini();
          vi = "-40pv";
          if (p.vie <= 0) {
            p.vie = 0;
            vi = "tu es mort";
          }
        } else if (t == 2) {
          p.vie = p.vie + a.anbigous();
          vi = "-20pv";
          if (p.vie <= 0) {
            p.vie = 0;
            vi = "tu es mort";
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: c(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'vie : ' + p.vie.toString(),
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              vi,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              '' + a.libelle,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              '' + l.exp.toString(),
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                t = 2;
                _at();
              },
              child: const Text("attaque ambigous"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.red),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                niv();
              },
              child: const Text("test niv"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.red),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                t = 1;
                _at();
              },
              child: const Text("attaque infini"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.red),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/route3');
              },
              child: const Text("Ecran 3"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
