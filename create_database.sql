-- Create database
CREATE DATABASE db_source; 
CREATE DATABASE db_dsa;      
CREATE DATABASE db_ods;           
CREATE DATABASE db_dwh;           





--  changer vers db_source
use db_source; 

-- Table Mutation 
CREATE TABLE Mutation (
   id_mutation VARCHAR(20) PRIMARY KEY,
   nature_mutation VARCHAR(50),
   date_mutation DATE,
   valeur_fonciere DOUBLE 
);

-- Table Commune 
CREATE TABLE Commune (
   code_commune VARCHAR(50) PRIMARY KEY,
   nom_commune VARCHAR(50),
   ancien_code_commune VARCHAR(50),
   ancien_nom_commune VARCHAR(50),
   code_departement VARCHAR(10) NOT NULL 
);

-- Table Parcelle 
CREATE TABLE Parcelle (
   id_parcelle VARCHAR(20) PRIMARY KEY,
   ancien_id_parcelle VARCHAR(50),
   numero_disposition VARCHAR(5), 
   longitude DOUBLE, 
   latitude DOUBLE,
   id_mutation VARCHAR(20) NOT NULL,
   CONSTRAINT fk_parcelle_mutation FOREIGN KEY (id_mutation) REFERENCES Mutation(id_mutation) ON DELETE CASCADE
);

-- Table Local 
CREATE TABLE Local (
   code_type_local VARCHAR(5) PRIMARY KEY,
   type_local VARCHAR(50)
);

-- Table Culture
CREATE TABLE Culture (
   code_nature_culture VARCHAR(5) PRIMARY KEY,
   nature_culture VARCHAR(30)
);

-- Table Culture_speciale
CREATE TABLE Culture_speciale (
   code_nature_culture_speciale VARCHAR(5) PRIMARY KEY,
   nature_culture_speciale VARCHAR(255)
);

-- Table Adresse
CREATE TABLE Adresse (
   id_adresse INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   adresse_numero VARCHAR(50),
   adresse_suffixe VARCHAR(50),
   adresse_code_voie VARCHAR(50),
   adresse_nom_voie VARCHAR(50),
   code_postal VARCHAR(10),
   code_commune VARCHAR(50),

   CONSTRAINT fk_addr_commune FOREIGN KEY (code_commune) REFERENCES Commune (code_commune)
);

-- Table Lot
CREATE TABLE Lot (
   id_lot INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   lot1_numero VARCHAR(5),
   lot1_surface_carrez DOUBLE,
   lot2_numero VARCHAR(5),
   lot2_surface_carrez DOUBLE,
   lot3_numero VARCHAR(5),
   lot3_surface_carrez DOUBLE,
   lot4_numero VARCHAR(5),
   lot4_surface_carrez DOUBLE,
   lot5_numero VARCHAR(5),
   lot5_surface_carrez DOUBLE,
   nombre_pieces_principales INT, 
   surface_reelle_bati DOUBLE,
   surface_terrain DOUBLE,
   numero_volume VARCHAR(50),
   nombre_lots INT,
   id_parcelle VARCHAR(20) NOT NULL,
   id_adresse INT,
   code_nature_culture VARCHAR(5),
   code_nature_culture_speciale VARCHAR(5),
   code_type_local VARCHAR(5),

   CONSTRAINT fk_lot_parcelle FOREIGN KEY (id_parcelle) REFERENCES Parcelle (id_parcelle),
   CONSTRAINT fk_lot_adresse FOREIGN KEY (id_adresse) REFERENCES Adresse (id_adresse),
   CONSTRAINT fk_lot_culture FOREIGN KEY (code_nature_culture) REFERENCES Culture (code_nature_culture),
   CONSTRAINT fk_lot_culture_spec FOREIGN KEY (code_nature_culture_speciale) REFERENCES Culture_speciale (code_nature_culture_speciale),
   CONSTRAINT fk_lot_local FOREIGN KEY (code_type_local) REFERENCES Local (code_type_local)
);





--  changer vers db_dsa 
use db_dsa; 

-- Table DSA_Mutation 
CREATE TABLE DSA_Mutation (
   id_mutation VARCHAR(20) PRIMARY KEY,
   nature_mutation VARCHAR(50),
   date_mutation DATE,
   valeur_fonciere DOUBLE 
);

-- Table DSA_Commune 
CREATE TABLE DSA_Commune (
   code_commune VARCHAR(50) PRIMARY KEY,
   nom_commune VARCHAR(50),
   ancien_code_commune VARCHAR(50),
   ancien_nom_commune VARCHAR(50),
   code_departement VARCHAR(10) NOT NULL 
);

-- Table DSA_Parcelle 
CREATE TABLE DSA_Parcelle (
   id_parcelle VARCHAR(20) PRIMARY KEY,
   ancien_id_parcelle VARCHAR(50),
   numero_disposition VARCHAR(5), 
   longitude DOUBLE, 
   latitude DOUBLE,
   id_mutation VARCHAR(20) NOT NULL,
   CONSTRAINT fk_dsa_parcelle_mutation FOREIGN KEY (id_mutation) REFERENCES DSA_Mutation(id_mutation) ON DELETE CASCADE
);

