-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Cze 2022, 11:21
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `user_activity`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `incorrect_logins`
--

CREATE TABLE `incorrect_logins` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `session_id` varchar(255) DEFAULT NULL,
  `id_address` int(11) NOT NULL,
  `computer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `incorrect_logins`
--

INSERT INTO `incorrect_logins` (`id`, `id_user`, `time`, `session_id`, `id_address`, `computer`) VALUES
(133, 10, '2022-06-13 20:04:13', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(134, 10, '2022-06-13 20:04:24', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(135, 10, '2022-06-13 20:04:44', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(136, 10, '2022-06-13 20:04:44', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(137, 10, '2022-06-13 20:04:44', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(138, 10, '2022-06-13 20:04:45', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(139, 10, '2022-06-13 20:04:45', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(140, 10, '2022-06-13 20:04:45', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(141, 10, '2022-06-13 20:04:46', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(142, 10, '2022-06-13 20:04:46', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(143, 10, '2022-06-13 20:04:46', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(144, 10, '2022-06-13 20:04:46', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(145, 10, '2022-06-13 20:04:47', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(146, 10, '2022-06-13 20:04:47', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(147, 10, '2022-06-13 20:04:48', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(148, 7, '2022-06-13 20:14:32', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(149, 9, '2022-06-13 20:20:15', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(150, 9, '2022-06-13 20:20:22', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(151, 9, '2022-06-13 20:20:24', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(152, 9, '2022-06-13 20:20:24', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(153, 9, '2022-06-13 20:20:24', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(154, 9, '2022-06-13 20:20:25', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(155, 9, '2022-06-13 20:20:25', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(156, 9, '2022-06-13 20:20:26', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
(157, 9, '2022-06-13 20:20:29', 'undetected', 1, 'j5dtfutr0g0hadlu2tnupkv82o'),
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
(208, 7, '2022-06-15 06:46:11', 'undetected', 1, 'u8vhnbje2dpmmfagochq0geub2');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ip_address`
--

