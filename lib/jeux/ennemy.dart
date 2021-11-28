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

  int terminatorV() {
    l.niv = 6;
    l.nomN;
    v();
    return v();
  }

  String ter() {
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

  int terminator() {
    while (attaque == true) {
      at = random.nextInt(3);
      attaque = false;
    }
    return at;
  }
}
