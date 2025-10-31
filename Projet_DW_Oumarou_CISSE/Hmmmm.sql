CREATE TABLE segment (
  id_segment INTEGER  NOT NULL  ,
  libelle VARCHAR(45)      ,
PRIMARY KEY(id_segment));
GO




CREATE TABLE canal (
  id_canal INTEGER  NOT NULL  ,
  libelle VARCHAR(45)      ,
PRIMARY KEY(id_canal));
GO




CREATE TABLE branche (
  id_branche INTEGER  NOT NULL  ,
  LIBELLE VARCHAR(45)      ,
PRIMARY KEY(id_branche));
GO




CREATE TABLE produit (
  id_produit INTEGER  NOT NULL  ,
  branche_id_branche INTEGER  NOT NULL  ,
  libelle VARCHAR(45)      ,
PRIMARY KEY(id_produit, branche_id_branche)  ,
  FOREIGN KEY(branche_id_branche)
    REFERENCES branche(id_branche));
GO


CREATE INDEX produit_FKIndex1 ON produit (branche_id_branche);
GO


CREATE INDEX IFK_Rel_03 ON produit (branche_id_branche);
GO


CREATE TABLE intermediaire (
  id_intermediaire INTEGER  NOT NULL  ,
  canal_id_canal INTEGER  NOT NULL  ,
  libelle VARCHAR(45)      ,
PRIMARY KEY(id_intermediaire, canal_id_canal)  ,
  FOREIGN KEY(canal_id_canal)
    REFERENCES canal(id_canal));
GO


CREATE INDEX intermediaire_FKIndex1 ON intermediaire (canal_id_canal);
GO


CREATE INDEX IFK_Rel_02 ON intermediaire (canal_id_canal);
GO


CREATE TABLE client (
  id_client INTEGER  NOT NULL  ,
  segment_id_segment INTEGER  NOT NULL  ,
  nom VARCHAR(45)    ,
  adresse VARCHAR(45)      ,
PRIMARY KEY(id_client, segment_id_segment)  ,
  FOREIGN KEY(segment_id_segment)
    REFERENCES segment(id_segment));
GO


CREATE INDEX client_FKIndex1 ON client (segment_id_segment);
GO


CREATE INDEX IFK_Rel_04 ON client (segment_id_segment);
GO


CREATE TABLE production (
  id_production VARCHAR(45)  NOT NULL  ,
  produit_branche_id_branche INTEGER  NOT NULL  ,
  produit_id_produit INTEGER  NOT NULL  ,
  intermediaire_canal_id_canal INTEGER  NOT NULL  ,
  intermediaire_id_intermediaire INTEGER  NOT NULL  ,
  client_segment_id_segment INTEGER  NOT NULL  ,
  client_id_client INTEGER  NOT NULL  ,
  exercice DATE    ,
  date_effet DATE    ,
  date_fin DATE    ,
  prime_nette FLOAT    ,
  cout_police FLOAT    ,
  taxe FLOAT    ,
  prime_totale FLOAT      ,
PRIMARY KEY(id_production, produit_branche_id_branche, produit_id_produit, intermediaire_canal_id_canal, intermediaire_id_intermediaire, client_segment_id_segment, client_id_client)      ,
  FOREIGN KEY(produit_id_produit, produit_branche_id_branche)
    REFERENCES produit(id_produit, branche_id_branche),
  FOREIGN KEY(intermediaire_id_intermediaire, intermediaire_canal_id_canal)
    REFERENCES intermediaire(id_intermediaire, canal_id_canal),
  FOREIGN KEY(client_id_client, client_segment_id_segment)
    REFERENCES client(id_client, segment_id_segment));
GO


CREATE INDEX production_FKIndex1 ON production (produit_id_produit, produit_branche_id_branche);
GO
CREATE INDEX production_FKIndex2 ON production (intermediaire_id_intermediaire, intermediaire_canal_id_canal);
GO
CREATE INDEX production_FKIndex3 ON production (client_id_client, client_segment_id_segment);
GO


CREATE INDEX IFK_Rel_05 ON production (produit_id_produit, produit_branche_id_branche);
GO
CREATE INDEX IFK_Rel_06 ON production (intermediaire_id_intermediaire, intermediaire_canal_id_canal);
GO
CREATE INDEX IFK_Rel_07 ON production (client_id_client, client_segment_id_segment);
GO


CREATE TABLE Objectif (
  idObjectif INTEGER  NOT NULL   IDENTITY ,
  segment_id_segment INTEGER  NOT NULL  ,
  produit_branche_id_branche INTEGER  NOT NULL  ,
  produit_id_produit INTEGER  NOT NULL  ,
  branche_id_branche INTEGER  NOT NULL  ,
  intermediaire_canal_id_canal INTEGER  NOT NULL  ,
  intermediaire_id_intermediaire INTEGER  NOT NULL  ,
  canal_id_canal INTEGER  NOT NULL  ,
  Année YEAR    ,
  Exercice DATE    ,
  objectif_ca INTEGER      ,
PRIMARY KEY(idObjectif)          ,
  FOREIGN KEY(canal_id_canal)
    REFERENCES canal(id_canal),
  FOREIGN KEY(intermediaire_id_intermediaire, intermediaire_canal_id_canal)
    REFERENCES intermediaire(id_intermediaire, canal_id_canal),
  FOREIGN KEY(branche_id_branche)
    REFERENCES branche(id_branche),
  FOREIGN KEY(produit_id_produit, produit_branche_id_branche)
    REFERENCES produit(id_produit, branche_id_branche),
  FOREIGN KEY(segment_id_segment)
    REFERENCES segment(id_segment));
GO


CREATE INDEX Objectif_FKIndex1 ON Objectif (canal_id_canal);
GO
CREATE INDEX Objectif_FKIndex2 ON Objectif (intermediaire_id_intermediaire, intermediaire_canal_id_canal);
GO
CREATE INDEX Objectif_FKIndex3 ON Objectif (branche_id_branche);
GO
CREATE INDEX Objectif_FKIndex4 ON Objectif (produit_id_produit, produit_branche_id_branche);
GO
CREATE INDEX Objectif_FKIndex5 ON Objectif (segment_id_segment);
GO


CREATE INDEX IFK_Rel_07 ON Objectif (canal_id_canal);
GO
CREATE INDEX IFK_Rel_08 ON Objectif (intermediaire_id_intermediaire, intermediaire_canal_id_canal);
GO
CREATE INDEX IFK_Rel_09 ON Objectif (branche_id_branche);
GO
CREATE INDEX IFK_Rel_10 ON Objectif (produit_id_produit, produit_branche_id_branche);
GO
CREATE INDEX IFK_Rel_11 ON Objectif (segment_id_segment);
GO