-- Table DSA_Local 
CREATE TABLE DSA_Local (
   code_type_local VARCHAR(5) PRIMARY KEY,
   type_local VARCHAR(50)
);

-- Table DSA_Culture
CREATE TABLE DSA_Culture (
   code_nature_culture VARCHAR(5) PRIMARY KEY,
   nature_culture VARCHAR(30)
);

-- Table DSA_Culture_speciale
CREATE TABLE DSA_Culture_speciale (
   code_nature_culture_speciale VARCHAR(5) PRIMARY KEY,
   nature_culture_speciale VARCHAR(255)
);

-- Table DSA_Adresse
CREATE TABLE DSA_Adresse (
   id_adresse INT PRIMARY KEY,
   adresse_numero VARCHAR(50),
   adresse_suffixe VARCHAR(50),
   adresse_code_voie VARCHAR(50),
   adresse_nom_voie VARCHAR(50),
   code_postal VARCHAR(10),
   code_commune VARCHAR(50) NOT NULL,

   CONSTRAINT fk_dsa_addr_commune FOREIGN KEY (code_commune) REFERENCES DSA_Commune (code_commune)
);

-- Table DSA_Lot
CREATE TABLE DSA_Lot (
   id_lot INT PRIMARY KEY,
   lot1_numero VARCHAR(5),
   lot1_surface_carrez DOUBLE,
   lot2_numero VARCHAR(5),
   lot2_surface_carrez DOUBLE,
   lot3_numero VARCHAR(5),
   lot3_surface_carrez DOUBLE,
   lot4_numero VARCHAR(5),
   lot4_surface_carrez DOUBLE,
   lot5_numero VARCHAR(5),
   lot5_surface_carrez DOUBLE,
   nombre_pieces_principales INT, 
   surface_reelle_bati DOUBLE,
   surface_terrain DOUBLE,
   numero_volume VARCHAR(50),
   nombre_lots INT,
   id_parcelle VARCHAR(20) NOT NULL,
   id_adresse INT,
   code_nature_culture VARCHAR(5),
   code_nature_culture_speciale VARCHAR(5),
   code_type_local VARCHAR(5),

   CONSTRAINT fk_dsa_lot_parcelle FOREIGN KEY (id_parcelle) REFERENCES DSA_Parcelle (id_parcelle),
   CONSTRAINT fk_dsa_lot_adresse FOREIGN KEY (id_adresse) REFERENCES DSA_Adresse (id_adresse),
   CONSTRAINT fk_dsa_lot_culture FOREIGN KEY (code_nature_culture) REFERENCES DSA_Culture (code_nature_culture),
   CONSTRAINT fk_dsa_lot_culture_spec FOREIGN KEY (code_nature_culture_speciale) REFERENCES DSA_Culture_speciale (code_nature_culture_speciale),
   CONSTRAINT fk_dsa_lot_local FOREIGN KEY (code_type_local) REFERENCES DSA_Local (code_type_local)
);





--  changer vers db_ods 
use db_ods; 

