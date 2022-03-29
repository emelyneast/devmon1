import 'package:devmon/jeux/attaque.dart';
import 'package:devmon/jeux/level.dart';
import 'package:devmon/jeux/perso.dart';
import 'dart:math';

class Ennemy {
  Random random = new Random();
  int at = 0;
  bool attaque = false;
  int _niveauE = 1;
  String nomE = "";
  Level l = new Level();
  int vieE = 100;
  String nomNE = "";
  String nomEnnemy = "";
  int idE = 0;
  int nbR = 3;

  get getAt => this.at;

  set setAt(at) => this.at = at;

  get getAttaque => this.attaque;

  set setAttaque(attaque) => this.attaque = attaque;

  get niveauE => this._niveauE;

  set niveauE(value) => this._niveauE = value;

  get getNomE => this.nomE;

  set setNomE(nomE) => this.nomE = nomE;

  get getL => this.l;

  set setL(l) => this.l = l;

  get getVieE => this.vieE;

  set setVieE(vieE) => this.vieE = vieE;

  String affiche() {
    nomE = "terminator";
    return nomE;
  }

  String afAntiVaccin() {
    nomE = "AntiVaccin";
    return nomE;
  }

  String afMmesql() {
    nomE = "Mme SQL";
    return nomE;
  }

  String afRag() {
    nomE = "Le sel";
    return nomE;
  }

  String afChien() {
    nomE = "Le chien";
    return nomE;
  }

  String afSpolier() {
    nomE = "spoiler";
    return nomE;
  }

  String afStreammeur() {
    nomE = "Streammeur";
    return nomE;
  }

  String afVeille() {
    nomE = "Veille Tachno";
    return nomE;
  }

  String afPatron() {
    nomE = "patron";
    return nomE;
  }

  String afIlluminati() {
    nomE = "Illuminati";
    return nomE;
  }

  void en() {
    idE = random.nextInt(nbR);
    if (idE == 0) {
      afRag();
    } else if (idE == 1) {
      afMmesql();
    } else if (idE == 2) {
      afMmesql();
    } else if (idE == 3) {
      afAntiVaccin();
    } else if (idE == 4) {
      affiche();
    }
  }

  int terminatorV() {
    l.niv = 6;
    l.nomN;
    v();
    return v();
  }

  int bts1V() {
    l.niv = 1;
    l.nomN;
    v();
    return v();
  }

  int bts2V() {
    l.niv = 2;
    l.nomN;
    v();
    return v();
  }

  int licenceV() {
    l.niv = 3;
    l.nomN;
    v();
    return v();
  }

  int master1V() {
    l.niv = 4;
    l.nomN;
    v();
    return v();
  }

  int master2V() {
    l.niv = 5;
    l.nomN;
    v();
    return v();
  }

  int illuV() {
    l.niv = 20;
    l.nomN;
    v();
    return v();
  }

  String ter() {
    l.nomN(6);
    nomNE = l.libelleL;
    return nomNE;
  }

  int eFaible() {
    l.niv = 1;
    l.nomN;
    v();
    return v();
  }

  String faible() {
    l.nomN(6);
    nomNE = l.libelleL;
    return nomNE;
  }

  int v() {
    if (l.niv == 1) {
      vieE = 100;
    } else if (l.niv == 2) {
      vieE = 200;
    } else if (l.niv == 3) {
      vieE = 300;
    } else if (l.niv == 4) {
      vieE = 400;
    } else if (l.niv == 5) {
      vieE = 500;
    } else if (l.niv == 6) {
      vieE = 600;
    }
    return vieE;
  }

  void test() {
    while (attaque == true) {
      if (l.niv >= 1 && l.niv <= 2) {
        next(0, 3, random);
      }
    }
  }

  int next(int min, int max, Random rand) => min + rand.nextInt(max - min);

  int terminator() {
    while (attaque == true) {
      if (l.niv >= 1 && l.niv <= 2) {
        at = random.nextInt(1);
      } else if (l.niv == 3) {
        at = random.nextInt(3) + 1;
      }

      attaque = false;
    }
    return at;
  }

  int faibA() {
    while (attaque == true) {
      at = random.nextInt(1);
      attaque = false;
    }
    return at;
  }
  /*
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
  }*/
}
