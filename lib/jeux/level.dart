class Level {
  int exp = 0;
  int expMAx = 500;
  int niv = 1;
  String libelleL = "BTS1";

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
      exp = 0;
    }
    nomN(niv);
  }

  int nomN(niv) {
    if (niv == 1) {
      libelleL = "BTS1";

      expMAx = 500;
    } else if (niv == 2) {
      libelleL = "BTS2";
      expMAx = 600;
    } else if (niv == 3) {
      libelleL = "Licence";
      expMAx = 700;
    } else if (niv == 4) {
      libelleL = "master1";
      expMAx = 800;
    } else if (niv == 5) {
      libelleL = "master2";
      expMAx = 900;
    } else if (niv == 6) {
      libelleL = "terminator";
      expMAx = 1000;
    }
    return exp;
  }
}
