-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Lun 23 Juin 2014 à 20:58
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `TpAlter`
--
CREATE DATABASE IF NOT EXISTS `TpAlter` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `TpAlter`;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `Client_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Client_Nom` varchar(50) NOT NULL,
  `Client_Prenom` varchar(50) NOT NULL,
  `Client_Adresse` varchar(80) NOT NULL,
  `Client_AdresseDeux` varchar(80) NOT NULL,
  `Client_Ville` varchar(30) NOT NULL,
  `Client_Codepostal` varchar(7) NOT NULL,
  `Client_Pays` varchar(20) NOT NULL,
  `Client_Tel` varchar(18) NOT NULL,
  `Client_Email` varchar(50) NOT NULL,
  `Client_NomUtilisateur` varchar(30) NOT NULL,
  `Client_Mdp` varchar(60) NOT NULL,
  `Client_DateEnregistrement` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Client_ID`),
  UNIQUE KEY `Client_ID` (`Client_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `Commande_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Commande_ProduitID` bigint(20) unsigned NOT NULL,
  `Commande_ClientID` int(11) NOT NULL,
  `Commande_TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Commande_ID`),
  UNIQUE KEY `Commande_ID` (`Commande_ID`),
  KEY `Commande_ProduitID` (`Commande_ProduitID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `inventaire`
--

CREATE TABLE IF NOT EXISTS `inventaire` (
  `Inventaire_IDLot` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Inventaire_ProduitID` bigint(20) unsigned NOT NULL,
  `Inventaire_NbDispo` int(11) NOT NULL,
  PRIMARY KEY (`Inventaire_IDLot`),
  UNIQUE KEY `Inventaire_IDLot` (`Inventaire_IDLot`),
  KEY `Inventaire_ProduitID` (`Inventaire_ProduitID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `Produit_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Produit_Nom` varchar(50) NOT NULL,
  `Produit_Code` int(11) NOT NULL,
  `Produit_Couleur` varchar(20) NOT NULL,
  `Produit_Description` varchar(100) NOT NULL,
  `Produit_OS` int(11) NOT NULL,
  `Produit_WaterProof` int(11) NOT NULL,
  `Produit_TouchScreen` int(11) NOT NULL,
  `Produit_ResolutionEcran` varchar(20) NOT NULL,
  `Produit_Microphone` int(11) NOT NULL,
  `Produit_Camera` int(11) NOT NULL,
  `Produit_CameraResolution` varchar(20) NOT NULL,
  `Produit_Hautparleur` int(11) NOT NULL,
  `Produit_Poids` int(11) NOT NULL,
  `Produit_Prix` int(11) NOT NULL,
  `Produit_Longeur` int(11) NOT NULL,
  `Produit_Largeur` int(11) NOT NULL,
  `Produit_Image` varchar(50) NOT NULL,
  UNIQUE KEY `Produit_ID` (`Produit_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `dr` FOREIGN KEY (`Commande_ProduitID`) REFERENCES `produit` (`Produit_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `inventaire`
--
ALTER TABLE `inventaire`
  ADD CONSTRAINT `produit` FOREIGN KEY (`Inventaire_ProduitID`) REFERENCES `produit` (`Produit_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