CREATE TABLE `ip_address` (
  `id` int(11) NOT NULL,
  `ok_login_num` bigint(20) NOT NULL,
  `bad_login_num` int(11) NOT NULL,
  `last_bad_login_num` smallint(6) DEFAULT NULL,
  `permanent_lock` tinyint(4) NOT NULL,
  `temp_lock` timestamp NULL DEFAULT NULL,
  `address_IP` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `ip_address`
--

INSERT INTO `ip_address` (`id`, `ok_login_num`, `bad_login_num`, `last_bad_login_num`, `permanent_lock`, `temp_lock`, `address_IP`) VALUES
(1, 56, 76, 0, 0, '2022-06-15 06:56:11', '::1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_activity`
--

CREATE TABLE `user_activity` (
  `id` bigint(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `action_taken` varchar(255) NOT NULL,
  `table_affected` varchar(255) DEFAULT NULL,
  `row_number` int(11) DEFAULT NULL,
  `previous_data` text DEFAULT NULL,
  `new_data` text DEFAULT NULL,
  `undone` tinyint(4) NOT NULL DEFAULT 0,
  `can_undo` tinyint(4) GENERATED ALWAYS AS (case when `undone` <> 0 then 0 when `previous_data` is not null then 1 when `new_data` is not null then 1 else 0 end) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `user_activity`
--

INSERT INTO `user_activity` (`id`, `id_user`, `time`, `action_taken`, `table_affected`, `row_number`, `previous_data`, `new_data`, `undone`) VALUES
(228, 7, '2022-06-13 18:45:26', 'add content', 'reviews', 16, NULL, 'a:6:{s:2:\"id\";i:16;s:7:\"user_id\";i:7;s:5:\"title\";s:11:\"Alee rajza!\";s:7:\"content\";s:40:\"Podoba mi się nieźle fajne wybuchy itd\";s:5:\"score\";s:3:\"8.9\";s:7:\"deleted\";i:0;}', 0),
(229, 7, '2022-06-13 18:45:33', 'delete content', 'reviews', 13, '0', '1', 0),
(230, 7, '2022-06-13 18:45:37', 'delete content', 'reviews', 13, '0', '1', 0),
(231, 7, '2022-06-13 18:45:40', 'delete content', 'reviews', 13, '0', '1', 0),
(232, 7, '2022-06-13 18:45:50', 'delete content', 'reviews', 13, '0', '1', 0),
(233, 7, '2022-06-13 18:47:31', 'delete content', 'reviews', 14, '0', '1', 0),
(234, 7, '2022-06-13 18:47:49', 'edit content', 'reviews', 15, 'a:18:{s:2:\"id\";i:15;i:0;i:15;s:7:\"user_id\";i:7;i:1;i:7;s:5:\"title\";s:11:\"Alee rajza!\";i:2;s:11:\"Alee rajza!\";s:7:\"content\";s:40:\"Podoba mi się nieźle fajne wybuchy itd\";i:3;s:40:\"Podoba mi się nieźle fajne wybuchy itd\";s:10:\"created_at\";s:19:\"2022-06-13 20:45:26\";i:4;s:19:\"2022-06-13 20:45:26\";s:5:\"score\";d:8.9;i:5;d:8.9;s:9:\"movies_id\";i:3;i:6;i:3;s:7:\"deleted\";i:0;i:7;i:0;s:10:\"like_count\";N;i:8;N;}', 'a:4:{s:5:\"title\";s:19:\"KUURWA PODAJ PIWOOO\";s:7:\"content\";s:14:\"JA KOCHAM PIWO\";s:5:\"score\";s:1:\"2\";s:9:\"review_id\";s:2:\"15\";}', 1),
(235, 8, '2022-06-13 18:49:31', 'add content', 'movies', 14, NULL, 'a:8:{s:2:\"id\";i:14;s:7:\"user_id\";i:8;s:5:\"title\";s:22:\"Świat Według Bundych\";s:7:\"content\";s:1618:\"Czworo Bundych oraz ich pies to przeciętna amerykańska rodzina, której dochód schodzi jednak poniżej przeciętnej. Jedyną stale pracującą osobą w rodzinie jest Al, głowa rodziny, który pracuje w sklepie obuwniczym. Gdy otwierają się drzwi domu i staje w nich Al, niemalże zawsze można usłyszeć: Dziś do sklepu weszła taka gruba baba.... Do jego ulubionych czynności należy picie budweisera oraz posiedzenia w ubikacji. Peggy, małżonka Ala, większość dnia spędza przed telewizorem, zajadając się tonami popcornu i czekoladek. Ich pociechy, Bud i Kelly, rozwijają się w trakcie kolejnych serii. Buda ogólnie można scharakteryzować jako macho, którego nie chce żadna dziewczyna, a Kelly jako puszczalską, niezbyt rozgarniętą blondynkę. Towarzyszem rodziny Bundych jest ich pies Buck. Dużą rolę w serialu spełniają także sąsiedzi Bundych - Marcy z mężem Steve\'em, a później z kolejnym Jeffersonem Darcym. Rodzina Bundych jest bardzo przywiązana do kilku przedmiotów, do których zaliczyć można starego dodge\'a w garażu, kanapę, na której zasiadają członkowie rodziny, aby spoglądać w kolejny niezwykle ważny przedmiot - telewizor. Bundym nieraz w oczy zagląda głód czy inne problemy związane z brakiem pieniędzy. Oni jednak nie przejmują się tym, a po prostu znajdują rozwiązanie problemu (np. przeprowadzenie się do hipermarketu), które obfituje w wiele dowcipnych sytuacji. Serial budził niemałe kontrowersje, głównie w Stanach Zjednoczonych. Łamał niektóre tabu, a także bezlitośnie wyśmiewał każdego i wszystko, co tylko się dało.\";s:4:\"type\";s:6:\"comedy\";s:9:\"prod_date\";s:10:\"1987-06-19\";s:7:\"img_url\";s:46:\"https://fwcdn.pl/fpo/24/57/92457/7682360.3.jpg\";s:7:\"deleted\";i:0;}', 1),
(236, 7, '2022-06-13 19:36:51', 'add content', 'reviews', 17, NULL, 'a:6:{s:2:\"id\";i:17;s:7:\"user_id\";i:7;s:5:\"title\";s:10:\"aduapdasap\";s:7:\"content\";s:9:\"asduasuda\";s:5:\"score\";s:3:\"7.8\";s:7:\"deleted\";i:0;}', 1),
(237, 7, '2022-06-13 19:41:53', 'add content', 'reviews', 18, NULL, 'a:6:{s:2:\"id\";i:18;s:7:\"user_id\";i:7;s:5:\"title\";s:15:\"sadasdasdasdasd\";s:7:\"content\";s:49:\"saasdasdasdasdas to jest walanise kiepskich swiat\";s:5:\"score\";s:1:\"6\";s:7:\"deleted\";i:0;}', 1),
(238, 7, '2022-06-13 19:43:28', 'add content', 'reviews', 18, NULL, 'a:6:{s:2:\"id\";i:18;s:7:\"user_id\";i:7;s:5:\"title\";s:11:\"zxczxczxczx\";s:7:\"content\";s:21:\"ło kurwa wybuchtawsd\";s:5:\"score\";s:1:\"5\";s:7:\"deleted\";i:0;}', 1),
(240, 10, '2022-06-13 19:46:27', 'add content', 'comments', 21, NULL, 'a:5:{s:2:\"id\";i:21;s:7:\"user_id\";i:10;s:7:\"content\";s:16:\"kohom ten seriol\";s:5:\"score\";s:1:\"7\";s:7:\"deleted\";i:0;}', 0),
(241, 10, '2022-06-13 19:46:38', 'edit content', 'comments', 21, 'a:16:{s:2:\"id\";i:21;i:0;i:21;s:7:\"content\";s:16:\"kohom ten seriol\";i:1;s:16:\"kohom ten seriol\";s:10:\"created_at\";s:19:\"2022-06-13 21:46:27\";i:2;s:19:\"2022-06-13 21:46:27\";s:7:\"user_id\";i:10;i:3;i:10;s:5:\"score\";d:7;i:4;d:7;s:9:\"movies_id\";i:5;i:5;i:5;s:7:\"deleted\";i:0;i:6;i:0;s:8:\"like_cnt\";N;i:7;N;}', 'a:3:{s:7:\"content\";s:42:\"kohom ten seriol imo jest zajebisty w chuj\";s:5:\"score\";s:1:\"7\";s:10:\"comment_id\";s:2:\"21\";}', 1),
(242, 7, '2022-06-14 17:38:01', 'add content', 'reviews', 19, NULL, 'a:6:{s:2:\"id\";i:19;s:7:\"user_id\";i:7;s:5:\"title\";s:20:\"Fantastyczna komedai\";s:7:\"content\";s:18:\"Uwielbiam ten film\";s:5:\"score\";s:3:\"6.5\";s:7:\"deleted\";i:0;}', 0),
(243, 7, '2022-06-14 17:39:41', 'edit content', 'reviews', 19, 'a:18:{s:2:\"id\";i:19;i:0;i:19;s:7:\"user_id\";i:7;i:1;i:7;s:5:\"title\";s:20:\"Fantastyczna komedai\";i:2;s:20:\"Fantastyczna komedai\";s:7:\"content\";s:18:\"Uwielbiam ten film\";i:3;s:18:\"Uwielbiam ten film\";s:10:\"created_at\";s:19:\"2022-06-14 19:38:01\";i:4;s:19:\"2022-06-14 19:38:01\";s:5:\"score\";d:6.5;i:5;d:6.5;s:9:\"movies_id\";i:13;i:6;i:13;s:7:\"deleted\";i:0;i:7;i:0;s:10:\"like_count\";N;i:8;N;}', 'a:4:{s:5:\"title\";s:20:\"Fantastyczna komedia\";s:7:\"content\";s:59:\"Uwielbiam ten film, postać [wpisz tutaj] jest przezabawna!\";s:5:\"score\";s:2:\"10\";s:9:\"review_id\";s:2:\"19\";}', 0),
(244, 7, '2022-06-14 17:39:53', 'delete content', 'reviews', 19, '0', '1', 0),
(245, 8, '2022-06-14 17:40:49', 'add content', 'movies', 14, NULL, 'a:8:{s:2:\"id\";i:14;s:7:\"user_id\";i:8;s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"type\";N;s:9:\"prod_date\";s:0:\"\";s:7:\"img_url\";s:0:\"\";s:7:\"deleted\";i:0;}', 0),
(246, 8, '2022-06-14 17:42:03', 'add content', 'movies', 15, NULL, 'a:8:{s:2:\"id\";i:15;s:7:\"user_id\";i:8;s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"type\";N;s:9:\"prod_date\";s:0:\"\";s:7:\"img_url\";s:0:\"\";s:7:\"deleted\";i:0;}', 0),
(247, 8, '2022-06-14 17:43:36', 'add content', 'movies', 16, NULL, 'a:8:{s:2:\"id\";i:16;s:7:\"user_id\";i:8;s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"type\";N;s:9:\"prod_date\";s:0:\"\";s:7:\"img_url\";s:0:\"\";s:7:\"deleted\";i:0;}', 0),
(248, 8, '2022-06-14 17:48:28', 'add content', 'movies', 17, NULL, 'a:8:{s:2:\"id\";i:17;s:7:\"user_id\";i:8;s:5:\"title\";s:40:\"\";s:7:\"content\";s:5:\"asdas\";s:4:\"type\";s:6:\"comedy\";s:9:\"prod_date\";s:10:\"2022-06-08\";s:7:\"img_url\";s:6:\"asdasd\";s:7:\"deleted\";i:0;}', 0),
(249, 8, '2022-06-14 18:02:30', 'add content', 'movies', 18, NULL, 'a:8:{s:2:\"id\";i:18;s:7:\"user_id\";i:8;s:5:\"title\";s:6:\"asdasd\";s:7:\"content\";s:8:\"asdasdas\";s:4:\"type\";s:6:\"comedy\";s:9:\"prod_date\";s:10:\"2022-06-15\";s:7:\"img_url\";s:6:\"asdasd\";s:7:\"deleted\";i:0;}', 0),
(250, 8, '2022-06-14 18:02:35', 'delete content', 'movies', 14, '0', '1', 0),
(251, 8, '2022-06-14 18:02:38', 'delete content', 'movies', 15, '0', '1', 0),
(252, 8, '2022-06-14 18:02:41', 'delete content', 'movies', 17, '0', '1', 0),
(253, 8, '2022-06-14 18:02:44', 'delete content', 'movies', 16, '0', '1', 0),
(254, 8, '2022-06-14 18:02:47', 'delete content', 'movies', 18, '0', '1', 0),
(255, 8, '2022-06-14 18:03:42', 'add content', 'movies', 19, NULL, 'a:8:{s:2:\"id\";i:19;s:7:\"user_id\";i:8;s:5:\"title\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"type\";s:6:\"comedy\";s:9:\"prod_date\";s:10:\"2022-06-09\";s:7:\"img_url\";s:4:\"adas\";s:7:\"deleted\";i:0;}', 0),
(256, 8, '2022-06-14 18:10:30', 'add content', 'movies', 20, NULL, 'a:8:{s:2:\"id\";i:20;s:7:\"user_id\";i:8;s:5:\"title\";s:11:\"Zupa romana\";s:7:\"content\";s:12:\"romano domua\";s:4:\"type\";s:6:\"comedy\";s:9:\"prod_date\";s:10:\"1999-10-12\";s:7:\"img_url\";s:11:\"dupa romana\";s:7:\"deleted\";i:0;}', 0),
(257, 8, '2022-06-14 18:10:43', 'delete content', 'movies', 20, '0', '1', 0),
(258, 6, '2022-06-15 07:40:42', 'add content', 'reviews', 20, NULL, 'a:6:{s:2:\"id\";i:20;s:7:\"user_id\";i:6;s:5:\"title\";s:7:\"Hahahah\";s:7:\"content\";s:15:\"Bawi bawi bawi!\";s:5:\"score\";s:1:\"8\";s:7:\"deleted\";i:0;}', 0),
(259, 6, '2022-06-15 07:46:03', 'add content', 'reviews', 21, NULL, 'a:6:{s:2:\"id\";i:21;s:7:\"user_id\";i:6;s:5:\"title\";s:19:\"Przezabawny serial!\";s:7:\"content\";s:23:\"Jeden z zabwaniejszych!\";s:5:\"score\";s:1:\"8\";s:7:\"deleted\";i:0;}', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_login`
--

CREATE TABLE `user_login` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_address` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `computer` varchar(255) DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  `correct` tinyint(4) NOT NULL,
  `log_out` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(592, 9, 1, '2022-06-15 09:18:49', '\"Windows\"', NULL, 1, 0);

--
-- Indeksy dla zrzutów tabel
--

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
-- AUTO_INCREMENT dla tabeli `incorrect_logins`
--
ALTER TABLE `incorrect_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT dla tabeli `ip_address`
--
ALTER TABLE `ip_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `user_activity`
--
ALTER TABLE `user_activity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT dla tabeli `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=593;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `incorrect_logins`
--
ALTER TABLE `incorrect_logins`
  ADD CONSTRAINT `incorrect_logins__ip_address__FK` FOREIGN KEY (`id_address`) REFERENCES `ip_address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `incorrect_logins__user__FK` FOREIGN KEY (`id_user`) REFERENCES `news`.`user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `user_activity`
--
ALTER TABLE `user_activity`
  ADD CONSTRAINT `user_activity__user__FK` FOREIGN KEY (`id_user`) REFERENCES `news`.`user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `user_login`
--
ALTER TABLE `user_login`
  ADD CONSTRAINT `user_login__ip_address__FK` FOREIGN KEY (`id_address`) REFERENCES `ip_address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_login__user__FK` FOREIGN KEY (`id_user`) REFERENCES `projcyber`.`user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
