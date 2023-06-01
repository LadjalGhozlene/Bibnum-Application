-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 30 mai 2023 à 08:33
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `library`
--

-- --------------------------------------------------------

--
-- Structure de la table `action_admin`
--

CREATE TABLE `action_admin` (
  `id_action` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `date_action` datetime NOT NULL,
  `action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `action_lecteur`
--

CREATE TABLE `action_lecteur` (
  `id_action` int(11) NOT NULL,
  `id_lecteur` int(11) NOT NULL,
  `date_action` datetime NOT NULL,
  `action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `id_admin` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `psw` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id_admin`, `user`, `psw`) VALUES
(1, '21232f297a57a5a743894a0e4a801fc3', '*4ACFE3202A5FF5CF467898FC58AAB1D615029441');

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `id_auteur` int(11) NOT NULL,
  `nom_auteur` varchar(100) NOT NULL,
  `prenom_auteur` varchar(100) NOT NULL,
  `biographie` text NOT NULL,
  `image` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`id_auteur`, `nom_auteur`, `prenom_auteur`, `biographie`, `image`) VALUES
(1, 'Solange', 'Ghernaouti', 'Diplômé de la faculté de polytechnique en ingénierie civile avec spécialité physique (1983) et docteur en génie nucléaire (1989) à l\'université libre de Bruxelles (ULB), il fut pris en charge comme chercheur par une subvention de la CEE-CCR au centre de recherche d\'Ispra (1984-1987). Ensuite, il devint membre du laboratoire IRIDIA (le laboratoire d\'intelligence artificielle de l\'ULB). Il est maintenant à la tête de celui-ci avec Marco Dorigo. Depuis 1992, il était professeur assistant à l\'ULB et devint officiellement professeur à temps plein (2004) en enseignant aux facultés polytechniques et Solvay les sciences informatiques, la programmation et l\'intelligence artificielle. Il est partenaire de différents projets industriels et projets Esprit (CEE) impliquant l\'utilisation de contrôleurs flous adaptatifs ou neuronaux, algorithmes d\'optimisation et de data mining.', '1'),
(2, 'Hugues', 'Bersini', 'Membre de l\'Académie Royale de Belgique, Hugues Bersini enseigne l\'informatique et la programmation aux facultés polytechnique et Solvay de l\'Université Libre de Bruxelles, dont il dirige le laboratoire d\'intelligence Artificielle. Il est l\'auteur de très nombreuses publications (systèmes complexes, génie logiciel, sciences cognitives et bioinformatique) et de plusieurs ouvrages d\'introduction à la programmation, l\'intelligence artificielle et les systèmes complexes qui font aujourd\'hui autorité dans le monde académique.', '2'),
(3, 'Pascal', 'Lafourcade', 'Docteur en informatique, Pascal Lafourcade est Maître de Conférence de l’Université Clermont Auvergne et effectue ses recherches dans le Thème Réseaux de capteurs au sein du laboratoire  LIMOS (UMR 6158), à \r\nIl enseigne au département Informatique de l’IUT et à l’ISIMA.\r\nDe 2013 à 2016, dans le cadre de la chaire de confiance numérique, il a organisé un séminaire mensuel sur la confiance numérique.Aubière.', '3'),
(4, 'Charles Adams', 'Platt', 'Passionné d\'électronique depuis son enfance, Charles Michael Platt est un auteur, journaliste, programmeur informatique, créateur de logiciels.\r\nNaturalisé Américain, il vit aux États-Unis depuis 1970.\r\nCharles Platt a commencé à s\'intéresser aux ordinateurs en 1979, lorsqu\'il s\'est acheté un Ohio Scientific C4P. Après avoir conçu des logiciels et les avoir vendus par correspondance, il a enseigné le BASIC, MS-DOS puis Adobe Illustrator et Photoshop. Au cours des années 1980, il a écrit cinq livres d\'informatique.', '4'),
(5, 'Erik', 'Bartmann', 'Électronicien de formation, Erik Bartmann est aujourd\'hui développeur pour le principal fournisseur européen d\'infrastructures informatiques. Passionné d\'électronique depuis toujours, il est l\'auteur de plusieurs ouvrages sur Arduino, Raspberry Pi et l\'ESP8266.', '5'),
(6, 'Cyprien', 'Accard', '', '6'),
(8, 'Daniel', 'Knox', 'Enfant, Daniel Knox a passé beaucoup de temps dans l\'atelier de son grand-père, où il a appris à fabriquer des objets. Aujourd\'hui, il est responsable du Shed, un atelier ouvert de fabrication à l\'université du Kent (Angleterre), qui met différentes machines à disposition des étudiants pour qu\'ils puissent réaliser leurs projets.', '7'),
(9, 'Hubert', 'Mèmeteau', 'Hubert Mèmeteau est professeur en génie mécanique. Il a accompli sa carrière à l\'Éducation nationale dans les académies de Versailles et de Poitiers. Bruno Collomb est professeur en génie mécanique, maintenance des véhicules dans l\'académie de Montpellier.', '8'),
(10, 'Jacques', 'Faisandier', 'Jacques Faisandier est Ingénieur des Arts et Métiers, ancien directeur technique de la SAMM, l\'auteur a consacré toute sa carrière au développement des techniques hydrauliques. Il a contribué à l\'élaboration d\'une théorie des asservissements hydrauliques, et a été l\'un des premiers à enseigner ces techniques en écoles d\'ingénieurs. Cette nouvelle édition a été coordonnée par Michel Blot, ingénieur INSA Lyon et ESTA, directeur technique et qualité de MOOG France, qui s\'est entouré de collaborateurs issus de l\'industrie et de la recherche.', '9'),
(11, 'Robert', 'Gourhant', '', '10'),
(12, 'Francis', 'Esnault', 'agrégé de mécanique et diplômé du CNAM, est professeur à l\'ECAM. Il a également enseigné les sciences industrielles en différents BTS (CPI, ET et AVA) et dispensé des cours en CPGE. Il est l\'auteur de nombreux ouvrages aux éditions Ellipses et Dunod.', '11');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_cat` int(11) NOT NULL,
  `intitule_cat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_cat`, `intitule_cat`) VALUES