-- Table ODS_Mutation 
CREATE TABLE ODS_Mutation (
   id_mutation VARCHAR(20),
   nature_mutation VARCHAR(50),
   date_mutation DATE,
   valeur_fonciere DOUBLE,
   load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table ODS_Commune 
CREATE TABLE ODS_Commune (
   code_commune VARCHAR(50),
   nom_commune VARCHAR(50),
   ancien_code_commune VARCHAR(50),
   ancien_nom_commune VARCHAR(50),
   code_departement VARCHAR(10) NOT NULL,
   load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table ODS_Parcelle 
CREATE TABLE ODS_Parcelle (
   id_parcelle VARCHAR(20),
   ancien_id_parcelle VARCHAR(50),
   numero_disposition VARCHAR(5), 
   longitude DOUBLE, 
   latitude DOUBLE,
   id_mutation VARCHAR(20),
   load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table ODS_Local 
CREATE TABLE ODS_Local (
   code_type_local VARCHAR(5),
   type_local VARCHAR(50),
   load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table ODS_Culture
CREATE TABLE ODS_Culture (
   code_nature_culture VARCHAR(5),
   nature_culture VARCHAR(30),
   load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table ODS_Culture_speciale
CREATE TABLE ODS_Culture_speciale (
   code_nature_culture_speciale VARCHAR(5),
   nature_culture_speciale VARCHAR(255),
   load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table ODS_Adresse
CREATE TABLE ODS_Adresse (
   id_adresse INT,
   adresse_numero VARCHAR(50),
   adresse_suffixe VARCHAR(50),
   adresse_code_voie VARCHAR(50),
   adresse_nom_voie VARCHAR(50),
   code_postal VARCHAR(10),
   code_commune VARCHAR(50),
   load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table ODS_Lot
CREATE TABLE ODS_Lot (
   id_lot INT,
   lot1_numero VARCHAR(5),
   lot1_surface_carrez DOUBLE,
   lot2_numero VARCHAR(5),
   lot2_surface_carrez DOUBLE,
   lot3_numero VARCHAR(5),
   lot3_surface_carrez DOUBLE,
   lot4_numero VARCHAR(5),
   lot4_surface_carrez DOUBLE,
   lot5_numero VARCHAR(5),
   lot5_surface_carrez DOUBLE,
   nombre_pieces_principales INT, 
   surface_reelle_bati DOUBLE,
   surface_terrain DOUBLE,
   numero_volume VARCHAR(50),
   nombre_lots INT,
   id_parcelle VARCHAR(20) NOT NULL,
   id_adresse INT,
   code_nature_culture VARCHAR(5),
   code_nature_culture_speciale VARCHAR(5),
   code_type_local VARCHAR(5),
   load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);





--  changer vers db_dwh 
use db_dwh; 

-- Table Dim_Localisation 
CREATE TABLE Dim_Localisation(
   TK_adresse INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   NPK_adresse INT NOT NULL,
   adresse_numero VARCHAR(50),
   adresse_suffixe VARCHAR(50),
   adresse_code_voie VARCHAR(50),
   adresse_nom_voie VARCHAR(50),
   code_postal VARCHAR(10),
   code_commune VARCHAR(50) NOT NULL,
   nom_commune VARCHAR(50),
   ancien_code_commune VARCHAR(50),
   ancien_nom_commune VARCHAR(50),
   code_departement VARCHAR(10) NOT NULL,
   date_debut DATETIME DEFAULT CURRENT_TIMESTAMP,
   date_fin DATETIME DEFAULT '2099-12-31 00:00:00',
   current_flag INT DEFAULT 1
);

-- Table Dim_Parcelle 
CREATE TABLE Dim_Parcelle(
   TK_parcelle INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   NPK_parcelle VARCHAR(20) NOT NULL,
   ancien_id_parcelle VARCHAR(50),
   numero_diposition VARCHAR(5),
   longitude DOUBLE,
   latitude DOUBLE,
   date_debut DATETIME DEFAULT CURRENT_TIMESTAMP,
   date_fin DATETIME DEFAULT '2099-12-31 00:00:00',
   current_flag INT DEFAULT 1
);

-- Table Dim_Lot 
CREATE TABLE Dim_Lot(
   TK_lot INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   NPK_lot INT NOT NULL,
   lot1_numero VARCHAR(5),
   lot1_surface_carrez DOUBLE,
   lot2_numero VARCHAR(5),
   lot2_surface_carrez DOUBLE,
   lot3_numero VARCHAR(5),
   lot3_surface_carrez DOUBLE,
   lot4_numero VARCHAR(5),
   lot4_surface_carrez DOUBLE,
   lot5_numero VARCHAR(5),
   lot5_surface_carrez DOUBLE,
   nombre_pieces_principales INT,
   surface_reelle_bati DOUBLE,
   surface_terrain DOUBLE,
   numero_volume VARCHAR(50),
   nombre_lots INT,
   code_type_local VARCHAR(5),
   type_local VARCHAR(50),
   code_nature_culture VARCHAR(5),
   nature_culture VARCHAR(30),
   code_nature_culture_speciale VARCHAR(5),
   nature_culture_speciale VARCHAR(255),
   date_debut DATETIME DEFAULT CURRENT_TIMESTAMP,
   date_fin DATETIME DEFAULT '2099-12-31 00:00:00',
   current_flag INT DEFAULT 1
);

-- Table Dim_Date
CREATE TABLE Dim_Date(
   date_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   full_date DATE UNIQUE,
   jour INT GENERATED ALWAYS AS (DAY(full_date)) STORED,
   mois INT GENERATED ALWAYS AS (MONTH(full_date)) STORED,
   trimestre INT GENERATED ALWAYS AS (QUARTER(full_date)) STORED,
   annee INT GENERATED ALWAYS AS (YEAR(full_date)) STORED
);

-- Table Dim_Mutation
CREATE TABLE Dim_Mutation(
   TK_mutation INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   NPK_mutation VARCHAR(20) NOT NULL,
   nature_mutation VARCHAR(50),
   date_debut DATETIME DEFAULT CURRENT_TIMESTAMP,
   date_fin DATETIME DEFAULT '2099-12-31 00:00:00',
   current_flag INT DEFAULT 1
);

-- Table Fait_DVF
CREATE TABLE Fait_DVF(
   TK_lot INT NOT NULL,
   TK_adresse INT NOT NULL,
   TK_parcelle INT NOT NULL,
   TK_mutation INT NOT NULL,
   date_id INT NOT NULL,
   valeur_fonciere DOUBLE,

   FOREIGN KEY(TK_lot) REFERENCES Dim_Lot(TK_lot),
   FOREIGN KEY(TK_adresse) REFERENCES Dim_Localisation(TK_adresse),
   FOREIGN KEY(TK_parcelle) REFERENCES Dim_Parcelle(TK_parcelle),
   FOREIGN KEY(TK_mutation) REFERENCES Dim_Mutation(TK_mutation),
   FOREIGN KEY(date_id) REFERENCES Dim_Date(date_id),
   PRIMARY KEY (TK_lot, TK_adresse, TK_parcelle, TK_mutation, date_id)
);
