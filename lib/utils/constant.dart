// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

const KintoText =
    "Analyser les contenus suspects pour détecter\nles logiciels malveillants et autres violations, et les partager automatiquement avec la communauté de la sécurité.";
const KcheckContent = "Veuillez saisir votre texte";

const KcheckButtonText = 'verification';

const KresultText = "Résultats d'analyse des fournisseurs de sécurité";

List<PageViewModel> KonBoardingPages = [
  PageViewModel(
    title: '',
    bodyWidget: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Image.asset(
            'assets/images/onboarding_2.jpg',
            width: 280,
            height: 280,
          ),
          const SizedBox(height: 50),
          const Text(
            "Mettez fin à vos doutes",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            "Instead of having to buy an entire share, invest any amount you want.",
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
    title: '',
    bodyWidget: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Image.asset(
            'assets/images/onboarding_2.jpg',
            width: 280,
            height: 280,
          ),
          const SizedBox(height: 50),
          const Text(
            "Mettez fin à vos doutes",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            "Instead of having to buy an entire share, invest any amount you want.",
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
    title: '',
    bodyWidget: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Image.asset(
            'assets/images/onboarding_2.jpg',
            width: 280,
            height: 280,
          ),
          const SizedBox(height: 50),
          const Text(
            "Mettez fin à vos doutes",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            "Instead of having to buy an entire share, invest any amount you want.",
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
