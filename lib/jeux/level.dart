import 'package:devmon/jeux/perso.dart';

class Level {
  int exp = 0;
  int expMAx = 500;
  int niv = 1;
  String libelleL = "BTS1";
  Perso p = new Perso();

  int get getExp => this.exp;

  set setExp(int exp) => this.exp = exp;

  get getExpMAx => this.expMAx;

  set setExpMAx(expMAx) => this.expMAx = expMAx;

  get getNiv => this.niv;

  set setNiv(niv) => this.niv = niv;

  get getLibelleL => this.libelleL;

  set setLibelleL(libelleL) => this.libelleL = libelleL;

  void ChangeNiv() {
    if (exp == expMAx) {
      niv = niv + 1;
      nomN();
    }
  }

  void nomN() {
    if (niv == 1) {
      libelleL = "BTS1";
      expMAx = 500;
      p.vie = 100;
    } else if (niv == 2) {
      p.vie = 200;
      libelleL = "BTS2";
      expMAx = 600;
    } else if (niv == 3) {
      p.vie = 300;
      libelleL = "Licence";
      expMAx = 700;
    } else if (niv == 4) {
      p.vie = 400;
      libelleL = "master1";
      expMAx = 800;
    } else if (niv == 5) {
      p.vie = 500;
      libelleL = "master2";
      expMAx = 600;
    } else if (niv == 6) {
      p.vie = 600;
      libelleL = "terminator";
      expMAx = 1000;
    }
  }
}
