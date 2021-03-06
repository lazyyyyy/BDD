-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Sam 06 Mai 2017 à 00:01
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
-- Structure de la table `compte_rendu_visite`
--

CREATE TABLE `compte_rendu_visite` (
  `id` int(11) NOT NULL,
  `date_creation` datetime NOT NULL,
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
(3, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 2);

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
(1, 'salarié', NULL);

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
  `date_creation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `frais`
--

INSERT INTO `frais` (`id`, `montant`, `commentaire`, `date`, `id_utilisateur`, `id_type_frais`, `date_creation`) VALUES
(1, 156, 'test', '2016-02-28', 1, 2, '0000-00-00 00:00:00'),
(6, 111, 'TEST DEPUIS LE SITE', '2017-04-15', 1, 1, '0000-00-00 00:00:00'),
(7, 145, 'htdhdfd', '2017-04-14', 2, 1, '0000-00-00 00:00:00'),
(8, 999, 'test', '2017-05-05', 1, 1, '2017-05-01 22:04:13'),
(12, 159, 'test flo', '2017-04-05', 2, 1, '2017-05-02 13:27:01'),
(15, 333, 'test depuis le site', '2019-05-06', 2, 1, '2017-05-03 21:03:04'),
(16, 289, 'test', '2017-08-08', 2, 1, '2017-05-05 23:50:24'),
(17, 999, 'test depuis site', '2017-08-09', 2, 1, '2017-05-05 23:51:33');

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
(1, 'GSB Lyon', 'Rue de Lyon', 69003, 'Lyon', 'France', 2),
(2, 'GSB Paris', 'Champs Elysées', 75001, 'Paris', 'France', 2),
(32, 'GSB Marseille', 'Rue de Marseille', 13001, 'Marseille', 'France', 4);

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
(2, 'TEST', 2);

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
(11, 'Hugo', 'Victor', '0489562314', '0602050809', 'victor.hugo@outlook.fr', '2016-05-01 00:00:00', NULL, 1, 1, 1),
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
(1, 'Test', 'TEST TEST', 'TEST TEST', '1 comprimé le matin et 1 comprimé le soir', 'Adulte de plus de 20 ans', 1, 2),
(2, 'dolliprane', 'contre maux de tete', 'enfants', '1 matin 1 soir', 'adultes', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit_composants`
--

CREATE TABLE `produit_composants` (
  `produit_id` int(11) NOT NULL,
  `composant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
(1, 'Hôtel', NULL),
(2, 'Restaurant', NULL),
(3, 'Frais véhicule', NULL),
(4, 'Carburant', NULL),
(5, 'Péage', NULL);

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
(2, 'médecin', NULL);

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
  `id_fonction_utilisateur` int(11) NOT NULL,
  `id_lieu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `date_naissance`, `date_embauche`, `date_creation`, `date_modification`, `telephone_portable`, `telephone_fixe`, `mail`, `id_laboratoire`, `id_fonction_utilisateur`, `id_lieu`) VALUES
(1, 'spadaro', 'florian', '1997-02-09', '2016-06-06', '2016-08-10 00:00:00', '2017-05-04 16:50:57', '0636968686', '0458686565', 'spadaro.florian@outlook.fr', 1, 2, 1),
(2, 'user', 'user', '2000-01-01', '2000-01-01', '2017-04-13 22:04:58', '2017-04-13 22:04:58', '0102030405', '0102030405', 'user@user.com', 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE `vehicule` (
  `immatricule` varchar(255) NOT NULL,
  `marque` varchar(255) NOT NULL,
  `modele` varchar(255) NOT NULL,
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

INSERT INTO `vehicule` (`immatricule`, `marque`, `modele`, `description`, `kilometrage`, `disponible`, `equipement`, `id_parc_automobile`, `id_energie`, `id_type_vehicule`, `image`) VALUES
('AA-689-BF', 'Audi', 'A3', 'Vehicule neuf', 125000, 1, 'Anti-brouillards', 2, 1, 1, 'imagesVehicules/audiA3.jpg'),
('BJ-685-JH', 'Volkswagen', 'Golf', NULL, 36785, 1, NULL, 1, 1, 1, 'imagesVehicules/volkswagenGolf.jpg');

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
(6, 2, 'AA-689-BF', '2017-05-05 17:19:04', '2017-05-05 17:19:21', 2, 2, 158);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `composant`
--
ALTER TABLE `composant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`);

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
-- Index pour la table `parc_automobile`
--
ALTER TABLE `parc_automobile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lieu` (`id_lieu`);

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
  ADD KEY `produit_id` (`produit_id`),
  ADD KEY `composant_produit` (`composant_id`);

--
-- Index pour la table `region`
--
ALTER TABLE `region`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libelle` (`libelle`);

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
  ADD KEY `id_fonction_utilisateur` (`id_fonction_utilisateur`),
  ADD KEY `id_lieu` (`id_lieu`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`immatricule`),
  ADD KEY `id_parc_automobile` (`id_parc_automobile`),
  ADD KEY `id_energie` (`id_energie`),
  ADD KEY `id_type_vehicule` (`id_type_vehicule`);

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
-- AUTO_INCREMENT pour la table `composant`
--
ALTER TABLE `composant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `compte_rendu_visite`
--
ALTER TABLE `compte_rendu_visite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `connexion`
--
ALTER TABLE `connexion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `laboratoire`
--
ALTER TABLE `laboratoire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `lieu`
--
ALTER TABLE `lieu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT pour la table `motif`
--
ALTER TABLE `motif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `parc_automobile`
--
ALTER TABLE `parc_automobile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `praticien`
--
ALTER TABLE `praticien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `specialite`
--
ALTER TABLE `specialite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
-- AUTO_INCREMENT pour la table `vehicule_utilisateur`
--
ALTER TABLE `vehicule_utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `compte_rendu_visite`
--
ALTER TABLE `compte_rendu_visite`
  ADD CONSTRAINT `compte_rendu_visite_ibfk_1` FOREIGN KEY (`id_motif`) REFERENCES `motif` (`id`),
  ADD CONSTRAINT `compte_rendu_visite_ibfk_3` FOREIGN KEY (`id_praticien`) REFERENCES `praticien` (`id`),
  ADD CONSTRAINT `compte_rendu_visite_ibfk_6` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `compte_rendu_visite_ibfk_7` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `connexion`
--
ALTER TABLE `connexion`
  ADD CONSTRAINT `connexion_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `frais`
--
ALTER TABLE `frais`
  ADD CONSTRAINT `frais_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `frais_ibfk_2` FOREIGN KEY (`id_type_frais`) REFERENCES `type_frais` (`id`);

--
-- Contraintes pour la table `justificatif`
--
ALTER TABLE `justificatif`
  ADD CONSTRAINT `justificatif_ibfk_1` FOREIGN KEY (`id_frais`) REFERENCES `frais` (`id`);

--
-- Contraintes pour la table `laboratoire`
--
ALTER TABLE `laboratoire`
  ADD CONSTRAINT `laboratoire_ibfk_1` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`);

--
-- Contraintes pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD CONSTRAINT `lieu_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`);

