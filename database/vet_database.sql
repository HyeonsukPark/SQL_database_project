-- Create and use the Vet_database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Vet_database')
BEGIN
    CREATE DATABASE Vet_database;
END
GO

USE Vet_database;
GO   

-- Owner table 

CREATE TABLE Owners (
  owner_id INT IDENTITY(1,1) PRIMARY KEY,
  first_name varchar(50),
  last_name varchar(50), 
  phone_number varchar(50), 
  email varchar(50), 
  home_address varchar(50) 
);

CREATE TABLE Pets (
  pet_id INT IDENTITY(1,1) PRIMARY KEY,
  owner_id int foreign key references Owners(owner_id),
  pet_name varchar(50),
  species varchar(50), 
  breed varchar(50),
  date_of_birth date,
  gender varchar(50), 
  microchip_number varchar(50) 
); 

CREATE TABLE Vets (
  vet_id INT IDENTITY(1,1) PRIMARY KEY,
  first_name varchar(50), 
  last_name varchar(50),
  speciality varchar(50), 
  phone_number varchar(50),
  hire_date date
);

CREATE TABLE Appointments (
  appointment_id INT IDENTITY(1,1) PRIMARY KEY,
  pet_id int foreign key references Pets(pet_id),
  vet_id int foreign key references Vets(vet_id), 
  date_time datetime, 
  reason varchar(500) 
);

CREATE TABLE Medical_Records (
  record_id INT IDENTITY(1,1) PRIMARY KEY,
  appointment_id int foreign key references Appointments(appointment_id),
  diagnosis varchar(500), 
  treatment varchar(500), 
  notes varchar(500), 
  billing_amount decimal 
);

CREATE TABLE Prescription (
  prescription_id INT IDENTITY(1,1) PRIMARY KEY,
  record_id int foreign key references Medical_Records(record_id),
  item_name varchar(50), 
  quantity int, 
  unit_price decimal, 
  instruction varchar(500) 
); 

-- ChatGPT was used to generate mock data for each column including information of owners, pets, vets, etc. 

