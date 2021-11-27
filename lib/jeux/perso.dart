import 'package:devmon/jeux/level.dart';

class Perso {
  Level l = new Level();
  int _niveau = 1;
  String nom = "u";

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
}
