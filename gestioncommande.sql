-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 18 jan. 2018 à 16:14
-- Version du serveur :  5.7.20-log
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestioncommande`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id_article` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(50) DEFAULT NULL,
  `prix_vente_ht` float DEFAULT NULL,
  `id_tva` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_article`),
  KEY `FK_TVA_id_tva` (`id_tva`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id_article`, `reference`, `prix_vente_ht`, `id_tva`) VALUES
(1, 'Sirop', 2, 1),
(2, 'Eau minérale', 2, 1),
(3, 'Coca-Cola', 3, 1),
(4, 'Orangina', 3, 1),
(5, 'Red Bull', 4, 1),
(6, 'Bordeaux', 3, 2),
(7, 'Côte de provence', 2.5, 2),
(8, 'Chardonnay', 4.5, 2),
(9, 'Coteau du Layon', 4.5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `date_commande` date DEFAULT NULL,
  `id_Table` int(11) DEFAULT NULL,
  `id_statut_Cmd` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `FK_Commande_id_Table` (`id_Table`),
  KEY `FK_Commande_id_statut_Commande` (`id_statut_Cmd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

DROP TABLE IF EXISTS `ligne_commande`;
CREATE TABLE IF NOT EXISTS `ligne_commande` (
  `id_ligne` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` int(11) DEFAULT NULL,
  `prix_ht` float DEFAULT NULL,
  `prix_ttc` float DEFAULT NULL,
  `id_commande` int(11) DEFAULT NULL,
  `id_article` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ligne`),
  KEY `FK_Commande_id_commande` (`id_commande`),
  KEY `FK_Article_id_article` (`id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `statut_commande`
--

DROP TABLE IF EXISTS `statut_commande`;
CREATE TABLE IF NOT EXISTS `statut_commande` (
  `id_statut_Cmd` int(11) NOT NULL AUTO_INCREMENT,
  `type_statut` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_statut_Cmd`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut_commande`
--

INSERT INTO `statut_commande` (`id_statut_Cmd`, `type_statut`) VALUES
(1, 'Ouverte'),
(2, 'Fermé');

-- --------------------------------------------------------

--
-- Structure de la table `statut_table`
--

DROP TABLE IF EXISTS `statut_table`;
CREATE TABLE IF NOT EXISTS `statut_table` (
  `id_statut_Table` int(11) NOT NULL AUTO_INCREMENT,
  `type_statut` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_statut_Table`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut_table`
--

INSERT INTO `statut_table` (`id_statut_Table`, `type_statut`) VALUES
(1, 'Libre'),
(2, 'Occupé');

-- --------------------------------------------------------

--
-- Structure de la table `tablebar`
--

DROP TABLE IF EXISTS `tablebar`;
CREATE TABLE IF NOT EXISTS `tablebar` (
  `id_Table` int(11) NOT NULL AUTO_INCREMENT,
  `nb_Personnes` int(11) DEFAULT NULL,
  `id_statut_Table` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Table`),
  KEY `FK_Etat_Table` (`id_statut_Table`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tablebar`
--

INSERT INTO `tablebar` (`id_Table`, `nb_Personnes`, `id_statut_Table`) VALUES
(1, 4, 1),
(2, 4, 1),
(3, 4, 1),
(4, 5, 1),
(5, 5, 1),
(6, 4, 1),
(7, 5, 1),
(8, 4, 1),
(9, 4, 1),
(10, 5, 1),
(11, 5, 1),
(12, 4, 1),
(13, 5, 1),
(14, 4, 1),
(15, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `tva`
--

DROP TABLE IF EXISTS `tva`;
CREATE TABLE IF NOT EXISTS `tva` (
  `id_tva` int(11) NOT NULL AUTO_INCREMENT,
  `taux_tva` float DEFAULT NULL,
  PRIMARY KEY (`id_tva`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tva`
--

INSERT INTO `tva` (`id_tva`, `taux_tva`) VALUES
(1, 1.1),
(2, 1.2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_TVA_id_tva` FOREIGN KEY (`id_tva`) REFERENCES `tva` (`id_tva`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_Commande_id_Table` FOREIGN KEY (`id_Table`) REFERENCES `tablebar` (`id_Table`),
  ADD CONSTRAINT `FK_Commande_id_statut_Commande` FOREIGN KEY (`id_statut_Cmd`) REFERENCES `statut_commande` (`id_statut_Cmd`);

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `FK_Article_id_article` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`),
  ADD CONSTRAINT `FK_Commande_id_commande` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);

--
-- Contraintes pour la table `tablebar`
--
ALTER TABLE `tablebar`
  ADD CONSTRAINT `FK_Etat_Table` FOREIGN KEY (`id_statut_Table`) REFERENCES `statut_table` (`id_statut_Table`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
