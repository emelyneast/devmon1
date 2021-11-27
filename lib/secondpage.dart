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
      l.ChangeNiv();
    });
  }

  int v() {
    if (l.niv == 1) {
      p.vie = 100;
    } else if (l.niv == 2) {
      p.vie = 200;
    } else if (l.niv == 3) {
      p.vie = 300;
    } else if (l.niv == 4) {
      p.vie = 400;
    } else if (l.niv == 5) {
      p.vie = 500;
    } else if (l.niv == 6) {
      p.vie = 600;
    }
    return p.vie;
  }

  Color c() {
    if (p.vie > 0) {
      if (t == 2) {
        fond = Colors.red.shade100;
      } else if (t == 1) {
        fond = Colors.red.shade200;
      } else if (t == 0) {
        fond = Colors.grey.shade100;
      }
    } else if (p.vie <= 0) {
      fond = Colors.red.shade900;
    }

    return fond;
  }

  void _at() {
    setState(() {
      t == 0;
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
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            ' je t\'attaque ',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            p.vie.toString() + 'pv',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            l.exp.toString() +
                                'px /' +
                                l.expMAx.toString() +
                                ' px',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '' + l.libelleL,
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: <Widget>[],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            p.vie.toString() + 'pv',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            l.exp.toString() +
                                'px /' +
                                l.expMAx.toString() +
                                ' px',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '' + l.libelleL,
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            ' a utilisé' + a.libelle + ' et tu perd ' + vi,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    t = 2;
                    _at();
                  },
                  child: const Text("attaque ambigous"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        niv();
                        l.nomN();
                        v();
                      },
                      child: const Text("test niv"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.red),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    t = 1;
                    _at();
                  },
                  child: const Text("attaque infini"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/route3');
                  },
                  child: const Text("Ecran 3"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
