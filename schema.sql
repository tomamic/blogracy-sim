-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generato il: Mar 07, 2013 alle 23:49
-- Versione del server: 5.5.27
-- Versione PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `blogracy-sim`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `delivery`
--

CREATE TABLE IF NOT EXISTS `delivery` (
  `src` varchar(100) NOT NULL,
  `dst` varchar(100) NOT NULL,
  `created` int(11) NOT NULL,
  `received` int(11) NOT NULL,
  `optimal` int(11) NOT NULL,
  PRIMARY KEY (`src`,`dst`,`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `edge`
--

CREATE TABLE IF NOT EXISTS `edge` (
  `a` varchar(100) NOT NULL,
  `b` varchar(100) NOT NULL,
  PRIMARY KEY (`a`,`b`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `src` varchar(100) NOT NULL,
  `created` int(11) NOT NULL,
  `available` int(11) NOT NULL,
  PRIMARY KEY (`src`,`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `node`
--

CREATE TABLE IF NOT EXISTS `node` (
  `id` varchar(100) NOT NULL,
  `online` tinyint(1) NOT NULL,
  `minonline` int(11) NOT NULL,
  `maxonline` int(11) NOT NULL,
  `minoffline` int(11) NOT NULL,
  `maxoffline` int(11) NOT NULL,
  `countdown` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `system`
--

CREATE TABLE IF NOT EXISTS `system` (
  `name` varchar(100) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
