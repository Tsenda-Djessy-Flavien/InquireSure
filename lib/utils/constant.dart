// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:analyse_gp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

const KintoText =
    "Analyser les contenus suspects pour détecter\nles logiciels malveillants et autres violations, et les partager automatiquement avec la communauté de la sécurité.";
const KcheckContent = "Veuillez saisir votre texte";

const KurlEmpty = 'Votre contenu doit avoir un lien';

const KcheckButtonText = 'verification';

const kTrueContenu = '"Ce contenu semble être digne de confiance"';

const kFalseContenu = '"Ce contenu ne semble pas être digne de confiance"';

const kQueudStatus = 'Veillez soumettre à nouveau votre vérification !';

const Konboarding_title = '';

const KresultText = "Résultats d'analyse des fournisseurs de sécurité";

const Konboarding_title_2 = "Mettez fin à vos doutes";

const Konboarding_main_2 =
    "Instead of having to buy an entire share, invest any amount you want.";

List<PageViewModel> KonBoardingPages = [
  PageViewModel(
    title: Konboarding_title,
    bodyWidget: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Image.asset(
            Konboarding_2,
            width: 280,
            height: 280,
          ),
          const SizedBox(height: 50),
          const Text(
            Konboarding_title_2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            Konboarding_main_2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    ),
  ),
  PageViewModel(
    title: Konboarding_title,
    bodyWidget: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Image.asset(
            Konboarding_2,
            width: 280,
            height: 280,
          ),
          const SizedBox(height: 50),
          const Text(
            Konboarding_title_2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            Konboarding_main_2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    ),
  ),
  PageViewModel(
    title: Konboarding_title,
    bodyWidget: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Image.asset(
            Konboarding_2,
            width: 280,
            height: 280,
          ),
          const SizedBox(height: 50),
          const Text(
            Konboarding_title_2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            Konboarding_main_2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    ),
  ),
];
