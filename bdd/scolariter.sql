-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 22 juil. 2020 à 21:53
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.3.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `scolariter`
--

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

CREATE TABLE `etudiants` (
  `Num_E` int(5) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prenom` varchar(20) NOT NULL,
  `Sexe` varchar(2) NOT NULL,
  `Adresse` varchar(10) NOT NULL,
  `Telephone` int(10) NOT NULL,
  `Code_F` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiants`
--

INSERT INTO `etudiants` (`Num_E`, `Nom`, `Prenom`, `Sexe`, `Adresse`, `Telephone`, `Code_F`) VALUES
(1, 'odanou', 'massahoudou', 'M', 'agèo', 93240584, 'IG'),
(4, 'bassuka', 'chrisian', 'F', 'legba cito', 93240584, 'IG'),
(5, 'Alphonse', 'ayedji', 'M', 'légba', 70848948, 'IG'),
(7, 'AFOH', 'Faridat', 'F', 'cassablanc', 78948514, 'IG');

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `Code_F` varchar(6) NOT NULL,
  `libelle` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `filiere`
--

INSERT INTO `filiere` (`Code_F`, `libelle`) VALUES
('CGE', 'comptabilité gestion d\'entreprise'),
('GC', 'Géni civil'),
('IG', 'Informatique de Gestion');

-- --------------------------------------------------------

--
-- Structure de la table `payer`
--

CREATE TABLE `payer` (
  `Num_E` int(5) NOT NULL,
  `Num_R` int(3) NOT NULL,
  `date_P` date NOT NULL,
  `montant` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `payer`
--

INSERT INTO `payer` (`Num_E`, `Num_R`, `date_P`, `montant`) VALUES
(1, 5, '2020-06-21', 45000),
(4, 9, '2020-06-10', 30500),
(5, 9, '2020-06-21', 50000),
(7, 9, '2020-06-21', 70000);

-- --------------------------------------------------------

--
-- Structure de la table `recouvrement`
--

CREATE TABLE `recouvrement` (
  `Num_R` int(3) NOT NULL,
  `Date_R` date NOT NULL,
  `Montant` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `recouvrement`
--

INSERT INTO `recouvrement` (`Num_R`, `Date_R`, `Montant`) VALUES
(5, '2020-03-28', 30001),
(9, '2020-03-10', 70500);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`Num_E`),
  ADD KEY `fk` (`Code_F`);

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`Code_F`);

--
-- Index pour la table `payer`
--
ALTER TABLE `payer`
  ADD PRIMARY KEY (`Num_E`,`Num_R`),
  ADD KEY `ck` (`Num_R`);

--
-- Index pour la table `recouvrement`
--
ALTER TABLE `recouvrement`
  ADD PRIMARY KEY (`Num_R`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `etudiants`
--
ALTER TABLE `etudiants`
  MODIFY `Num_E` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `recouvrement`
--
ALTER TABLE `recouvrement`
  MODIFY `Num_R` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD CONSTRAINT `fk` FOREIGN KEY (`Code_F`) REFERENCES `filiere` (`Code_F`);

--
-- Contraintes pour la table `payer`
--
ALTER TABLE `payer`
  ADD CONSTRAINT `ck` FOREIGN KEY (`Num_R`) REFERENCES `recouvrement` (`Num_R`),
  ADD CONSTRAINT `dk` FOREIGN KEY (`Num_E`) REFERENCES `etudiants` (`Num_E`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
