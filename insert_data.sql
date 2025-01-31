USE MedicalDB;

-- Insérer 100 patients
INSERT INTO patients (nom, prenom, date_naissance, num_securite_sociale, adresse)
SELECT 
    CONCAT('Nom', id) AS nom,
    CONCAT('Prenom', id) AS prenom,
    DATE_ADD('1960-01-01', INTERVAL FLOOR(RAND() * 20000) DAY) AS date_naissance,
    LPAD(FLOOR(RAND() * 1000000000000000), 15, '0') AS num_securite_sociale,
    CONCAT('Adresse ', id) AS adresse
FROM (SELECT n FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION 
                     SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
           (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION 
            SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t2) t3
LIMIT 100;

-- Insérer 100 dossiers médicaux pour les patients
INSERT INTO dossiers_medicaux (patient_id, consultation, prescription, diagnostic)
SELECT 
    id,
    CONCAT('Consultation pour patient ', id),
    CONCAT('Prescription pour patient ', id),
    CONCAT('Diagnostic pour patient ', id)
FROM patients
LIMIT 100;

-- Insérer 100 analyses de laboratoire pour les patients
INSERT INTO analyses_labo (patient_id, date_analyse, type_analyse, resultat)
SELECT 
    id,
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY) AS date_analyse,
    CONCAT('Type analyse ', FLOOR(RAND() * 10)) AS type_analyse,
    CONCAT('Résultat analyse ', id) AS resultat
FROM patients
LIMIT 100;

-- Insérer 100 facturations pour les patients
INSERT INTO facturation (patient_id, montant, date_facturation, statut_paiement)
SELECT 
    id,
    ROUND(RAND() * 500 + 50, 2) AS montant,
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY) AS date_facturation,
    ELT(FLOOR(1 + (RAND() * 3)), 'payé', 'en attente', 'annulé') AS statut_paiement
FROM patients
LIMIT 100;
