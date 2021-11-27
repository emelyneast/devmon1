import 'package:devmon/jeux/level.dart';

class Perso {
  int _niveau = 1;
  String nom = "u";
  Level l = new Level();

  String get getNom => this.nom;

  set setNom(String nom) => this.nom = nom;

  int vie = 100;
  int get getVie => this.vie;

  set setVie(int vie) => this.vie = vie;

  get niveau => this._niveau;

  set niveau(value) => this._niveau = value;

  String affiche() {
    return nom;
  }

  int v() {
    if (l.niv == 1) {
      vie = 100;
    } else if (l.niv == 2) {
      vie = 200;
    } else if (l.niv == 3) {
      vie = 300;
    } else if (l.niv == 4) {
      vie = 400;
    } else if (l.niv == 5) {
      vie = 500;
    } else if (l.niv == 6) {
      vie = 600;
    }
    return vie;
  }
}
