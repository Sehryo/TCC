-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Set-2020 às 17:30
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.4.7
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_culturama`
--
CREATE DATABASE db_culturama;
USE db_culturama;
-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_avaliacao`
--

CREATE TABLE `tb_avaliacao` (
  `id_usuario` int(11) NOT NULL,
  `id_organizador` int(11) NOT NULL,
  `valor_avaliacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_endereco`
--


CREATE TABLE `tb_endereco` (
  `id_endereco` int(11) NOT NULL,
  `rua_endereco` varchar(255) NOT NULL,
  `bairro_endereco` varchar(255) NOT NULL,
  `cidade_endereco` varchar(255) NOT NULL,
  `uf_endereco` char(2) NOT NULL,
  `cep_endereco` char(8) NOT NULL,
  `complemento_endereco` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_endereco`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_endereco_usuario`
--

CREATE TABLE `tb_endereco_usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  `numero_endereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_endereco_usuario`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_evento`
--

CREATE TABLE `tb_evento` (
  `id_evento` int(11) NOT NULL,
  `nome_evento` varchar(255) NOT NULL,
  `descricao_evento` longtext NOT NULL,
  `data_evento` date NOT NULL,
  `horario_entrada` time DEFAULT NULL,
  `horario_saida` time DEFAULT NULL,
  `id_organizador` int(11) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  `num_endereco` int(11) NOT NULL,
  `tags_evento` varchar(255) DEFAULT NULL,
  `imagem_evento` longblob DEFAULT NULL,
  `tipo_imagem` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_evento`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_interesses`
--

CREATE TABLE `tb_interesses` (
  `data_interesse` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_evento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_local_fixo`
--

CREATE TABLE `tb_local_fixo`(
`id_local` INT NOT NULL,
`nome_local` varchar(255) NOT NULL,
`email_local` varchar(255) NOT NULL,
`descricao_local` longtext NOT NULL,
`telefone_local` varchar(15) NOT NULL,
`funcionamento_local` varchar(255) NOT NULL,
`tags_local` varchar(255) NOT NULL,
`id_endereco` int NOT NULL,
`id_organizador` int not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_organizador`
--

CREATE TABLE `tb_organizador` (
  `id_organizador` int(11) NOT NULL,
  `nome_organizador` varchar(255) NOT NULL,
  `email_organizador` varchar(255) NOT NULL,
  `senha_organizador` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_organizador`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pf`
--

CREATE TABLE `tb_pf` (
  `cpf_pg` char(11) NOT NULL,
  `id_organizador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pj`
--

CREATE TABLE `tb_pj` (
  `cnpj_pj` char(11) NOT NULL,
  `id_organizador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_pj`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_setor_evento`
--

CREATE TABLE `tb_setor_evento` (
  `id_setor` int(11) NOT NULL,
  `nome_setor` varchar(255) NOT NULL,
  `id_evento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome_usuario` varchar(255) NOT NULL,
  `senha_usuario` varchar(256) NOT NULL,
  `email_usuario` varchar(255) NOT NULL,
  `telefone_usuario` char(13) NOT NULL,
  `dataNasc_usuario` date NOT NULL,
  `tags_usuario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_usuario`
--

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_avaliacao`
--
ALTER TABLE `tb_avaliacao`
  ADD KEY `FK_avaliador` (`id_usuario`),
  ADD KEY `FK_avaliado` (`id_organizador`);

--
-- Índices para tabela `tb_endereco`
--
ALTER TABLE `tb_endereco`
  ADD PRIMARY KEY (`id_endereco`);

--
-- Índices para tabela `tb_endereco_usuario`
--
ALTER TABLE `tb_endereco_usuario`
  ADD KEY `FK_usuario_endereco` (`id_usuario`),
  ADD KEY `FK_endereco_usuario` (`id_endereco`);

--
-- Índices para tabela `tb_evento`
--
ALTER TABLE `tb_evento`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `FK_id_organizador` (`id_organizador`),
  ADD KEY `FK_id_endereco` (`id_endereco`);

--
-- Índices para tabela `tb_interesses`
--
ALTER TABLE `tb_interesses`
  ADD KEY `FK_usuario_interessado` (`id_usuario`),
  ADD KEY `FK_evento_interesse` (`id_evento`);

--
-- Índices para tabela `tb_organizador`
--
ALTER TABLE `tb_organizador`
  ADD PRIMARY KEY (`id_organizador`);

--
-- Índices para tabela `tb_pf`
--
ALTER TABLE `tb_pf`
  ADD KEY `FK_cpf_organizador` (`id_organizador`);

--
-- Índices para tabela `tb_pj`
--
ALTER TABLE `tb_pj`
  ADD KEY `FK_cnpj_organizador` (`id_organizador`);

--
-- Índices para tabela `tb_setor_evento`
--
ALTER TABLE `tb_setor_evento`
  ADD PRIMARY KEY (`id_setor`),
  ADD KEY `FK_setor_evento` (`id_evento`);

--
-- Índices para tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Índices para tabela `tb_endereco`
--
ALTER TABLE `tb_local_fixo`
  ADD PRIMARY KEY (`id_local`),
  ADD KEY `FK_organizador_local` (`id_organizador`),
  ADD KEY `FK_endereco_local` (`id_endereco`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_endereco`
--
ALTER TABLE `tb_endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_evento`
--
ALTER TABLE `tb_evento`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_organizador`
--
ALTER TABLE `tb_organizador`
  MODIFY `id_organizador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_setor_evento`
--
ALTER TABLE `tb_setor_evento`
  MODIFY `id_setor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_avaliacao`
--
ALTER TABLE `tb_avaliacao`
  ADD CONSTRAINT `FK_avaliado` FOREIGN KEY (`id_organizador`) REFERENCES `tb_organizador` (`id_organizador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_avaliador` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_endereco_usuario`
--
ALTER TABLE `tb_endereco_usuario`
  ADD CONSTRAINT `FK_endereco_usuario` FOREIGN KEY (`id_endereco`) REFERENCES `tb_endereco` (`id_endereco`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_usuario_endereco` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_evento`
--
ALTER TABLE `tb_evento`
  ADD CONSTRAINT `FK_id_endereco` FOREIGN KEY (`id_endereco`) REFERENCES `tb_endereco` (`id_endereco`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_id_organizador` FOREIGN KEY (`id_organizador`) REFERENCES `tb_organizador` (`id_organizador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_interesses`
--
ALTER TABLE `tb_interesses`
  ADD CONSTRAINT `FK_evento_interesse` FOREIGN KEY (`id_evento`) REFERENCES `tb_evento` (`id_evento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_usuario_interessado` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_pf`
--
ALTER TABLE `tb_pf`
  ADD CONSTRAINT `FK_cpf_organizador` FOREIGN KEY (`id_organizador`) REFERENCES `tb_organizador` (`id_organizador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_pj`
--
ALTER TABLE `tb_pj`
  ADD CONSTRAINT `FK_cnpj_organizador` FOREIGN KEY (`id_organizador`) REFERENCES `tb_organizador` (`id_organizador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_setor_evento`
--
ALTER TABLE `tb_setor_evento`
  ADD CONSTRAINT `FK_setor_evento` FOREIGN KEY (`id_evento`) REFERENCES `tb_evento` (`id_evento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_local_fixo`
--
ALTER TABLE `tb_local_fixo`
  ADD CONSTRAINT `FK_organizador_local` FOREIGN KEY (`id_organizador`) REFERENCES `tb_organizador` (`id_organizador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_endereco_local` FOREIGN KEY (`id_endereco`) REFERENCES `tb_endereco` (`id_endereco`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
