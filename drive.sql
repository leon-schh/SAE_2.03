DROP DATABASE IF EXISTS drive;
 
CREATE DATABASE drive;

USE drive;

CREATE TABLE Categorie(
	id_cat INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom_cat VARCHAR(40),
    descpriptif TINYTEXT
);

CREATE TABLE Produits(
	id_produit INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nom_produit VARCHAR(40),
    date_péremption DATE,
    photo BLOB,
    marque VARCHAR(40),
    auteur VARCHAR(40),
    categorie INT UNSIGNED,
    CONSTRAINT fk_cat
		FOREIGN KEY (categorie)
        REFERENCES Categorie(id_cat)
);

CREATE TABLE Clients(
	numero_client INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nom_client VARCHAR(40),
	prenom_client VARCHAR(40),
    date_inscription DATE,
    adresse TINYTEXT
);

CREATE TABLE Commandes(
	numero_commande INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	num_client INT UNSIGNED,
    date_commande DATE,
    CONSTRAINT fk_client
		FOREIGN KEY (num_client)
        REFERENCES Clients(numero_client)
);

CREATE TABLE Liste_De_Produits(
	produits INT UNSIGNED,
    quantite_produits INT UNSIGNED,
    num_commande INT UNSIGNED,
    CONSTRAINT fk_produit
		FOREIGN KEY (produits)
		REFERENCES Produits(id_produit),
	CONSTRAINT fk_num_commande
		FOREIGN KEY (num_commande)
        REFERENCES Commandes(numero_commande)
);


	