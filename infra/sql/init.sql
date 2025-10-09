CREATE SEQUENCE seq_ra START 1;

CREATE TABLE Aluno (
    id_aluno INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ra VARCHAR (7) UNIQUE NOT NULL,
    nome VARCHAR (80) NOT NULL,
    sobrenome VARCHAR (80) NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR (200),
    email VARCHAR (80),
    celular VARCHAR (20) NOT NULL
);

CREATE OR REPLACE FUNCTION gerar_ra() RETURNS TRIGGER AS $$
BEGIN
    NEW.ra := 'AAA' || TO_CHAR(nextval('seq_ra'), 'FM0000');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_gerar_ra
BEFORE INSERT ON Aluno
FOR EACH ROW EXECUTE FUNCTION gerar_ra();

CREATE TABLE Livro (
    id_livro INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR (200) NOT NULL,
    autor VARCHAR (150) NOT NULL,
    editora VARCHAR (100) NOT NULL,
    ano_publicacao VARCHAR (5),
    isbn VARCHAR (20),
    quant_total INTEGER NOT NULL,
    quant_disponivel INTEGER NOT NULL,
    valor_aquisicao DECIMAL (10,2),
    status_livro_emprestado VARCHAR (20)
);

CREATE TABLE Emprestimo (
    id_emprestimo INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_aluno INT REFERENCES Aluno(id_aluno),
    id_livro INT REFERENCES Livro(id_livro),
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR (20)
);

INSERT INTO Aluno (nome, sobrenome, data_nascimento, endereco, email, celular) 
VALUES 
('Conor', 'McGregor', '2005-01-15', 'Rua UFC, 123', 'mcgregor@ufc.com', '16998959876'),
('Amanda', 'Nunes', '2004-03-22', 'Rua UFC, 456', 'amanda.nunes@ufc.com', '16995992305'),
('Angelina', 'Jolie', '2003-07-10', 'Rua Hollywood, 789', 'jolie@cinema.com', '16991915502'),
('Natalie', 'Portman', '2002-11-05', 'Rua Hollywood, 101', 'natalie.portman@cinema.com', '16993930703'),
('Shaquille', 'ONeal', '2004-09-18', 'Rua NBA, 202', 'shaquille@gmail.com', '16993937030'),
('Harry', 'Kane', '2000-05-18', 'Rua Futebol, 2024', 'kane@futi.com', '16998951983'),
('Jaqueline', 'Carvalho', '2001-12-10', 'Rua Volei, 456', 'jack@volei.com', '16991993575'),
('Sheilla', 'Castro', '2003-04-25', 'Rua Volei, 2028', 'sheilla.castro@volei.com', '16981974547'),
('Gabriela', 'Guimarães', '2007-08-19', 'Rua Volei, 2028', 'gaby@volei.com', '16983932215'),
('Magic', 'Johnson', '2003-07-08', 'Rua NBA, 1999', 'magic@gmail.com', '16993932020');

INSERT INTO Aluno (nome, sobrenome, data_nascimento, endereco, email, celular) 
VALUES 
('Wilson', 'Jarvis', '2002-01-01', 'Rua Valentina Marginal, 7585', 'wilsonjarvis@hotmail.com', '16991345567'),
('Robert', 'Hill', '1999-06-30', 'Rua Jardim Palmeiras, 199', 'robert.hill334@gmail.com', '22995896670'),
('Lohanne', 'Martins', '2008-10-26', 'Rua João Adami, 861', 'lohanne@fut.com', '16993456688'),
('Iohan', 'Shakira', '1987-03-04', 'Rua Guilherme Paes, 1019', 'iohaann.shaks@hotmail.com', '16992456677'),
('Liam', 'Gallagher', '2001-12-11', 'Rua Frank, 899', 'liam.gall@gmail.com', '24990876654'),
('Fiona', 'Sherek', '2000-11-07', 'Rua Mediterraneo, 643', 'fionaleel@hotmail.com', '1239465579'),
('Janaina', 'Silva', '1989-11-03', 'Rua Joaquim Ferreira, 98', 'jana@site.com', '16991345521'),
('Gabriel', 'Nievas', '2006-02-23', 'Rua Tofani Joel, 2023', 'gabrielnievass@fut.com', '1698176345'),
('Nicolly', 'Guimarães', '2009-08-06', 'Rua Alaor, 1896', 'nick@pess.com', '169976568843'),
('Débora', 'Sorriso', '1987-07-31', 'Rua Magic Garden, 1990', 'debbie@gmail.com', '16993912120');