-- owner table
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Antonio', 'Rocha', '+351 99 350 328', 'antonio.rocha87@proton.me', 'Avenida do Porto, 23, Lisbon');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Mateo', 'Oliveira', '+351 94 716 127', 'mateooliveira@proton.me', 'Avenida do Porto, 108, Leiria');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Victoria', 'Silva', '+351 93 814 532', 'victoria_silva@hotmail.com', 'Rua da Estrela, 27, Porto');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Samuel', 'Dias', '+351 91 847 570', 'samueldias@yahoo.com', 'Rua do Carmo, 142, Leiria');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Helena', 'Coelho', '+351 92 146 777', 'helena.coelho11@hotmail.com', 'Largo da Igreja, 98, Setubal');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Marco', 'Machado', '+351 99 818 799', 'marcomachado@proton.me', 'Avenida dos Aliados, 137 Apt 6, Viana do Castelo');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Leonardo', 'Correia', '+351 29 324 801', 'leonardo_correia8@hotmail.com', 'Avenida da Liberdade, 207, Faro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Noah', 'Moreira', '+351 26 317 771', 'noah_moreira@proton.me', 'Rua do Monte, 37, Coimbra');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Filipa', 'Santos', '+351 97 697 508', 'filipa_santos@hotmail.com', 'Rua da Marinha, 127, Lisbon');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Camila', 'Ribeiro', '+351 97 710 165', 'camila_ribeiro@yahoo.com', 'Rua da Marinha, 65 Apt 1, Porto');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Luz', 'Varela', '+351 98 214 400', 'luz_varela@gmail.com', 'Rua do Mercado, 249, Braga');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Pedro', 'Martins', '+351 25 961 754', 'pedromartins20@outlook.com', 'Avenida dos Aliados, 139 Apt 17, Lisbon');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Goncalo', 'Monteiro', '+351 92 471 999', 'goncalo_monteiro@hotmail.com', 'Rua da Beleza, 243, Viana do Castelo');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Noah', 'Amaral', '+351 93 231 775', 'noah_amaral22@outlook.com', 'Rua da Marinha, 224, Coimbra');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Nuno', 'Amaral', '+351 96 830 419', 'nuno_amaral84@outlook.com', 'Rua do Monte, 231, Porto');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Ines', 'Pinto', '+351 91 702 667', 'ines.pinto@gmail.com', 'Rua do Carmo, 182, Coimbra');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Noah', 'Ferreira', '+351 22 626 343', 'noah_ferreira28@mail.com', 'Travessa do Sol, 186 Apt 19, Leiria');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Francisco', 'Melo', '+351 97 294 196', 'francisco.melo46@yahoo.com', 'Praça da República, 120 Apt 2, Porto');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Mariana', 'Castro', '+351 92 354 296', 'mariana.castro@hotmail.com', 'Praça da República, 47, Coimbra');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Noah', 'Fonseca', '+351 29 200 151', 'noahfonseca2@gmail.com', 'Rua das Acacias, 43, Viana do Castelo');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Ana', 'Castro', '+351 23 488 102', 'ana_castro@yahoo.com', 'Estrada de Benfica, 109, Viseu');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Joaquim', 'Nogueira', '+351 96 403 322', 'joaquim.nogueira@mail.com', 'Avenida da Liberdade, 192, Lisbon');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Eva', 'Neves', '+351 94 261 158', 'evaneves@hotmail.com', 'Rua do Carmo, 153, Coimbra');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Marta', 'Rocha', '+351 24 692 708', 'marta.rocha54@proton.me', 'Rua da Beleza, 145, Faro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Ana', 'Faria', '+351 96 371 505', 'ana.faria39@yahoo.com', 'Rua da Estrela, 238 Apt 3, Lisbon');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Alice', 'Tavares', '+351 22 175 650', 'alice.tavares@hotmail.com', 'Avenida do Brasil, 226, Coimbra');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Helena', 'Lopes', '+351 94 820 409', 'helenalopes84@mail.com', 'Rua das Flores, 171 Apt 10, Porto');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Hugo', 'Barbosa', '+351 92 860 666', 'hugo.barbosa@mail.com', 'Rua da Alegria, 184, Faro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Pedro', 'Marques', '+351 91 194 749', 'pedro_marques6@gmail.com', 'Rua da Estrela, 198, Faro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Marco', 'Sá', '+351 97 674 109', 'marco.sá@proton.me', 'Travessa do Sol, 140, Setubal');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Eva', 'Santos', '+351 93 142 415', 'eva_santos6@outlook.com', 'Rua da Alegria, 175, Porto');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Samuel', 'Reis', '+351 97 735 867', 'samuel.reis31@hotmail.com', 'Avenida dos Aliados, 226, Braga');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Filipa', 'Cardoso', '+351 97 921 785', 'filipacardoso35@hotmail.com', 'Largo da Igreja, 98 Apt 16, Coimbra');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Tiago', 'Henriques', '+351 96 328 124', 'tiagohenriques@outlook.com', 'Rua do Mercado, 222, Faro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Samuel', 'Cabral', '+351 94 439 128', 'samuel.cabral34@hotmail.com', 'Rua da Beleza, 247 Apt 2, Porto');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Goncalo', 'Matos', '+351 98 546 720', 'goncalomatos@mail.com', 'Rua da Alegria, 66, Aveiro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Lucas', 'Cruz', '+351 29 803 836', 'lucascruz26@outlook.com', 'Praça da República, 18 Apt 11, Leiria');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Daniel', 'Faria', '+351 25 619 416', 'danielfaria@yahoo.com', 'Estrada de Benfica, 142, Aveiro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Joaquim', 'Ramos', '+351 93 730 682', 'joaquim_ramos@gmail.com', 'Estrada de Benfica, 74, Leiria');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Goncalo', 'Cabral', '+351 95 552 791', 'goncalo.cabral@proton.me', 'Avenida dos Aliados, 169, Viseu');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Joaquim', 'Vaz', '+351 92 938 869', 'joaquim.vaz29@hotmail.com', 'Travessa do Sol, 7, Viana do Castelo');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Rita', 'Reis', '+351 97 744 689', 'rita.reis50@yahoo.com', 'Rua do Rosário, 63, Lisbon');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Sebastian', 'Reis', '+351 27 324 280', 'sebastianreis@gmail.com', 'Avenida do Porto, 64 Apt 4, Viana do Castelo');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Hugo', 'Henriques', '+351 94 709 424', 'hugo_henriques93@mail.com', 'Praça da República, 213 Apt 15, Braga');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Filipa', 'Neves', '+351 96 960 752', 'filipa_neves67@yahoo.com', 'Rua das Acacias, 71, Faro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Ines', 'Correia', '+351 94 182 241', 'ines.correia@proton.me', 'Travessa do Sol, 181, Aveiro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'David', 'Cardoso', '+351 97 163 311', 'david_cardoso@mail.com', 'Rua das Flores, 220 Apt 19, Aveiro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Francisco', 'Silva', '+351 25 871 499', 'francisco_silva@proton.me', 'Avenida do Porto, 205, Coimbra');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Carolina', 'Pinto', '+351 95 129 498', 'carolina_pinto52@proton.me', 'Avenida dos Aliados, 216, Braga');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Rita', 'Varela', '+351 97 706 677', 'ritavarela@proton.me', 'Praça da República, 35 Apt 6, Lisbon');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Miguel', 'Ramos', '+351 95 434 445', 'miguel_ramos@yahoo.com', 'Rua do Mercado, 214, Lisbon');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Filipa', 'Varela', '+351 98 329 765', 'filipa.varela84@gmail.com', 'Rua das Flores, 244, Lisbon');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Rita', 'Ribeiro', '+351 95 785 217', 'ritaribeiro60@proton.me', 'Rua do Mercado, 197, Leiria');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Goncalo', 'Sá', '+351 93 418 210', 'goncalosá@outlook.com', 'Rua da Beleza, 174 Apt 13, Aveiro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Margarida', 'Carvalho', '+351 96 204 813', 'margarida_carvalho77@gmail.com', 'Rua da Beleza, 201, Viseu');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Sara', 'Faria', '+351 94 763 449', 'sara.faria63@gmail.com', 'Praça da República, 246, Viana do Castelo');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Margarida', 'Ribeiro', '+351 94 766 376', 'margaridaribeiro69@yahoo.com', 'Rua do Monte, 112 Apt 19, Faro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Daniel', 'Melo', '+351 22 385 561', 'daniel.melo73@mail.com', 'Rua do Rosário, 87, Setubal');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Lara', 'Marques', '+351 99 448 386', 'laramarques36@mail.com', 'Rua das Flores, 133 Apt 3, Coimbra');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Andre', 'Azevedo', '+351 96 807 587', 'andreazevedo58@gmail.com', 'Rua do Carmo, 76, Coimbra');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Clara', 'Faria', '+351 95 666 643', 'clara_faria@proton.me', 'Avenida do Porto, 85, Viana do Castelo');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Victoria', 'Teixeira', '+351 92 838 297', 'victoria_teixeira@mail.com', 'Avenida dos Aliados, 50, Viana do Castelo');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Victoria', 'Macedo', '+351 94 711 389', 'victoria.macedo38@hotmail.com', 'Avenida do Brasil, 46, Viseu');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Hugo', 'Correia', '+351 91 666 399', 'hugocorreia82@yahoo.com', 'Largo da Igreja, 224, Faro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Francisco', 'Neves', '+351 93 152 358', 'francisco_neves@gmail.com', 'Rua do Rosário, 126, Lisbon');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Beatrice', 'Ribeiro', '+351 25 187 354', 'beatrice.ribeiro@yahoo.com', 'Rua do Arco, 153 Apt 8, Viseu');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Leonardo', 'Fonseca', '+351 25 980 702', 'leonardo_fonseca@mail.com', 'Avenida da Liberdade, 157 Apt 4, Coimbra');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Antonio', 'Moreira', '+351 92 260 345', 'antonio.moreira@hotmail.com', 'Rua das Flores, 105, Leiria');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Francisco', 'Lopes', '+351 99 823 389', 'franciscolopes10@proton.me', 'Rua das Acacias, 237, Leiria');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Joaquim', 'Carvalho', '+351 94 330 763', 'joaquim.carvalho19@gmail.com', 'Avenida da Liberdade, 43 Apt 20, Leiria');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Rafael', 'Fonseca', '+351 99 816 512', 'rafael_fonseca@yahoo.com', 'Rua do Monte, 21, Aveiro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Filipa', 'Monteiro', '+351 91 193 334', 'filipamonteiro74@mail.com', 'Rua das Flores, 196, Faro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Bruno', 'Ferreira', '+351 93 581 631', 'brunoferreira@outlook.com', 'Avenida dos Aliados, 150, Viana do Castelo');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Olivia', 'Neves', '+351 98 428 786', 'olivia.neves43@yahoo.com', 'Rua de Santa Catarina, 74, Aveiro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Sebastian', 'Santos', '+351 92 422 358', 'sebastian_santos@yahoo.com', 'Rua da Marinha, 212 Apt 18, Viana do Castelo');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'David', 'Costa', '+351 98 737 874', 'david_costa98@gmail.com', 'Rua da Alegria, 69, Faro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Arthur', 'Figueiredo', '+351 91 745 723', 'arthur.figueiredo40@mail.com', 'Rua das Flores, 142, Coimbra');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Camila', 'Henriques', '+351 23 610 833', 'camila_henriques@outlook.com', 'Praça da República, 214, Viana do Castelo');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Ines', 'Henriques', '+351 97 295 713', 'ineshenriques18@gmail.com', 'Rua do Mercado, 198 Apt 14, Setubal');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Pedro', 'Correia', '+351 25 843 405', 'pedrocorreia@proton.me', 'Rua de Santa Catarina, 222, Viseu');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Francisco', 'Dias', '+351 94 486 566', 'francisco_dias90@hotmail.com', 'Rua da Beleza, 99, Aveiro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Sofia', 'Monteiro', '+351 97 495 779', 'sofiamonteiro64@gmail.com', 'Travessa do Sol, 129 Apt 11, Porto');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Arthur', 'Martins', '+351 95 115 839', 'arthur.martins@proton.me', 'Travessa do Sol, 20, Faro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Isabel', 'Tavares', '+351 92 972 436', 'isabeltavares49@outlook.com', 'Rua de Santa Catarina, 224, Leiria');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Noah', 'Melo', '+351 99 332 864', 'noah.melo@gmail.com', 'Largo da Igreja, 114, Faro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Mateo', 'Ferreira', '+351 91 400 467', 'mateo_ferreira@hotmail.com', 'Rua da Marinha, 106, Braga');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Marco', 'Gomes', '+351 97 734 799', 'marco.gomes@mail.com', 'Travessa do Sol, 60, Faro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Alice', 'Barbosa', '+351 95 394 793', 'alicebarbosa@yahoo.com', 'Avenida do Brasil, 151, Aveiro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Vasco', 'Barbosa', '+351 99 303 493', 'vasco_barbosa@yahoo.com', 'Rua da Beleza, 92, Faro');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Mateo', 'Faria', '+351 91 679 985', 'mateofaria7@mail.com', 'Rua de Santa Catarina, 214 Apt 10, Coimbra');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Goncalo', 'Dias', '+351 96 735 356', 'goncalodias99@proton.me', 'Travessa do Sol, 161, Lisbon');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Clara', 'Fonseca', '+351 98 849 234', 'clara.fonseca42@proton.me', 'Praça da República, 45, Viseu');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Helena', 'Cruz', '+351 99 950 268', 'helena_cruz62@outlook.com', 'Rua da Estrela, 206, Porto');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Beatrice', 'Amaral', '+351 27 966 923', 'beatriceamaral@yahoo.com', 'Rua das Flores, 68, Viana do Castelo');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Helena', 'Esteves', '+351 99 698 490', 'helenaesteves14@proton.me', 'Rua das Acacias, 121, Viseu');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Daniel', 'Tavares', '+351 92 750 943', 'daniel_tavares39@proton.me', 'Praça da República, 30, Lisbon');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Clara', 'Marques', '+351 96 650 238', 'clara_marques@proton.me', 'Avenida do Porto, 108, Braga');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'David', 'Cabral', '+351 95 730 517', 'david_cabral@outlook.com', 'Rua da Alegria, 114, Coimbra');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Helena', 'Martins', '+351 26 657 760', 'helena_martins@outlook.com', 'Rua da Alegria, 248, Viana do Castelo');
INSERT INTO Owners ( first_name, last_name, phone_number, email, home_address) VALUES ( 'Olivia', 'Faria', '+351 91 151 905', 'olivia_faria@hotmail.com', 'Rua da Beleza, 53, Viseu');


