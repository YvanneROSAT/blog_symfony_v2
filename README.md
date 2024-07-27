# Cahier des Charges - Projet Symfony v2

## Introduction
Ce projet est la suite du projet initial, avec des fonctionnalités supplémentaires basées sur les consignes du cahier des charges. L'objectif principal est d'ajouter une fonctionnalité de connexion, une vue admin avec des opérations CRUD, et une page d'accueil admin affichant un tableau des articles.

## Fonctionnalités
- la base de donnée se trouve à la racine du projet
- l'arborescence de mon site aussi en PNG

### Fonctionnalités Utilisateurs
- **Accès aux articles** : Tous les utilisateurs peuvent consulter les articles publiés par l'admin.

### Fonctionnalités Admin
- **Connexion** : L'admin peut se connecter via une URL spécifique pour éviter d'ajouter un bouton de connexion sur le site, réduisant ainsi les risques d'attaques.
  - URL de connexion : `localhost:8000/admin`
  - Identifiants :
    - ID : `louis_pignon`
    - Mot de passe : `password`
- **Vue Admin** :
  - **CRUD Articles** : L'admin peut créer, lire, mettre à jour et supprimer des articles.
  - **Page d'accueil admin** : Affiche un tableau des articles.
  - **Alertes** : Un composant `AlertMessage` s'affiche pour indiquer le succès ou l'échec des opérations CRUD.
  - **Suppression sécurisée** : Utilisation de `http_method_override: true` dans `packages/framework.yaml` pour sécuriser la suppression des articles via un formulaire dédié.

## Fonctionnalités Non Réalisées
- **Menu Dynamique** : L'ajout d'un label dans la table `category` devrait mettre à jour le menu et créer une vue et un contrôleur associés. Cette fonctionnalité n'a pas été implémentée en raison de sa complexité et des compétences limitées en services Symfony.
- **Gestion des Catégories** : L'admin devrait avoir accès à la liste des catégories et des articles, ainsi qu'aux opérations CRUD associées. Cependant, des problèmes ont été rencontrés lors de la modification et de la suppression des articles liés à des catégories, empêchant la mise à jour des catégories et des articles.
- **Upload d'Images** : En raison des problèmes de modification et de suppression des articles, l'upload d'images n'a pas été implémenté.

## Technologies Utilisées
- **Back-end** : Symfony (utilisé en cours)
- **Front-end** : HTML et CSS (Bootstrap pour une première ébauche rapide)

## Conclusion
Malgré les efforts déployés, certaines fonctionnalités n'ont pas pu être réalisées en raison de limitations techniques et de compétences. Cependant, les fonctionnalités principales de connexion et de gestion des articles par l'admin ont été implémentées avec succès.