-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Sam 13 Mai 2017 à 13:29
-- Version du serveur :  5.7.14
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gsb`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `nb_jour` int(11) NOT NULL,
  `distance_km` int(11) NOT NULL,
  `description` text NOT NULL,
  `date` datetime NOT NULL,
  `id_theme` int(11) NOT NULL,
  `id_type_activite` int(11) NOT NULL,
  `id_lieu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `activite`
--

INSERT INTO `activite` (`id`, `libelle`, `nb_jour`, `distance_km`, `description`, `date`, `id_theme`, `id_type_activite`, `id_lieu`) VALUES
(1, 'test', 1, 25, 'test test', '2016-12-22 00:00:00', 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `boite_vitesse`
--

CREATE TABLE `boite_vitesse` (
  `id` int(11) NOT NULL,
  `nb_vitesse` int(11) NOT NULL,
  `id_type_boite_vitesse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `composant`
--

CREATE TABLE `composant` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `composant`
--

INSERT INTO `composant` (`id`, `libelle`, `description`) VALUES
(1, 'dolliprane', NULL),
(2, 'paracetamol', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `compte_rendu_echantillon`
--

CREATE TABLE `compte_rendu_echantillon` (
  `id` int(11) NOT NULL,
  `echantillon_id` int(11) NOT NULL,
  `compte_rendu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compte_rendu_echantillon`
--

INSERT INTO `compte_rendu_echantillon` (`id`, `echantillon_id`, `compte_rendu_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `compte_rendu_produit`
--

CREATE TABLE `compte_rendu_produit` (
  `id` int(11) NOT NULL,
  `id_compte_rendu` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compte_rendu_produit`
--

INSERT INTO `compte_rendu_produit` (`id`, `id_compte_rendu`, `id_produit`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `compte_rendu_visite`
--

CREATE TABLE `compte_rendu_visite` (
  `id` int(11) NOT NULL,
  `date_creation` datetime NOT NULL,
  `date_modification` datetime DEFAULT NULL,
  `date` date NOT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `nb_echantillons` int(11) DEFAULT NULL,
  `bilan` text NOT NULL,
  `coefficient_confiance` float NOT NULL,
  `coefficient_notoriete` float NOT NULL,
  `coefficient_prescription` float NOT NULL,
  `id_motif` int(11) NOT NULL,
  `autre_motif` varchar(255) DEFAULT NULL,
  `id_praticien` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compte_rendu_visite`
--

INSERT INTO `compte_rendu_visite` (`id`, `date_creation`, `date_modification`, `date`, `id_produit`, `nb_echantillons`, `bilan`, `coefficient_confiance`, `coefficient_notoriete`, `coefficient_prescription`, `id_motif`, `autre_motif`, `id_praticien`, `id_utilisateur`) VALUES
(1, '2017-05-10 15:22:17', '2017-05-07 22:56:04', '2017-02-08', 1, 3, 'TEST', 5, 6, 7, 1, NULL, 1, 1),
(3, '2017-05-10 05:18:12', NULL, '2017-08-08', 1, 3, 'test', 8, 9, 6, 1, NULL, 1, 2),
(4, '2017-05-05 22:55:51', NULL, '2017-05-05', 1, 3, 'Test Test', 8, 9, 6, 1, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

CREATE TABLE `connexion` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `connexion`
--

INSERT INTO `connexion` (`id`, `login`, `mdp`, `id_utilisateur`) VALUES
(2, 'florian.spadaro', '56910c52ed70539e3ce0391edeb6d339', 1),
(3, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 2),
(4, 'michael.jordan', 'f72a062102bb36635133f3d925b0d3fa', 3),
(6, 'test.test', '800ef42b41c73767c596562901cff0c4', 5),
(8, 'jimmy.duong', 'b92886151bbd0b962241c6146c820c14', 8);

-- --------------------------------------------------------

--
-- Structure de la table `echantillon`
--

CREATE TABLE `echantillon` (
  `id` int(11) NOT NULL,
  `qte` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `echantillon`
--

INSERT INTO `echantillon` (`id`, `qte`, `id_produit`) VALUES
(1, 50, 1);

-- --------------------------------------------------------

--
-- Structure de la table `energie`
--

CREATE TABLE `energie` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `energie`
--

INSERT INTO `energie` (`id`, `libelle`, `description`) VALUES
(1, 'diesel', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `famille_produit`
--

CREATE TABLE `famille_produit` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `famille_produit`
--

INSERT INTO `famille_produit` (`id`, `libelle`, `description`) VALUES
(1, 'generique', NULL),
(2, 'famille Test', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fiche_frais`
--

CREATE TABLE `fiche_frais` (
  `id` int(11) NOT NULL,
  `date_creation` datetime NOT NULL,
  `montant_remboursement` float NOT NULL,
  `date_cloture` datetime NOT NULL,
  `date_modif` datetime DEFAULT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_service_comptable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fonction_praticien`
--

CREATE TABLE `fonction_praticien` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fonction_praticien`
--

INSERT INTO `fonction_praticien` (`id`, `libelle`, `description`) VALUES
(1, 'salari', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fonction_utilisateur`
--

CREATE TABLE `fonction_utilisateur` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fonction_utilisateur`
--

INSERT INTO `fonction_utilisateur` (`id`, `libelle`, `description`) VALUES
(1, 'administrateur', NULL),
(2, 'utilisateur', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `frais`
--

CREATE TABLE `frais` (
  `id` int(11) NOT NULL,
  `montant` float NOT NULL,
  `commentaire` text,
  `date` date NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_type_frais` int(11) NOT NULL,
  `date_creation` datetime NOT NULL,
  `date_modification` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `frais`
--

INSERT INTO `frais` (`id`, `montant`, `commentaire`, `date`, `id_utilisateur`, `id_type_frais`, `date_creation`, `date_modification`) VALUES
(1, 185, 'Notepad', '2017-08-09', 1, 1, '2017-05-11 12:32:21', '2017-05-08 19:09:06'),
(6, 111, 'TEST DEPUIS LE SITE', '2017-04-15', 1, 1, '2017-05-11 07:15:40', NULL),
(7, 145, 'htdhdfd', '2017-04-14', 2, 1, '2017-05-17 12:30:28', '2017-05-24 07:20:21'),
(8, 999, 'test', '2017-05-05', 1, 1, '2017-05-01 22:04:13', NULL),
(12, 159, 'test flo', '2017-04-05', 2, 1, '2017-05-02 13:27:01', NULL),
(15, 9519, 'nouveau test', '3333-09-09', 2, 1, '2017-05-03 21:03:04', '2017-05-08 20:10:21'),
(16, 289, 'test', '2017-08-08', 2, 1, '2017-05-05 23:50:24', NULL),
(17, 999, 'test depuis site', '2017-08-09', 2, 1, '2017-05-05 23:51:33', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `justificatif`
--

CREATE TABLE `justificatif` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `id_frais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `justificatif`
--

INSERT INTO `justificatif` (`id`, `url`, `libelle`, `id_frais`) VALUES
(12, 'pj/ee42d0f698677fe2fb0c10a124da12d1.txt', 'BDD.txt', 15);

-- --------------------------------------------------------

--
-- Structure de la table `laboratoire`
--

CREATE TABLE `laboratoire` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `id_lieu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `laboratoire`
--

INSERT INTO `laboratoire` (`id`, `nom`, `id_lieu`) VALUES
(1, 'gsb lyon', 1);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

CREATE TABLE `lieu` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `cp` int(11) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `pays` varchar(255) NOT NULL,
  `region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lieu`
--

INSERT INTO `lieu` (`id`, `libelle`, `adresse`, `cp`, `ville`, `pays`, `region_id`) VALUES
(1, 'GSB Lyon', 'Rue de Lyon', 69003, 'Lyon', 'France', 1),
(2, 'GSB Paris', 'Champs Elys?es', 75001, 'Paris', 'France', 2),
(32, 'GSB Marseille', 'Rue de Marseille', 13001, 'Marseille', 'France', 4),
(40, 'Test', 'gregrze', 99999, 'frzz', 'frerz', 3),
(46, 'Villeurbanne', 'Rue de Villeurbanne', 69100, 'Lyon', 'France', 2),
(47, 'Bordeaux', 'Rue de Bordeaux', 99999, 'Bordeaux', 'France', 4);

-- --------------------------------------------------------

--
-- Structure de la table `motif`
--

CREATE TABLE `motif` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `motif`
--

INSERT INTO `motif` (`id`, `libelle`, `description`) VALUES
(1, 'visite', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `operations`
--

CREATE TABLE `operations` (
  `id` int(11) NOT NULL,
  `reception_pieces` tinyint(1) NOT NULL,
  `validation_demande_remboursement` tinyint(1) NOT NULL,
  `mise_en_paiement` tinyint(1) NOT NULL,
  `remboursement_effectue` tinyint(1) NOT NULL,
  `id_service_comptable` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `parc_automobile`
--

CREATE TABLE `parc_automobile` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `id_lieu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `parc_automobile`
--

INSERT INTO `parc_automobile` (`id`, `libelle`, `id_lieu`) VALUES
(1, 'parc auto part dieu', 1),
(2, 'TEST99', 2),
(3, 'TEST', 2),
(4, 'Parc Auto', 2),
(6, 'Flo', 1),
(7, 'PC', 47);

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

CREATE TABLE `participant` (
  `id` int(11) NOT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `id_praticien` int(11) DEFAULT NULL,
  `id_remplacant_praticien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `praticien`
--

CREATE TABLE `praticien` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `telephone_fixe` varchar(255) DEFAULT NULL,
  `telephone_portable` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `date_derniere_visite` datetime DEFAULT NULL,
  `id_fonction_praticien` int(11) DEFAULT NULL,
  `id_type_praticien` int(11) NOT NULL,
  `id_lieu` int(11) NOT NULL,
  `id_specialite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `praticien`
--

INSERT INTO `praticien` (`id`, `nom`, `prenom`, `telephone_fixe`, `telephone_portable`, `mail`, `date_derniere_visite`, `id_fonction_praticien`, `id_type_praticien`, `id_lieu`, `id_specialite`) VALUES
(1, 'Obamaz', 'Barack', '0450588985', '0636657895', 'barack.obama@gmail.com', '2015-10-09 00:00:00', 1, 2, 1, 1),
(11, 'Hugo', 'Victor', '0489562314', '0602050809', 'victor.hugo@outlook.fr', '2016-05-01 00:00:00', NULL, 1, 40, 1),
(13, 'Smith', 'Will', '0408090607', '0636985741', 'will.smith@gmail.com', '2017-02-03 00:00:00', NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `effets` text NOT NULL,
  `contre_indications` text NOT NULL,
  `dosage` text NOT NULL,
  `type_individu` text NOT NULL,
  `id_laboratoire` int(11) NOT NULL,
  `id_famille_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id`, `libelle`, `effets`, `contre_indications`, `dosage`, `type_individu`, `id_laboratoire`, `id_famille_produit`) VALUES
(1, 'Test', 'TEST TEST', 'TEST TEST', '1 comprim? le matin et 1 comprim? le soir', 'Adulte de plus de 20 ans', 1, 2),
(2, 'dolliprane', 'contre maux de tete', 'enfants', '1 matin 1 soir', 'adultes', 1, 1),
(15, 'florian', 'grgrgreg', 'gegez', 'gregz', 'gregze', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit_composants`
--

CREATE TABLE `produit_composants` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `composant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `produit_composants`
--

INSERT INTO `produit_composants` (`id`, `produit_id`, `composant_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(8, 15, 2);

-- --------------------------------------------------------

--
-- Structure de la table `rdv`
--

CREATE TABLE `rdv` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `description` text NOT NULL,
  `id_praticien` int(11) NOT NULL,
  `id_visiteur` int(11) NOT NULL,
  `id_lieu` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rdv`
--

INSERT INTO `rdv` (`id`, `date`, `description`, `id_praticien`, `id_visiteur`, `id_lieu`, `id_utilisateur`) VALUES
(4, '2017-02-17 00:00:00', 'TEST', 1, 1, 1, 1),
(5, '2016-05-02 00:00:00', 'test', 1, 2, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `region`
--

INSERT INTO `region` (`id`, `libelle`) VALUES
(1, 'Nord'),
(2, 'Est'),
(3, 'Ouest'),
(4, 'Sud'),
(5, 'Paris Centre');

-- --------------------------------------------------------

--
-- Structure de la table `remplacant_praticien`
--

CREATE TABLE `remplacant_praticien` (
  `id` int(11) NOT NULL,
  `id_praticien_remplacant` int(11) NOT NULL,
  `id_praticien_remplace` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `service_comptable`
--

CREATE TABLE `service_comptable` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text,
  `id_lieu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `service_comptable`
--

INSERT INTO `service_comptable` (`id`, `libelle`, `description`, `id_lieu`) VALUES
(1, 'service comptable part dieu', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE `specialite` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `specialite`
--

INSERT INTO `specialite` (`id`, `libelle`, `description`) VALUES
(1, 'test', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `synthese_mensuelle`
--

CREATE TABLE `synthese_mensuelle` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `commentaire` text,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

CREATE TABLE `theme` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `theme`
--

INSERT INTO `theme` (`id`, `libelle`, `description`) VALUES
(1, 'test', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `type_activite`
--

CREATE TABLE `type_activite` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type_activite`
--

INSERT INTO `type_activite` (`id`, `libelle`, `description`) VALUES
(1, 'rdv', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `type_boite_vitesse`
--

CREATE TABLE `type_boite_vitesse` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `type_frais`
--

CREATE TABLE `type_frais` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type_frais`
--

INSERT INTO `type_frais` (`id`, `libelle`, `description`) VALUES
(1, 'H?tel', NULL),
(2, 'Restaurant', NULL),
(3, 'Frais v?hicule', NULL),
(4, 'Carburant', NULL),
(5, 'P?age', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `type_praticien`
--

CREATE TABLE `type_praticien` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type_praticien`
--

INSERT INTO `type_praticien` (`id`, `libelle`, `description`) VALUES
(1, 'pharmacien', NULL),
(2, 'm?decin', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `type_vehicule`
--

CREATE TABLE `type_vehicule` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type_vehicule`
--

INSERT INTO `type_vehicule` (`id`, `libelle`, `description`) VALUES
(1, 'citadine', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `date_naissance` date NOT NULL,
  `date_embauche` date NOT NULL,
  `date_creation` datetime NOT NULL,
  `date_modification` datetime DEFAULT NULL,
  `telephone_portable` varchar(255) DEFAULT NULL,
  `telephone_fixe` varchar(20) DEFAULT NULL,
  `mail` varchar(255) NOT NULL,
  `id_laboratoire` int(11) NOT NULL,
  `id_service_comptable` int(11) DEFAULT NULL,
  `id_fonction_utilisateur` int(11) NOT NULL,
  `id_lieu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `date_naissance`, `date_embauche`, `date_creation`, `date_modification`, `telephone_portable`, `telephone_fixe`, `mail`, `id_laboratoire`, `id_service_comptable`, `id_fonction_utilisateur`, `id_lieu`) VALUES
(1, 'spadaro', 'florian', '1997-02-09', '2016-06-06', '2016-08-10 00:00:00', '2017-05-04 16:50:57', '0636968686', '0458686565', 'spadaro.florian@outlook.fr', 1, NULL, 2, 1),
(2, 'user', 'user', '2000-01-01', '2000-01-01', '2017-04-13 22:04:58', '2017-04-13 22:04:58', '0102030405', '0102030405', 'user@user.com', 1, NULL, 1, 1),
(3, 'Jordan', 'Michael', '2016-05-06', '2016-05-06', '2017-04-24 14:16:28', '2017-04-24 14:16:28', '0658597453', '0458693547', 'michael.jordan@outlook.fr', 1, NULL, 1, 1),
(5, 'test', 'test', '1998-09-06', '2017-09-08', '2017-05-04 11:17:23', '2017-05-04 11:17:23', '06362547898', '0458693625', 'test@test.com', 1, NULL, 2, NULL),
(6, 'Test', 'Test', '1998-09-02', '1996-09-06', '2017-05-04 11:20:48', '2017-05-04 11:20:48', '0696589632', '0458963625', 'test.test@test.test', 1, NULL, 2, NULL),
(8, 'Duong', 'Jimmy', '1995-10-25', '2017-08-08', '2017-05-04 16:56:06', '2017-05-04 16:56:06', '0658733481', '0498653258', 'jd.jimmyduong@gmail.com', 1, NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE `vehicule` (
  `immatricule` varchar(255) NOT NULL,
  `id_marque` int(11) NOT NULL,
  `id_model` int(11) NOT NULL,
  `description` text,
  `kilometrage` int(11) NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `equipement` text,
  `id_parc_automobile` int(11) NOT NULL,
  `id_energie` int(11) NOT NULL,
  `id_type_vehicule` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vehicule`
--

INSERT INTO `vehicule` (`immatricule`, `id_marque`, `id_model`, `description`, `kilometrage`, `disponible`, `equipement`, `id_parc_automobile`, `id_energie`, `id_type_vehicule`, `image`) VALUES
('AA-689-BF', 1, 2, 'Vehicule neuf', 125000, 0, 'Anti-brouillards', 1, 1, 1, 'imagesVehicules/A3.jpg'),
('BJ-685-ZA', 2, 1, 'Notepad', 99999, 1, 'tout équipé', 1, 1, 1, 'imagesVehicules/2390dd8641d9006e65bd4ee63a0ed5a1.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule_images`
--

CREATE TABLE `vehicule_images` (
  `id` int(11) NOT NULL,
  `immatricule_vehicule` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vehicule_images`
--

INSERT INTO `vehicule_images` (`id`, `immatricule_vehicule`, `image`) VALUES
(1, 'AA-689-BF', 'imagesVehicules/A3.jpg'),
(2, 'BJ-685-ZA', 'imagesVehicules/2390dd8641d9006e65bd4ee63a0ed5a1.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule_marque`
--

CREATE TABLE `vehicule_marque` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vehicule_marque`
--

INSERT INTO `vehicule_marque` (`id`, `libelle`) VALUES
(1, 'Audi'),
(2, 'Volkswagen');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule_model`
--

CREATE TABLE `vehicule_model` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `id_marque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vehicule_model`
--

INSERT INTO `vehicule_model` (`id`, `libelle`, `id_marque`) VALUES
(1, 'Golf', 2),
(2, 'A3', 1);

-- --------------------------------------------------------

--
-- Structure de la table `vehicule_utilisateur`
--

CREATE TABLE `vehicule_utilisateur` (
  `id` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `immatricule_vehicule` varchar(255) NOT NULL,
  `date_depart` timestamp NOT NULL,
  `date_arrivee` timestamp NULL DEFAULT NULL,
  `id_parc_automobile_depart` int(11) NOT NULL,
  `id_parc_automobile_arrivee` int(11) DEFAULT NULL,
  `distance_parcourue` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vehicule_utilisateur`
--

INSERT INTO `vehicule_utilisateur` (`id`, `id_utilisateur`, `immatricule_vehicule`, `date_depart`, `date_arrivee`, `id_parc_automobile_depart`, `id_parc_automobile_arrivee`, `distance_parcourue`) VALUES
(5, 2, 'AA-689-BF', '2017-05-05 17:15:20', '2017-05-05 17:18:16', 1, 2, 158),
(6, 2, 'AA-689-BF', '2017-05-05 17:19:04', '2017-05-05 17:19:21', 2, 2, 158),
(7, 2, 'AA-689-BF', '2017-05-07 21:20:40', NULL, 1, NULL, NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_theme` (`id_theme`),
  ADD KEY `id_type_activite` (`id_type_activite`),
  ADD KEY `id_lieu` (`id_lieu`);

--
-- Index pour la table `boite_vitesse`
--
ALTER TABLE `boite_vitesse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type_boite_vitesse` (`id_type_boite_vitesse`);

--
-- Index pour la table `composant`
--
ALTER TABLE `composant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`);

--
-- Index pour la table `compte_rendu_echantillon`
--
ALTER TABLE `compte_rendu_echantillon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `echantillon_id` (`echantillon_id`),
  ADD KEY `compte_rendu_id` (`compte_rendu_id`);

--
-- Index pour la table `compte_rendu_produit`
--
ALTER TABLE `compte_rendu_produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_compte_rendu` (`id_compte_rendu`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Index pour la table `compte_rendu_visite`
--
ALTER TABLE `compte_rendu_visite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_motif` (`id_motif`),
  ADD KEY `id_praticien` (`id_praticien`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Index pour la table `connexion`
--
ALTER TABLE `connexion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `echantillon`
--
ALTER TABLE `echantillon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Index pour la table `energie`
--
ALTER TABLE `energie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`);

--
-- Index pour la table `famille_produit`
--
ALTER TABLE `famille_produit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`);

--
-- Index pour la table `fiche_frais`
--
ALTER TABLE `fiche_frais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_service_comptable` (`id_service_comptable`);

--
-- Index pour la table `fonction_praticien`
--
ALTER TABLE `fonction_praticien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`);

--
-- Index pour la table `fonction_utilisateur`
--
ALTER TABLE `fonction_utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`);

--
-- Index pour la table `frais`
--
ALTER TABLE `frais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_type_frais` (`id_type_frais`);

--
-- Index pour la table `justificatif`
--
ALTER TABLE `justificatif`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`),
  ADD UNIQUE KEY `libelle` (`libelle`),
  ADD KEY `id_fiche_frais` (`id_frais`);

--
-- Index pour la table `laboratoire`
--
ALTER TABLE `laboratoire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lieu` (`id_lieu`);

--
-- Index pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`),
  ADD KEY `region_id` (`region_id`);

--
-- Index pour la table `motif`
--
ALTER TABLE `motif`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`);

--
-- Index pour la table `operations`
--
ALTER TABLE `operations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_service_comptable` (`id_service_comptable`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `parc_automobile`
--
ALTER TABLE `parc_automobile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lieu` (`id_lieu`);

--
-- Index pour la table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_praticien` (`id_praticien`),
  ADD KEY `id_remplacant_praticien` (`id_remplacant_praticien`);

--
-- Index pour la table `praticien`
--
ALTER TABLE `praticien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_fonction_praticien` (`id_fonction_praticien`),
  ADD KEY `id_type_praticien` (`id_type_praticien`),
  ADD KEY `id_lieu` (`id_lieu`),
  ADD KEY `id_specialite` (`id_specialite`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`),
  ADD UNIQUE KEY `libelle_2` (`libelle`),
  ADD KEY `id_laboratoire` (`id_laboratoire`),
  ADD KEY `id_famille_produit` (`id_famille_produit`);

--
-- Index pour la table `produit_composants`
--
ALTER TABLE `produit_composants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produit_id` (`produit_id`),
  ADD KEY `composant_produit` (`composant_id`);

--
-- Index pour la table `rdv`
--
ALTER TABLE `rdv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_praticien` (`id_praticien`),
  ADD KEY `id_visiteur` (`id_visiteur`),
  ADD KEY `id_lieu` (`id_lieu`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `region`
--
ALTER TABLE `region`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `remplacant_praticien`
--
ALTER TABLE `remplacant_praticien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_praticien_remplacant` (`id_praticien_remplacant`),
  ADD KEY `id_praticien_remplace` (`id_praticien_remplace`);

--
-- Index pour la table `service_comptable`
--
ALTER TABLE `service_comptable`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`),
  ADD KEY `id_lieu` (`id_lieu`);

--
-- Index pour la table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`);

--
-- Index pour la table `synthese_mensuelle`
--
ALTER TABLE `synthese_mensuelle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`);

--
-- Index pour la table `type_activite`
--
ALTER TABLE `type_activite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`);

--
-- Index pour la table `type_boite_vitesse`
--
ALTER TABLE `type_boite_vitesse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_frais`
--
ALTER TABLE `type_frais`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`);

--
-- Index pour la table `type_praticien`
--
ALTER TABLE `type_praticien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`);

--
-- Index pour la table `type_vehicule`
--
ALTER TABLE `type_vehicule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD UNIQUE KEY `telephone_portable` (`telephone_portable`),
  ADD KEY `id_laboratoire` (`id_laboratoire`),
  ADD KEY `id_service_comptable` (`id_service_comptable`),
  ADD KEY `id_fonction_utilisateur` (`id_fonction_utilisateur`),
  ADD KEY `id_lieu` (`id_lieu`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`immatricule`),
  ADD KEY `id_parc_automobile` (`id_parc_automobile`),
  ADD KEY `id_energie` (`id_energie`),
  ADD KEY `id_type_vehicule` (`id_type_vehicule`),
  ADD KEY `id_marque` (`id_marque`),
  ADD KEY `id_model` (`id_model`);

--
-- Index pour la table `vehicule_images`
--
ALTER TABLE `vehicule_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `immatricule_vehicule` (`immatricule_vehicule`);

--
-- Index pour la table `vehicule_marque`
--
ALTER TABLE `vehicule_marque`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`);

--
-- Index pour la table `vehicule_model`
--
ALTER TABLE `vehicule_model`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`),
  ADD KEY `id_marque` (`id_marque`);

--
-- Index pour la table `vehicule_utilisateur`
--
ALTER TABLE `vehicule_utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_vehicule` (`immatricule_vehicule`),
  ADD KEY `id_parc_automobile_depart` (`id_parc_automobile_depart`),
  ADD KEY `id_parc_automobile_arrivee` (`id_parc_automobile_arrivee`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `activite`
--
ALTER TABLE `activite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `boite_vitesse`
--
ALTER TABLE `boite_vitesse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `composant`
--
ALTER TABLE `composant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `compte_rendu_echantillon`
--
ALTER TABLE `compte_rendu_echantillon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `compte_rendu_produit`
--
ALTER TABLE `compte_rendu_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `compte_rendu_visite`
--
ALTER TABLE `compte_rendu_visite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `connexion`
--
ALTER TABLE `connexion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `echantillon`
--
ALTER TABLE `echantillon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `energie`
--
ALTER TABLE `energie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `famille_produit`
--
ALTER TABLE `famille_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `fiche_frais`
--
ALTER TABLE `fiche_frais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `fonction_praticien`
--
ALTER TABLE `fonction_praticien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `fonction_utilisateur`
--
ALTER TABLE `fonction_utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `frais`
--
ALTER TABLE `frais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `justificatif`
--
ALTER TABLE `justificatif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `laboratoire`
--
ALTER TABLE `laboratoire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `lieu`
--
ALTER TABLE `lieu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT pour la table `motif`
--
ALTER TABLE `motif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `operations`
--
ALTER TABLE `operations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `parc_automobile`
--
ALTER TABLE `parc_automobile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `participant`
--
ALTER TABLE `participant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `praticien`
--
ALTER TABLE `praticien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `produit_composants`
--
ALTER TABLE `produit_composants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `rdv`
--
ALTER TABLE `rdv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `remplacant_praticien`
--
ALTER TABLE `remplacant_praticien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `service_comptable`
--
ALTER TABLE `service_comptable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `specialite`
--
ALTER TABLE `specialite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `synthese_mensuelle`
--
ALTER TABLE `synthese_mensuelle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `theme`
--
ALTER TABLE `theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `type_activite`
--
ALTER TABLE `type_activite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `type_boite_vitesse`
--
ALTER TABLE `type_boite_vitesse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `type_frais`
--
ALTER TABLE `type_frais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `type_praticien`
--
ALTER TABLE `type_praticien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `type_vehicule`
--
ALTER TABLE `type_vehicule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `vehicule_images`
--
ALTER TABLE `vehicule_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `vehicule_marque`
--
ALTER TABLE `vehicule_marque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `vehicule_model`
--
ALTER TABLE `vehicule_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `vehicule_utilisateur`
--
ALTER TABLE `vehicule_utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `activite`
--
ALTER TABLE `activite`
  ADD CONSTRAINT `activite_ibfk_1` FOREIGN KEY (`id_theme`) REFERENCES `theme` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `activite_ibfk_2` FOREIGN KEY (`id_type_activite`) REFERENCES `type_activite` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `activite_ibfk_3` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `boite_vitesse`
--
ALTER TABLE `boite_vitesse`
  ADD CONSTRAINT `boite_vitesse_ibfk_1` FOREIGN KEY (`id_type_boite_vitesse`) REFERENCES `type_boite_vitesse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `compte_rendu_echantillon`
--
ALTER TABLE `compte_rendu_echantillon`
  ADD CONSTRAINT `compte_rendu_echantillon_ibfk_1` FOREIGN KEY (`echantillon_id`) REFERENCES `echantillon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compte_rendu_echantillon_ibfk_2` FOREIGN KEY (`compte_rendu_id`) REFERENCES `compte_rendu_visite` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `compte_rendu_produit`
--
ALTER TABLE `compte_rendu_produit`
  ADD CONSTRAINT `compte_rendu_produit_ibfk_1` FOREIGN KEY (`id_compte_rendu`) REFERENCES `compte_rendu_visite` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compte_rendu_produit_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `compte_rendu_visite`
--
ALTER TABLE `compte_rendu_visite`
  ADD CONSTRAINT `compte_rendu_visite_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compte_rendu_visite_ibfk_2` FOREIGN KEY (`id_motif`) REFERENCES `motif` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compte_rendu_visite_ibfk_3` FOREIGN KEY (`id_praticien`) REFERENCES `praticien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compte_rendu_visite_ibfk_4` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `connexion`
--
ALTER TABLE `connexion`
  ADD CONSTRAINT `connexion_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `echantillon`
--
ALTER TABLE `echantillon`
  ADD CONSTRAINT `echantillon_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `fiche_frais`
--
ALTER TABLE `fiche_frais`
  ADD CONSTRAINT `fiche_frais_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fiche_frais_ibfk_2` FOREIGN KEY (`id_service_comptable`) REFERENCES `service_comptable` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `frais`
--
ALTER TABLE `frais`
  ADD CONSTRAINT `frais_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `frais_ibfk_2` FOREIGN KEY (`id_type_frais`) REFERENCES `type_frais` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `justificatif`
--
ALTER TABLE `justificatif`
  ADD CONSTRAINT `justificatif_ibfk_1` FOREIGN KEY (`id_frais`) REFERENCES `frais` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `laboratoire`
--
ALTER TABLE `laboratoire`
  ADD CONSTRAINT `laboratoire_ibfk_1` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD CONSTRAINT `lieu_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `operations`
--
ALTER TABLE `operations`
  ADD CONSTRAINT `operations_ibfk_1` FOREIGN KEY (`id_service_comptable`) REFERENCES `service_comptable` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operations_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `parc_automobile`
--
ALTER TABLE `parc_automobile`
  ADD CONSTRAINT `parc_automobile_ibfk_1` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participant_ibfk_2` FOREIGN KEY (`id_praticien`) REFERENCES `praticien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participant_ibfk_3` FOREIGN KEY (`id_remplacant_praticien`) REFERENCES `remplacant_praticien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `praticien`
--
ALTER TABLE `praticien`
  ADD CONSTRAINT `praticien_ibfk_1` FOREIGN KEY (`id_fonction_praticien`) REFERENCES `fonction_praticien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `praticien_ibfk_2` FOREIGN KEY (`id_type_praticien`) REFERENCES `type_praticien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `praticien_ibfk_4` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `praticien_ibfk_5` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_3` FOREIGN KEY (`id_laboratoire`) REFERENCES `laboratoire` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produit_ibfk_5` FOREIGN KEY (`id_famille_produit`) REFERENCES `famille_produit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produit_composants`
--
ALTER TABLE `produit_composants`
  ADD CONSTRAINT `produit_composants_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produit_composants_ibfk_2` FOREIGN KEY (`composant_id`) REFERENCES `composant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `rdv`
--
ALTER TABLE `rdv`
  ADD CONSTRAINT `rdv_ibfk_1` FOREIGN KEY (`id_praticien`) REFERENCES `praticien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rdv_ibfk_2` FOREIGN KEY (`id_visiteur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rdv_ibfk_3` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rdv_ibfk_4` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `remplacant_praticien`
--
ALTER TABLE `remplacant_praticien`
  ADD CONSTRAINT `remplacant_praticien_ibfk_1` FOREIGN KEY (`id_praticien_remplacant`) REFERENCES `praticien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `remplacant_praticien_ibfk_2` FOREIGN KEY (`id_praticien_remplace`) REFERENCES `praticien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `service_comptable`
--
ALTER TABLE `service_comptable`
  ADD CONSTRAINT `service_comptable_ibfk_1` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `synthese_mensuelle`
--
ALTER TABLE `synthese_mensuelle`
  ADD CONSTRAINT `synthese_mensuelle_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`id_laboratoire`) REFERENCES `laboratoire` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utilisateur_ibfk_3` FOREIGN KEY (`id_service_comptable`) REFERENCES `service_comptable` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utilisateur_ibfk_4` FOREIGN KEY (`id_fonction_utilisateur`) REFERENCES `fonction_utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utilisateur_ibfk_6` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `vehicule_ibfk_1` FOREIGN KEY (`id_parc_automobile`) REFERENCES `parc_automobile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicule_ibfk_2` FOREIGN KEY (`id_energie`) REFERENCES `energie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicule_ibfk_3` FOREIGN KEY (`id_type_vehicule`) REFERENCES `type_vehicule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicule_ibfk_4` FOREIGN KEY (`id_marque`) REFERENCES `vehicule_marque` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicule_ibfk_5` FOREIGN KEY (`id_model`) REFERENCES `vehicule_model` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vehicule_images`
--
ALTER TABLE `vehicule_images`
  ADD CONSTRAINT `vehicule_images_ibfk_1` FOREIGN KEY (`immatricule_vehicule`) REFERENCES `vehicule` (`immatricule`);

--
-- Contraintes pour la table `vehicule_model`
--
ALTER TABLE `vehicule_model`
  ADD CONSTRAINT `vehicule_model_ibfk_1` FOREIGN KEY (`id_marque`) REFERENCES `vehicule_marque` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vehicule_utilisateur`
--
ALTER TABLE `vehicule_utilisateur`
  ADD CONSTRAINT `vehicule_utilisateur_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicule_utilisateur_ibfk_2` FOREIGN KEY (`id_parc_automobile_depart`) REFERENCES `parc_automobile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicule_utilisateur_ibfk_3` FOREIGN KEY (`id_parc_automobile_arrivee`) REFERENCES `parc_automobile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicule_utilisateur_ibfk_4` FOREIGN KEY (`immatricule_vehicule`) REFERENCES `vehicule` (`immatricule`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
