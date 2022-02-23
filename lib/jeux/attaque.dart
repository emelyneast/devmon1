import 'package:devmon/jeux/perso.dart';

class Attaque {
  int coup = 0;
  String libelle = "";
  String libelleE = "";
  Perso p = new Perso();

  get getCoup => this.coup;

  set setCoup(coup) => this.coup = coup;

  get getLibelle => this.libelle;

  set setLibelle(libelle) => this.libelle = libelle;

  int boucleInfini() {
    libelle = " boucle infini ! tu surchauffe et tu plante";
    libelleE = " boucle infini ! il surchauffe et plante";
    coup = -40;
    return coup;
  }

  int anbigous() {
    libelle = " Erreur Ambigous ! ta base de donnée n'est plus fonctionnel";
    libelleE = " Erreur Ambigous ! ça base de donnée n'est plus fonctionnel";

    coup = -20;
    return coup;
  }

  int ciberA() {
    libelle =
        " Cyber attaque ! tu n'a pas géré la cybersécurité tu te retrouve piraté ";
    libelleE =
        " Cyber attaque ! il n'a pas géré la cybersécurité il se retrouve piraté ";
    coup = -30;
    return coup;
  }

  int arduino() {
    libelle =
        " arduino a été lancé 5 fois ! ton ordi surchauffe au point de faire de la fumé ";
    libelleE =
        " arduino a été lancé 5 fois ! som ordi surchauffe au point de faire de la fumé ";
    coup = -70;
    return coup;
  }

  int pointVirgule() {
    libelle =
        " il ta enlevé un ; ! ton programme est bugué et tu vois pas l'erreur le sel est en toi";
    libelleE =
        " tu lui enleve un ; ! son programme est bugué et il ne vois pas l'erreur le sel est en lui";
    coup = -10;
    return coup;
  }

  int spoiler() {
    libelle =
        " il te spoil ton anime pref ! ty t'enerve et tu est déconcentrer tu es en position pls";
    libelleE =
        " tu le spoil son anime pref ! il s'enerve et il est déconcentrer il es en position pls";
    coup = -15;
    return coup;
  }

  int twitch() {
    libelle = " il t'oblige a regarder un live toute la soirée t'es fatigué";
    libelleE = " tu l'oblige a regarder un live toute la soirée il est fatigué";
    coup = -15;
    return coup;
  }
}
