CREATE DATABASE IF NOT EXISTS MedicalDB;
USE MedicalDB;

CREATE TABLE IF NOT EXISTS patients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    date_naissance DATE,
    num_securite_sociale VARCHAR(15) UNIQUE,
    adresse TEXT
);

CREATE TABLE IF NOT EXISTS dossiers_medicaux (
    id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    consultation TEXT,
    prescription TEXT,
    diagnostic TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS analyses_labo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    date_analyse DATE,
    type_analyse VARCHAR(50),
    resultat TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS facturation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    montant DECIMAL(10,2),
    date_facturation DATE,
    statut_paiement ENUM('payé', 'en attente', 'annulé'),
    FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE
);