INSERT INTO Livro (titulo, autor, editora, ano_publicacao, isbn, quant_total, quant_disponivel, valor_aquisicao, status_livro_emprestado) 
VALUES 
('O Senhor dos Anéis', 'J.R.R. Tolkien', 'HarperCollins', '1954', '978-0007525546', 10, 10, 150.00, 'Disponível'),
('1984', 'George Orwell', 'Companhia das Letras', '1949', '978-8535906770', 8, 8, 90.00, 'Disponível'),
('Dom Quixote', 'Miguel de Cervantes', 'Penguin Classics', '1605', '978-0142437230', 6, 6, 120.00, 'Disponível'),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Agir', '1943', '978-8522008731', 12, 12, 50.00, 'Disponível'),
('A Revolução dos Bichos', 'George Orwell', 'Penguin', '1945', '978-0141036137', 7, 7, 80.00, 'Disponível'),
('O Hobbit', 'J.R.R. Tolkien', 'HarperCollins', '1937', '978-0007458424', 9, 9, 140.00, 'Disponível'),
('O Conde de Monte Cristo', 'Alexandre Dumas', 'Penguin Classics', '1844', '978-0140449266', 5, 5, 110.00, 'Disponível'),
('Orgulho e Preconceito', 'Jane Austen', 'Penguin Classics', '1813', '978-0141439518', 7, 7, 90.00, 'Disponível'),
('Moby Dick', 'Herman Melville', 'Penguin Classics', '1851', '978-0142437247', 4, 4, 100.00, 'Disponível'),
('Guerra e Paz', 'Liev Tolstói', 'Companhia das Letras', '1869', '978-8535922343', 3, 3, 130.00, 'Disponível');

INSERT INTO Livro (titulo, autor, editora, ano_publicacao, isbn, quant_total, quant_disponivel, valor_aquisicao, status_livro_emprestado) 
VALUES 
('De caçador a gourmet - Uma história da gastronomia', 'Ariovaldo Franco', 'Senac São Paulo
', '2001', '978-8573599701', 34, 33, 96.00, 'Disponível'),
('Vidas secas', 'Graciliano Ramos', 'Principis', '2024', '978-6550971298',19, 17, 20.99, 'Disponível'),
('A cirurgiã - Um thriller psicológico eletrizante, repleto de reviravoltas.', 'Leslie Wolfe', 'Faro Editorial', '2024', '978-6559574605', 8, 8, 30.99, 'Disponível'),
('As Coisas que Deixamos Para Trás', 'Lucy Score', 'Alta Novel', '2024', '978-8550822730
', 10, 8, 89.90, 'Disponível'),
('Até o verão terminar', 'Colleen Hoover', 'Galera', '2021', '978-6559810376', 23, 20, 130.00, 'Disponível'),
('As mil partes do meu coração', 'Colleen Hoover', 'Galera', '2018', '978-8501115744', 5, 2, 50.00, 'Disponível'),
('A Vila dos Tecidos', 'Anna Jacobs', 'Editora Arqueiro', '2023', '978-6555655049', 5, 5, 20.00, 'Disponível'),
('Tudo que deixamos inacabado', 'Rebecca Yarros', 'Editora Arqueiro
', '2024', '978-6555656206', 7, 7, 45.00, 'Disponível'),
('Sete anos entre nós: Às vezes você encontra o amor no lugar certo, mas na hora errada', 'Ashley Poston', 'Editora Arqueiro', '2025', '978-6555657630', 3, 2, 120.00, 'Disponível'),
('A empregada está de olho', 'Freida McFadden', 'Editora Arqueiro
', '2024', '978-6555656756', 3, 3, 67.00, 'Disponível');

INSERT INTO Emprestimo (id_aluno, id_livro, data_emprestimo, data_devolucao, status_emprestimo) 
VALUES 
(1, 2, '2024-09-01', '2024-09-15', 'Em andamento'),
(2, 1, '2024-09-02', '2024-09-16', 'Em andamento'),
(3, 5, '2024-09-03', '2024-09-17', 'Em andamento'),
(5, 3, '2024-09-04', '2024-09-18', 'Em andamento'),
(4, 6, '2024-09-05', '2024-09-19', 'Em andamento'),
(6, 4, '2024-09-06', '2024-09-20', 'Em andamento'),
(7, 8, '2024-09-07', '2024-09-21', 'Em andamento'),
(8, 7, '2024-09-08', '2024-09-22', 'Em andamento'),
(10, 9, '2024-09-09', '2024-09-23', 'Em andamento'),
(9, 10, '2024-09-10', '2024-09-24', 'Em andamento'),
(1, 10, '2024-09-11', '2024-09-25', 'Em andamento'),
(2, 3, '2024-09-11', '2024-09-25', 'Em andamento'),
(4, 5, '2024-09-11', '2024-09-25', 'Em andamento'),
(6, 2, '2024-09-11', '2024-09-25', 'Em andamento');

INSERT INTO Emprestimo (id_aluno, id_livro, data_emprestimo, data_devolucao, status_emprestimo) 
VALUES 
(7, 20, '2023-10-24', '2023-11-24', 'Em andamento'),
(3, 11, '2024-11-02', '2024-12-02', 'Em andamento'),
(4, 5, '2024-03-03', '2024-04-03', 'Em andamento'),
(9, 4, '2024-11-04', '2024-12-04', 'Em andamento'),
(20, 3, '2023-10-05', '2023-11-05', 'Em andamento'),
(6, 8, '2024-10-06', '2024-11-06', 'Em andamento'),
(10, 19, '2024-12-07', '2025-01-07', 'Em andamento'),
(14, 17, '2024-12-08', '2025-01-08', 'Em andamento'),
(18, 4, '2023-10-09', '2023-11-09', 'Em andamento'),
(4, 14, '2023-09-10', '2023-10-10', 'Em andamento'),
(2, 13, '2023-08-11', '2023-09-11', 'Em andamento'),
(16, 2, '2024-07-11', '2024-08-11', 'Em andamento'),
(11, 9, '2024-06-11', '2024-07-11', 'Em andamento'),
(9, 18, '2023-04-11', '2023-05-11', 'Em andamento');