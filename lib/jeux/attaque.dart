import 'package:devmon/jeux/ennemy.dart';
import 'package:devmon/jeux/perso.dart';

class Attaque {
  int coup = 0;
  String libelle = "";
  String libelleE = "";
  Perso p = new Perso();
  Ennemy e = new Ennemy();

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
    libelle =
        "Stream ! il t'oblige a regarder un live toute la soirée t'es fatigué";
    libelleE =
        "Stream ! tu l'oblige a regarder un live toute la soirée il est fatigué";
    coup = -15;
    return coup;
  }

  int patron() {
    libelle =
        "Patron ! il te donne masse travail a faire tu es déborder il veut te viré";
    libelleE =
        "Patron ! tu appelle l'inspection du travil ils passent, le patron stress tellement qu'il t'oublie";
    coup = -25;
    return coup;
  }

  int chien() {
    libelle = "Chien ! Il ta fais peter un plomb avec les actus";
    libelleE = "Chien ! tu le fais chier avec les actus";
    coup = -30;
    return coup;
  }

  int veille() {
    libelle =
        "Veille tachno ! il te fais une maj sur tout tes logiciels ta mal gérer ta veille plus rien fonctionne";
    libelleE =
        "Veille techno ! tu lui fais une maj sur tout les logiciels il a mal gérer sa veille techno il est perdu";
    coup = -30;
    return coup;
  }

//1boucle infini, 2twitch, 3pointvirgule, 4ciberA, 5arduino, 6anbigous, 7chien, 8veille,  9spoiler, 10patron
//niv bts attaque: point virgule, ambigous, infini, twich, arduino, ciberA
//niv licence: -point virgule, la meme , + spoil, veille techno, chien
//master: -ambigous, pareil, +patron
//terminator: -twich, arduino, pareil, +injectoin sql
//tout le temp: infini, twich, ciberA

  void attaqueEn() {
    e.attaque = true;
    e.terminator();
    if (e.at == 1) {
      boucleInfini();
    } else if (e.at == 2) {
      twitch();
    } else if (e.at == 3) {
      pointVirgule();
    } else if (e.at == 4) {
      ciberA();
    } else if (e.at == 5) {
      arduino();
    } else if (e.at == 6) {
      anbigous();
    } else if (e.at == 7) {
      chien();
    } else if (e.at == 8) {
      veille();
    } else if (e.at == 9) {
      spoiler();
    } else if (e.at == 10) {
      patron();
    }
  }
}
