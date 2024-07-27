-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 27 juil. 2024 à 16:31
-- Version du serveur : 8.0.36
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog_symfony_v2`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `label`, `slug`, `updated_at`, `created_at`) VALUES
(1, 'IseKai', 'isekai', '2024-07-25 14:55:18', '2024-07-25 14:55:25'),
(2, 'Action', 'action', '2024-07-25 14:55:28', '2024-07-25 14:55:34'),
(3, 'Shônen', 'shonen', '2024-07-25 14:55:37', '2024-07-25 14:55:31'),
(4, 'Romance', 'romance', '2024-07-25 14:55:39', '2024-07-25 14:55:42');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240724122732', '2024-07-24 12:30:10', 46),
('DoctrineMigrations\\Version20240724131343', '2024-07-24 13:13:55', 50),
('DoctrineMigrations\\Version20240725083951', '2024-07-25 08:40:08', 107),
('DoctrineMigrations\\Version20240725092645', '2024-07-25 09:27:09', 76),
('DoctrineMigrations\\Version20240725125342', '2024-07-25 12:53:59', 56);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5A8A6C8DF675F31B` (`author_id`),
  KEY `IDX_5A8A6C8D12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `author_id`, `title`, `slug`, `summary`, `content`, `created_at`, `updated_at`, `category_id`) VALUES
(4, 1, 'Demon Slayer: Kimetsu no Yaiba', 'demon-slayer', 'Découvrez une aventure où le sang va couler sous la lame de l’épée. Nous sommes pendant l’ère Taishô. Tanjirô, un jeune et sympathique vendeur de charbon voit son quotidien changer radicalement après le massacre de sa famille par un démon. Seule sa petite sœur Nezuko survit à l’attaque, mais elle est transformée en un démon féroce. Ils partent tous deux en voyage afin de prendre leur revanche et de rendre à Nezuko son apparence d’origine. Vivez avec eux ce périple dans lequel le destin des humains et des démons s’entremêlent.', '', '2024-07-25 09:38:48', '2024-07-25 11:43:22', 3),
(5, 1, 'My Hero Academia', 'my-hero-academia', 'Super héros, super pouvoirs… On a tous déjà rêvé secrètement de posséder une qualité hors du commun, de briller ou d’être LA personne la plus puissante de l’univers. Dans ce nouveau monde, ce rêve est à la portée de quasiment toute la population car les humains peuvent désormais naître avec un pouvoir : le « alter ». Mais certains malchanceux naissent sans alter.', '', '2024-07-25 09:38:49', '2024-07-25 11:43:28', 3),
(6, 1, 'MASHLE: MAGIC AND MUSCLES', 'mashle', 'Dans un monde où la magie fait loi, il était une fois Mash Burnedead ! Élevé au fin fond de la\r\nforêt, le jeune garçon partage ses journées entre séances de musculation et dégustation de\r\nchoux à la crème. Mais un jour, un agent de police découvre son secret : il est né sans\r\npouvoirs magiques, ce qui est puni de mort ! Pour survivre, il va devoir postuler à Easton,\r\nune prestigieuse académie de magie, et en devenir le meilleur élève… La magie n’a plus\r\nqu’à bien se tenir : avec sa musculature affûtée et sa force hors du commun, Mash compte\r\nbien pulvériser tous les sorts et briser les codes de cette société !', '', '2024-07-25 09:38:49', '2024-07-25 11:43:33', 3),
(7, 1, 'Dragon Ball Z', 'dragon-ball-z', 'Tandis que Son Goku, devenu papa, mène une vie de famille tranquille, de nouveaux ennemis dotés d’une puissance extraordinaire arrivent sur Terre. Le jeune fils de Son Goku, Son Gohan, va se joindre au combat malgré lui, point de départ d’une série d’affrontements qui entraînent nos amis sur une lointaine planète…', '', '2024-07-25 09:44:40', '2024-07-25 11:44:41', 2),
(8, 1, 'JUJUTSU KAISEN', 'jujutsu-kaisen', 'JUJUTSU KAISEN est une série de manga créée par Gege Akutami et publiée dans le Weekly Shonen Jump. L’œuvre a rapidement été adaptée en anime, avec une animation produite par le Studio MAPPA. La série comporte actuellement deux saisons, la première en 24 épisodes et la seconde, diffusée depuis juillet 2023. Un film préquel, JUJUTSU KAISEN 0, est également sorti en 2022 et a rencontré un grand succès. La série est disponible en version doublée et sous-titrée.', 'JUJUTSU KAISEN est une série de manga créée par Gege Akutami et publiée dans le Weekly Shonen Jump. L’œuvre a rapidement été adaptée en anime, avec une animation produite par le Studio MAPPA. La série comporte actuellement deux saisons, la première en 24 épisodes et la seconde, diffusée depuis juillet 2023. Un film préquel, JUJUTSU KAISEN 0, est également sorti en 2022 et a rencontré un grand succès. La série est disponible en version doublée et sous-titrée.\r\n\r\nPlongez dans une série sombre, palpitante et surnaturelle… Suivez le jeune Yuji Itadori dans son initiation aux dangereux arts de l’exorcisme et au monde des fléaux !\r\n\r\nPour sauver son camarade de classe, Yuji Itadori a mangé… un doigt de démon maudit. Il partage désormais son corps avec Ryomen Sukuna, un démon maléfique connu sous le nom de Roi des Fléaux.\r\n\r\nLes fléaux sont des forces surnaturelles créées à partir des émotions négatives des humains. Cette énergie occulte est la source de la puissance des exorcistes, aussi bien que des fléaux.\r\n\r\nYuji rejoint alors l’école d’exorcisme de Tokyo, qui lutte contre les fléaux. Guidé par son professeur, Satoru Gojo, il se lie d’amitié avec Megumi Fushiguro et Nobara Kugisaki, tous deux élèves de première année.\r\n\r\nLa saison 2 remonte le temps dans l’univers de JUJUTSU KAISEN... Nous suivons Satoru Gojo et Suguru Geto, alors étudiants, dans leur mission pour protéger le Plasma Stellaire.', '2024-07-25 09:44:40', '2024-07-25 11:44:41', 2),
(13, 1, 'Tomo-chan est une fille !', 'tomo-chan', 'Tomo Aizawa est un vrai garçon manqué ! Pourtant, cette lycéenne aimerait bien que son ami d\'enfance, Jun’ichirô Kubota, la voie comme une fille, mais toutes ses tentatives sont vaines. Toujours à l\'ouest, le jeune homme se rendra-t-il compte un jour des sentiments de Tomo à son égard ?', '', '2024-07-25 09:47:16', '2024-07-25 11:47:16', 4),
(14, 1, 'Horimiya', 'horimiya', 'Hori Kyôko est la coqueluche de sa classe, une lycéenne jolie et populaire aux excellents résultats. Mais le soir venu, elle doit tenir la maison à la place de ses parents qui travaillent et s\'occuper de son petit frère, Sôta. Un jour pas comme un autre, Sôta se fait mal dehors. Un garçon inconnu qui prend sur lui de le ramener chez sa famille, mais quand Kyôko leur ouvre la porte, c\'est interloqué qu\'il prononce son nom avec un soupçon d\'hésitation. Elle se rend alors compte que la personne qui vient de ramener son frère n\'est autre qu\'un camarade de classe...', '', '2024-07-25 09:47:16', '2024-07-25 11:47:16', 4),
(15, 1, 'Rent-a-Girlfriend', 'rent-a-girlfriend', 'Kazuya Kinoshita est un étudiant de 20 ans qui a échoué dans ses études. Il a toutefois réussi à embrasser sa petite amie une fois, mais elle l\'a largué au bout d\'un mois !\r\nNe voulant plus jamais revivre une telle situation, il part en quête d\'une nouvelle copine en s\'aidant d\'une application spéciale permettant de louer une petite amie. C\'est ainsi qu\'il fait la connaissance de Chizuru Mizuhara qu\'il trouve tout à fait à son goût. Mais la suite ne se déroule pas comme prévu et Kazuya s\'embarque dans une situation plutôt gênante', '', '2024-07-25 09:47:16', '2024-07-25 11:49:02', 4),
(16, 1, 'Arrête de me chauffer, Nagatoro', 'nagatoro', 'Alors qu’il se rend à la bibliothèque, Naoto devient un jour la cible d’une fille plus jeune que lui. Cette élève qui le taquine, l’aguiche et le tourmente s’appelle Nagatoro ! À la fois ennuyeuse, mais adorable, elle ne cesse de s’en prendre à Naoto. Mais où veut-elle en venir, finalement ? Et si ses caprices agacent le garçon, ils pourraient bien l’aider à sortir de sa timidité.', '', '2024-07-25 09:47:16', '2024-07-25 11:50:05', 4),
(23, 1, 'Moi, quand je me réincarne en Slime', 'je-me-reincarne-en-slime', 'Satoru, employé de bureau lambda, se fait assassiner par un criminel en pleine rue. Son histoire aurait dû s\'arrêter là, mais il se retrouve soudain réincarné dans un autre monde sous la forme d\'un Slime, le monstre le plus faible du bestiaire fantastique. Le voilà équipé de deux compétences uniques : « Prédateur », lui permettant de récupérer les aptitudes de ses adversaires, et « Grand Sage », grâce à laquelle il acquiert une compréhension aiguë de son environnement. Mais même muni de ces armes, ses chances de survie semblent cependant limitées.', '', '2024-07-25 09:53:30', '2024-07-25 11:53:31', 1),
(24, 1, 'The Reincarnation Of The Strongest Exorcist In Another World', 'the-strongest-exorcist', 'Même si on est le meilleur exorciste du monde, la puissance ne suffit pas à rendre heureux. Haruyoshi Kuga, exorciste au génie imbattable, est aux portes de la mort après avoir été trahi par la cour impériale. Déterminé à être heureux dans sa prochaine vie, il se sert d’une technique de réincarnation secrète de sa création pour se transporter dans un autre monde. Il s’appelle désormais Seika et prend conscience qu’il n’a pas été assez rusé. Dans cette nouvelle vie, il décide d’être plus calculateur, simplement dans le but de trouver enfin le bonheur', '', '2024-07-25 09:53:31', '2024-07-25 11:53:31', 1),
(25, 1, 'The World\'s Finest Assassin Gets Reincarnated in Another World as an Aristocrat', 'finest-assassin', 'Le plus grand tueur au monde s’est réincarné en fils aîné d’une famille d’assassins aristocrates. Mais la déesse qui lui a accordé ce statut lui demande un service en échange : « Tuer le héros annoncé comme le destructeur de son monde » ! Avec ses connaissances, son expérience des temps modernes et la magie qu’il découvre, il pourrait bien devenir l\'assassin le plus invincible de tous les temps ! De quoi le rassurer pour mener à bien cette mission.', '', '2024-07-25 09:53:31', '2024-07-25 11:57:39', 1),
(26, 1, 'Test yvanne 2', 'test', 'lorem ispum braahhhhh', 'content ispsum', '2024-07-26 09:51:00', '2024-07-26 10:09:16', 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`, `full_name`, `email`) VALUES
(1, 'louis_pignon', '[\"ROLE_ADMIN\"]', '$2y$13$GEoziewmNbkVCCGWE1MT4.NbKxwcS.JIpg1ZOhdcuwLKkEt8T84CS', 'Louis Pigons', 'louispigons@gmail.com');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8D12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_5A8A6C8DF675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
