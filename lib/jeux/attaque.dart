import 'package:devmon/jeux/perso.dart';

class Attaque {
  int coup = 0;
  String libelle = "";
  Perso p = new Perso();

  get getCoup => this.coup;

  set setCoup(coup) => this.coup = coup;

  get getLibelle => this.libelle;

  set setLibelle(libelle) => this.libelle = libelle;

  int boucleInfini() {
    libelle = "boucle infini ! ";
    coup = -40;
    return coup;
  }

  int anbigous() {
    libelle = "Erreur Ambigous ! ";
    coup = -20;
    return coup;
  }
}