--
-- Contraintes pour la table `parc_automobile`
--
ALTER TABLE `parc_automobile`
  ADD CONSTRAINT `parc_automobile_ibfk_1` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`);

--
-- Contraintes pour la table `praticien`
--
ALTER TABLE `praticien`
  ADD CONSTRAINT `praticien_ibfk_1` FOREIGN KEY (`id_fonction_praticien`) REFERENCES `fonction_praticien` (`id`),
  ADD CONSTRAINT `praticien_ibfk_2` FOREIGN KEY (`id_type_praticien`) REFERENCES `type_praticien` (`id`),
  ADD CONSTRAINT `praticien_ibfk_4` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`),
  ADD CONSTRAINT `praticien_ibfk_5` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_3` FOREIGN KEY (`id_laboratoire`) REFERENCES `laboratoire` (`id`),
  ADD CONSTRAINT `produit_ibfk_5` FOREIGN KEY (`id_famille_produit`) REFERENCES `famille_produit` (`id`);

--
-- Contraintes pour la table `produit_composants`
--
ALTER TABLE `produit_composants`
  ADD CONSTRAINT `produit_composants_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`),
  ADD CONSTRAINT `produit_composants_ibfk_2` FOREIGN KEY (`composant_id`) REFERENCES `composant` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`id_laboratoire`) REFERENCES `laboratoire` (`id`),
  ADD CONSTRAINT `utilisateur_ibfk_4` FOREIGN KEY (`id_fonction_utilisateur`) REFERENCES `fonction_utilisateur` (`id`),
  ADD CONSTRAINT `utilisateur_ibfk_6` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`);

--
-- Contraintes pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `vehicule_ibfk_1` FOREIGN KEY (`id_parc_automobile`) REFERENCES `parc_automobile` (`id`),
  ADD CONSTRAINT `vehicule_ibfk_2` FOREIGN KEY (`id_energie`) REFERENCES `energie` (`id`),
  ADD CONSTRAINT `vehicule_ibfk_3` FOREIGN KEY (`id_type_vehicule`) REFERENCES `type_vehicule` (`id`);

--
-- Contraintes pour la table `vehicule_utilisateur`
--
ALTER TABLE `vehicule_utilisateur`
  ADD CONSTRAINT `vehicule_utilisateur_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `vehicule_utilisateur_ibfk_2` FOREIGN KEY (`id_parc_automobile_depart`) REFERENCES `parc_automobile` (`id`),
  ADD CONSTRAINT `vehicule_utilisateur_ibfk_3` FOREIGN KEY (`id_parc_automobile_arrivee`) REFERENCES `parc_automobile` (`id`),
  ADD CONSTRAINT `vehicule_utilisateur_ibfk_4` FOREIGN KEY (`immatricule_vehicule`) REFERENCES `vehicule` (`immatricule`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
