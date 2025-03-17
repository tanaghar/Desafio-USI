CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    cpf VARCHAR(14) INT NOT NULL,
    estado_civil VARCHAR ('Casado', 'Solteiro', 'Divorciado', 'União Estável',) NOT NULL,
    data_nascimento DATE,
    nome_pai VARCHAR(100),
    nome_mae VARCHAR(100),
    email VARCHAR(100),
    grau_instrucao VARCHAR('Analfabeto', 'Ensino Fundamental Completo', 'Ensino Médio Completo', 'Superior')
);
CREATE TABLE documentos (
    id_documento INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    tipo_documento VARCHAR('RG', 'CNH', 'Passaporte', 'CTPS') NOT NULL,
    numero_documento VARCHAR(30) NOT NULL,
    orgao_emissor VARCHAR(30),
    data_emissao DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
CREATE TABLE telefones (
    id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    tipo_telefone ENUM('Celular', 'Residencial', 'Comercial') NOT NULL,
    numero_telefone VARCHAR(20) NOT NULL,
    is_principal BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


INSERT INTO Cliente (nome, cpf, estado_civil, data_nascimento, nome_pai, nome_mae, grau_instrucao, email)
VALUES ('Carlos Maia', '326.985.147-22', 'Solteiro', '1985-05-12', 'Jose Maia', 'Maria Maia', 'Superior', 'carlosmaia@gmail.com');

INSERT INTO Documento (id_cliente, tipo_documento, numero_documento, orgao_emissor, data_emissao)
VALUES (1, 'RG', '1.336.257', 'SSP-DF', '2000-10-15');

INSERT INTO Telefone (id_cliente, tipo_telefone, numero_telefone, telefone_principal)
VALUES (1, 'Celular', '(61) 99999-9999', TRUE);

INSERT INTO Telefone (id_cliente, tipo_telefone, numero_telefone, telefone_principal)
VALUES (1, 'Residencial', '(61 3333-3333) ', FALSE)


UPDATE Cliente
SET email = 'carlosmaia@gmail.com'
WHERE id_cliente = 1;
UPDATE Telefone
SET numero_telefone = '(61) 88888-8888'
WHERE id_telefone = 1 AND id_cliente = 1;


SELECT 
    Cliente.*, 
    Documento.tipo_documento, Documento.numero_documento, Documento.orgao_emissor, Documento.data_emissao,
    Telefone.tipo_telefone, Telefone.numero_telefone, Telefone.telefone_principal
FROM 
    Cliente
LEFT JOIN 
    Documento ON Cliente.id_cliente = Documento.id_cliente
LEFT JOIN 
    Telefone ON Cliente.id_cliente = Telefone.id_cliente
WHERE 
    Cliente.id_cliente = 1;


DELETE FROM Documento
WHERE id_cliente = 1;

DELETE FROM Telefone
WHERE id_cliente = 1;

DELETE FROM Cliente
WHERE id_cliente = 1;
