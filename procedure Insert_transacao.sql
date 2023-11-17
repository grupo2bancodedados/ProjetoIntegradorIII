DELIMITER //

CREATE PROCEDURE insert_transacao (IN id_conta TINYINT, IN id_categoria INT, IN id_subcategoria INT, 
                                   IN data_transacao DATE, IN valor_transacao DECIMAL(10,2), 
                                   IN descricao VARCHAR(100), IN prestacoes TINYINT, 
                                   IN periodicidade enum('S', 'M', 'A', 'O'), IN tipo_transacao ENUM('C', 'D'))
BEGIN
    DECLARE msg VARCHAR(50);
    DECLARE i TINYINT DEFAULT 1;
    declare p varchar(10);
    
    WHILE i <= prestacoes DO

		IF prestacoes  > 1 THEN
		  set p =  concat(' (', i, '/', prestacoes , ')');
		else
		  set p = '';
		end if;
        
        INSERT INTO transacoes (data_transacao, valor_transacao, descricao, id_conta, id_categoria, id_subcategoria, tipo_transacao)
        VALUES (data_transacao, valor_transacao, concat(descricao, p) , id_conta, id_categoria, id_subcategoria, tipo_transacao);
        
		SET i = i + 1;
		
        if prestacoes  > 1 THEN
			IF periodicidade = 'S' THEN
				SET data_transacao = DATE_ADD(data_transacao, INTERVAL 1 WEEK);
			ELSEIF periodicidade = 'M' THEN
				SET data_transacao = DATE_ADD(data_transacao, INTERVAL 1 MONTH);
			ELSEIF periodicidade = 'A' THEN
				SET data_transacao = DATE_ADD(data_transacao, INTERVAL 1 YEAR);
			END IF;
        end if;
    END WHILE;
END;
//

DELIMITER ;