-- Pet table 
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 27, 'Iggy', 'Reptile', 'Leopard Gecko', '2015-08-04', 'Male', '904228421020539');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 42, 'Luna', 'Dog', 'German Shepherd', '2010-11-22', 'Male', '681177589178390');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 94, 'Squeak', 'Rodent', 'Jerboa', '2017-10-17', 'Unknown', '007661771159212');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 36, 'Noodle', 'Reptile', 'Water Dragon', '2022-02-12', 'Female', '698478961183673');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 53, 'Bunny', 'Rabbit', 'American Sable', '2017-01-28', 'Unknown', '156545271111615');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 17, 'Sparky', 'Reptile', 'Bearded Dragon', '2019-07-22', 'Unknown', '516560494519832');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 85, 'Sunny', 'Bird', 'African Grey', '2015-12-16', 'Unknown', '514936899809402');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 35, 'Fuzz', 'Rodent', 'Rat', '2015-12-22', 'Male', '229612018366752');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 48, 'Willow', 'Rabbit', 'Mini Lop', '2020-02-22', 'Male', '022901476797643');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 97, 'Sushi', 'Reptile', 'Corn Snake', '2017-04-25', 'Male', '497840369003432');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 98, 'Honey', 'Rabbit', 'Rex', '2012-01-16', 'Male', '762268388516060');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 59, 'Leo', 'Dog', 'Poodle', '2017-04-21', 'Unknown', '664160529751613');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 56, 'Noodle', 'Reptile', 'King Snake', '2011-05-04', 'Female', '453521818835523');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 14, 'Simba', 'Cat', 'Ragdoll', '2012-12-14', 'Unknown', '212779979955271');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 61, 'Rio', 'Bird', 'Canary', '2020-01-23', 'Male', '581477005411998');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 50, 'Sky', 'Bird', 'Cockatoo', '2023-06-22', 'Unknown', '079359782071518');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 83, 'Simba', 'Cat', 'Domestic Shorthair', '2022-01-15', 'Female', '788925546659051');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 43, 'Molly', 'Dog', 'Shih Tzu', '2014-11-01', 'Female', '925192546291486');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 83, 'Daisy', 'Rabbit', 'Flemish Giant', '2011-08-04', 'Unknown', '685054235733221');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 38, 'Duke', 'Dog', 'Shih Tzu', '2022-07-26', 'Unknown', '059296222927065');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 87, 'Button', 'Rodent', 'Chinchilla', '2020-05-22', 'Female', '738347359774688');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 54, 'Whiskers', 'Cat', 'Persian', '2012-05-09', 'Female', '075818141247826');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 12, 'Nala', 'Cat', 'British Shorthair', '2010-06-15', 'Female', '068536153051522');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 5, 'Coco', 'Rabbit', 'American Sable', '2022-11-29', 'Unknown', '779010432898614');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 31, 'Thumper', 'Rabbit', 'Lionhead', '2014-01-21', 'Female', '971179808932460');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 79, 'Willow', 'Rabbit', 'Dutch', '2017-02-01', 'Male', '185188888067065');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 33, 'Fuzz', 'Rodent', 'Guinea Pig', '2023-06-01', 'Male', '531952058527722');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 9, 'Pip', 'Rodent', 'Squirrel', '2014-12-29', 'Male', '030548687403450');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 84, 'Bunbun', 'Rabbit', 'Rex', '2023-08-07', 'Female', '667652775841616');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 78, 'Chloe', 'Cat', 'Abyssinian', '2015-06-19', 'Male', '154479627570596');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 36, 'Gizmo', 'Rodent', 'Guinea Pig', '2021-06-02', 'Unknown', '658202970213556');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 73, 'Max', 'Dog', 'Cocker Spaniel', '2021-07-21', 'Female', '557192856543102');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 64, 'Noodle', 'Reptile', 'King Snake', '2012-01-02', 'Female', '473947312172715');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 86, 'Daisy', 'Rabbit', 'Lionhead', '2019-03-23', 'Female', '422583132370589');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 48, 'Tweety', 'Bird', 'Conure', '2020-05-30', 'Male', '146786691251778');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 45, 'Whiskers', 'Cat', 'Abyssinian', '2013-02-04', 'Male', '680182422535841');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 33, 'Chloe', 'Cat', 'Abyssinian', '2012-02-17', 'Unknown', '498182992299590');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 4, 'Leo', 'Dog', 'Labrador Retriever', '2014-07-03', 'Unknown', '396907844736471');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 89, 'Bailey', 'Dog', 'German Shepherd', '2017-01-26', 'Female', '735925556258815');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 31, 'Rio', 'Bird', 'Cockatiel', '2017-08-25', 'Male', '210469632595327');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 66, 'Rio', 'Bird', 'Macaw', '2018-06-18', 'Male', '168733950047974');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 69, 'Molly', 'Dog', 'Golden Retriever', '2012-04-12', 'Female', '565060983584168');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 58, 'Sparky', 'Reptile', 'Ball Python', '2021-07-29', 'Unknown', '121655852398680');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 6, 'Rocky', 'Dog', 'German Shepherd', '2023-09-05', 'Female', '872982595269495');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 65, 'Zilla', 'Reptile', 'Turtle', '2022-01-21', 'Unknown', '470551694097499');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 30, 'Clover', 'Rodent', 'Guinea Pig', '2018-03-05', 'Male', '896230913075626');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 89, 'Shadow', 'Cat', 'Bengal', '2023-03-09', 'Unknown', '702838578652785');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 70, 'Willow', 'Rabbit', 'Rex', '2018-03-28', 'Male', '348434437575844');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 16, 'Gex', 'Reptile', 'Turtle', '2016-09-17', 'Female', '240415747338484');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 18, 'Leo', 'Dog', 'Cocker Spaniel', '2014-01-26', 'Male', '083301657120826');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 84, 'Coco', 'Bird', 'Macaw', '2022-11-11', 'Female', '540193802620672');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 96, 'Thumper', 'Rabbit', 'Netherland Dwarf', '2015-01-29', 'Unknown', '915478872874315');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 21, 'Squeak', 'Rodent', 'Squirrel', '2022-03-24', 'Male', '054932966851612');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 18, 'Coco', 'Bird', 'Finch', '2010-02-12', 'Female', '637454990453017');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 40, 'Shadow', 'Cat', 'Bengal', '2021-12-20', 'Female', '145933272795687');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 97, 'Iggy', 'Reptile', 'Leopard Gecko', '2021-07-29', 'Unknown', '187851910883982');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 22, 'Pumpkin', 'Rabbit', 'English Lop', '2011-12-24', 'Unknown', '397187072867908');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 60, 'Pip', 'Rodent', 'Rat', '2016-09-26', 'Female', '039106518017046');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 24, 'Nala', 'Cat', 'Bengal', '2016-07-04', 'Female', '661825128682300');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 39, 'Pepper', 'Bird', 'Conure', '2019-01-19', 'Female', '337524310690331');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 13, 'Zilla', 'Reptile', 'Bearded Dragon', '2020-03-03', 'Unknown', '030673830284395');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 74, 'Iggy', 'Reptile', 'Green Iguana', '2015-02-19', 'Male', '836440892687056');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 68, 'Bunny', 'Rabbit', 'Angora', '2012-07-16', 'Female', '628733427086688');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 18, 'Rio', 'Bird', 'African Grey', '2013-06-17', 'Female', '175183046990139');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 93, 'Nibbles', 'Rodent', 'Jerboa', '2018-02-26', 'Male', '540331739363854');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 49, 'Buddy', 'Bird', 'Conure', '2015-04-01', 'Female', '587717535560932');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 3, 'Willow', 'Rabbit', 'English Lop', '2019-11-08', 'Unknown', '642353693785477');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 59, 'Milo', 'Cat', 'Sphynx', '2012-05-19', 'Unknown', '872808010062312');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 2, 'Lily', 'Cat', 'Abyssinian', '2016-05-07', 'Male', '997700886008484');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 3, 'Slither', 'Reptile', 'King Snake', '2011-10-27', 'Male', '823398454615679');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 32, 'Squeak', 'Rodent', 'Chinchilla', '2021-08-21', 'Male', '016668700217659');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 13, 'Iggy', 'Reptile', 'Bearded Dragon', '2013-08-06', 'Unknown', '974014890250392');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 97, 'Gizmo', 'Rodent', 'Degus', '2015-02-03', 'Male', '939685621850163');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 10, 'Willow', 'Rabbit', 'Holland Lop', '2020-02-18', 'Female', '504773586629619');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 38, 'Oliver', 'Cat', 'Siamese', '2014-07-24', 'Male', '626551104754121');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 24, 'Sky', 'Bird', 'Macaw', '2019-06-10', 'Unknown', '610158199560466');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 100, 'Bella', 'Dog', 'Shih Tzu', '2019-09-25', 'Unknown', '262244472126464');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 62, 'Luna', 'Dog', 'Poodle', '2014-03-13', 'Unknown', '799371240659657');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 43, 'Tweety', 'Bird', 'Cockatoo', '2015-02-10', 'Female', '937526547935646');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 47, 'Bella', 'Dog', 'Cocker Spaniel', '2020-01-28', 'Unknown', '280737416724342');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 92, 'Sunny', 'Bird', 'Parakeet', '2017-08-22', 'Unknown', '796886805891135');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 22, 'Pip', 'Rodent', 'Sugar Glider', '2019-08-01', 'Unknown', '656101438889937');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 48, 'Skyla', 'Bird', 'Macaw', '2021-09-30', 'Unknown', '250714611254573');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 67, 'Angel', 'Bird', 'Finch', '2011-08-30', 'Female', '751401051238282');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 43, 'Zilla', 'Reptile', 'King Snake', '2013-12-11', 'Female', '226609379660334');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 97, 'Clover', 'Rodent', 'Hamster', '2011-09-25', 'Unknown', '255371478596969');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 15, 'Pumpkin', 'Rabbit', 'Mini Lop', '2020-07-03', 'Male', '499125134125286');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 54, 'Sparky', 'Reptile', 'Boa Constrictor', '2016-07-12', 'Female', '278282742257905');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 2, 'Coco', 'Bird', 'Lovebird', '2023-11-14', 'Female', '887676772190340');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 36, 'Chloe', 'Cat', 'Abyssinian', '2012-11-11', 'Female', '978819148580783');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 55, 'Luna', 'Dog', 'French Bulldog', '2010-07-20', 'Female', '451713395962923');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 27, 'Rocky', 'Dog', 'Cocker Spaniel', '2019-01-21', 'Female', '982544948126042');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 90, 'Milo', 'Cat', 'Persian', '2022-02-07', 'Female', '367294667116845');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 59, 'Skyla', 'Bird', 'Finch', '2010-01-16', 'Unknown', '175186363745458');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 74, 'Lily', 'Cat', 'Norwegian Forest', '2023-05-31', 'Female', '001701277063242');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 36, 'Luna', 'Dog', 'Poodle', '2011-05-28', 'Female', '206436110371293');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 67, 'Pip', 'Rodent', 'Squirrel', '2010-02-20', 'Unknown', '516271361115542');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 49, 'Oliver', 'Cat', 'Maine Coon', '2019-01-10', 'Unknown', '092753269731121');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 76, 'Fuzz', 'Rodent', 'Degus', '2017-04-22', 'Female', '234138999404389');
INSERT INTO Pets ( owner_id, pet_name, species, breed, date_of_birth, gender, microchip_number) VALUES ( 66, 'Chloe', 'Cat', 'Bengal', '2020-12-29', 'Male', '376137918055269');

