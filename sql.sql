-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: nuepp3ddzwtnggom.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306
-- Czas generowania: 26 Cze 2022, 17:59
-- Wersja serwera: 8.0.23
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `hyzav0u6q2vkcqti`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int NOT NULL,
  `score` double NOT NULL,
  `movies_id` int NOT NULL,
  `deleted` tinyint NOT NULL,
  `like_cnt` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `comments`
--

INSERT INTO `comments` (`id`, `content`, `created_at`, `user_id`, `score`, `movies_id`, `deleted`, `like_cnt`) VALUES
(1, 'Podoba mi się ten osioł, to naprawdę fajny osioł', '2022-05-25 23:21:35', 1, 8.9, 2, 0, NULL),
(2, 'Ten bond to jak nie bond...', '2022-05-25 23:21:38', 1, 4.42, 1, 0, 1),
(7, 'Taki średni z nieg bond', '2022-06-05 21:28:09', 4, 4, 1, 0, NULL),
(11, 'Nic więcej nie trzeba dodawać chyba najlepsza odsłona zielonego ogra, wspanily byl to film nie zapomne go nigdyt', '2022-06-10 11:10:51', 4, 10, 8, 0, NULL),
(13, 'Niezły ten shrek', '2022-06-10 11:13:17', 5, 6, 4, 0, NULL),
(14, 'Podoba mi się ten film', '2022-06-26 14:50:40', 5, 4, 5, 0, NULL),
(16, 'SUperowe filmidlo', '2022-06-10 18:16:26', 7, 10, 1, 0, NULL),
(17, 'Siekiera motyka... marian paździoch to....', '2022-06-12 22:35:03', 4, 7.5, 12, 0, NULL),
(19, 'Tadzik zejdź mi z torów', '2022-06-12 22:36:21', 4, 8, 6, 0, NULL),
(20, 'superowy serial', '2022-06-13 21:45:27', 4, 7, 6, 0, NULL),
(21, 'kohom ten seriol', '2022-06-13 21:46:38', 10, 7, 5, 0, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `incorrect_logins`
--

CREATE TABLE `incorrect_logins` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `session_id` varchar(255) DEFAULT NULL,
  `id_address` int NOT NULL,
  `computer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `incorrect_logins`
--

INSERT INTO `incorrect_logins` (`id`, `id_user`, `time`, `session_id`, `id_address`, `computer`) VALUES
(158, 7, '2022-06-13 20:22:40', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(159, 7, '2022-06-13 20:22:52', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(160, 7, '2022-06-13 20:22:53', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(161, 7, '2022-06-13 20:22:54', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(162, 7, '2022-06-13 20:22:54', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(163, 7, '2022-06-13 20:22:54', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(164, 7, '2022-06-13 20:22:54', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(165, 7, '2022-06-13 20:22:54', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(166, 7, '2022-06-13 20:22:55', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(167, 7, '2022-06-13 20:22:55', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(168, 7, '2022-06-13 20:22:55', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(169, 7, '2022-06-13 20:22:55', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(170, 7, '2022-06-13 20:22:55', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(171, 7, '2022-06-13 20:22:55', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(172, 7, '2022-06-13 20:22:56', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(173, 7, '2022-06-13 20:22:56', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(174, 7, '2022-06-13 20:22:56', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(175, 7, '2022-06-13 20:22:57', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(176, 7, '2022-06-13 20:22:58', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(177, 7, '2022-06-13 20:23:02', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(178, 7, '2022-06-13 20:23:35', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(179, 7, '2022-06-13 20:24:12', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(180, 7, '2022-06-13 20:24:13', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(181, 7, '2022-06-13 20:24:14', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(182, 7, '2022-06-13 20:24:14', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(183, 7, '2022-06-13 20:24:14', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(184, 7, '2022-06-13 20:24:14', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(185, 7, '2022-06-13 20:24:14', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(186, 7, '2022-06-13 20:24:15', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(187, 7, '2022-06-13 20:24:15', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(188, 7, '2022-06-13 20:24:15', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(189, 7, '2022-06-13 20:24:15', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(190, 7, '2022-06-13 20:24:15', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(191, 7, '2022-06-13 20:24:15', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(192, 7, '2022-06-13 20:24:16', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(193, 7, '2022-06-13 20:24:16', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(194, 7, '2022-06-15 06:46:07', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2'),
(195, 7, '2022-06-15 06:46:08', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2'),
(196, 7, '2022-06-15 06:46:08', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2'),
(197, 7, '2022-06-15 06:46:08', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2'),
(198, 7, '2022-06-15 06:46:09', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2'),
(199, 7, '2022-06-15 06:46:09', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2'),
(200, 7, '2022-06-15 06:46:09', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2'),
(201, 7, '2022-06-15 06:46:09', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2'),
(202, 7, '2022-06-15 06:46:09', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2'),
(203, 7, '2022-06-15 06:46:09', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2'),
(204, 7, '2022-06-15 06:46:10', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2'),
(205, 7, '2022-06-15 06:46:10', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2'),
(206, 7, '2022-06-15 06:46:10', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2'),
(207, 7, '2022-06-15 06:46:10', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2'),
(208, 7, '2022-06-15 06:46:11', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2'),
(209, 9, '2022-06-26 14:47:34', 'undetected', 7, '8ekmg24djv06srfl9918bgnk132026mc'),
(210, 12, '2022-06-26 15:34:27', 'undetected', 12, '8ekmg24djv06srfl9918bgnk132026mc');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ip_address`
--

CREATE TABLE `ip_address` (
  `id` int NOT NULL,
  `ok_login_num` bigint NOT NULL,
  `bad_login_num` int NOT NULL,
  `last_bad_login_num` smallint DEFAULT NULL,
  `permanent_lock` tinyint NOT NULL,
  `temp_lock` timestamp NULL DEFAULT NULL,
  `address_IP` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `ip_address`
--

INSERT INTO `ip_address` (`id`, `ok_login_num`, `bad_login_num`, `last_bad_login_num`, `permanent_lock`, `temp_lock`, `address_IP`) VALUES
(1, 56, 76, 0, 0, '2022-06-15 06:56:11', '::1'),
(3, 2, 0, 0, 0, NULL, '10.1.15.118'),
(4, 2, 0, 0, 0, NULL, '10.1.22.129'),
(5, 1, 0, 0, 0, NULL, '10.1.29.171'),
(6, 1, 0, 0, 0, NULL, '10.1.33.158'),
(7, 6, 1, 0, 0, NULL, '10.1.18.242'),
(8, 1, 0, 0, 0, NULL, '10.1.41.212'),
(9, 3, 0, 0, 0, NULL, '10.1.9.172'),
(10, 1, 0, 0, 0, NULL, '10.1.24.135'),
(11, 1, 0, 0, 0, NULL, '10.1.8.14'),
(12, 0, 1, 1, 0, NULL, '10.1.40.166'),
(13, 2, 0, 0, 0, NULL, '10.1.38.25'),
(14, 3, 0, 0, 0, NULL, '10.1.19.163'),
(15, 1, 0, 0, 0, NULL, '10.1.5.36');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `movies`
--

CREATE TABLE `movies` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `content` text NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `image_url` text NOT NULL,
  `deleted` tinyint NOT NULL,
  `production_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `movies`
--

INSERT INTO `movies` (`id`, `user_id`, `title`, `created_at`, `content`, `type`, `image_url`, `deleted`, `production_date`) VALUES
(1, 1, 'James Bond - Szpieg, który mnie kochał', '2022-06-12 21:41:08', 'James Bond bada sprawe tajemniczych zaginięć okretów..', 'action', 'https://www.swiatksiazki.pl/media/catalog/product/cache/eaf55611dc9c3a2fa4224fad2468d647/6/8/6899906712168.jpg', 0, '2004-05-15 00:00:00'),
(2, 1, 'Shrek', '2022-06-12 21:41:08', 'By odzyskać swój dom, brzydki ogr z gadatyliwym osłem wyruszają na podbój..', 'action', 'https://fwcdn.pl/fpo/95/09/9509/7640796.3.jpg', 0, '2004-05-15 00:00:00'),
(3, 1, 'Iron Man', '2022-06-12 21:41:08', '\"Iron Man\" historia miliardera, przemysłowca i seksi bombe', 'action', 'https://fwcdn.pl/fpo/25/41/122541/7885686.3.jpg', 0, '2004-05-15 00:00:00'),
(4, 1, 'Hulk', '2022-06-12 21:41:08', 'Młody naukowiec, Bruce Banner przejmuje bardzo wysy..', 'action', 'https://image.ceneostatic.pl/data/products/6900015/i-incredible-hulk-vcd-dvd.jpg', 0, '2004-05-15 00:00:00'),
(5, 1, 'Gwiezdne Wojny: Część IV - Nowa nadzieja', '2022-06-12 21:41:08', 'Część IV - Nowa nadzieja (1977) - Złowrogie Imperi...', 'action', 'https://fwcdn.pl/fpo/07/59/759/7301614.3.jpg', 0, '2004-05-15 00:00:00'),
(6, 1, 'Miodowe Lata', '2022-06-12 21:41:08', 'Współcześnie rozgrywająca się historia dwóch zaprz.', 'action', 'https://fwcdn.pl/fpo/44/79/104479/7917896.6.jpg', 0, '2004-05-15 00:00:00'),
(8, 8, 'Shrek II', '2022-06-12 21:41:08', 'Kolejna przygoda zielonego ogra i jego przyjaciela osła!', 'action', 'https://i0.wp.com/garretreza.pl/wp-content/uploads/2018/09/shrek.jpg?fit=677%2C1000&ssl=1', 0, '2004-05-15 00:00:00'),
(12, 8, 'Świat Według Kiepskich', '2022-06-12 22:31:12', 'Serial opowiada o przeciętnej polskiej rodzinie mieszkającej w jednej z wrocławskich kamienic. Głowa rodziny, Ferdynand Kiepski, całymi dniami siedzi ze swym synem Waldkiem przed telewizorem i popija piwo. Cały dom jest na głowie jego żony - Haliny, która jest pielęgniarką. Do tego dochodzi jeszcze babcia, która jest zapaloną fanką \"Koziołka Matołka\".\n\nSerial komediowy o licznych perypetiach zwariowanych mieszkańców starej kamienicy we Wrocławiu. Głową rodziny Kiepskich jest bezrobotny Ferdynand (Andrzej Grabowski), będący na utrzymaniu swojej żony, Haliny (Marzena Kipiel-Sztuka). Ferdek spędza większość czasu na piciu swojego ukochanego browara i oglądaniu telewizji. Jego sąsiad, Marian Paździoch (Ryszard Kotys) zawsze szuka możliwości zarobienia łatwych pieniędzy przy pomocy wszystkich dostępnych mu środków. Z kolei Arnold Boczek (Dariusz Gnatowski), z racji swej łatwowierności, stale daje się nabrać na nierealne plany swoich sąsiadów.', 'comedy', 'https://image.ceneostatic.pl/data/products/383550/i-swiat-wedlug-kiepskich-1-dvd.jpg', 0, '1999-01-01 00:00:00'),
(13, 8, 'Świat Według Bundych', '2022-06-13 20:49:31', 'Czworo Bundych oraz ich pies to przeciętna amerykańska rodzina, której dochód schodzi jednak poniżej przeciętnej. Jedyną stale pracującą osobą w rodzinie jest Al, głowa rodziny, który pracuje w sklepie obuwniczym. Gdy otwierają się drzwi domu i staje w nich Al, niemalże zawsze można usłyszeć: Dziś do sklepu weszła taka gruba baba.... Do jego ulubionych czynności należy picie budweisera oraz posiedzenia w ubikacji. Peggy, małżonka Ala, większość dnia spędza przed telewizorem, zajadając się tonami popcornu i czekoladek. Ich pociechy, Bud i Kelly, rozwijają się w trakcie kolejnych serii. Buda ogólnie można scharakteryzować jako macho, którego nie chce żadna dziewczyna, a Kelly jako puszczalską, niezbyt rozgarniętą blondynkę. Towarzyszem rodziny Bundych jest ich pies Buck. Dużą rolę w serialu spełniają także sąsiedzi Bundych - Marcy z mężem Steve\'em, a później z kolejnym Jeffersonem Darcym. Rodzina Bundych jest bardzo przywiązana do kilku przedmiotów, do których zaliczyć można starego dodge\'a w garażu, kanapę, na której zasiadają członkowie rodziny, aby spoglądać w kolejny niezwykle ważny przedmiot - telewizor. Bundym nieraz w oczy zagląda głód czy inne problemy związane z brakiem pieniędzy. Oni jednak nie przejmują się tym, a po prostu znajdują rozwiązanie problemu (np. przeprowadzenie się do hipermarketu), które obfituje w wiele dowcipnych sytuacji. Serial budził niemałe kontrowersje, głównie w Stanach Zjednoczonych. Łamał niektóre tabu, a także bezlitośnie wyśmiewał każdego i wszystko, co tylko się dało.', 'comedy', 'https://fwcdn.pl/fpo/24/57/92457/7682360.3.jpg', 0, '1987-06-19 00:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `privileges`
--

CREATE TABLE `privileges` (
  `id` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `privileges`
--

INSERT INTO `privileges` (`id`, `title`, `description`, `active`, `createdAt`, `updatedAt`) VALUES
(1, 'add_content', 'Dodanie recenzji bądź komentarza', 1, '2022-05-25 22:00:33', '2022-05-25 22:00:33'),
(2, 'edit_content', 'Edycja recenzji bądź komentarza', 1, '2022-05-25 22:02:15', '2022-05-25 22:02:15'),
(3, 'delete_content', 'Usunięcie komentarza bądź recenzji', 1, '2022-05-25 22:02:35', '2022-05-25 22:02:35'),
(4, 'all_privileges', 'Zestaw wszystkich uprawnień', 1, '2022-05-25 22:02:54', '2022-05-25 22:02:54');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `score` double NOT NULL,
  `movies_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `like_count` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `title`, `content`, `created_at`, `score`, `movies_id`, `deleted`, `like_count`) VALUES
(1, 1, 'Bajka nie tylko dla dzieci', 'Shrek okazał się hitem, nie tylko rozbawia dzieci, a połączenie wszystkich baśni w całość to naprawdę dobry pomysł', '2022-05-25 23:20:42', 8.8, 2, 0, NULL),
(2, 7, 'Agent 007 i jego powtarzalne akcje..., mierny fesr', 'Film był... no właśnie taki jak każdy z Bond\'ów - przewidywalny, akcja może i płynęła dosyć szybko, ale zawierała w sobie strasnzy nie ład, ojj i to duży, ja nie wiem w ogóle czym się ludzie jaarają', '2022-06-10 17:55:16', 3.3, 1, 0, NULL),
(10, 7, 'To świetna odsłona Shreka!', '10/10, nie trzeba wiele dodawać najlepszy film animowany w historii!!', '2022-06-12 16:37:45', 10, 2, 0, NULL),
(11, 7, 'Polska w krzywym zwierciadle???', 'Serial \"Świat według Kiepskich\" po kilku latach emisji stał się ikoną polskiej telewizji, a dialogi bohaterów weszły do języka potocznego, no bo kto nie zna powiedzeń: \"W tym kraju nie ma pracy dla ludzi z moim wykształceniem\", \"Jak nie jak tak\" czy \"W mordę jeża\". babka dawaj rente', '2022-06-13 11:02:37', 10, 12, 0, NULL),
(13, 7, 'Alee rajza!', 'Podoba mi się nieźle fajne wybuchy itd', '2022-06-13 20:43:50', 8.9, 3, 1, NULL),
(19, 7, 'Fantastyczna komedia', 'Uwielbiam ten film, postać [wpisz tutaj] jest przezabawna!', '2022-06-14 19:39:41', 10, 13, 1, NULL),
(21, 6, 'Przezabawny serial!', 'Jeden z zabwaniejszych!', '2022-06-15 09:46:03', 8, 13, 1, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `role`
--

INSERT INTO `role` (`id`, `title`, `description`, `active`, `createdAt`, `updatedAt`) VALUES
(1, 'Użytkownik', 'Podstawowy użytkownik, mogący komentować i oceniać dane filmy', 1, '2022-05-25 22:03:51', NULL),
(2, 'Recenzent', 'Dodaje własną recenzję filmu, wraz z osobistą oceną', 1, '2022-05-25 22:04:28', NULL),
(3, 'Pracownik', 'Może dodać, edytować lub usunąć dany film', 1, '2022-05-25 22:05:01', NULL),
(4, 'Administrator', 'Administrator systemu, ma dostęp do wszystkich opcji', 1, '2022-05-25 22:06:13', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `role_privileges`
--

CREATE TABLE `role_privileges` (
  `id` int NOT NULL,
  `privileges_id` int NOT NULL,
  `role_id` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `role_privileges`
--

INSERT INTO `role_privileges` (`id`, `privileges_id`, `role_id`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, '2022-05-25 22:06:59', '2022-05-25 22:06:59'),
(2, 2, 1, '2022-05-25 22:07:29', '2022-05-25 22:07:29'),
(3, 3, 1, '2022-05-25 22:07:38', '2022-05-25 22:07:38'),
(4, 4, 4, '2022-05-25 22:09:46', '2022-05-25 22:09:46'),
(5, 1, 2, '2022-05-25 22:10:11', '2022-05-25 22:10:11'),
(7, 2, 2, '2022-05-25 22:10:33', '2022-05-25 22:10:33'),
(8, 3, 2, '2022-05-25 22:10:54', '2022-05-25 22:10:54'),
(9, 1, 3, '2022-05-25 22:13:07', '2022-05-25 22:13:07'),
(10, 3, 3, '2022-05-25 22:13:24', '2022-05-25 22:13:24'),
(11, 2, 3, '2022-05-25 22:13:30', '2022-05-25 22:13:30');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `role_id` int NOT NULL,
  `login` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `salt` blob,
  `email_code` varchar(6) DEFAULT NULL,
  `code_lifetime` timestamp NULL DEFAULT NULL,
  `security_password` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `lockout_time` timestamp NULL DEFAULT NULL,
  `id_status` int NOT NULL,
  `password_form` int NOT NULL,
  `check_validation` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `role_id`, `login`, `email`, `hash`, `salt`, `email_code`, `code_lifetime`, `security_password`, `answer`, `lockout_time`, `id_status`, `password_form`, `check_validation`) VALUES
(1, 3, 'test123', 'test123@o2.pl', 'm6FnWkGyRFojK8EsT+BI+/S8UQIDXIxNAkeXLVgvgRMwXrhA+HDQ0sZcYTv79/qYv1n1NPf/Ig6lKEz4E751Dqw/YKSBYHwqAG1Q7kJiBGmuSRoJeqjaWykTvbRMdz3bW8ap95Qm83PpWsdYWf6n3zb+gzT75h1ny69MUKrnXSMlEaCNNaUMpY9mDMEUlugt', 0x898da79e481e00668fa82918e8985aac, NULL, NULL, NULL, NULL, NULL, 0, 0, 1),
(4, 1, 'kauczuk', 'kauczuk@o2.pl', 'm6FnWkGyRFojK8EsT+BI+/S8UQIDXIxNAkeXLVgvgRMwXrhA+HDQ0sZcYTv79/qYv1n1NPf/Ig6lKEz4E751Dqw/YKSBYHwqAG1Q7kJiBGmuSRoJeqjaWykTvbRMdz3bW8ap95Qm83PpWsdYWf6n3zb+gzT75h1ny69MUKrnXSMlEaCNNaUMpY9mDMEUlugt', 0x898da79e481e00668fa82918e8985aac, '435714', '2022-06-12 15:54:45', NULL, NULL, NULL, 1, 0, 0),
(5, 1, 'kamil', 'kamil@spoko.pl', 'm6FnWkGyRFojK8EsT+BI+/S8UQIDXIxNAkeXLVgvgRMwXrhA+HDQ0sZcYTv79/qYv1n1NPf/Ig6lKEz4E751Dqw/YKSBYHwqAG1Q7kJiBGmuSRoJeqjaWykTvbRMdz3bW8ap95Qm83PpWsdYWf6n3zb+gzT75h1ny69MUKrnXSMlEaCNNaUMpY9mDMEUlugt', 0x898da79e481e00668fa82918e8985aac, '197656', '2022-06-26 14:55:15', NULL, NULL, NULL, 1, 0, 1),
(6, 2, 'recenzent', 'recenzent@o2.pl', 'm6FnWkGyRFojK8EsT+BI+/S8UQIDXIxNAkeXLVgvgRMwXrhA+HDQ0sZcYTv79/qYv1n1NPf/Ig6lKEz4E751Dqw/YKSBYHwqAG1Q7kJiBGmuSRoJeqjaWykTvbRMdz3bW8ap95Qm83PpWsdYWf6n3zb+gzT75h1ny69MUKrnXSMlEaCNNaUMpY9mDMEUlugt', 0x898da79e481e00668fa82918e8985aac, '198738', '2022-06-15 07:50:36', NULL, NULL, NULL, 1, 0, 1),
(7, 2, 'kaszalot', 'kaszalot200@o2.pl', 'm6FnWkGyRFojK8EsT+BI+/S8UQIDXIxNAkeXLVgvgRMwXrhA+HDQ0sZcYTv79/qYv1n1NPf/Ig6lKEz4E751Dqw/YKSBYHwqAG1Q7kJiBGmuSRoJeqjaWykTvbRMdz3bW8ap95Qm83PpWsdYWf6n3zb+gzT75h1ny69MUKrnXSMlEaCNNaUMpY9mDMEUlugt', 0x898da79e481e00668fa82918e8985aac, '376724', '2022-06-13 19:41:24', NULL, NULL, NULL, 1, 0, 0),
(8, 3, 'areczek199', 'areczek119@spoko.pl', 'AWvzaUVieKCY/VZ9DsOfc2aIyvzgA48BOuSCUklOujbw9ulywNXFeveYLu/IQlgpZdU2TJstmMR82SMqJkJJQrSnwarvRn42q8fN4lkSnw3VRLBVQERITT40mfRIe1GDHRJGibAW2cE6EQCoJTlsIKP2OJkNWmNqDJyBlCx4LA4sSlcwK6qho4BQWkQPLhqQ', 0x4d48a0f03ec3d888c9cf6778e39bfe3a, '843585', '2022-06-14 17:45:30', NULL, NULL, NULL, 1, 0, 0),
(9, 4, 'admin', 'admin@admin.pl', '6xRFV80KlYQzNIA9txMgo75zzkLhmPCDJf3C0bl7OPfKN4h3LDyAzF+fxs+PzPQJfYUmIE7Phr05SChrXd7FqQ/Smz9tgI89w8R6x5XbXdf1XNXKsymhE7eaTfMvx17b4jPd36hbsV7jiXiAk+7Ly2PPgSfxc8HJcoWaxv0K7wC690e+W+tXAO6G2v/aPs38', 0x33abdbd90d52268b6d000e1d405047b1, '316591', '2022-06-12 20:45:28', NULL, NULL, NULL, 1, 0, 0),
(10, 4, 'romanowski', 'roman@o2.pl', 'hgx/qcZlas37q32aPAPCoTQ1f0iX9dlBuk3jTSXqg292Vtj0aPt3n9YLB0GsqNtQN8KdMfewMeyx/n4OLCBq8U+KzQhwyRP3O+gTqEuBD5otAUABZytFKd62vHpa7pLS0Q5JSy1wzVreYquDn1waMwscs13P1XdnvJrISEdfAy+SQQ4UUx5yYy5OKlr5M9tp', 0xe7c0d056efb49b0bac5f15fccd75d941, '562564', '2022-06-13 19:50:47', NULL, NULL, NULL, 1, 0, 0),
(12, 1, 'ojej', 'toyey85157@syswift.com', 'sClLWBO06i5+T0YwrBDLhhUKBfyFJF65YwgI4aoFiiTuQ0UFttS+nRMNVvkrshBwPG/QWHzshZ1IhBZg7/R8ngXOyeKzZaqNLV38kf5qGSDsdG0Dt79r70IKEqIc6zzU4+XM+ND8Bd0HV6JmOIxXFikTcTEbLn+zijfPjmd4t+ycO7Tl116qip5VHAzl3iKz', 0x1c47220aa27473bd4e73d4799f3df390, '893799', '2022-06-26 15:44:45', NULL, NULL, NULL, 1, 0, 1),
(14, 1, 'marcin', 'narutoziak2@gmail.com', 'CnF37XQrN/EIhpD3EzBzC/xaG+O2H+e8V72Mdy0xHEMlSRSMZWOIIQqp0DvqumdAKDUoLkgi4tzc0xByCZhA3QBUbY8ctXQItOn6vXm0b6GDbu9VXNT9NYzBT3D+I1E11qoCcmB6MBOCqmYq/8Uh6woR0jmcqFDQfzn5OUCIhaD5HtsgSnydL+4P8V7hiQVf', 0x3c2ba68b9883c363b95e952eb5e3cca8, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(15, 1, 'popiolek', 'popiolek@o2.pl', 'AL7lQfrXBVXRY4Sl/EvZ5w88BXSGbdGDQghVlc4W91w8rpPPogVNhPWW3LVnpNVCKRUMdLBBgNw8yBup57vhqbWKesfaLlcSf8X5WRzUbM2kYE099xv61qTgto0TqlyvnCaMfvuQ5EHIOCXTfjiNB5au/0xZSAOnBvnHa/GlVQnnnrcIBC7LZ7g4xg1LN5kS', 0xffc8f57cad75ab23c3d44a04c5ed3505, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(16, 1, 'yeti', 'yeniti6097@runqx.com', 'mO8FgQPY1rympAazyF8I5Vco0fWoa9eozyfsTT3WrISLymGeXzvN7LMFVXKPZQCME7AyCUe8LdDJtKWNgo9g2PLkkCGo0ZTaxEoUXbIND8slJ88Ue8JMcMl2iqD0PlUphrF33vGbAIdBKUmGksG5/7eG49w1U7QBbJHvCRd41PfQBxVdaEHrv6FxfJq1fTVV', 0x96b0775fe12b678fca6ad31043ab8f33, '202664', '2022-06-26 15:48:34', NULL, NULL, NULL, 1, 0, 1),
(18, 3, 'pracownik', 'pracownik@spoko.pl', 'aZqBYXQufdGOZmvTg0fwXmG1c0vaGzJtqA9eqmQ0QQAKbFysqCp0Bvdib5XWw7RPTPrag//hquCu9KU67kVrV7QGBKn+FkVOs31G/U4K2pt0uoqZ47ZnSS54tmT7WXWnO+dsQzSzFpW/cSo5g/3qIPTJLP2Rvd7Q2djnNaIzzeDVQRrFSJY23ExUL7rCOk+T', 0x411057b074d70c091d7dbc5a12e5948c, NULL, NULL, NULL, NULL, NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_activity`
--

CREATE TABLE `user_activity` (
  `id` bigint NOT NULL,
  `id_user` int NOT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `action_taken` varchar(255) NOT NULL,
  `table_affected` varchar(255) DEFAULT NULL,
  `row_number` int DEFAULT NULL,
  `previous_data` text,
  `new_data` text,
  `undone` tinyint NOT NULL DEFAULT '0',
  `can_undo` tinyint GENERATED ALWAYS AS ((case when (`undone` <> 0) then 0 when (`previous_data` is not null) then 1 when (`new_data` is not null) then 1 else 0 end)) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `user_activity`
--

INSERT INTO `user_activity` (`id`, `id_user`, `time`, `action_taken`, `table_affected`, `row_number`, `previous_data`, `new_data`, `undone`) VALUES
(260, 11, '2022-06-26 14:38:46', 'add content', 'comments', 22, NULL, 'a:5:{s:2:\"id\";i:22;s:7:\"user_id\";i:11;s:7:\"content\";s:20:\"uwielbiam ten serial\";s:5:\"score\";s:1:\"9\";s:7:\"deleted\";i:0;}', 1),
(261, 11, '2022-06-26 14:39:15', 'edit content', 'comments', 22, 'a:16:{s:2:\"id\";i:22;i:0;i:22;s:7:\"content\";s:20:\"uwielbiam ten serial\";i:1;s:20:\"uwielbiam ten serial\";s:10:\"created_at\";s:19:\"2022-06-26 14:38:46\";i:2;s:19:\"2022-06-26 14:38:46\";s:7:\"user_id\";i:11;i:3;i:11;s:5:\"score\";d:9;i:4;d:9;s:9:\"movies_id\";i:12;i:5;i:12;s:7:\"deleted\";i:0;i:6;i:0;s:8:\"like_cnt\";N;i:7;N;}', 'a:3:{s:7:\"content\";s:19:\"przezabawny serial!\";s:5:\"score\";s:1:\"9\";s:10:\"comment_id\";s:2:\"22\";}', 1),
(262, 11, '2022-06-26 14:47:13', 'add content', 'comments', 23, NULL, 'a:5:{s:2:\"id\";i:23;s:7:\"user_id\";i:11;s:7:\"content\";s:13:\"Nie śmieszny\";s:5:\"score\";s:3:\"1.3\";s:7:\"deleted\";i:0;}', 1),
(263, 11, '2022-06-26 14:47:26', 'edit content', 'comments', 23, 'a:16:{s:2:\"id\";i:23;i:0;i:23;s:7:\"content\";s:13:\"Nie śmieszny\";i:1;s:13:\"Nie śmieszny\";s:10:\"created_at\";s:19:\"2022-06-26 14:47:13\";i:2;s:19:\"2022-06-26 14:47:13\";s:7:\"user_id\";i:11;i:3;i:11;s:5:\"score\";d:1.3;i:4;d:1.3;s:9:\"movies_id\";i:13;i:5;i:13;s:7:\"deleted\";i:0;i:6;i:0;s:8:\"like_cnt\";N;i:7;N;}', 'a:3:{s:7:\"content\";s:15:\"Ultra śmieszny\";s:5:\"score\";s:1:\"9\";s:10:\"comment_id\";s:2:\"23\";}', 1),
(264, 5, '2022-06-26 14:50:40', 'edit content', 'comments', 14, 'a:16:{s:2:\"id\";i:14;i:0;i:14;s:7:\"content\";s:23:\"Podoba mi się ten film\";i:1;s:23:\"Podoba mi się ten film\";s:10:\"created_at\";s:19:\"2022-06-10 11:13:39\";i:2;s:19:\"2022-06-10 11:13:39\";s:7:\"user_id\";i:5;i:3;i:5;s:5:\"score\";d:4;i:4;d:4;s:9:\"movies_id\";i:5;i:5;i:5;s:7:\"deleted\";i:0;i:6;i:0;s:8:\"like_cnt\";N;i:7;N;}', 'a:3:{s:7:\"content\";s:56:\"Podoba mi się ten film, najlepszy jest ten zielpony ogr\";s:5:\"score\";s:1:\"4\";s:10:\"comment_id\";s:2:\"14\";}', 1),
(265, 11, '2022-06-26 14:54:00', 'add content', 'comments', 24, NULL, 'a:5:{s:2:\"id\";i:24;s:7:\"user_id\";i:11;s:7:\"content\";s:29:\"fajny ten zielony, brałabym \";s:5:\"score\";s:2:\"10\";s:7:\"deleted\";i:0;}', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_login`
--

CREATE TABLE `user_login` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `id_address` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `computer` varchar(255) DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  `correct` tinyint NOT NULL,
  `log_out` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `user_login`
--

INSERT INTO `user_login` (`id`, `id_user`, `id_address`, `time`, `computer`, `session`, `correct`, `log_out`) VALUES
(368, 9, 1, '2022-06-13 16:55:18', '\"Windows\"', NULL, 1, 1),
(369, 9, 1, '2022-06-13 16:55:22', '\"Windows\"', NULL, 1, 0),
(370, 9, 1, '2022-06-13 16:55:27', '\"Windows\"', NULL, 1, 1),
(371, 7, 1, '2022-06-13 16:55:33', '\"Windows\"', NULL, 0, 0),
(372, 7, 1, '2022-06-13 16:55:37', '\"Windows\"', NULL, 0, 0),
(373, 7, 1, '2022-06-13 16:55:45', '\"Windows\"', NULL, 0, 0),
(374, 7, 1, '2022-06-13 16:55:47', '\"Windows\"', NULL, 0, 0),
(375, 7, 1, '2022-06-13 16:55:57', '\"Windows\"', NULL, 1, 0),
(376, 7, 1, '2022-06-13 18:48:10', '\"Windows\"', NULL, 1, 1),
(377, 8, 1, '2022-06-13 18:48:27', '\"Windows\"', NULL, 1, 0),
(378, 8, 1, '2022-06-13 18:54:38', '\"Windows\"', NULL, 1, 1),
(379, 9, 1, '2022-06-13 18:54:42', '\"Windows\"', NULL, 1, 0),
(380, 9, 1, '2022-06-13 19:36:19', '\"Windows\"', NULL, 1, 1),
(381, 7, 1, '2022-06-13 19:36:35', '\"Windows\"', NULL, 1, 0),
(382, 7, 1, '2022-06-13 19:37:08', '\"Windows\"', NULL, 1, 1),
(383, 9, 1, '2022-06-13 19:37:12', '\"Windows\"', NULL, 1, 0),
(384, 9, 1, '2022-06-13 19:41:33', '\"Windows\"', NULL, 1, 1),
(385, 7, 1, '2022-06-13 19:41:37', '\"Windows\"', NULL, 1, 0),
(386, 7, 1, '2022-06-13 19:42:12', '\"Windows\"', NULL, 1, 1),
(387, 9, 1, '2022-06-13 19:42:15', '\"Windows\"', NULL, 1, 0),
(388, 9, 1, '2022-06-13 19:43:10', '\"Windows\"', NULL, 1, 1),
(389, 7, 1, '2022-06-13 19:43:15', '\"Windows\"', NULL, 1, 0),
(390, 7, 1, '2022-06-13 19:43:31', '\"Windows\"', NULL, 1, 1),
(391, 9, 1, '2022-06-13 19:43:35', '\"Windows\"', NULL, 0, 0),
(392, 9, 1, '2022-06-13 19:43:38', '\"Windows\"', NULL, 1, 0),
(393, 9, 1, '2022-06-13 19:44:21', '\"Windows\"', NULL, 1, 1),
(394, 7, 1, '2022-06-13 19:44:27', '\"Windows\"', NULL, 1, 0),
(395, 7, 1, '2022-06-13 19:45:12', '\"Windows\"', NULL, 1, 1),
(396, 4, 1, '2022-06-13 19:45:16', '\"Windows\"', NULL, 1, 0),
(397, 4, 1, '2022-06-13 19:45:28', '\"Windows\"', NULL, 1, 1),
(398, 10, 1, '2022-06-13 19:45:55', '\"Windows\"', NULL, 1, 0),
(399, 10, 1, '2022-06-13 19:46:42', '\"Windows\"', NULL, 1, 1),
(400, 9, 1, '2022-06-13 19:46:45', '\"Windows\"', NULL, 1, 0),
(401, 9, 1, '2022-06-13 19:50:10', '\"Windows\"', NULL, 1, 1),
(402, 10, 1, '2022-06-13 19:50:16', '\"Windows\"', NULL, 1, 0),
(403, 10, 1, '2022-06-13 20:04:09', '\"Windows\"', NULL, 1, 1),
(404, 10, 1, '2022-06-13 20:04:13', '\"Windows\"', NULL, 0, 0),
(405, 10, 1, '2022-06-13 20:04:24', '\"Windows\"', NULL, 0, 0),
(406, 10, 1, '2022-06-13 20:04:44', '\"Windows\"', NULL, 0, 0),
(407, 10, 1, '2022-06-13 20:04:44', '\"Windows\"', NULL, 0, 0),
(408, 10, 1, '2022-06-13 20:04:44', '\"Windows\"', NULL, 0, 0),
(409, 10, 1, '2022-06-13 20:04:45', '\"Windows\"', NULL, 0, 0),
(410, 10, 1, '2022-06-13 20:04:45', '\"Windows\"', NULL, 0, 0),
(411, 10, 1, '2022-06-13 20:04:45', '\"Windows\"', NULL, 0, 0),
(412, 10, 1, '2022-06-13 20:04:46', '\"Windows\"', NULL, 0, 0),
(413, 10, 1, '2022-06-13 20:04:46', '\"Windows\"', NULL, 0, 0),
(414, 10, 1, '2022-06-13 20:04:46', '\"Windows\"', NULL, 0, 0),
(415, 10, 1, '2022-06-13 20:04:46', '\"Windows\"', NULL, 0, 0),
(416, 10, 1, '2022-06-13 20:04:47', '\"Windows\"', NULL, 0, 0),
(417, 10, 1, '2022-06-13 20:04:47', '\"Windows\"', NULL, 0, 0),
(418, 10, 1, '2022-06-13 20:04:48', '\"Windows\"', NULL, 0, 0),
(419, 10, 1, '2022-06-13 20:04:48', '\"Windows\"', NULL, 0, 0),
(420, 10, 1, '2022-06-13 20:10:43', '\"Windows\"', NULL, 0, 0),
(421, 9, 1, '2022-06-13 20:14:11', '\"Windows\"', NULL, 1, 0),
(422, 9, 1, '2022-06-13 20:14:16', '\"Windows\"', NULL, 1, 1),
(423, 7, 1, '2022-06-13 20:14:32', '\"Windows\"', NULL, 0, 0),
(424, 7, 1, '2022-06-13 20:14:36', '\"Windows\"', NULL, 0, 0),
(425, 7, 1, '2022-06-13 20:16:35', '\"Windows\"', NULL, 1, 0),
(426, 7, 1, '2022-06-13 20:17:33', '\"Windows\"', NULL, 1, 1),
(427, 9, 1, '2022-06-13 20:17:37', '\"Windows\"', NULL, 1, 0),
(428, 9, 1, '2022-06-13 20:17:46', '\"Windows\"', NULL, 1, 1),
(429, 7, 1, '2022-06-13 20:17:50', '\"Windows\"', NULL, 0, 0),
(430, 7, 1, '2022-06-13 20:17:55', '\"Windows\"', NULL, 0, 0),
(431, 7, 1, '2022-06-13 20:18:00', '\"Windows\"', NULL, 1, 0),
(432, 7, 1, '2022-06-13 20:19:58', '\"Windows\"', NULL, 1, 1),
(433, 9, 1, '2022-06-13 20:20:06', '\"Windows\"', NULL, 1, 0),
(434, 9, 1, '2022-06-13 20:20:12', '\"Windows\"', NULL, 1, 1),
(435, 9, 1, '2022-06-13 20:20:15', '\"Windows\"', NULL, 0, 0),
(436, 9, 1, '2022-06-13 20:20:22', '\"Windows\"', NULL, 0, 0),
(437, 9, 1, '2022-06-13 20:20:24', '\"Windows\"', NULL, 0, 0),
(438, 9, 1, '2022-06-13 20:20:24', '\"Windows\"', NULL, 0, 0),
(439, 9, 1, '2022-06-13 20:20:24', '\"Windows\"', NULL, 0, 0),
(440, 9, 1, '2022-06-13 20:20:25', '\"Windows\"', NULL, 0, 0),
(441, 9, 1, '2022-06-13 20:20:25', '\"Windows\"', NULL, 0, 0),
(442, 9, 1, '2022-06-13 20:20:26', '\"Windows\"', NULL, 0, 0),
(443, 9, 1, '2022-06-13 20:20:29', '\"Windows\"', NULL, 0, 0),
(444, 9, 1, '2022-06-13 20:20:31', '\"Windows\"', NULL, 1, 0),
(445, 9, 1, '2022-06-13 20:20:39', '\"Windows\"', NULL, 1, 1),
(446, 7, 1, '2022-06-13 20:20:43', '\"Windows\"', NULL, 1, 0),
(447, 7, 1, '2022-06-13 20:20:47', '\"Windows\"', NULL, 1, 1),
(448, 7, 1, '2022-06-13 20:21:49', '\"Windows\"', NULL, 1, 0),
(449, 7, 1, '2022-06-13 20:22:32', '\"Windows\"', NULL, 1, 1),
(450, 7, 1, '2022-06-13 20:22:40', '\"Windows\"', NULL, 0, 0),
(451, 7, 1, '2022-06-13 20:22:45', '\"Windows\"', NULL, 1, 0),
(452, 7, 1, '2022-06-13 20:22:47', '\"Windows\"', NULL, 1, 1),
(453, 7, 1, '2022-06-13 20:22:52', '\"Windows\"', NULL, 0, 0),
(454, 7, 1, '2022-06-13 20:22:53', '\"Windows\"', NULL, 0, 0),
(455, 7, 1, '2022-06-13 20:22:54', '\"Windows\"', NULL, 0, 0),
(456, 7, 1, '2022-06-13 20:22:54', '\"Windows\"', NULL, 0, 0),
(457, 7, 1, '2022-06-13 20:22:54', '\"Windows\"', NULL, 0, 0),
(458, 7, 1, '2022-06-13 20:22:54', '\"Windows\"', NULL, 0, 0),
(459, 7, 1, '2022-06-13 20:22:54', '\"Windows\"', NULL, 0, 0),
(460, 7, 1, '2022-06-13 20:22:55', '\"Windows\"', NULL, 0, 0),
(461, 7, 1, '2022-06-13 20:22:55', '\"Windows\"', NULL, 0, 0),
(462, 7, 1, '2022-06-13 20:22:55', '\"Windows\"', NULL, 0, 0),
(463, 7, 1, '2022-06-13 20:22:55', '\"Windows\"', NULL, 0, 0),
(464, 7, 1, '2022-06-13 20:22:55', '\"Windows\"', NULL, 0, 0),
(465, 7, 1, '2022-06-13 20:22:55', '\"Windows\"', NULL, 0, 0),
(466, 7, 1, '2022-06-13 20:22:56', '\"Windows\"', NULL, 0, 0),
(467, 7, 1, '2022-06-13 20:22:56', '\"Windows\"', NULL, 0, 0),
(468, 7, 1, '2022-06-13 20:22:56', '\"Windows\"', NULL, 0, 0),
(469, 7, 1, '2022-06-13 20:22:57', '\"Windows\"', NULL, 0, 0),
(470, 7, 1, '2022-06-13 20:22:58', '\"Windows\"', NULL, 0, 0),
(471, 7, 1, '2022-06-13 20:23:02', '\"Windows\"', NULL, 0, 0),
(472, 7, 1, '2022-06-13 20:23:07', '\"Windows\"', NULL, 1, 0),
(473, 7, 1, '2022-06-13 20:23:22', '\"Windows\"', NULL, 1, 1),
(474, 7, 1, '2022-06-13 20:23:27', '\"Windows\"', NULL, 1, 0),
(475, 7, 1, '2022-06-13 20:23:30', '\"Windows\"', NULL, 1, 1),
(476, 7, 1, '2022-06-13 20:23:35', '\"Windows\"', NULL, 0, 0),
(477, 7, 1, '2022-06-13 20:24:07', '\"Windows\"', NULL, 1, 0),
(478, 7, 1, '2022-06-13 20:24:09', '\"Windows\"', NULL, 1, 1),
(479, 7, 1, '2022-06-13 20:24:12', '\"Windows\"', NULL, 0, 0),
(480, 7, 1, '2022-06-13 20:24:13', '\"Windows\"', NULL, 0, 0),
(481, 7, 1, '2022-06-13 20:24:14', '\"Windows\"', NULL, 0, 0),
(482, 7, 1, '2022-06-13 20:24:14', '\"Windows\"', NULL, 0, 0),
(483, 7, 1, '2022-06-13 20:24:14', '\"Windows\"', NULL, 0, 0),
(484, 7, 1, '2022-06-13 20:24:14', '\"Windows\"', NULL, 0, 0),
(485, 7, 1, '2022-06-13 20:24:14', '\"Windows\"', NULL, 0, 0),
(486, 7, 1, '2022-06-13 20:24:15', '\"Windows\"', NULL, 0, 0),
(487, 7, 1, '2022-06-13 20:24:15', '\"Windows\"', NULL, 0, 0),
(488, 7, 1, '2022-06-13 20:24:15', '\"Windows\"', NULL, 0, 0),
(489, 7, 1, '2022-06-13 20:24:15', '\"Windows\"', NULL, 0, 0),
(490, 7, 1, '2022-06-13 20:24:15', '\"Windows\"', NULL, 0, 0),
(491, 7, 1, '2022-06-13 20:24:15', '\"Windows\"', NULL, 0, 0),
(492, 7, 1, '2022-06-13 20:24:16', '\"Windows\"', NULL, 0, 0),
(493, 7, 1, '2022-06-13 20:24:16', '\"Windows\"', NULL, 0, 0),
(494, 7, 1, '2022-06-13 20:24:16', '\"Windows\"', NULL, 0, 0),
(495, 7, 1, '2022-06-13 20:24:23', '\"Windows\"', NULL, 1, 0),
(496, 7, 1, '2022-06-13 20:25:22', '\"Windows\"', NULL, 1, 1),
(497, 7, 1, '2022-06-13 20:25:26', '\"Windows\"', NULL, 1, 0),
(498, 7, 1, '2022-06-13 20:25:35', '\"Windows\"', NULL, 1, 0),
(499, 9, 1, '2022-06-13 20:26:41', '\"Windows\"', NULL, 1, 0),
(500, 9, 1, '2022-06-13 20:26:52', '\"Windows\"', NULL, 1, 1),
(501, 7, 1, '2022-06-14 16:49:04', '\"Windows\"', NULL, 1, 0),
(502, 7, 1, '2022-06-14 17:40:24', '\"Windows\"', NULL, 1, 1),
(503, 8, 1, '2022-06-14 17:40:39', '\"Windows\"', NULL, 1, 0),
(504, 8, 1, '2022-06-14 17:45:25', '\"Windows\"', NULL, 1, 1),
(505, 7, 1, '2022-06-14 17:45:30', '\"Windows\"', NULL, 1, 0),
(506, 7, 1, '2022-06-14 17:47:46', '\"Windows\"', NULL, 1, 1),
(507, 8, 1, '2022-06-14 17:47:50', '\"Windows\"', NULL, 1, 0),
(508, 8, 1, '2022-06-14 18:01:41', '\"Windows\"', NULL, 1, 1),
(509, 8, 1, '2022-06-14 18:01:46', '\"Windows\"', NULL, 1, 0),
(510, 8, 1, '2022-06-14 18:10:49', '\"Windows\"', NULL, 1, 1),
(511, 9, 1, '2022-06-14 18:10:52', '\"Windows\"', NULL, 1, 0),
(512, 9, 1, '2022-06-14 18:11:09', '\"Windows\"', NULL, 1, 1),
(513, 8, 1, '2022-06-14 18:11:16', '\"Windows\"', NULL, 1, 0),
(514, 8, 1, '2022-06-14 18:15:33', '\"Windows\"', NULL, 1, 1),
(515, 9, 1, '2022-06-14 18:15:45', '\"Windows\"', NULL, 1, 0),
(516, 9, 1, '2022-06-14 18:15:55', '\"Windows\"', NULL, 1, 1),
(517, 8, 1, '2022-06-14 18:15:59', '\"Windows\"', NULL, 1, 0),
(518, 8, 1, '2022-06-14 18:16:07', '\"Windows\"', NULL, 1, 1),
(519, 9, 1, '2022-06-14 18:16:10', '\"Windows\"', NULL, 1, 0),
(520, 9, 1, '2022-06-14 19:30:54', '\"Windows\"', NULL, 1, 1),
(521, 7, 1, '2022-06-14 19:30:58', '\"Windows\"', NULL, 1, 0),
(522, 7, 1, '2022-06-14 19:35:57', '\"Windows\"', NULL, 1, 1),
(523, 9, 1, '2022-06-14 19:36:00', '\"Windows\"', NULL, 1, 0),
(524, 9, 1, '2022-06-14 19:36:19', '\"Windows\"', NULL, 1, 1),
(525, 10, 1, '2022-06-14 19:36:24', '\"Windows\"', NULL, 1, 0),
(526, 10, 1, '2022-06-14 19:36:45', '\"Windows\"', NULL, 1, 1),
(527, 7, 1, '2022-06-14 19:36:50', '\"Windows\"', NULL, 1, 0),
(528, 7, 1, '2022-06-14 19:39:12', '\"Windows\"', NULL, 1, 1),
(529, 7, 1, '2022-06-14 20:30:00', '\"Windows\"', NULL, 1, 0),
(530, 7, 1, '2022-06-14 20:32:36', '\"Windows\"', NULL, 1, 0),
(531, 7, 1, '2022-06-14 20:33:36', '\"Windows\"', NULL, 1, 1),
(532, 7, 1, '2022-06-14 20:33:42', '\"Windows\"', NULL, 1, 0),
(533, 7, 1, '2022-06-14 20:34:06', '\"Windows\"', NULL, 1, 0),
(534, 9, 1, '2022-06-15 06:13:24', '\"Windows\"', NULL, 1, 0),
(535, 9, 1, '2022-06-15 06:14:46', '\"Windows\"', NULL, 1, 0),
(536, 9, 1, '2022-06-15 06:16:34', '\"Windows\"', NULL, 1, 0),
(537, 9, 1, '2022-06-15 06:16:47', '\"Windows\"', NULL, 1, 0),
(538, 9, 1, '2022-06-15 06:17:11', '\"Windows\"', NULL, 1, 0),
(539, 9, 1, '2022-06-15 06:17:20', '\"Windows\"', NULL, 1, 0),
(540, 9, 1, '2022-06-15 06:17:36', '\"Windows\"', NULL, 1, 0),
(541, 9, 1, '2022-06-15 06:18:59', '\"Windows\"', NULL, 1, 1),
(542, 9, 1, '2022-06-15 06:19:04', '\"Windows\"', NULL, 1, 0),
(543, 9, 1, '2022-06-15 06:34:38', '\"Windows\"', NULL, 1, 0),
(544, 9, 1, '2022-06-15 06:34:53', '\"Windows\"', NULL, 1, 0),
(545, 9, 1, '2022-06-15 06:35:13', '\"Windows\"', NULL, 1, 0),
(546, 9, 1, '2022-06-15 06:36:13', '\"Windows\"', NULL, 1, 0),
(547, 9, 1, '2022-06-15 06:42:53', '\"Windows\"', NULL, 1, 0),
(548, 9, 1, '2022-06-15 06:44:32', '\"Windows\"', NULL, 1, 0),
(549, 9, 1, '2022-06-15 06:44:41', '\"Windows\"', NULL, 1, 1),
(550, 9, 1, '2022-06-15 06:44:46', '\"Windows\"', NULL, 1, 0),
(551, 9, 1, '2022-06-15 06:46:02', '\"Windows\"', NULL, 1, 1),
(552, 7, 1, '2022-06-15 06:46:07', '\"Windows\"', NULL, 0, 0),
(553, 7, 1, '2022-06-15 06:46:08', '\"Windows\"', NULL, 0, 0),
(554, 7, 1, '2022-06-15 06:46:08', '\"Windows\"', NULL, 0, 0),
(555, 7, 1, '2022-06-15 06:46:08', '\"Windows\"', NULL, 0, 0),
(556, 7, 1, '2022-06-15 06:46:09', '\"Windows\"', NULL, 0, 0),
(557, 7, 1, '2022-06-15 06:46:09', '\"Windows\"', NULL, 0, 0),
(558, 7, 1, '2022-06-15 06:46:09', '\"Windows\"', NULL, 0, 0),
(559, 7, 1, '2022-06-15 06:46:09', '\"Windows\"', NULL, 0, 0),
(560, 7, 1, '2022-06-15 06:46:09', '\"Windows\"', NULL, 0, 0),
(561, 7, 1, '2022-06-15 06:46:09', '\"Windows\"', NULL, 0, 0),
(562, 7, 1, '2022-06-15 06:46:09', '\"Windows\"', NULL, 0, 0),
(563, 7, 1, '2022-06-15 06:46:10', '\"Windows\"', NULL, 0, 0),
(564, 7, 1, '2022-06-15 06:46:10', '\"Windows\"', NULL, 0, 0),
(565, 7, 1, '2022-06-15 06:46:10', '\"Windows\"', NULL, 0, 0),
(566, 7, 1, '2022-06-15 06:46:11', '\"Windows\"', NULL, 0, 0),
(567, 7, 1, '2022-06-15 06:46:11', '\"Windows\"', NULL, 0, 0),
(568, 9, 1, '2022-06-15 06:46:17', '\"Windows\"', NULL, 1, 0),
(569, 9, 1, '2022-06-15 06:46:36', '\"Windows\"', NULL, 1, 1),
(570, 7, 1, '2022-06-15 06:46:42', '\"Windows\"', NULL, 1, 0),
(571, 7, 1, '2022-06-15 06:46:48', '\"Windows\"', NULL, 1, 1),
(572, 9, 1, '2022-06-15 06:46:52', '\"Windows\"', NULL, 1, 0),
(573, 9, 1, '2022-06-15 06:54:03', '\"Windows\"', NULL, 1, 0),
(574, 9, 1, '2022-06-15 07:25:40', '\"Windows\"', NULL, 1, 0),
(575, 9, 1, '2022-06-15 07:38:03', '\"Windows\"', NULL, 1, 1),
(576, 9, 1, '2022-06-15 07:38:21', '\"Windows\"', NULL, 1, 0),
(577, 9, 1, '2022-06-15 07:40:09', '\"Windows\"', NULL, 1, 1),
(578, 6, 1, '2022-06-15 07:40:25', '\"Windows\"', NULL, 1, 0),
(579, 6, 1, '2022-06-15 07:41:47', '\"Windows\"', NULL, 1, 1),
(580, 9, 1, '2022-06-15 07:41:51', '\"Windows\"', NULL, 1, 0),
(581, 9, 1, '2022-06-15 07:45:30', '\"Windows\"', NULL, 1, 1),
(582, 6, 1, '2022-06-15 07:45:47', '\"Windows\"', NULL, 1, 0),
(583, 6, 1, '2022-06-15 07:46:05', '\"Windows\"', NULL, 1, 1),
(584, 9, 1, '2022-06-15 07:46:08', '\"Windows\"', NULL, 1, 0),
(585, 9, 1, '2022-06-15 07:58:57', '\"Windows\"', NULL, 1, 0),
(586, 9, 1, '2022-06-15 08:05:20', '\"Windows\"', NULL, 1, 0),
(587, 9, 1, '2022-06-15 08:35:36', '\"Windows\"', NULL, 1, 0),
(588, 9, 1, '2022-06-15 08:43:58', '\"Windows\"', NULL, 1, 0),
(589, 9, 1, '2022-06-15 09:03:46', '\"Windows\"', NULL, 1, 0),
(590, 9, 1, '2022-06-15 09:15:18', '\"Windows\"', NULL, 1, 0),
(591, 9, 1, '2022-06-15 09:18:40', '\"Windows\"', NULL, 1, 1),
(592, 9, 1, '2022-06-15 09:18:49', '\"Windows\"', NULL, 1, 0),
(593, 9, 3, '2022-06-26 14:36:08', '\"Windows\"', NULL, 1, 0),
(594, 9, 3, '2022-06-26 14:36:13', '\"Windows\"', NULL, 1, 1),
(595, 11, 3, '2022-06-26 14:36:49', '\"Windows\"', NULL, 1, 0),
(596, 11, 3, '2022-06-26 14:37:54', '\"Windows\"', NULL, 1, 0),
(597, 11, 4, '2022-06-26 14:38:55', '\"Windows\"', NULL, 1, 1),
(598, 11, 4, '2022-06-26 14:39:00', '\"Windows\"', NULL, 1, 0),
(599, 11, 4, '2022-06-26 14:39:19', '\"Windows\"', NULL, 1, 1),
(600, 9, 4, '2022-06-26 14:39:23', '\"Windows\"', NULL, 1, 0),
(601, 9, 5, '2022-06-26 14:43:33', '\"Windows\"', NULL, 1, 0),
(602, 9, 6, '2022-06-26 14:46:30', '\"Windows\"', NULL, 1, 0),
(603, 9, 7, '2022-06-26 14:46:54', '\"Windows\"', NULL, 1, 1),
(604, 11, 7, '2022-06-26 14:46:58', '\"Windows\"', NULL, 1, 0),
(605, 11, 7, '2022-06-26 14:47:30', '\"Windows\"', NULL, 1, 1),
(606, 9, 7, '2022-06-26 14:47:34', '\"Windows\"', NULL, 0, 0),
(607, 9, 7, '2022-06-26 14:47:37', '\"Windows\"', NULL, 1, 0),
(608, 9, 7, '2022-06-26 14:49:55', '\"Windows\"', NULL, 1, 1),
(609, 9, 7, '2022-06-26 14:50:05', '\"Windows\"', NULL, 1, 0),
(610, 9, 7, '2022-06-26 14:50:10', '\"Windows\"', NULL, 1, 1),
(611, 5, 7, '2022-06-26 14:50:29', '\"Windows\"', NULL, 1, 0),
(612, 5, 7, '2022-06-26 14:50:42', '\"Windows\"', NULL, 1, 1),
(613, 9, 7, '2022-06-26 14:50:46', '\"Windows\"', NULL, 1, 0),
(614, 9, 8, '2022-06-26 14:51:50', '\"Windows\"', NULL, 1, 1),
(615, 9, 8, '2022-06-26 14:52:30', '\"Windows\"', NULL, 1, 0),
(616, 11, 9, '2022-06-26 14:53:18', '\"Windows\"', NULL, 1, 0),
(617, 11, 9, '2022-06-26 14:55:11', '\"Windows\"', NULL, 1, 1),
(618, 11, 9, '2022-06-26 14:56:24', '\"Windows\"', NULL, 1, 0),
(619, 11, 9, '2022-06-26 14:59:23', '\"Windows\"', NULL, 1, 1),
(620, 11, 9, '2022-06-26 14:59:33', '\"Windows\"', NULL, 1, 0),
(621, 9, 10, '2022-06-26 15:03:36', '\"Windows\"', NULL, 1, 0),
(622, 11, 11, '2022-06-26 15:04:25', '\"Windows\"', NULL, 1, 0),
(623, 9, 10, '2022-06-26 15:04:40', '\"Windows\"', NULL, 1, 1),
(624, 12, 12, '2022-06-26 15:34:27', '\"Windows\"', NULL, 0, 0),
(625, 15, 7, '2022-06-26 15:37:26', '\"Windows\"', NULL, 1, 0),
(626, 15, 7, '2022-06-26 15:37:35', '\"Windows\"', NULL, 1, 1),
(627, 16, 13, '2022-06-26 15:43:24', '\"Windows\"', NULL, 1, 0),
(628, 16, 13, '2022-06-26 15:43:30', '\"Windows\"', NULL, 1, 1),
(629, 16, 13, '2022-06-26 15:44:01', '\"Windows\"', NULL, 1, 0),
(630, 16, 14, '2022-06-26 15:47:42', '\"Windows\"', NULL, 1, 1),
(631, 18, 14, '2022-06-26 15:48:27', '\"Windows\"', NULL, 1, 0),
(632, 18, 14, '2022-06-26 15:48:29', '\"Windows\"', NULL, 1, 1),
(633, 9, 14, '2022-06-26 15:48:32', '\"Windows\"', NULL, 1, 0),
(634, 9, 14, '2022-06-26 15:49:02', '\"Windows\"', NULL, 1, 1),
(635, 18, 14, '2022-06-26 15:49:06', '\"Windows\"', NULL, 1, 0),
(636, 18, 15, '2022-06-26 15:51:13', '\"Windows\"', NULL, 1, 1),
(637, 9, 15, '2022-06-26 15:51:23', '\"Windows\"', NULL, 1, 0),
(638, 9, 15, '2022-06-26 15:51:38', '\"Windows\"', NULL, 1, 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_user_idx` (`user_id`),
  ADD KEY `fk_comments_movies1_idx` (`movies_id`);

--
-- Indeksy dla tabeli `incorrect_logins`
--
ALTER TABLE `incorrect_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incorrect_logins__user__FK__idx` (`id_user`),
  ADD KEY `incorrect_logins__ip_address__FK__idx` (`id_address`);

--
-- Indeksy dla tabeli `ip_address`
--
ALTER TABLE `ip_address`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reviews_user1_idx` (`user_id`),
  ADD KEY `fk_reviews_movies1_idx` (`movies_id`);

--
-- Indeksy dla tabeli `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `role_privileges`
--
ALTER TABLE `role_privileges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_role_privileges_privileges1_idx` (`privileges_id`),
  ADD KEY `fk_role_privileges_role1_idx` (`role_id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_user_role1_idx` (`role_id`);

--
-- Indeksy dla tabeli `user_activity`
--
ALTER TABLE `user_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_activity__user__FK__idx` (`id_user`);

--
-- Indeksy dla tabeli `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_login__user__FK__idx` (`id_user`),
  ADD KEY `user_login__ip_address__FK__idx` (`id_address`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT dla tabeli `incorrect_logins`
--
ALTER TABLE `incorrect_logins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT dla tabeli `ip_address`
--
ALTER TABLE `ip_address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT dla tabeli `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT dla tabeli `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `role_privileges`
--
ALTER TABLE `role_privileges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT dla tabeli `user_activity`
--
ALTER TABLE `user_activity`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT dla tabeli `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=639;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_movies1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `fk_comments_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ograniczenia dla tabeli `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_reviews_movies1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `fk_reviews_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ograniczenia dla tabeli `role_privileges`
--
ALTER TABLE `role_privileges`
  ADD CONSTRAINT `fk_role_privileges_privileges1` FOREIGN KEY (`privileges_id`) REFERENCES `privileges` (`id`),
  ADD CONSTRAINT `fk_role_privileges_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Ograniczenia dla tabeli `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