(1, 'Informatique'),
(2, 'Électronique'),
(3, 'Mécanique'),
(4, 'Mécatronique'),
(5, 'Robotique'),
(6, 'أدب عربي'),
(7, 'Sciences de Gestion'),
(8, 'Mathématiques'),
(9, 'Biologies'),
(10, 'Science médicale');

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `id_dep` int(11) NOT NULL,
  `id_fac` int(11) NOT NULL,
  `intitule` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`id_dep`, `id_fac`, `intitule`) VALUES
(1, 1, 'Département de Biologie'),
(2, 1, 'Département de Biochimie'),
(3, 1, 'Département de Chimie'),
(4, 1, 'Département de Mathématiques'),
(5, 1, 'Département de Mathématiques-Informatique'),
(6, 1, 'Département de Physique'),
(7, 1, 'Département des Sciences de la Matière'),
(8, 1, 'Département des Sciences de la Mer'),
(9, 1, 'Département des Sciences de la Nature et la Vie'),
(10, 2, 'Département d’Electronique'),
(11, 2, 'Département d’Electromécanique'),
(12, 2, 'Département d’Eléctrotechnique'),
(13, 2, 'Département d’Informatique'),
(14, 2, 'Département de Génie Civil'),
(15, 2, 'Département de Métallurgie et Génie des Matériaux'),
(16, 2, 'Département de Génie des Procédés'),
(17, 2, 'Département de Génie Mécanique'),
(18, 2, 'Département d’Hydraulique'),
(19, 3, 'Département d’Aménagement du territoire'),
(20, 3, 'Département d’Architecture'),
(21, 3, 'Département de Géologie'),
(22, 3, 'Département des Mines'),
(23, 4, 'قسم الحقوق'),
(24, 4, 'قسم العلوم السياسية'),
(25, 5, 'قسم اللغة و الأدب العربي'),
(26, 5, 'قسم علم النفس'),
(27, 5, 'قسم التاريخ'),
(28, 5, 'قسم الفلسفة'),
(29, 5, 'قسم علم الإجتماع'),
(30, 5, 'قسم اللغة الإنجليزية'),
(31, 5, 'قسم اللغة الفرنسية'),
(32, 5, 'قسم اللغة الإيطالية'),
(33, 5, 'قسم الترجمة'),
(34, 5, 'قسم التربية البدنية و الرياضية'),
(35, 5, 'قسم علم إقتصاد المكتبات'),
(36, 5, 'قسم علوم الإتصال'),
(37, 5, 'قسم العلوم الإنسانية و الإجتماعية'),
(38, 6, 'Département de Médecine'),
(39, 6, 'Département de Pharmacie'),
(40, 6, 'Département de Chirurgie Dentaire');