-- Vets table 
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'David', 'Machado', 'Internal Medicine', '+351 95 888 174', '2020-02-21');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Eva', 'Pereira', 'Surgery', '+351 91 161 908', '2023-05-21');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Pedro', 'Lopes', 'Internal Medicine', '+351 97 818 511', '2020-09-13');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Antonio', 'Varela', 'Internal Medicine', '+351 99 185 417', '2020-09-02');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Pedro', 'Moreira', 'Cardiology', '+351 97 700 749', '2025-07-11');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Luz', 'Cabral', 'Dermatology', '+351 97 847 966', '2022-01-11');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Mariana', 'Melo', 'Dermatology', '+351 22 564 726', '2025-03-06');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Mariana', 'Teixeira', 'Cardiology', '+351 93 818 111', '2021-05-24');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Carolina', 'Dias', 'Internal Medicine', '+351 99 270 480', '2021-01-29');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Filipa', 'Reis', 'Dentistry', '+351 92 889 130', '2022-11-06');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Sara', 'Correia', 'Internal Medicine', '+351 92 608 566', '2024-05-05');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Helena', 'Costa', 'Emergency Medicine', '+351 23 476 261', '2022-03-03');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Catarina', 'Martins', 'Behavioral Medicine', '+351 92 333 858', '2024-04-29');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Lucas', 'Ferreira', 'Surgery', '+351 95 472 492', '2021-04-11');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Lara', 'Ferreira', 'Internal Medicine', '+351 27 329 429', '2022-02-10');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'David', 'Macedo', 'Ophthalmology', '+351 92 685 481', '2021-01-05');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Pedro', 'Esteves', 'Surgery', '+351 94 147 510', '2020-08-02');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Alice', 'Lopes', 'Dentistry', '+351 94 567 108', '2023-02-20');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Tiago', 'Lopes', 'Behavioral Medicine', '+351 96 575 477', '2025-01-12');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Carolina', 'Reis', 'General Practice', '+351 94 878 915', '2022-01-31');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Beatrice', 'Silva', 'Oncology', '+351 94 454 751', '2025-11-24');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Lucas', 'Cardoso', 'Surgery', '+351 97 969 855', '2022-08-13');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Gabriel', 'Moreira', 'Internal Medicine', '+351 27 603 161', '2021-03-18');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Margarida', 'Correia', 'Dermatology', '+351 96 965 632', '2023-07-07');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Vasco', 'Machado', 'Emergency Medicine', '+351 22 694 197', '2024-04-19');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Hugo', 'Vaz', 'Oncology', '+351 91 545 778', '2021-02-10');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Ines', 'Lopes', 'Dentistry', '+351 27 817 951', '2022-10-10');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Daniel', 'Fonseca', 'Dentistry', '+351 96 239 898', '2024-12-21');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Gabriel', 'Ribeiro', 'Dermatology', '+351 95 421 516', '2021-01-10');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Nuno', 'Dias', 'General Practice', '+351 95 371 972', '2021-01-07');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Olivia', 'Nunes', 'Dentistry', '+351 21 320 955', '2022-10-15');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Beatrice', 'Oliveira', 'General Practice', '+351 27 625 150', '2025-10-04');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Clara', 'Barbosa', 'Cardiology', '+351 97 975 563', '2024-09-23');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Filipa', 'Santos', 'General Practice', '+351 92 923 912', '2021-03-10');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Camila', 'Silva', 'Surgery', '+351 24 233 302', '2023-05-29');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Helena', 'Esteves', 'Dermatology', '+351 99 932 176', '2020-03-08');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Noah', 'Carvalho', 'Emergency Medicine', '+351 22 967 949', '2022-10-27');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Camila', 'Ferreira', 'Emergency Medicine', '+351 97 941 841', '2023-05-12');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Carolina', 'Santos', 'Oncology', '+351 93 462 319', '2021-08-04');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Victoria', 'Correia', 'Emergency Medicine', '+351 21 728 734', '2025-03-31');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Ines', 'Cabral', 'Dentistry', '+351 94 590 162', '2020-09-29');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Victoria', 'Ramos', 'Cardiology', '+351 94 355 745', '2024-08-16');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Mateo', 'Ramos', 'Ophthalmology', '+351 95 452 679', '2024-04-09');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Daniel', 'Ramos', 'Dentistry', '+351 98 711 324', '2020-04-01');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Catarina', 'Correia', 'Surgery', '+351 28 642 466', '2024-12-19');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Joao', 'Nunes', 'Dermatology', '+351 96 372 646', '2020-06-22');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Sebastian', 'Pinto', 'Behavioral Medicine', '+351 27 463 959', '2021-06-23');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Lara', 'Melo', 'Behavioral Medicine', '+351 98 705 128', '2025-12-25');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Vasco', 'Dias', 'Behavioral Medicine', '+351 96 956 929', '2024-03-09');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Nuno', 'Teixeira', 'Cardiology', '+351 92 157 338', '2025-02-12');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Joao', 'Santos', 'Internal Medicine', '+351 98 728 306', '2021-02-09');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Isabel', 'Nogueira', 'Cardiology', '+351 26 160 122', '2021-04-03');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Eva', 'Nogueira', 'Cardiology', '+351 94 981 473', '2020-08-13');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Helena', 'Nogueira', 'Oncology', '+351 98 409 430', '2021-02-27');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Marco', 'Macedo', 'Oncology', '+351 95 764 424', '2021-06-25');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Margarida', 'Santos', 'Behavioral Medicine', '+351 96 781 703', '2021-06-28');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Leonardo', 'Teixeira', 'Dentistry', '+351 91 818 686', '2023-05-01');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Catarina', 'Coelho', 'Surgery', '+351 98 928 726', '2021-11-17');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Antonio', 'Coelho', 'Dermatology', '+351 23 439 863', '2020-08-29');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Ines', 'Dias', 'Ophthalmology', '+351 92 941 825', '2025-09-12');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Antonio', 'Macedo', 'Ophthalmology', '+351 99 314 355', '2025-11-23');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Noah', 'Dias', 'Dentistry', '+351 91 149 495', '2023-09-23');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Andre', 'Azevedo', 'Cardiology', '+351 28 487 459', '2024-08-23');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Leonardo', 'Martins', 'Emergency Medicine', '+351 96 266 562', '2020-08-17');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Sofia', 'Lopes', 'Surgery', '+351 92 175 450', '2021-06-12');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Leonardo', 'Nunes', 'Dermatology', '+351 92 446 708', '2025-03-21');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Francisco', 'Nogueira', 'Surgery', '+351 93 721 544', '2021-05-03');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Mariana', 'Martins', 'Ophthalmology', '+351 96 519 813', '2024-09-17');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Andre', 'Macedo', 'Internal Medicine', '+351 99 404 343', '2020-10-25');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Mariana', 'Castro', 'Behavioral Medicine', '+351 95 257 155', '2023-01-26');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Lucas', 'Matos', 'Dermatology', '+351 95 304 199', '2020-03-20');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Ana', 'Nunes', 'Dentistry', '+351 28 964 218', '2022-08-16');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Marta', 'Neves', 'Emergency Medicine', '+351 25 193 757', '2024-08-17');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Leonardo', 'Gomes', 'Ophthalmology', '+351 26 291 556', '2020-05-18');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Miguel', 'Fonseca', 'Emergency Medicine', '+351 99 677 163', '2021-04-14');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Sebastian', 'Figueiredo', 'Dermatology', '+351 98 927 654', '2023-07-10');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Sebastian', 'Santos', 'General Practice', '+351 97 938 635', '2023-07-24');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Nuno', 'Esteves', 'Emergency Medicine', '+351 96 587 406', '2020-09-02');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Marta', 'Nogueira', 'Surgery', '+351 94 919 685', '2025-10-06');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Rita', 'Ribeiro', 'Dermatology', '+351 28 277 271', '2021-10-20');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Tiago', 'Almeida', 'Surgery', '+351 97 306 942', '2025-05-02');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Beatrice', 'Simoes', 'Dentistry', '+351 92 189 497', '2024-09-24');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Marta', 'Santos', 'Ophthalmology', '+351 29 569 994', '2020-02-08');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Vasco', 'Tavares', 'Behavioral Medicine', '+351 97 215 524', '2021-04-09');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Beatrice', 'Coelho', 'Behavioral Medicine', '+351 92 208 676', '2020-11-09');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Rafael', 'Varela', 'Ophthalmology', '+351 25 492 770', '2024-02-17');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Bruno', 'Simoes', 'Emergency Medicine', '+351 99 512 247', '2025-04-04');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Goncalo', 'Esteves', 'Oncology', '+351 98 807 343', '2020-06-02');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Filipa', 'Neves', 'Dentistry', '+351 21 445 937', '2022-07-30');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Clara', 'Correia', 'Emergency Medicine', '+351 22 989 333', '2021-02-21');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Clara', 'Sá', 'Emergency Medicine', '+351 98 375 846', '2023-07-18');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Goncalo', 'Cabral', 'Dermatology', '+351 96 943 516', '2024-02-14');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Sebastian', 'Cruz', 'Ophthalmology', '+351 29 910 262', '2020-07-22');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Clara', 'Nogueira', 'Internal Medicine', '+351 94 682 129', '2021-06-23');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Tiago', 'Carvalho', 'Surgery', '+351 95 151 469', '2025-12-29');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Tiago', 'Correia', 'Ophthalmology', '+351 29 506 750', '2021-01-19');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Luz', 'Santos', 'General Practice', '+351 95 281 991', '2024-01-14');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Eva', 'Santos', 'Ophthalmology', '+351 99 866 950', '2025-11-10');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Olivia', 'Lopes', 'Surgery', '+351 93 974 685', '2021-10-27');
INSERT INTO Vets ( first_name, last_name, speciality, phone_number, hire_date) VALUES ( 'Joao', 'Cabral', 'General Practice', '+351 99 767 519', '2024-05-13');

