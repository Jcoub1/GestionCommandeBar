CREATE TABLE Commande(
        id_commande             int (11) Auto_increment  NOT NULL ,
        date_commande           Date ,
        id_Table                Int ,
        id_statut_Cmd     Int ,
        PRIMARY KEY (id_commande )
)ENGINE=InnoDB;



CREATE TABLE Ligne_Commande(
                id_ligne int (11) Auto_increment NOT NULL ,
                quantite                Int ,
                prix_ht                 Float ,
                prix_ttc                Float ,
                id_commande             int,
                id_article              int,
                PRIMARY KEY (id_ligne)
)ENGINE=InnoDB;

CREATE TABLE TableBar(
        id_Table                int (11) Auto_increment  NOT NULL ,
        nb_Personnes            Int ,
        id_statut_Table         Int ,
        PRIMARY KEY (id_Table )
)ENGINE=InnoDB;


CREATE TABLE Statut_Commande(
        id_statut_Cmd   int (11) Auto_increment  NOT NULL ,
        type_statut Varchar (50) ,
        PRIMARY KEY (id_statut_Cmd )
)ENGINE=InnoDB;

CREATE TABLE Statut_Table(
        id_statut_Table   int (11) Auto_increment  NOT NULL ,
        type_statut Varchar (50) ,
        PRIMARY KEY (id_statut_Table )
)ENGINE=InnoDB;

CREATE TABLE Article(
    id_article                  int (11) Auto_increment  NOT NULL ,
    reference                   varchar (50),
    prix_vente_ht               float,
    id_tva                      int,
    PRIMARY KEY (id_article)
)ENGINE=InnoDB;


CREATE TABLE TVA(
    id_tva              int (11) Auto_increment  NOT NULL ,
    taux_tva            float,
    PRIMARY KEY (id_tva)
)ENGINE=InnoDB;



ALTER TABLE Commande ADD CONSTRAINT FK_Commande_id_Table FOREIGN KEY (id_Table) REFERENCES TableBar(id_Table);

ALTER TABLE Commande ADD CONSTRAINT FK_Commande_id_statut_Commande FOREIGN KEY (id_statut_Cmd) REFERENCES Statut_commande(id_statut_Cmd);

ALTER TABLE TableBar ADD CONSTRAINT FK_Etat_Table FOREIGN KEY (id_statut_Table) REFERENCES Statut_Table(id_statut_Table);

ALTER TABLE Ligne_Commande ADD CONSTRAINT FK_Commande_id_commande FOREIGN KEY (id_commande) REFERENCES Commande(id_commande);

ALTER TABLE Ligne_Commande ADD CONSTRAINT FK_Article_id_article FOREIGN KEY (id_article) REFERENCES Article(id_article); 

ALTER TABLE Article ADD CONSTRAINT FK_TVA_id_tva FOREIGN KEY (id_tva) REFERENCES TVA(id_tva);