-- --------------------------------------------------------

--
-- Structure de la table `ecrire`
--

CREATE TABLE `ecrire` (
  `id_ecrire` int(11) NOT NULL,
  `id_auteur` int(11) NOT NULL,
  `isbn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

CREATE TABLE `editeur` (
  `id_editeur` int(11) NOT NULL,
  `intitule` varchar(100) NOT NULL,
  `nom` text NOT NULL,
  `logo` varchar(100) NOT NULL,
  `adresse` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `editeur`
--

INSERT INTO `editeur` (`id_editeur`, `intitule`, `nom`, `logo`, `adresse`) VALUES
(1, 'Dunod', 'Dunod est une maison d\'édition du groupe Hachette Livre, spécialisée dans les ouvrages de formation universitaire et professionnelle et regroupe les marques Dunod, Armand Colin, InterÉditions, Ediscience, ETSF', '1', ''),
(2, 'Eyrolles', 'Le groupe Eyrolles est un groupe français d\'édition indépendant, présent dans l\'édition, la librairie et la diffusion. Le groupe diffuse une centaine d\'éditeurs via sa filiale Geodif et possède la Librairie Eyrolles', '2', ''),
(3, 'Ellipses', 'Les éditions Ellipses ont été fondées en 1973, en France, par Jean-Pierre Bénézet. Elles font partie de la catégorie des éditeurs dits indépendants.', '3', ''),
(4, 'Hachette', 'Hachette Livre, ou simplement Hachette, est un groupe d\'édition français fondé en 1826 par Louis Hachette. Au fil de ses acquisitions,', '4', '');

-- --------------------------------------------------------

--
-- Structure de la table `emprunter`
--

CREATE TABLE `emprunter` (
  `id_emprunt` int(11) NOT NULL,
  `id_lecteur` int(11) NOT NULL,
  `isbn` int(11) NOT NULL,
  `date_emprunt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `emprunter`
--

INSERT INTO `emprunter` (`id_emprunt`, `id_lecteur`, `isbn`, `date_emprunt`) VALUES
(6, 4, 1, '2023-05-20');

-- --------------------------------------------------------

--
-- Structure de la table `en_ligne`
--

CREATE TABLE `en_ligne` (
  `id_enligne` int(11) NOT NULL,
  `date_in` datetime NOT NULL,
  `date_out` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `facultes`
--

CREATE TABLE `facultes` (
  `id_fac` int(11) NOT NULL,
  `intitule` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `facultes`
--

INSERT INTO `facultes` (`id_fac`, `intitule`) VALUES
(1, 'Faculté des Sciences'),
(2, 'Faculté des Sciences de L\'ingéniorat'),
(3, 'Faculté des Sciences de la Terre'),
(4, 'Faculté de Droit'),
(5, 'Faculté des Lettres,des Sciences Humaines & Sociales'),
(6, 'Faculté de Médecine'),
(7, 'Faculté des Sciences Economiques & Gestion');

-- --------------------------------------------------------

--
-- Structure de la table `lecteur`
--

CREATE TABLE `lecteur` (
  `id_lecteur` int(11) NOT NULL,
  `nom_lecteur` varchar(80) NOT NULL,
  `prenom_lecteur` varchar(80) NOT NULL,
  `user` varchar(100) NOT NULL,
  `email_lecteur` varchar(100) NOT NULL,
  `date_naissance` date NOT NULL,
  `adresse` text NOT NULL,
  `date_inscription` date NOT NULL,
  `nb_emprunt` int(11) NOT NULL,
  `psw` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lecteur`
--

INSERT INTO `lecteur` (`id_lecteur`, `nom_lecteur`, `prenom_lecteur`, `user`, `email_lecteur`, `date_naissance`, `adresse`, `date_inscription`, `nb_emprunt`, `psw`) VALUES
(4, 'LOLO', 'Popo blabla', 'lolo', 'popo@lolo.kiki', '2023-05-15', 'gdfgdfgdfgdfg', '2023-05-14', 2, '123');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `isbn` int(11) NOT NULL,
  `titre_livre` varchar(80) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `id_editeur` int(11) NOT NULL,
  `etat` tinyint(1) NOT NULL DEFAULT 0,
  `img_livre` varchar(80) NOT NULL,
  `description` text NOT NULL,
  `id_auteur` int(11) NOT NULL,
  `date_parution` date NOT NULL,
  `nbr_page` int(11) NOT NULL,
  `format` varchar(20) NOT NULL,
  `localisation` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`isbn`, `titre_livre`, `id_cat`, `id_editeur`, `etat`, `img_livre`, `description`, `id_auteur`, `date_parution`, `nbr_page`, `format`, `localisation`) VALUES
(1, 'Cybersécurité - 6e éd. - Analyser les risques, mettre en oeuvre les solutions', 1, 1, 1, 'ouvrages/9782100807338.jpg', 'Le but de cet ouvrage est de fournir une vision globale des problématiques de sécurité et de criminalité informatique. En montrant que les technologies de l\'information présentent des failles susceptibles d\'être exploitées à des fins criminelles, l\'auteur explique les enjeux d\'une maîtrise rigoureuse et méthodique de la sécurité des systèmes et des réseaux de communication. Une centaine d\'exercices corrigés font de cet ouvrage un outil d\'apprentissage concret et efficace.\r\nCette 6e édition s\'enrichit de mises à jour sur les évolutions des protocoles de sécurité et sur les nouveaux modes de cyberattaques. Elle comporte en outre de nouveaux exercices.', 1, '2019-09-04', 416, '', 'Bibliotheque Centrale'),
(2, 'L\'intelligence artificielle en pratique avec Python - Recherche, optimisation, a', 1, 2, 0, 'ouvrages/9782416010941.jpg', 'Cet ouvrage a vocation essentiellement pédagogique a pour but d\'aider les débutants et praticiens confirmés de l\'Intelligence Artificielle à mieux faire le tri dans un ensemble de mécanismes algorithmiques propres à cette discipline et souvent confondus, tels la \"recherche\" , \"l\'optimisation\" et \"l\'apprentissage\" . Le besoin d\'un tel écrit s\'est fait sentir lorsque l\'auteur qui enseigne cette discipline informatique depuis plus de trente ans a constaté de manière accrue la grande confusion régnant dans l\'esprit de ses étudiants lorsque ces derniers choisissent de programmer ce qui leur paraît comme l\'algorithme et donc le logiciel le plus prometteur pour résoudre le jeu du taquin ou des problèmes de sudoku, un logiciel pour affronter des joueurs humains au jeu du puissance-4, des dames ou des échecs, un logiciel pour jouer aux vétérans Tetris ou au Snake, pour contrôler Super Mario dans le jeu vidéo du même nom, un logiciel capable de trouver le chemin le plus court dans un graphe ou de trouver le parcours le plus rapide traversant toutes les villes par un voyageur de commerce et, finalement, un logiciel capable de distinguer un chien d\'un chat sur une photo qu\'on lui présente.\r\nEt, de fait, les trois mécanismes les plus souvent confondus afin de s\'attaquer à ces problèmes sont effectivement la \"recherche\" , \"l\'optimisation\" et \"l\'apprentissage\" . Cet ouvrage théorique mais aussi et surtout pratique enseigne les bases de l\'IA en exploitant la force du langage de programmation Python. Tous ces exemples seront donc repris en donnant les clés pour maîtriser l\'intelligence artificielle grâce à Python.\r\nLa deuxième édition de cet ouvrage est enrichie et mise à jour. Elle comporte également deux nouveaux cas pratiques.', 2, '2023-03-09', 168, '', 'Bibliotheque Centrale'),
(3, '15 énigmes ludiques pour s\'initier à la programmation Python', 1, 1, 0, 'ouvrages/9782100834303.jpg', 'L\'objectif proposé par cet ouvrage est de s\'initier à la programmation avec Python en écrivant un petit programme informatique pour résoudre des énigmes amusantes. Les thèmes de ces énigmes ont été choisis pour découvrir à chaque fois un nouveau concept-clé en informatique. Les commandes Python qui seront utiles à la résolution des énigmes sont intégrées dans le livre pour qu\'il soit auto-suffisant.\r\nPour chaque énigme trois niveaux d\'indice sont fournis pour ceux qui auront besoin d\'un peu d\'aide pour démarrer. La difficulté des énigmes est repérée par un système d\'étoiles. La solution complète de toutes les énigmes est bien sûr détaillée en fin d\'ouvrage. Elle comporte non seulement le programme Python qui permet de trouver la solution mais aussi des explications détaillées sur la conception de l\'algorithme correspondant.\r\nEnfin de nombreux encadrés historiques, biographiques, culturels ou techniques viennent agrémenter la lecture.', 3, '2022-11-02', 179, '', 'Bibliotheque Centrale'),
(4, 'L\'électronique en pratique', 2, 2, 0, 'ouvrages/9782416006999.jpg', 'Voici la troisième édition de ce best-seller d\'initiation à l\'électronique. A l\'aide de 30 expériences amusantes, le lecteur apprendra les bases de l\'électronique, en passant sans arrêt de la pratique à la théorie et inversement. Ce livre est un pied de nez à tous ceux qui pensent qu\'un ouvrage d\'électronique est forcément indigeste. Ludique, inventif, foisonnant d\'illustrations (photos, schémas, dessins), écrit dans un langage vivant et accessible, il donnerait presque envie à chacun de se lancer dans l\'aventure : makers, bidouilleurs, bricoleurs, hackers, électroniciens en herbe, designers, musiciens, étudiant', 4, '2023-11-03', 351, '', 'Bibliotheque Centrale'),
(5, 'L\'électronique en pratique - 36 expériences ludiques', 2, 2, 0, 'ouvrages/9782212135077.jpg', 'Vous souhaitez vous mettre à l\'électronique, mais à condition de pratiquer tout de suite ? Vous voulez en connaître les grands fondements, mais sans risquer l\'overdose de théorie ? Avec ce livre d\'introduction, vous commencerez à monter des circuits simples dès la première page. Par le biais de 36 expériences, toutes plus amusantes les unes que les autres, vous découvrirez les principaux composants et les concepts essentiels de l\'électronique.\r\nVous serez guidé pas à pas dans la réalisation de montages de plus en plus complexes, allant d\'un commutateur basique aux circuits intégrés, d\'une LED qui clignote aux microcontrôleurs programmables. Ludique, inventif, foisonnant d\'illustrations (plus de 500 photos, schémas et dessins), écrit dans un langage vivant et accessible, cet ouvrage remarquable met l\'électronique à la portée de tous. A qui s\'adresse ce livre ? Aux électroniciens en herbe, amateurs, bricoleurs, bidouilleurs, geeks, étudiants, musiciens...\r\nA tous les makers qui souhaitent découvrir l\'électronique par la pratique. Dans ce livre, vous apprendrez à : vous aménager un bel espace de travail, équipé de tous les outils nécessaires ; identifier les principaux composants électroniques et leurs fonctions dans un circuit ; fabriquer une alarme anti-intrusion, une radio, un bijou électronique, un testeur de réflexe et un verrou à combinaison ; construire un petit véhicule qui réagit à son environnement et évite les obstacles.', 4, '2023-05-07', 331, '', 'Bibliotheque Centrale'),
(7, 'Le grand livre d\'Arduino', 2, 2, 0, 'ouvrages/9782416005831.jpg', 'L\'ouvrage de référence sur Arduino Avec son petit microcontrôleur hautement performant et facilement programmable, la carte Arduino a révolutionné le mouvement Do lt Yourself. Se couplant aisément avec d\'autres composants (écrans LCD, capteurs, moteurs...), elle est devenue aujourd\'hui un élément indispensable dans de nombreux dispositifs électroniques. Sa simplicité d\'utilisation, l\'étendue de ses applications et son prix modique ont conquis un large public d\'amateurs et de professionnels : passionnés d\'électronique, designers, ingénieurs, musiciens...\r\nD\'une pédagogie remarquable, cet ouvrage de référence vous fera découvrir le formidable potentiel d\'Arduino, en vous délivrant un peu de théorie et surtout beaucoup de pratique avec ses 27 montages à réaliser. Mise à jour avec les dernières évolutions d\'Arduino, cette quatrième édition entièrement refondue s\'est enrichie de nouveaux projets à monter, qui vous familiariseront notamment avec l\'Internet des objets grâce à l\'ESP32, Node-RED et MQTT.\r\nA qui s\'adresse ce livre ? Aux makers, électroniciens, bricoleurs, bidouilleurs, ingénieurs, designers, artistes... Dans ce livre, vous apprendrez notamment à : créer un séquenceur de lumière ; fabriquer un afficheur LCD ; commander un moteur pas-à-pas ; faire de la musique avec Arduino.', 5, '2022-05-05', 518, '', 'Bibliotheque Centrale'),
(8, 'Les robots - Apprendre la robotique par l\'exemple', 5, 3, 0, 'ouvrages/9782340013988.jpg', 'L\'initiation à la robotique est de plus en plus présente dans les programmes scolaires que ce soit en collège avec l\'introduction du codage, ou dans des projets EPI (Enseignements Pratiques Interdisciplinaires), ou bien au lycée avec le développement de la spécialité ISN (Informatique et Sciences du Numérique) et l\'enseignement d\'exploration ICN (Informatique et Création Numérique). Grâce à une démarche progressive, pédagogique et surtout ludique, les auteurs vous initient aux premiers rudiments de la robotique.\r\nA travers l\'étude de trois systèmes différents vous pourrez découvrir la programmation en Python en réalisant différentes missions virtuelles du monde de Reeborg. Pour un coût modeste, vous pourrez aussi réaliser votre propre robot à programmer à l\'aide d\'une carte Arduino dans un langage proche du C. Enfin, les plus créatifs pourront créer en LEGO® des robots plus élaborés grâce à Lego Mindstorms® et sa programmation simple via la technologie LabView™.\r\nL\'originalité de ce livre est son approche par thématiques déclinées suivant les trois systèmes étudiés. Les apports théoriques sont volontairement réduits à l\'essentiel pour ne présenter que les fonctionnalités de base. Chaque chapitre comporte à la fois de nombreux exemples concrets et illustrés et surtout des exercices pour vous permettre de vous approprier ou d\'approfondir les notions étudiées.\r\nDe plus, vous pourrez retrouver sur le site de la collection du livre, de nombreux compléments (programmes des corrections, ressources, conseils, vidéos). Ainsi que vous soyez collégien, lycéen, étudiant, enseignant, à la recherche d\'activités d\'initiation à la robotique ou simplement intéressé par le sujet, ce livre vous permettra de découvrir le monde étonnant de la robotique. ', 6, '2020-06-12', 234, '', 'Bibliotheque Centrale'),
(9, 'Petits robots à fabriquer - 13 DIY', 5, 2, 0, 'ouvrages/9782212675757.jpg', 'Vous avez toujours rêvé de pouvoir fabriquer un robot qui puisse se déplacer et répondre à vos ordres ? Ce livre très accessible exaucera votre souhait et bien plus encore, grâce à ces 13 projets de robots à monter à l\'aide de composants électroniques courants et d\'objets du quotidien. Brosses à dents et à ongles, pinces à linge, gobelets, bâtons d\'esquimau, bouchons de bouteille... vous allez voir qu\'avec presque rien on peut construire des robots qui frottent, gribouillent, marchent et même se battent entre eux ! De difficulté croissante, ces pas à pas détaillés vous permettront d\'acquérir des compétences en électronique et en programmation qui vous serviront pour concevoir vos robots personnels.\r\nDans ce livre, vous apprendrez notamment à fabriquer : un robot jardinier qui vous prévient lorsque votre plante a besoin d\'eau ; un robot catapulte qui déclenche son mécanisme si un intrus est détecté ; un véhicule tout-terrain inspiré du robot explorateur de Mars. ', 7, '2018-02-08', 160, '', 'Bibliotheque Centrale');

-- --------------------------------------------------------

--
-- Structure de la table `rayon`
--

CREATE TABLE `rayon` (
  `id_rayon` int(11) NOT NULL,
  `intitule` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `action_admin`
--
ALTER TABLE `action_admin`
  ADD PRIMARY KEY (`id_action`);

--
-- Index pour la table `action_lecteur`
--
ALTER TABLE `action_lecteur`
  ADD PRIMARY KEY (`id_action`);

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id_admin`);

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`id_auteur`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_cat`);

--
-- Index pour la table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`id_dep`),
  ADD KEY `id_fac` (`id_fac`);

--
-- Index pour la table `ecrire`
--
ALTER TABLE `ecrire`
  ADD PRIMARY KEY (`id_ecrire`),
  ADD KEY `id_auteur` (`id_auteur`,`isbn`) USING BTREE,
  ADD KEY `isbn` (`isbn`) USING BTREE;

--
-- Index pour la table `editeur`
--
ALTER TABLE `editeur`
  ADD PRIMARY KEY (`id_editeur`);

--
-- Index pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD PRIMARY KEY (`id_emprunt`),
  ADD KEY `id_lecteur` (`id_lecteur`),
  ADD KEY `isbn` (`isbn`);

--
-- Index pour la table `en_ligne`
--
ALTER TABLE `en_ligne`
  ADD PRIMARY KEY (`id_enligne`);

--
-- Index pour la table `facultes`
--
ALTER TABLE `facultes`
  ADD PRIMARY KEY (`id_fac`);

--
-- Index pour la table `lecteur`
--
ALTER TABLE `lecteur`
  ADD PRIMARY KEY (`id_lecteur`),
  ADD UNIQUE KEY `email_lecteur` (`email_lecteur`),
  ADD UNIQUE KEY `user` (`user`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `isbn` (`isbn`),
  ADD KEY `id_cat` (`id_cat`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `action_admin`
--
ALTER TABLE `action_admin`
  MODIFY `id_action` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `action_lecteur`
--
ALTER TABLE `action_lecteur`
  MODIFY `id_action` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `id_auteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `departement`
--
ALTER TABLE `departement`
  MODIFY `id_dep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `ecrire`
--
ALTER TABLE `ecrire`
  MODIFY `id_ecrire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `editeur`
--
ALTER TABLE `editeur`
  MODIFY `id_editeur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `emprunter`
--
ALTER TABLE `emprunter`
  MODIFY `id_emprunt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `en_ligne`
--
ALTER TABLE `en_ligne`
  MODIFY `id_enligne` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `facultes`
--
ALTER TABLE `facultes`
  MODIFY `id_fac` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `lecteur`
--
ALTER TABLE `lecteur`
  MODIFY `id_lecteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `isbn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `departement`
--
ALTER TABLE `departement`
  ADD CONSTRAINT `departement_ibfk_1` FOREIGN KEY (`id_fac`) REFERENCES `facultes` (`id_fac`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