-- Appointments table 
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 1, 3, '2025-11-02 21:52:12', 'Vaccination booster');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 2, 61, '2025-12-09 07:52:45', 'Limping / possible fracture');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 3, 83, '2024-05-14 20:41:39', 'Neuter surgery');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 4, 2, '2024-06-23 03:22:32', 'Microchip implantation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 5, 78, '2025-09-17 15:52:57', 'Pre-op assessment');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 6, 92, '2025-07-05 07:34:53', 'Microchip implantation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 7, 55, '2025-11-26 21:00:45', 'Weight loss');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 8, 45, '2024-12-22 20:20:35', 'Microchip implantation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 9, 28, '2024-12-28 19:52:53', 'Pre-op assessment');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 10, 87, '2025-02-08 17:23:37', 'Neuter surgery');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 11, 51, '2025-03-30 07:37:49', 'Ear infection');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 12, 1, '2025-02-01 15:18:24', 'Chronic cough evaluation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 13, 72, '2025-05-18 03:19:54', 'Neuter surgery');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 14, 78, '2024-08-07 21:28:44', 'Pre-op assessment');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 15, 88, '2024-03-25 07:12:52', 'Parasite check');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 16, 9, '2024-09-18 12:46:53', 'Microchip implantation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 17, 82, '2024-09-09 20:59:39', 'Microchip implantation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 18, 34, '2025-05-24 22:57:21', 'Pre-op assessment');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 19, 25, '2024-04-26 18:53:04', 'Vaccination: rabies');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 20, 98, '2024-07-05 23:33:19', 'Annual wellness exam');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 21, 77, '2024-11-10 04:56:26', 'Post-op check');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 22, 88, '2024-04-19 00:28:30', 'Vaccination booster');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 23, 84, '2025-01-21 15:42:05', 'Pre-op assessment');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 24, 34, '2025-12-05 18:03:24', 'Behavior change');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 25, 52, '2024-10-28 21:58:08', 'Annual wellness exam');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 26, 75, '2025-07-04 07:21:43', 'Spay surgery');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 27, 25, '2024-09-23 21:05:50', 'Allergic reaction');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 28, 88, '2025-02-19 14:19:14', 'Parasite check');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 29, 86, '2024-10-05 18:52:15', 'Vaccination: rabies');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 30, 39, '2025-10-18 23:45:25', 'Dental cleaning');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 31, 85, '2025-11-12 03:02:49', 'Vaccination: distemper');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 32, 24, '2024-08-16 12:31:54', 'Ear infection');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 33, 61, '2024-04-09 17:03:05', 'Microchip implantation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 34, 93, '2025-09-20 04:37:18', 'Vaccination: distemper');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 35, 98, '2025-12-10 04:33:31', 'Dental cleaning');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 36, 88, '2025-11-30 01:35:40', 'Post-op check');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 37, 84, '2024-03-10 16:40:09', 'Allergic reaction');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 38, 46, '2024-06-22 19:08:03', 'Pre-op assessment');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 39, 54, '2025-09-04 11:04:13', 'Post-op check');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 40, 48, '2024-07-21 17:10:34', 'Spay surgery');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 41, 38, '2024-12-26 13:07:28', 'Ear infection');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 42, 61, '2024-02-12 00:36:39', 'Spay surgery');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 43, 75, '2025-04-27 09:50:31', 'Skin irritation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 44, 61, '2025-11-22 04:06:12', 'Gastrointestinal upset');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 45, 65, '2024-04-03 09:31:51', 'Weight loss');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 46, 68, '2024-08-20 01:45:15', 'Behavior change');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 47, 7, '2025-11-07 17:48:16', 'Limping / possible fracture');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 48, 18, '2024-06-04 21:47:56', 'Post-op check');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 49, 53, '2025-03-18 14:27:07', 'Routine blood work');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 50, 19, '2024-09-03 01:48:54', 'Dental cleaning');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 51, 100, '2024-03-04 02:26:05', 'Parasite check');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 52, 43, '2025-05-05 11:18:12', 'Dental cleaning');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 53, 41, '2025-05-08 03:55:05', 'Annual wellness exam');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 54, 1, '2024-12-17 10:52:58', 'Microchip implantation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 55, 27, '2025-08-14 13:40:16', 'Dental cleaning');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 56, 74, '2025-08-17 03:00:35', 'Dental cleaning');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 57, 63, '2025-09-02 05:23:31', 'Skin irritation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 58, 17, '2025-04-22 14:43:57', 'Behavior change');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 59, 82, '2024-11-29 20:46:38', 'Weight loss');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 60, 55, '2025-01-06 03:23:10', 'Weight loss');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 61, 1, '2024-01-30 15:15:03', 'Vaccination: distemper');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 62, 26, '2025-07-21 20:28:20', 'Chronic cough evaluation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 63, 2, '2025-11-24 04:12:15', 'Post-op check');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 64, 97, '2025-10-09 12:30:29', 'Vaccination: rabies');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 65, 25, '2024-01-15 05:58:50', 'Vaccination booster');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 66, 81, '2025-07-24 03:21:20', 'Allergic reaction');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 67, 29, '2025-06-23 00:14:17', 'Chronic cough evaluation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 68, 40, '2024-04-10 11:26:39', 'Ear infection');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 69, 50, '2025-01-26 06:52:19', 'Spay surgery');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 70, 40, '2024-05-10 01:28:55', 'Skin irritation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 71, 6, '2024-08-19 22:53:34', 'Pre-op assessment');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 72, 59, '2025-07-19 15:46:12', 'Vaccination: rabies');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 73, 77, '2025-02-11 10:15:39', 'Post-op check');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 74, 56, '2025-11-21 01:02:09', 'Limping / possible fracture');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 75, 44, '2025-12-01 11:00:41', 'Parasite check');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 76, 46, '2025-08-05 23:10:04', 'Gastrointestinal upset');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 77, 22, '2025-12-05 17:44:01', 'Weight loss');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 78, 3, '2024-06-26 18:01:31', 'Allergic reaction');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 79, 94, '2024-04-12 05:51:10', 'Gastrointestinal upset');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 80, 94, '2024-01-18 08:29:34', 'Spay surgery');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 81, 65, '2024-05-11 14:06:14', 'Ear infection');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 82, 47, '2025-07-06 16:03:10', 'Annual wellness exam');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 83, 49, '2025-11-12 03:58:01', 'Microchip implantation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 84, 99, '2025-02-19 16:09:13', 'Neuter surgery');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 85, 7, '2025-04-06 15:32:49', 'Annual wellness exam');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 86, 85, '2024-03-25 07:22:50', 'Vaccination booster');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 87, 7, '2025-06-20 01:52:02', 'Ear infection');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 88, 54, '2024-12-11 10:37:07', 'Weight loss');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 89, 16, '2025-03-01 10:04:59', 'Microchip implantation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 90, 61, '2025-06-29 11:46:18', 'Limping / possible fracture');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 91, 27, '2025-06-24 07:19:07', 'Vaccination booster');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 92, 39, '2024-11-23 05:36:45', 'Ear infection');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 93, 85, '2025-02-08 11:16:01', 'Microchip implantation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 94, 80, '2025-04-15 17:50:32', 'Limping / possible fracture');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 95, 54, '2025-10-07 12:29:20', 'Ear infection');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 96, 66, '2025-07-12 14:46:24', 'Neuter surgery');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 97, 16, '2024-08-07 22:02:10', 'Ear infection');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 98, 14, '2025-01-21 22:31:43', 'Gastrointestinal upset');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 99, 78, '2024-06-04 11:35:54', 'Microchip implantation');
INSERT INTO Appointments ( pet_id, vet_id, date_time, reason) VALUES ( 100, 67, '2024-06-05 23:27:38', 'Chronic cough evaluation');

