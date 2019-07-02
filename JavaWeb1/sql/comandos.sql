CREATE TABLE `item` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nome_item` varchar(100) DEFAULT NULL,
  `fornecedor` varchar(70) DEFAULT NULL,
  `validade` varchar(10) DEFAULT NULL,
  `quantidade` varchar(10) DEFAULT NULL,
  `compra` varchar(10) DEFAULT NULL,
  `venda` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ;