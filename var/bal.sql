-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 03 juin 2025 à 22:21
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : "bal"
--

-- --------------------------------------------------------

--
-- Structure de la table "doctrine_migration_versions"
--

CREATE TABLE "doctrine_migration_versions" (
  "version" varchar(191) NOT NULL,
  "executed_at" datetime DEFAULT NULL,
  "execution_time" int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table "doctrine_migration_versions"
--

INSERT INTO "doctrine_migration_versions" ("version", "executed_at", "execution_time") VALUES
('DoctrineMigrations\\Version20250528101010', '2025-05-28 12:10:31', 41);

-- --------------------------------------------------------

--
-- Structure de la table "messenger_messages"
--

CREATE TABLE "messenger_messages" (
  "id" bigint(20) NOT NULL,
  "body" longtext NOT NULL,
  "headers" longtext NOT NULL,
  "queue_name" varchar(190) NOT NULL,
  "created_at" datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  "available_at" datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  "delivered_at" datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table "participants"
--

CREATE TABLE "participants" (
  "id" int(11) NOT NULL,
  "nom" varchar(255) DEFAULT NULL,
  "prenom" varchar(255) DEFAULT NULL,
  "classe" varchar(255) DEFAULT NULL,
  "mail" varchar(255) NOT NULL,
  "qr_code" varchar(255) NOT NULL,
  "statut" varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table "participants"
--

INSERT INTO "participants" ("id", "nom", "prenom", "classe", "mail", "qr_code", "statut") VALUES
(1, 'Nom0', 'Valentin', 'Terminale A', 'emailtest0@example.com', '35c39bb4-8714-4a56-adce-ebad5a871c83', 'valide'),
(2, 'Nom1', 'Prenom1', 'Terminale A', 'emailtest1@example.com', 'd43af0d2-9a89-49eb-ae66-bcbcdd5486e8', 'passé'),
(3, 'Nom2', 'Prenom2', 'Terminale A', 'emailtest2@example.com', '0ac96bb2-f321-4379-a88b-2f58e54eb94b', 'valide'),
(4, 'Nom3', 'Prenom3', 'Terminale A', 'emailtest3@example.com', '6842c6a1-f46d-4a4b-a7db-91afa8508c8a', 'passé'),
(5, 'Nom4', 'Prenom4', 'Terminale A', 'emailtest4@example.com', '3210ef75-fa86-450e-8672-91c09b9011bc', 'non_passé'),
(6, 'Nom5', 'Prenom5', 'Terminale A', 'emailtest5@example.com', '8a0f57c4-1aa2-485a-b206-be13b9688c93', 'non_passé'),
(7, 'Nom6', 'Prenom6', 'Terminale A', 'emailtest6@example.com', '44fc399b-f74b-45ba-9765-087d835cc751', 'non_passé'),
(8, 'Nom7', 'Prenom7', 'Terminale A', 'emailtest7@example.com', '74a9e131-12b1-44ed-893d-2a3466b6c07c', 'non_passé'),
(9, 'Nom8', 'Prenom8', 'Terminale A', 'emailtest8@example.com', '71f8ebcb-3045-4902-8fa2-e26f1cdc8af1', 'non_passé'),
(10, 'Nom9', 'Prenom9', 'Terminale A', 'emailtest9@example.com', 'fae889d6-cf2b-43e3-b71c-7f940c2cc4fe', 'non_passé'),
(11, 'Nom10', 'Prenom10', 'Terminale A', 'emailtest10@example.com', '04753801-b94a-4f66-9530-24d022da5ab9', 'non_passé'),
(12, 'Nom11', 'Prenom11', 'Terminale A', 'emailtest11@example.com', 'e22eb7ac-d118-4964-b77e-d609240cb738', 'valide'),
(13, 'Nom12', 'Prenom12', 'Terminale A', 'emailtest12@example.com', '3266e18e-eeb3-4b7b-a571-19916b558098', 'non_passé'),
(14, 'Nom13', 'Prenom13', 'Terminale A', 'emailtest13@example.com', '45feb4a4-09af-4158-a510-b71fd1615e5e', 'valide'),
(15, 'Nom14', 'Prenom14', 'Terminale A', 'emailtest14@example.com', 'c6f137f2-8147-40fd-81d8-b9184b234ea8', 'non_passé'),
(16, 'Nom15', 'Prenom15', 'Terminale A', 'emailtest15@example.com', '761ac47d-79e2-4519-9f1f-cab25eb9c8ef', 'valide'),
(17, 'Nom16', 'Prenom16', 'Terminale A', 'emailtest16@example.com', 'ec9e0daf-d1c2-4470-9c50-c204fcc1ea7e', 'non_passé'),
(18, 'Nom17', 'Prenom17', 'Terminale A', 'emailtest17@example.com', '59ad9dbb-e0d6-47af-b484-f9affe8a3140', 'non_passé'),
(19, 'Nom18', 'Prenom18', 'Terminale A', 'emailtest18@example.com', '97727a0b-1438-412c-bdb5-165aad816e90', 'non_passé'),
(20, 'Nom19', 'Prenom19', 'Terminale A', 'emailtest19@example.com', '4dbc794e-37c7-4a3d-b653-12f3df57007f', 'non_passé'),
(21, 'Nom20', 'Prenom20', 'Terminale A', 'emailtest20@example.com', '2c16f47b-f355-4737-bd54-9ee53d4f0419', 'valide'),
(22, 'Nom21', 'Prenom21', 'Terminale A', 'emailtest21@example.com', '28039009-f34a-4498-9b0c-720813ad5111', 'non_passé'),
(23, 'Nom22', 'Prenom22', 'Terminale A', 'emailtest22@example.com', 'f7f260d8-08b5-46d2-b5f1-1bd51b6b0caf', 'non_passé'),
(24, 'Nom23', 'Prenom23', 'Terminale A', 'emailtest23@example.com', 'acc4dd81-8ad8-4e70-b601-05eca1c5f16b', 'non_passé'),
(25, 'Nom24', 'Prenom24', 'Terminale A', 'emailtest24@example.com', '47626037-544e-4f87-a58c-ccb59be8f68c', 'non_passé'),
(26, 'Nom25', 'Prenom25', 'Terminale A', 'emailtest25@example.com', '0c94165e-21be-47a5-87fd-20725f43f583', 'non_passé'),
(27, 'Nom26', 'Prenom26', 'Terminale A', 'emailtest26@example.com', 'b3f154fe-534b-444f-8088-c16c85792c06', 'non_passé'),
(28, 'Nom27', 'Prenom27', 'Terminale A', 'emailtest27@example.com', '4cd9b849-b497-4e36-aa49-ee9d5baffe1d', 'non_passé'),
(29, 'Nom28', 'Prenom28', 'Terminale A', 'emailtest28@example.com', 'b5152033-2f9c-454d-84c7-bf1b244d1c14', 'passé'),
(30, 'Nom29', 'Prenom29', 'Terminale A', 'emailtest29@example.com', 'fe93581f-c36b-41a1-9d73-120b03eed580', 'non_passé'),
(31, 'Nom30', 'Prenom30', 'Terminale A', 'emailtest30@example.com', 'fe1a8b69-0156-4609-85e1-fb18ac942139', 'non_passé'),
(32, 'Nom31', 'Prenom31', 'Terminale A', 'emailtest31@example.com', '496332f4-6c15-42e0-b571-32acee470926', 'non_passé'),
(33, 'Nom32', 'Prenom32', 'Terminale A', 'emailtest32@example.com', 'ace53c6d-0138-49df-b6ca-6d8faefce59b', 'non_passé'),
(34, 'Nom33', 'Prenom33', 'Terminale A', 'emailtest33@example.com', '0fd5e72b-b9d5-45eb-b0db-68a4e5ce1807', 'non_passé'),
(35, 'Nom34', 'Prenom34', 'Terminale A', 'emailtest34@example.com', '5bf15134-ca2d-4819-a115-e71e04f54924', 'non_passé'),
(36, 'Nom35', 'Prenom35', 'Terminale A', 'emailtest35@example.com', 'b71c0adc-1d4b-485b-b661-288bd209ba24', 'non_passé'),
(37, 'Nom36', 'Prenom36', 'Terminale A', 'emailtest36@example.com', 'cc8318b0-4ca8-4b5b-8017-d920a53d8dcc', 'valide'),
(38, 'Nom37', 'Prenom37', 'Terminale A', 'emailtest37@example.com', 'f4af3f2f-e5eb-41f8-b16e-2517610bf07b', 'non_passé'),
(39, 'Nom38', 'Prenom38', 'Terminale A', 'emailtest38@example.com', '7e9e816f-2cfd-48ab-ac2d-912f1c219e34', 'non_passé'),
(40, 'Nom39', 'Prenom39', 'Terminale A', 'emailtest39@example.com', '161fdf7c-c97f-4354-b525-3a9ee8dc2801', 'non_passé'),
(41, 'Nom40', 'Prenom40', 'Terminale A', 'emailtest40@example.com', '3d90790d-9b41-4df1-9e6d-c2619ccd3e86', 'non_passé'),
(42, 'Nom41', 'Prenom41', 'Terminale A', 'emailtest41@example.com', '461a7b68-2944-4b3e-9bc8-a70cf3494203', 'non_passé'),
(43, 'Nom42', 'Prenom42', 'Terminale A', 'emailtest42@example.com', '6d677609-764a-4c04-b971-219901f605ba', 'non_passé'),
(44, 'Nom43', 'Prenom43', 'Terminale A', 'emailtest43@example.com', 'b6ce0495-d9be-4c4b-b218-16c48bff59e4', 'non_passé'),
(45, 'Nom44', 'Prenom44', 'Terminale A', 'emailtest44@example.com', 'bbcc1825-11ab-47c2-8352-843c4ba30b96', 'non_passé'),
(46, 'Nom45', 'Prenom45', 'Terminale A', 'emailtest45@example.com', 'a55091f3-e4fb-481c-b6bb-d4276f023a17', 'non_passé'),
(47, 'Nom46', 'Prenom46', 'Terminale A', 'emailtest46@example.com', 'c5f41d71-c5c2-4fb0-8891-5198035896b4', 'non_passé'),
(48, 'Nom47', 'Prenom47', 'Terminale A', 'emailtest47@example.com', '40e5d5e0-2cd6-4d4e-9225-261c7fc7528f', 'non_passé'),
(49, 'Nom48', 'Prenom48', 'Terminale A', 'emailtest48@example.com', '4c48aad5-e96e-48b7-9c61-89717ea04a16', 'non_passé'),
(50, 'Nom49', 'Prenom49', 'Terminale A', 'emailtest49@example.com', 'db32404a-3f26-4667-89e2-a0a97a0ed845', 'non_passé'),
(51, 'Nom50', 'Prenom50', 'Terminale A', 'emailtest50@example.com', 'f74fe331-07d5-4c8c-a0cf-75396bea1ca8', 'non_passé'),
(52, 'Nom51', 'Prenom51', 'Terminale A', 'emailtest51@example.com', '5edbfb4f-b863-4c62-b560-ab8e86ba3dff', 'non_passé'),
(53, 'Nom52', 'Prenom52', 'Terminale A', 'emailtest52@example.com', '482b6ee0-7d82-427e-81c5-1420ec7e2bc9', 'non_passé'),
(54, 'Nom53', 'Prenom53', 'Terminale A', 'emailtest53@example.com', '59f7ee63-8c9a-4976-ac8e-4d1fff237b3b', 'non_passé'),
(55, 'Nom54', 'Prenom54', 'Terminale A', 'emailtest54@example.com', 'b7b9e4fe-dc75-4c3a-9135-099e67fb8374', 'non_passé'),
(56, 'Nom55', 'Prenom55', 'Terminale A', 'emailtest55@example.com', 'b4c502f3-a8eb-44e2-82d4-02f482af6749', 'non_passé'),
(57, 'Nom56', 'Prenom56', 'Terminale A', 'emailtest56@example.com', '52f093b1-3249-4f47-89a9-a362d5701a13', 'non_passé'),
(58, 'Nom57', 'Prenom57', 'Terminale A', 'emailtest57@example.com', 'ac97d68c-1c1b-442d-b558-46289be23b82', 'non_passé'),
(59, 'Nom58', 'Prenom58', 'Terminale A', 'emailtest58@example.com', 'cd1f7250-8877-480e-9dd5-65a1a3740e33', 'non_passé'),
(60, 'Nom59', 'Prenom59', 'Terminale A', 'emailtest59@example.com', '5922f488-cfe2-439f-bf74-89aad978a7ea', 'non_passé'),
(61, 'Nom60', 'Prenom60', 'Terminale A', 'emailtest60@example.com', '98185a9f-226b-4e78-8e65-0c62d0a652b0', 'non_passé'),
(62, 'Nom61', 'Prenom61', 'Terminale A', 'emailtest61@example.com', '36888d01-2522-490d-ac5e-fe15d7b0a483', 'non_passé'),
(63, 'Nom62', 'Prenom62', 'Terminale A', 'emailtest62@example.com', 'b7346a57-ed75-49be-a492-466fadf0b1ad', 'non_passé'),
(64, 'Nom63', 'Prenom63', 'Terminale A', 'emailtest63@example.com', 'f861faaa-d2e6-4fc5-8817-a53e0b5984b0', 'non_passé'),
(65, 'Nom64', 'Prenom64', 'Terminale A', 'emailtest64@example.com', '4039cfcf-2db6-48ec-811b-9115ee13be02', 'non_passé'),
(66, 'Nom65', 'Prenom65', 'Terminale A', 'emailtest65@example.com', '9259743a-81e1-4bd2-be03-6cb024fb3587', 'non_passé'),
(67, 'Nom66', 'Prenom66', 'Terminale A', 'emailtest66@example.com', 'afa0ebd1-2f08-4f84-874b-84fa14b597c4', 'non_passé'),
(68, 'Nom67', 'Prenom67', 'Terminale A', 'emailtest67@example.com', '5dd539b2-b782-429d-9609-58e42dc60837', 'non_passé'),
(69, 'Nom68', 'Prenom68', 'Terminale A', 'emailtest68@example.com', '54d7e36e-9c61-4736-b263-fe22b004cadd', 'non_passé'),
(70, 'Nom69', 'Prenom69', 'Terminale A', 'emailtest69@example.com', 'e5924f90-e008-40cb-9e10-d65b07760fc0', 'non_passé'),
(71, 'Nom70', 'Prenom70', 'Terminale A', 'emailtest70@example.com', '8ff2e98a-24b5-4580-997c-439e166ea838', 'non_passé'),
(72, 'Nom71', 'Prenom71', 'Terminale A', 'emailtest71@example.com', '42f2a8dd-f9ee-4f16-b818-195e9a28b42a', 'non_passé'),
(73, 'Nom72', 'Prenom72', 'Terminale A', 'emailtest72@example.com', '7f8140c0-a982-44fb-a399-59b53d4d4893', 'non_passé'),
(74, 'Nom73', 'Prenom73', 'Terminale A', 'emailtest73@example.com', '353cf1fe-8dad-4f11-8743-b5a00de49ebe', 'non_passé'),
(75, 'Nom74', 'Prenom74', 'Terminale A', 'emailtest74@example.com', 'cfd9c9dc-66b7-453c-895e-2e2de886cb71', 'non_passé'),
(76, 'Nom75', 'Prenom75', 'Terminale A', 'emailtest75@example.com', 'b408e52b-ad1d-4cf7-b9ff-e7a83af57a94', 'non_passé'),
(77, 'Nom76', 'Prenom76', 'Terminale A', 'emailtest76@example.com', '2fe15b71-7538-4d44-846f-19d02100c9b8', 'non_passé'),
(78, 'Nom77', 'Prenom77', 'Terminale A', 'emailtest77@example.com', '0965f04c-d630-4a94-b75e-e6716b0ab814', 'non_passé'),
(79, 'Nom78', 'Prenom78', 'Terminale A', 'emailtest78@example.com', '8f9e0543-6246-43bb-8bc8-467a59278637', 'non_passé'),
(80, 'Nom79', 'Prenom79', 'Terminale A', 'emailtest79@example.com', '0d78dc1d-5ae3-4413-a97e-7dbff189b737', 'passé'),
(81, 'Nom80', 'Prenom80', 'Terminale A', 'emailtest80@example.com', '5d801bf6-1f5d-44b5-92ee-8e3a48c3265d', 'passé'),
(82, 'Nom81', 'Prenom81', 'Terminale A', 'emailtest81@example.com', 'ba2f09fb-8099-42cd-95c0-a2133cd7f73b', 'non_passé'),
(83, 'Nom82', 'Prenom82', 'Terminale A', 'emailtest82@example.com', 'afe91309-8498-4a09-9f0b-ffbb86e39823', 'non_passé'),
(84, 'Nom83', 'Prenom83', 'Terminale A', 'emailtest83@example.com', 'c26eb315-6b35-4cb9-ae53-1327b62bd3f1', 'non_passé'),
(85, 'Nom84', 'Prenom84', 'Terminale A', 'emailtest84@example.com', '38f5621a-1fdd-4cda-bff1-432a3b50531e', 'non_passé'),
(86, 'Nom85', 'Prenom85', 'Terminale A', 'emailtest85@example.com', '3c9625e4-ffdd-4558-85e5-9d4edbdfd846', 'valide'),
(87, 'Nom86', 'Prenom86', 'Terminale A', 'emailtest86@example.com', '98bd96f3-14d4-4c3b-b6ac-bf8c5ef7fa29', 'non_passé'),
(88, 'Nom87', 'Prenom87', 'Terminale A', 'emailtest87@example.com', 'b12d4816-98c5-4440-9cfc-27bf796e4773', 'non_passé'),
(89, 'Nom88', 'Prenom88', 'Terminale A', 'emailtest88@example.com', '5aaeec35-2a29-4135-8da8-d1ada5e813f7', 'non_passé'),
(90, 'Nom89', 'Prenom89', 'Terminale A', 'emailtest89@example.com', '9c2a181c-1b37-445f-bfbc-07404aed6c74', 'non_passé'),
(91, 'Nom90', 'Prenom90', 'Terminale A', 'emailtest90@example.com', 'c085bda2-f81c-48a0-91f2-7a26207899bf', 'non_passé'),
(92, 'Nom91', 'Prenom91', 'Terminale A', 'emailtest91@example.com', '52c3094e-09c4-4f89-863f-5d3cc82e33f4', 'non_passé'),
(93, 'Nom92', 'Prenom92', 'Terminale A', 'emailtest92@example.com', '4813800b-8842-4f83-b828-d761fe993be4', 'non_passé'),
(94, 'Nom93', 'Prenom93', 'Terminale A', 'emailtest93@example.com', 'a118b432-b8cb-43ca-a4c9-2e9c4f5138fb', 'non_passé'),
(95, 'Nom94', 'Prenom94', 'Terminale A', 'emailtest94@example.com', '886cbd4c-4b57-48f0-a4a8-117a9786590c', 'non_passé'),
(96, 'Nom95', 'Prenom95', 'Terminale A', 'emailtest95@example.com', 'a4e5d598-7a43-4860-9289-adcfef7fc2a1', 'non_passé'),
(97, 'Nom96', 'Prenom96', 'Terminale A', 'emailtest96@example.com', '17bd94ec-6a53-496c-ac32-b43bf439783f', 'non_passé'),
(98, 'Nom97', 'Prenom97', 'Terminale A', 'emailtest97@example.com', '7607c9d2-cec4-4ab0-b11e-9d873555935b', 'non_passé'),
(99, 'Nom98', 'Prenom98', 'Terminale A', 'emailtest98@example.com', 'aefe16b4-c133-46fa-afa5-a2f862a28151', 'non_passé'),
(100, 'Nom99', 'Prenom99', 'Terminale A', 'emailtest99@example.com', '167b5352-fc91-42b3-aadf-652815df0796', 'non_passé');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table "doctrine_migration_versions"
--
ALTER TABLE "doctrine_migration_versions"
  ADD PRIMARY KEY ("version");

--
-- Index pour la table "messenger_messages"
--
ALTER TABLE "messenger_messages"
  ADD PRIMARY KEY ("id"),
  ADD KEY "IDX_75EA56E0FB7336F0" ("queue_name"),
  ADD KEY "IDX_75EA56E0E3BD61CE" ("available_at"),
  ADD KEY "IDX_75EA56E016BA31DB" ("delivered_at");

--
-- Index pour la table "participants"
--
ALTER TABLE "participants"
  ADD PRIMARY KEY ("id");

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table "messenger_messages"
--
ALTER TABLE "messenger_messages"
  MODIFY "id" bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table "participants"
--
ALTER TABLE "participants"
  MODIFY "id" int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