-- Medical_Records
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 1, 'Dermatophytosis (ringworm)', 'Fluid therapy and antiemetics', 'Schedule recheck radiographs in 4 weeks.', 76.10);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 2, 'Conjunctivitis', 'Dental scaling and polishing', 'Client declined additional diagnostics; palliative care advised.', 416.81);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 3, 'Otitis externa', 'Antibiotic course (oral, 10 days)', 'Patient tolerating medication well; monitor for side effects.', 1091.05);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 4, 'Allergic dermatitis', 'Insulin therapy initiation', 'Schedule recheck radiographs in 4 weeks.', 1140.85);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 5, 'Fracture - tibia', 'Topical ear drops, twice daily', 'Patient tolerating medication well; monitor for side effects.', 1088.59);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 6, 'Intervertebral disc disease', 'Insulin therapy initiation', 'Referral to cardiology recommended for advanced imaging.', 339.03);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 7, 'Dermatitis (allergic)', 'Topical ear drops, twice daily', 'Schedule recheck radiographs in 4 weeks.', 1052.74);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 8, 'Hypothyroidism', 'Surgical repair (orthopedic)', 'Microchip confirmed and registered with national database.', 528.41);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 9, 'Periodontal disease', 'Topical ear drops, twice daily', 'Owner advised on at-home care and follow-up in 10 days.', 41.32);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 10, 'Gastroenteritis', 'Anti-inflammatory injection and rest', 'Microchip confirmed and registered with national database.', 448.31);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 11, 'Diabetes mellitus', 'Behavioral modification plan', 'Referral to cardiology recommended for advanced imaging.', 1057.82);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 12, 'Luxating patella', 'Surgical repair (orthopedic)', 'Microchip confirmed and registered with national database.', 243.96);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 13, 'Pancreatitis', 'Wound debridement and suture', 'Client declined additional diagnostics; palliative care advised.', 348.04);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 14, 'Pancreatitis', 'Insulin therapy initiation', 'Advised strict rest and no leash walks for 2 weeks.', 789.15);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 15, 'Upper respiratory infection', 'Topical ear drops, twice daily', 'Schedule recheck radiographs in 4 weeks.', 844.52);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 16, 'Dermatitis (allergic)', 'Anti-inflammatory injection and rest', 'Patient tolerating medication well; monitor for side effects.', 516.75);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 17, 'Allergic dermatitis', 'Insulin therapy initiation', 'Dental extractions performed under anesthesia without complications.', 823.72);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 18, 'Upper respiratory infection', 'Behavioral modification plan', 'Advised strict rest and no leash walks for 2 weeks.', 941.62);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 19, 'Heart murmur', 'Antibiotic course (oral, 10 days)', 'Schedule recheck radiographs in 4 weeks.', 595.20);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 20, 'Conjunctivitis', 'Topical ear drops, twice daily', 'Advised strict rest and no leash walks for 2 weeks.', 545.60);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 21, 'Luxating patella', 'Fluid therapy and antiemetics', 'Microchip confirmed and registered with national database.', 44.46);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 22, 'Fracture - tibia', 'Behavioral modification plan', 'Dental extractions performed under anesthesia without complications.', 292.06);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 23, 'Flea allergy dermatitis', 'Chemotherapy protocol started', 'Vaccinations updated; provided vaccination certificate.', 835.24);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 24, 'Heart murmur', 'Topical ear drops, twice daily', 'Advised strict rest and no leash walks for 2 weeks.', 804.20);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 25, 'Intervertebral disc disease', 'Insulin therapy initiation', 'Microchip confirmed and registered with national database.', 806.54);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 26, 'Pancreatitis', 'Anti-inflammatory injection and rest', 'Vaccinations updated; provided vaccination certificate.', 1073.71);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 27, 'Heart murmur', 'Antibiotic course (oral, 10 days)', 'Owner advised on at-home care and follow-up in 10 days.', 782.78);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 28, 'Upper respiratory infection', 'Chemotherapy protocol started', 'Client declined additional diagnostics; palliative care advised.', 1026.69);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 29, 'Upper respiratory infection', 'Topical ear drops, twice daily', 'Client declined additional diagnostics; palliative care advised.', 405.14);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 30, 'Flea allergy dermatitis', 'Fluid therapy and antiemetics', 'Owner advised on at-home care and follow-up in 10 days.', 623.11);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 31, 'Abscess', 'Wound debridement and suture', 'Advised strict rest and no leash walks for 2 weeks.', 986.01);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 32, 'Luxating patella', 'Insulin therapy initiation', 'Client declined additional diagnostics; palliative care advised.', 967.48);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 33, 'Diabetes mellitus', 'Topical ear drops, twice daily', 'Client declined additional diagnostics; palliative care advised.', 553.07);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 34, 'Periodontal disease', 'Insulin therapy initiation', 'Owner advised on at-home care and follow-up in 10 days.', 150.09);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 35, 'Dermatophytosis (ringworm)', 'Antibiotic course (oral, 10 days)', 'Vaccinations updated; provided vaccination certificate.', 672.45);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 36, 'Luxating patella', 'Behavioral modification plan', 'Dental extractions performed under anesthesia without complications.', 775.92);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 37, 'Fracture - tibia', 'Chemotherapy protocol started', 'Discussed diet change and weight management plan.', 795.88);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 38, 'Diabetes mellitus', 'Surgical repair (orthopedic)', 'Microchip confirmed and registered with national database.', 995.61);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 39, 'Intervertebral disc disease', 'Insulin therapy initiation', 'Microchip confirmed and registered with national database.', 685.38);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 40, 'Heart murmur', 'Behavioral modification plan', 'Client declined additional diagnostics; palliative care advised.', 868.49);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 41, 'Foreign body ingestion', 'Insulin therapy initiation', 'Patient tolerating medication well; monitor for side effects.', 144.00);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 42, 'Intervertebral disc disease', 'Antibiotic course (oral, 10 days)', 'Microchip confirmed and registered with national database.', 445.51);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 43, 'Hypothyroidism', 'Chemotherapy protocol started', 'Vaccinations updated; provided vaccination certificate.', 467.45);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 44, 'Periodontal disease', 'Antibiotic course (oral, 10 days)', 'Schedule recheck radiographs in 4 weeks.', 606.13);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 45, 'Dermatophytosis (ringworm)', 'Topical ear drops, twice daily', 'Referral to cardiology recommended for advanced imaging.', 744.70);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 46, 'Hip dysplasia', 'Topical ear drops, twice daily', 'Advised strict rest and no leash walks for 2 weeks.', 282.24);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 47, 'Hip dysplasia', 'Surgical repair (orthopedic)', 'Patient tolerating medication well; monitor for side effects.', 915.86);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 48, 'Dermatitis (allergic)', 'Behavioral modification plan', 'Patient tolerating medication well; monitor for side effects.', 933.41);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 49, 'Diabetes mellitus', 'Insulin therapy initiation', 'Dental extractions performed under anesthesia without complications.', 1148.74);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 50, 'Gastroenteritis', 'Insulin therapy initiation', 'Owner advised on at-home care and follow-up in 10 days.', 650.53);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 51, 'Dermatitis (allergic)', 'Chemotherapy protocol started', 'Advised strict rest and no leash walks for 2 weeks.', 1011.41);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 52, 'Conjunctivitis', 'Chemotherapy protocol started', 'Schedule recheck radiographs in 4 weeks.', 839.43);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 53, 'Upper respiratory infection', 'Anti-inflammatory injection and rest', 'Patient tolerating medication well; monitor for side effects.', 483.26);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 54, 'Heart murmur', 'Behavioral modification plan', 'Microchip confirmed and registered with national database.', 619.81);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 55, 'Pancreatitis', 'Wound debridement and suture', 'Dental extractions performed under anesthesia without complications.', 1101.61);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 56, 'Intervertebral disc disease', 'Fluid therapy and antiemetics', 'Advised strict rest and no leash walks for 2 weeks.', 1157.40);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 57, 'Hypothyroidism', 'Insulin therapy initiation', 'Schedule recheck radiographs in 4 weeks.', 191.67);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 58, 'Heart murmur', 'Chemotherapy protocol started', 'Referral to cardiology recommended for advanced imaging.', 1016.40);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 59, 'Abscess', 'Surgical repair (orthopedic)', 'Vaccinations updated; provided vaccination certificate.', 770.12);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 60, 'Hip dysplasia', 'Dental scaling and polishing', 'Dental extractions performed under anesthesia without complications.', 865.83);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 61, 'Foreign body ingestion', 'Anti-inflammatory injection and rest', 'Schedule recheck radiographs in 4 weeks.', 619.56);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 62, 'Flea allergy dermatitis', 'Topical ear drops, twice daily', 'Microchip confirmed and registered with national database.', 687.87);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 63, 'Allergic dermatitis', 'Behavioral modification plan', 'Advised strict rest and no leash walks for 2 weeks.', 818.86);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 64, 'Abscess', 'Fluid therapy and antiemetics', 'Advised strict rest and no leash walks for 2 weeks.', 975.72);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 65, 'Fracture - tibia', 'Topical ear drops, twice daily', 'Owner advised on at-home care and follow-up in 10 days.', 475.62);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 66, 'Dermatitis (allergic)', 'Antibiotic course (oral, 10 days)', 'Discussed diet change and weight management plan.', 342.36);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 67, 'Upper respiratory infection', 'Fluid therapy and antiemetics', 'Referral to cardiology recommended for advanced imaging.', 201.32);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 68, 'Dermatitis (allergic)', 'Fluid therapy and antiemetics', 'Discussed diet change and weight management plan.', 911.70);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 69, 'Dermatitis (allergic)', 'Surgical repair (orthopedic)', 'Client declined additional diagnostics; palliative care advised.', 149.90);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 70, 'Abscess', 'Dental scaling and polishing', 'Vaccinations updated; provided vaccination certificate.', 485.00);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 71, 'Fracture - tibia', 'Fluid therapy and antiemetics', 'Owner advised on at-home care and follow-up in 10 days.', 1113.99);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 72, 'Pancreatitis', 'Wound debridement and suture', 'Microchip confirmed and registered with national database.', 1160.02);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 73, 'Dermatitis (allergic)', 'Antibiotic course (oral, 10 days)', 'Referral to cardiology recommended for advanced imaging.', 267.61);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 74, 'Diabetes mellitus', 'Dental scaling and polishing', 'Microchip confirmed and registered with national database.', 913.48);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 75, 'Abscess', 'Behavioral modification plan', 'Discussed diet change and weight management plan.', 938.09);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 76, 'Hip dysplasia', 'Fluid therapy and antiemetics', 'Client declined additional diagnostics; palliative care advised.', 237.59);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 77, 'Luxating patella', 'Anti-inflammatory injection and rest', 'Schedule recheck radiographs in 4 weeks.', 890.04);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 78, 'Periodontal disease', 'Wound debridement and suture', 'Owner advised on at-home care and follow-up in 10 days.', 531.35);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 79, 'Abscess', 'Fluid therapy and antiemetics', 'Schedule recheck radiographs in 4 weeks.', 218.29);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 80, 'Urinary tract infection', 'Antibiotic course (oral, 10 days)', 'Microchip confirmed and registered with national database.', 575.61);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 81, 'Gastroenteritis', 'Antibiotic course (oral, 10 days)', 'Schedule recheck radiographs in 4 weeks.', 1116.50);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 82, 'Heart murmur', 'Antibiotic course (oral, 10 days)', 'Dental extractions performed under anesthesia without complications.', 1016.47);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 83, 'Hypothyroidism', 'Insulin therapy initiation', 'Dental extractions performed under anesthesia without complications.', 673.69);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 84, 'Luxating patella', 'Surgical repair (orthopedic)', 'Vaccinations updated; provided vaccination certificate.', 287.36);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 85, 'Upper respiratory infection', 'Chemotherapy protocol started', 'Patient tolerating medication well; monitor for side effects.', 949.92);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 86, 'Upper respiratory infection', 'Wound debridement and suture', 'Vaccinations updated; provided vaccination certificate.', 658.33);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 87, 'Luxating patella', 'Surgical repair (orthopedic)', 'Discussed diet change and weight management plan.', 1063.57);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 88, 'Flea allergy dermatitis', 'Surgical repair (orthopedic)', 'Microchip confirmed and registered with national database.', 373.48);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 89, 'Heart murmur', 'Chemotherapy protocol started', 'Client declined additional diagnostics; palliative care advised.', 1196.06);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 90, 'Otitis externa', 'Topical ear drops, twice daily', 'Microchip confirmed and registered with national database.', 551.43);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 91, 'Heart murmur', 'Behavioral modification plan', 'Discussed diet change and weight management plan.', 1151.91);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 92, 'Flea allergy dermatitis', 'Wound debridement and suture', 'Patient tolerating medication well; monitor for side effects.', 481.47);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 93, 'Abscess', 'Fluid therapy and antiemetics', 'Owner advised on at-home care and follow-up in 10 days.', 1096.26);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 94, 'Foreign body ingestion', 'Chemotherapy protocol started', 'Vaccinations updated; provided vaccination certificate.', 551.30);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 95, 'Dermatitis (allergic)', 'Fluid therapy and antiemetics', 'Discussed diet change and weight management plan.', 404.77);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 96, 'Luxating patella', 'Topical ear drops, twice daily', 'Schedule recheck radiographs in 4 weeks.', 1166.81);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 97, 'Abscess', 'Chemotherapy protocol started', 'Owner advised on at-home care and follow-up in 10 days.', 763.51);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 98, 'Hip dysplasia', 'Dental scaling and polishing', 'Advised strict rest and no leash walks for 2 weeks.', 1007.73);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 99, 'Hip dysplasia', 'Chemotherapy protocol started', 'Advised strict rest and no leash walks for 2 weeks.', 786.48);
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment, notes, billing_amount) VALUES ( 100, 'Luxating patella', 'Anti-inflammatory injection and rest', 'Owner advised on at-home care and follow-up in 10 days.', 567.29);

