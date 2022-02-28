import 'dart:async';
import 'package:devmon/jeux/ennemy.dart';
import 'package:devmon/jeux/level.dart';
import 'package:devmon/jeux/perso.dart';
import 'dart:math';

import 'package:devmon/jeux/attaque.dart';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Perso p = new Perso();
  Ennemy e = new Ennemy();

  Attaque a = new Attaque();
  Level l = new Level();
  Color fond = Colors.white;
  int nbNom = 0;
  Random random = new Random();

  int t = 0;
  String vi = "";
  String en = "";
  bool tour = true;
  String nomEnnemy = "";

  void mort() {
    if (p.vie <= 0) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Tes mort'),
          content: const Text('Quitter ou recommencer'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/route3'),
              child: const Text('Quitter'),
            ),
            TextButton(
              onPressed: () {
                e.at == 4;
                init();
                v();
                c();
                Navigator.pop(context, 'Recommencer');
              },
              child: const Text('Recommencer'),
            ),
          ],
        ),
      );
    } else if (e.vieE <= 0) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Ta gagner'),
          content: const Text('Continuer'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                l.exp = l.exp + 100;
                l.ChangeNiv();
                init();
                v();
                c();
                Navigator.pop(context, 'Continuer');
              },
              child: const Text('Continuer'),
            ),
          ],
        ),
      );
    }
  }

  void niv() {
    setState(() {
      if (l.niv == 1) {
        e.bts1V();
      } else if (l.niv == 2) {
        e.bts2V();
      } else if (l.niv == 3) {
        e.licenceV();
      } else if (l.niv == 4) {
        e.master1V();
      } else if (l.niv == 5) {
        e.master2V();
      } else if (l.niv == 6) {
        e.terminatorV();
      } else if (l.niv == 20) {
        e.illuV();
      }
    });
  }

  void c() {
    fond = Colors.white;
  }

  void init() {
    setState(() {
      niv();
      ennemy();
      en = "";
      vi = "";
      l.exp = l.exp;
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

  void attaqueEn() {
    setState(() {
      en = "a utilisé " + "tu perd";
      p.vie = p.vie + 1;
    });
  }

  void ter() {
    setState(() {
      e.attaque = true;
      e.terminator();
      if (tour == false) {
        if (p.vie > 0 || e.vieE > 0) {
          if (e.at == 4) {
            p.vie = p.vie + a.boucleInfini();
            en = e.nomE +
                " a utilisé " +
                a.libelle +
                " tu perd " +
                a.boucleInfini().toString() +
                "pv";
            fond = Colors.red.shade400;
            tour = true;
          } else if (e.at == 2) {
            p.vie = p.vie + a.anbigous();
            en = e.nomE +
                " a utilisé " +
                a.libelle +
                " tu perd " +
                a.anbigous().toString() +
                "pv";
            fond = Colors.red.shade200;
            tour = true;
          } else if (e.at == 3) {
            p.vie = p.vie + a.twitch();
            en = e.nomE +
                " a utilisé " +
                a.libelle +
                " tu perd " +
                a.twitch().toString() +
                "pv";
            fond = Colors.red.shade200;
            tour = true;
          } else if (e.at == 1) {
            p.vie = p.vie + a.arduino();
            en = e.nomE +
                " a utilisé " +
                a.libelle +
                " tu perd " +
                a.arduino().toString() +
                "pv";
            fond = Colors.red.shade700;
            tour = true;
          } else if (e.at == 0) {
            p.vie = p.vie + a.ciberA();
            en = e.nomE +
                " a utilisé " +
                a.libelle +
                " tu perd " +
                a.ciberA().toString() +
                "pv";
            fond = Colors.red.shade300;

            tour = true;
          } else if (e.at == 5) {
            p.vie = p.vie + a.chien();
            en = e.nomE +
                " a utilisé " +
                a.libelle +
                " tu perd " +
                a.chien().toString() +
                "pv";
            fond = Colors.red.shade300;

            tour = true;
          } else if (e.at == 6) {
            p.vie = p.vie + a.patron();
            en = e.nomE +
                " a utilisé " +
                a.libelle +
                " tu perd " +
                a.patron().toString() +
                "pv";
            fond = Colors.red.shade300;

            tour = true;
          }
          if (p.vie <= 0) {
            p.vie = 0;
            fond = Colors.red.shade900;
          }
        }
      }
    });
  }

//niv bts attaque: point virgule, ambigous, infini, twich, arduino
//niv licence: -point virgule, la meme , + spoil, veille techno, chien
//master: -ambigous, pareil, +patron
//terminator: -twich, arduino, pareil, +injectoin sql
//tout le temp: infini, twich

  String _at() {
    setState(() {
      if (tour == true) {
        t == 0;
        if (p.vie > 0 || e.vieE > 0) {
          if (t == 4) {
            e.vieE = e.vieE + a.twitch();
            vi = "tu a utilisé " +
                a.libelleE +
                " il perd " +
                a.twitch().toString() +
                "pv";
            fond = Colors.blue.shade100;
            tour = false;
          }
          if (t == 3) {
            e.vieE = e.vieE + a.boucleInfini();
            vi = "tu a utilisé " +
                a.libelleE +
                " il perd " +
                a.boucleInfini().toString() +
                "pv";
            fond = Colors.blue.shade100;
            tour = false;
          } else if (t == 2) {
            e.vieE = e.vieE + a.anbigous();
            vi = "tu a utilisé " +
                a.libelleE +
                " il perd " +
                a.anbigous().toString() +
                "pv";
            fond = Colors.blue.shade100;
            tour = false;
          } else if (t == 5) {
            e.vieE = e.vieE + a.arduino();
            vi = "tu a utilisé " +
                a.libelleE +
                " il perd " +
                a.arduino().toString() +
                "pv ";
            fond = Colors.blue.shade100;
            tour = false;
          } else if (t == 6) {
            e.vieE = e.vieE + a.ciberA();
            vi = "tu a utilisé " +
                a.libelleE +
                " il perd " +
                a.ciberA().toString() +
                "pv";
            fond = Colors.blue.shade100;
            tour = false;
          } else if (t == 5) {
            e.vieE = e.vieE + a.arduino();
            vi = "tu a utilisé " +
                a.libelleE +
                " il perd " +
                a.arduino().toString() +
                "pv";
            fond = Colors.blue.shade100;
            tour = false;
          } else if (t == 1) {
            e.vieE = e.vieE + a.pointVirgule();
            vi = "tu a utilisé " +
                a.libelleE +
                " il perd " +
                a.pointVirgule().toString() +
                "pv";
            fond = Colors.blue.shade100;
            tour = false;
          } else if (t == 7) {
            e.vieE = e.vieE + a.chien();
            vi = "tu a utilisé " +
                a.libelleE +
                " il perd " +
                a.chien().toString() +
                "pv";
            fond = Colors.blue.shade100;
            tour = false;
          } else if (t == 8) {
            e.vieE = e.vieE + a.veille();
            vi = "tu a utilisé " +
                a.libelleE +
                " il perd " +
                a.veille().toString() +
                "pv";
            fond = Colors.blue.shade100;
            tour = false;
          }
          if (e.vieE <= 0) {
            e.vieE = 0;
            fond = Colors.green.shade200;
          }
        }
      }
    });
    return vi;
  }

//ennemy si niveau bts1 a bts2 ennemy = sel, spoiler anime,streammeur
//si niv licence ennemy = le chien,veille techno, streammeur
//si  niv master ennemy = patron
// si niv terminator ennemy = sql, vax, terminator
//dieu = jeux fini quand gagne contre illuminati

  String ennemy() {
    if (l.niv >= 1 && l.niv <= 2) {
      nbNom = random.nextInt(3) + 1;
      if (nbNom == 1) {
        nomEnnemy = e.afRag();
      } else if (nbNom == 2) {
        nomEnnemy = e.afSpolier();
      } else if (nbNom == 3) {
        nomEnnemy = e.afStreammeur();
      }
    } else if (l.niv == 3) {
      nbNom = random.nextInt(4) + 1;
      if (nbNom == 1) {
        nomEnnemy = e.afChien();
      } else if (nbNom == 2) {
        nomEnnemy = e.afVeille();
      } else if (nbNom == 3) {
        nomEnnemy = e.afSpolier();
      } else {
        nomEnnemy = e.afStreammeur();
      }
    } else if (l.niv >= 4 && l.niv <= 5) {
      nbNom = random.nextInt(3) + 1;
      if (nbNom == 1) {
        nomEnnemy = e.afChien();
      } else if (nbNom == 2) {
        nomEnnemy = e.afVeille();
      } else {
        nomEnnemy = e.afPatron();
      }
    } else if (l.niv >= 6 && l.niv <= 10) {
      nbNom = random.nextInt(3) + 1;
      if (nbNom == 1) {
        nomEnnemy = e.affiche();
      } else if (nbNom == 2) {
        nomEnnemy = e.afAntiVaccin();
      } else {
        nomEnnemy = e.afMmesql();
      }
    } else if (l.niv > 10) {
      nomEnnemy = e.afIlluminati();
    }
    return nomEnnemy;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: fond,
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
                            vi,
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
                            nomEnnemy,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            e.vieE.toString() + 'pv',
                            style: Theme.of(context).textTheme.headline6,
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
                            en,
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
                    t = 1;
                    _at();
                    ter();
                    mort();
                  },
                  child: const Text("attaque infini"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.purple),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    t = 2;
                    _at();
                    ter();
                    mort();
                  },
                  child: const Text("attaque ambigous"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red),
                  ),
                ),
                Visibility(
                  child: ElevatedButton(
                    onPressed: () {
                      t = 3;
                      _at();
                      ter();
                      mort();
                    },
                    child: const Text("attaque arduino"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.green),
                    ),
                  ),
                  visible: true,
                ),
                ElevatedButton(
                  onPressed: () {
                    t = 4;
                    _at();
                    ter();
                    mort();
                  },
                  child: const Text("attaque chien"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    t = 5;
                    _at();
                    ter();
                    mort();
                  },
                  child: const Text("attaque débutant"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    t = 6;
                    _at();
                    ter();
                    mort();
                  },
                  child: const Text("attaque spoil"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.black),
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
                    t = 4;
                    _at();
                    ter();
                    mort();
                  },
                  child: const Text("STREAM"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red),
                  ),
                ),
                Visibility(
                  child: ElevatedButton(
                    onPressed: () {
                      t = 3;
                      _at();
                      ter();
                      mort();
                    },
                    child: const Text("attaque arduino"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.green),
                    ),
                  ),
                  visible: true,
                ),
                ElevatedButton(
                  onPressed: () {
                    t = 4;
                    _at();
                    ter();
                    mort();
                  },
                  child: const Text("attaque chien"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    t = 5;
                    _at();
                    ter();
                    mort();
                  },
                  child: const Text("attaque débutant"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    t = 6;
                    _at();
                    ter();
                    mort();
                  },
                  child: const Text("attaque spoil"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.black),
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
