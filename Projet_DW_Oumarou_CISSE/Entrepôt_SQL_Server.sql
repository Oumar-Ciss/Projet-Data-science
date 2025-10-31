-- Choix de la base
USE base_projet_CO;

-- Table de dimension : Temps
CREATE TABLE temps (
  id_temps INT PRIMARY KEY, -- format : YYYYMMDD
  date_jour DATE NOT NULL,
  jour INT,
  mois INT,
  trimestre INT,
  année INT,
  libelle_mois VARCHAR(15),
  libelle_trimestre VARCHAR(15)
);
GO

-- Table de dimension : Segment
CREATE TABLE segment (
  id_segment INT PRIMARY KEY,
  libelle VARCHAR(45)
);
GO

-- Table de dimension : Canal
CREATE TABLE canal (
  id_canal INT PRIMARY KEY,
  libelle VARCHAR(45)
);
GO

-- Table de dimension : Branche
CREATE TABLE branche (
  id_branche INT PRIMARY KEY,
  libelle VARCHAR(45)
);
GO

-- Table de dimension : Produit
CREATE TABLE produit (
  id_produit INT PRIMARY KEY,
  libelle VARCHAR(45),
  branche_id INT NOT NULL,
  FOREIGN KEY (branche_id) REFERENCES branche(id_branche)
);
CREATE INDEX idx_produit_branche ON produit (branche_id);
GO

-- Table de dimension : Intermédiaire
CREATE TABLE intermediaire (
  id_intermediaire INT PRIMARY KEY,
  libelle VARCHAR(45),
  canal_id INT NOT NULL,
  FOREIGN KEY (canal_id) REFERENCES canal(id_canal)
);
CREATE INDEX idx_intermediaire_canal ON intermediaire (canal_id);
GO

-- Table de dimension : Client
CREATE TABLE client (
  id_client INT PRIMARY KEY,
  nom VARCHAR(45),
  adresse VARCHAR(45),
  segment_id INT NOT NULL,
  FOREIGN KEY (segment_id) REFERENCES segment(id_segment)
);
CREATE INDEX idx_client_segment ON client (segment_id);
GO

-- Table de faits production
CREATE TABLE production (
  id_production VARCHAR(45) PRIMARY KEY,
  produit_id INT NOT NULL,
  intermediaire_id INT NOT NULL,
  client_id INT NOT NULL,
  id_temps_exercice INT,
  id_temps_effet INT,
  id_temps_fin INT,
  prime_nette FLOAT,
  cout_police FLOAT,
  taxe FLOAT,
  prime_totale FLOAT,
  FOREIGN KEY (produit_id) REFERENCES produit(id_produit),
  FOREIGN KEY (intermediaire_id) REFERENCES intermediaire(id_intermediaire),
  FOREIGN KEY (client_id) REFERENCES client(id_client),
  FOREIGN KEY (id_temps_exercice) REFERENCES temps(id_temps),
  FOREIGN KEY (id_temps_effet) REFERENCES temps(id_temps),
  FOREIGN KEY (id_temps_fin) REFERENCES temps(id_temps)
);
CREATE INDEX idx_prod_produit ON production (produit_id);
CREATE INDEX idx_prod_intermediaire ON production (intermediaire_id);
CREATE INDEX idx_prod_client ON production (client_id);
CREATE INDEX idx_prod_temps_exercice ON production (id_temps_exercice);
GO

-- Table de fait objectif
CREATE TABLE objectif (
  id_objectif INT IDENTITY PRIMARY KEY,
  segment_id INT NOT NULL,
  produit_id INT NOT NULL,
  intermediaire_id INT NOT NULL,
  id_temps_exercice INT NOT NULL,
  objectif_ca INT,
  FOREIGN KEY (segment_id) REFERENCES segment(id_segment),
  FOREIGN KEY (produit_id) REFERENCES produit(id_produit),
  FOREIGN KEY (intermediaire_id) REFERENCES intermediaire(id_intermediaire),
  FOREIGN KEY (id_temps_exercice) REFERENCES temps(id_temps)
);
CREATE INDEX idx_obj_segment ON objectif (segment_id);
CREATE INDEX idx_obj_produit ON objectif (produit_id);
CREATE INDEX idx_obj_intermediaire ON objectif (intermediaire_id);
CREATE INDEX idx_obj_temps ON objectif (id_temps_exercice);
GO
select* from intermediaire;