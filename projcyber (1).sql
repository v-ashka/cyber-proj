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
-- Baza danych: `projcyber`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` double NOT NULL,
  `movies_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `like_cnt` int(11) DEFAULT NULL
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
(14, 'Podoba mi się ten film', '2022-06-10 11:13:39', 5, 4, 5, 0, NULL),
(16, 'SUperowe filmidlo', '2022-06-10 18:16:26', 7, 10, 1, 0, NULL),
(17, 'Siekiera motyka... marian paździoch to....', '2022-06-12 22:35:03', 4, 7.5, 12, 0, NULL),
(19, 'Tadzik zejdź mi z torów', '2022-06-12 22:36:21', 4, 8, 6, 0, NULL),
(20, 'superowy serial', '2022-06-13 21:45:27', 4, 7, 6, 0, NULL),
(21, 'kohom ten seriol', '2022-06-13 21:46:38', 10, 7, 5, 0, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `user_id` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `content` text NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `image_url` text NOT NULL,
  `deleted` tinyint(4) NOT NULL,
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
  `id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `score` double NOT NULL,
  `movies_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `like_count` int(11) DEFAULT NULL
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
  `id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
  `privileges_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `login` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `salt` blob DEFAULT NULL,
  `email_code` varchar(6) DEFAULT NULL,
  `code_lifetime` timestamp NULL DEFAULT NULL,
  `security_password` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `lockout_time` timestamp NULL DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `password_form` int(11) NOT NULL,
  `check_validation` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `role_id`, `login`, `email`, `hash`, `salt`, `email_code`, `code_lifetime`, `security_password`, `answer`, `lockout_time`, `id_status`, `password_form`, `check_validation`) VALUES
(1, 3, 'test123', 'test123@o2.pl', 'm6FnWkGyRFojK8EsT+BI+/S8UQIDXIxNAkeXLVgvgRMwXrhA+HDQ0sZcYTv79/qYv1n1NPf/Ig6lKEz4E751Dqw/YKSBYHwqAG1Q7kJiBGmuSRoJeqjaWykTvbRMdz3bW8ap95Qm83PpWsdYWf6n3zb+gzT75h1ny69MUKrnXSMlEaCNNaUMpY9mDMEUlugt', 0x898da79e481e00668fa82918e8985aac, NULL, NULL, NULL, NULL, NULL, 0, 0, 1),
(4, 1, 'kauczuk', 'kauczuk@o2.pl', 'm6FnWkGyRFojK8EsT+BI+/S8UQIDXIxNAkeXLVgvgRMwXrhA+HDQ0sZcYTv79/qYv1n1NPf/Ig6lKEz4E751Dqw/YKSBYHwqAG1Q7kJiBGmuSRoJeqjaWykTvbRMdz3bW8ap95Qm83PpWsdYWf6n3zb+gzT75h1ny69MUKrnXSMlEaCNNaUMpY9mDMEUlugt', 0x898da79e481e00668fa82918e8985aac, '435714', '2022-06-12 15:54:45', NULL, NULL, NULL, 1, 0, 0),
(5, 1, 'kamil', 'kamil@spoko.pl', 'm6FnWkGyRFojK8EsT+BI+/S8UQIDXIxNAkeXLVgvgRMwXrhA+HDQ0sZcYTv79/qYv1n1NPf/Ig6lKEz4E751Dqw/YKSBYHwqAG1Q7kJiBGmuSRoJeqjaWykTvbRMdz3bW8ap95Qm83PpWsdYWf6n3zb+gzT75h1ny69MUKrnXSMlEaCNNaUMpY9mDMEUlugt', 0x898da79e481e00668fa82918e8985aac, '308613', '2022-06-10 09:17:48', NULL, NULL, NULL, 1, 0, 1),
(6, 2, 'recenzent', 'recenzent@o2.pl', 'm6FnWkGyRFojK8EsT+BI+/S8UQIDXIxNAkeXLVgvgRMwXrhA+HDQ0sZcYTv79/qYv1n1NPf/Ig6lKEz4E751Dqw/YKSBYHwqAG1Q7kJiBGmuSRoJeqjaWykTvbRMdz3bW8ap95Qm83PpWsdYWf6n3zb+gzT75h1ny69MUKrnXSMlEaCNNaUMpY9mDMEUlugt', 0x898da79e481e00668fa82918e8985aac, '198738', '2022-06-15 07:50:36', NULL, NULL, NULL, 1, 0, 1),
(7, 2, 'kaszalot', 'kaszalot200@o2.pl', 'm6FnWkGyRFojK8EsT+BI+/S8UQIDXIxNAkeXLVgvgRMwXrhA+HDQ0sZcYTv79/qYv1n1NPf/Ig6lKEz4E751Dqw/YKSBYHwqAG1Q7kJiBGmuSRoJeqjaWykTvbRMdz3bW8ap95Qm83PpWsdYWf6n3zb+gzT75h1ny69MUKrnXSMlEaCNNaUMpY9mDMEUlugt', 0x898da79e481e00668fa82918e8985aac, '376724', '2022-06-13 19:41:24', NULL, NULL, NULL, 1, 0, 0),
(8, 3, 'areczek199', 'areczek119@spoko.pl', 'AWvzaUVieKCY/VZ9DsOfc2aIyvzgA48BOuSCUklOujbw9ulywNXFeveYLu/IQlgpZdU2TJstmMR82SMqJkJJQrSnwarvRn42q8fN4lkSnw3VRLBVQERITT40mfRIe1GDHRJGibAW2cE6EQCoJTlsIKP2OJkNWmNqDJyBlCx4LA4sSlcwK6qho4BQWkQPLhqQ', 0x4d48a0f03ec3d888c9cf6778e39bfe3a, '843585', '2022-06-14 17:45:30', NULL, NULL, NULL, 1, 0, 0),
(9, 4, 'admin', 'admin@admin.pl', '6xRFV80KlYQzNIA9txMgo75zzkLhmPCDJf3C0bl7OPfKN4h3LDyAzF+fxs+PzPQJfYUmIE7Phr05SChrXd7FqQ/Smz9tgI89w8R6x5XbXdf1XNXKsymhE7eaTfMvx17b4jPd36hbsV7jiXiAk+7Ly2PPgSfxc8HJcoWaxv0K7wC690e+W+tXAO6G2v/aPs38', 0x33abdbd90d52268b6d000e1d405047b1, '316591', '2022-06-12 20:45:28', NULL, NULL, NULL, 1, 0, 0),
(10, 4, 'romanowski', 'roman@o2.pl', 'hgx/qcZlas37q32aPAPCoTQ1f0iX9dlBuk3jTSXqg292Vtj0aPt3n9YLB0GsqNtQN8KdMfewMeyx/n4OLCBq8U+KzQhwyRP3O+gTqEuBD5otAUABZytFKd62vHpa7pLS0Q5JSy1wzVreYquDn1waMwscs13P1XdnvJrISEdfAy+SQQ4UUx5yYy5OKlr5M9tp', 0xe7c0d056efb49b0bac5f15fccd75d941, '562564', '2022-06-13 19:50:47', NULL, NULL, NULL, 1, 0, 0);

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
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT dla tabeli `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT dla tabeli `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT dla tabeli `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `role_privileges`
--
ALTER TABLE `role_privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_movies1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comments_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_reviews_movies1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reviews_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `role_privileges`
--
ALTER TABLE `role_privileges`
  ADD CONSTRAINT `fk_role_privileges_privileges1` FOREIGN KEY (`privileges_id`) REFERENCES `privileges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_role_privileges_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