-- Prescription table 
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 1, 'Prednisolone 5mg', 3, 12.78, 'Give with food, twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 2, 'Furosemide 20mg', 51, 32.10, 'Apply topically twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 3, 'Doxycycline 100mg', 53, 29.25, 'Use as needed for pain');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 4, 'Insulin (Vetsulin)', 25, 55.51, 'Administer for 14 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 5, 'Insulin (Vetsulin)', 21, 4.48, 'Apply topically twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 6, 'Ivermectin', 1, 77.87, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 7, 'Carprofen 50mg', 49, 90.15, 'Give with food, twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 8, 'Carprofen 50mg', 23, 111.55, 'Apply topically twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 9, 'Metronidazole 250mg', 51, 83.09, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 10, 'Carprofen 50mg', 19, 92.42, 'One dose now and repeat in 24h');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 11, 'Insulin (Vetsulin)', 26, 99.10, 'Give with food, twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 12, 'Vaccination - Rabies', 11, 65.18, 'One tablet every 12 hours');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 13, 'Insulin (Vetsulin)', 51, 96.20, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 14, 'Metronidazole 250mg', 41, 19.43, 'Administer for 7 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 15, 'Amoxicillin 250mg', 36, 105.29, 'One tablet every 12 hours');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 16, 'Carprofen 50mg', 3, 3.09, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 17, 'Insulin (Vetsulin)', 35, 66.83, 'Apply topically twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 18, 'Metronidazole 250mg', 14, 90.42, 'Administer for 7 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 19, 'Enrofloxacin 100mg', 27, 108.91, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 20, 'Furosemide 20mg', 11, 24.12, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 21, 'Metronidazole 250mg', 13, 15.97, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 22, 'Amoxicillin 250mg', 55, 90.75, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 23, 'Vaccination - Rabies', 42, 67.09, 'Use as needed for pain');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 24, 'Carprofen 50mg', 17, 14.04, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 25, 'Vaccination - Rabies', 22, 44.46, 'Inject as directed');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 26, 'Carprofen 50mg', 19, 75.29, 'Inject as directed');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 27, 'Prednisolone 5mg', 32, 55.45, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 28, 'Metronidazole 250mg', 45, 71.14, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 29, 'Doxycycline 100mg', 24, 97.40, 'Administer for 14 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 30, 'Furosemide 20mg', 1, 39.30, 'Inject as directed');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 31, 'Insulin (Vetsulin)', 18, 101.21, 'One tablet every 12 hours');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 32, 'Prednisolone 5mg', 57, 58.89, 'One dose now and repeat in 24h');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 33, 'Prednisolone 5mg', 50, 38.39, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 34, 'Carprofen 50mg', 12, 78.35, 'Apply topically twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 35, 'Metronidazole 250mg', 55, 99.61, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 36, 'Enrofloxacin 100mg', 17, 88.69, 'Apply topically twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 37, 'Carprofen 50mg', 58, 4.69, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 38, 'Amoxicillin 250mg', 53, 70.87, 'Administer for 14 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 39, 'Doxycycline 100mg', 14, 108.99, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 40, 'Metronidazole 250mg', 35, 107.54, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 41, 'Vaccination - Rabies', 42, 93.59, 'Administer for 7 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 42, 'Insulin (Vetsulin)', 15, 107.24, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 43, 'Metronidazole 250mg', 9, 57.10, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 44, 'Carprofen 50mg', 26, 45.25, 'Give with food, twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 45, 'Enrofloxacin 100mg', 55, 115.77, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 46, 'Furosemide 20mg', 49, 62.91, 'One dose now and repeat in 24h');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 47, 'Furosemide 20mg', 12, 69.05, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 48, 'Furosemide 20mg', 48, 88.51, 'Administer for 7 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 49, 'Amoxicillin 250mg', 15, 91.97, 'Inject as directed');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 50, 'Carprofen 50mg', 17, 45.91, 'Give with food, twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 51, 'Enrofloxacin 100mg', 34, 109.16, 'Administer for 7 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 52, 'Insulin (Vetsulin)', 31, 110.35, 'Give with food, twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 53, 'Amoxicillin 250mg', 42, 40.58, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 54, 'Metronidazole 250mg', 54, 89.67, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 55, 'Ivermectin', 37, 22.93, 'Administer for 14 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 56, 'Prednisolone 5mg', 38, 79.27, 'Apply topically twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 57, 'Ivermectin', 17, 46.72, 'Inject as directed');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 58, 'Ivermectin', 26, 43.97, 'Administer for 7 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 59, 'Vaccination - Rabies', 51, 59.15, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 60, 'Amoxicillin 250mg', 33, 106.14, 'One dose now and repeat in 24h');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 61, 'Furosemide 20mg', 15, 11.56, 'Use as needed for pain');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 62, 'Enrofloxacin 100mg', 10, 24.46, 'Administer for 7 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 63, 'Doxycycline 100mg', 46, 98.49, 'Inject as directed');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 64, 'Insulin (Vetsulin)', 52, 41.30, 'Apply topically twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 65, 'Vaccination - Rabies', 44, 58.76, 'Inject as directed');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 66, 'Doxycycline 100mg', 11, 78.55, 'Administer for 14 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 67, 'Amoxicillin 250mg', 16, 7.57, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 68, 'Doxycycline 100mg', 11, 18.33, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 69, 'Amoxicillin 250mg', 58, 69.74, 'Give with food, twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 70, 'Furosemide 20mg', 17, 110.89, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 71, 'Insulin (Vetsulin)', 39, 116.39, 'Give with food, twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 72, 'Metronidazole 250mg', 6, 27.95, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 73, 'Vaccination - Rabies', 56, 59.10, 'Inject as directed');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 74, 'Insulin (Vetsulin)', 39, 19.27, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 75, 'Furosemide 20mg', 40, 80.01, 'Use as needed for pain');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 76, 'Furosemide 20mg', 47, 83.06, 'One dose now and repeat in 24h');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 77, 'Doxycycline 100mg', 38, 10.59, 'Administer for 14 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 78, 'Insulin (Vetsulin)', 9, 15.26, 'Inject as directed');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 79, 'Ivermectin', 56, 109.35, 'Administer for 14 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 80, 'Furosemide 20mg', 39, 13.82, 'One dose now and repeat in 24h');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 81, 'Doxycycline 100mg', 39, 7.09, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 82, 'Ivermectin', 49, 16.31, 'One dose now and repeat in 24h');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 83, 'Furosemide 20mg', 58, 73.41, 'Give with food, twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 84, 'Insulin (Vetsulin)', 34, 51.93, 'Give with food, twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 85, 'Ivermectin', 28, 29.46, 'One dose now and repeat in 24h');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 86, 'Insulin (Vetsulin)', 23, 71.71, 'Give 1-2 times daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 87, 'Carprofen 50mg', 28, 18.23, 'One dose now and repeat in 24h');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 88, 'Enrofloxacin 100mg', 59, 103.44, 'Use as needed for pain');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 89, 'Doxycycline 100mg', 57, 66.39, 'Use as needed for pain');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 90, 'Enrofloxacin 100mg', 1, 85.82, 'Give with food, twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 91, 'Doxycycline 100mg', 34, 16.34, 'Give with food, twice daily');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 92, 'Insulin (Vetsulin)', 42, 26.64, 'Administer for 7 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 93, 'Insulin (Vetsulin)', 24, 15.02, 'Administer for 14 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 94, 'Doxycycline 100mg', 17, 33.20, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 95, 'Insulin (Vetsulin)', 37, 45.46, 'Use as needed for pain');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 96, 'Insulin (Vetsulin)', 49, 26.43, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 97, 'Ivermectin', 31, 23.50, 'Use until finished');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 98, 'Ivermectin', 31, 32.32, 'Use as needed for pain');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 99, 'Doxycycline 100mg', 23, 93.47, 'Administer for 14 days');
INSERT INTO Prescription ( record_id, item_name, quantity, unit_price, instruction) VALUES ( 100, 'Furosemide 20mg', 55, 104.00, 'Apply topically twice daily');



