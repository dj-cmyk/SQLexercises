-- SQL database modeling exercises

CREATE DATABASE medical_center_db;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY, 
    doctor_name TEXT NOT NULL,
    doctor_specialty TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    surname TEXT NOT NULL,
    phone TEXT NOT NULL
);

CREATE TABLE illnesses (
    id SERIAL PRIMARY KEY,
    disease_name TEXT UNIQUE NOT NULL,
    symptoms TEXT
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    date_of_visit DATE NOT NULL,
    doctor_id INTEGER REFERENCES doctors(id) ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients(id) ON DELETE CASCADE,
    illness_id INTEGER REFERENCES illnesses(id) ON DELETE SET NULL
);

INSERT INTO doctors (doctor_name) 
  VALUES 
  ('Doctor A'),
  ('Doctor Who'),
  ('Doc Marten'),
  ('Doogie Howser, MD'),
  ('House')
  ;

INSERT INTO patients (first_name, surname, phone) 
  VALUES 
  ('Steve', 'Stevenson', '111-222-3333'),
  ('Lady', 'Elizabeth', '111-222-3232'),
  ('Fakey', 'McFakerson', '111-222-2222')
  ;

INSERT INTO illnesses (disease_name, symptoms)
  VALUES
  ('broken bone', 'bruising, pain, cracking noise, x-ray confirmation'),
  ('depression', 'general malaise, feelings of sadness, blah blah blah'),
  ('fake disease', 'has lots of fake symptoms')
  ;

INSERT INTO visits (date_of_visit, doctor_id, patient_id, illness_id)
  VALUES
  ('2021-09-17', 1, 1, 2),
  ('2021-09-09', 3, 3, 2),
  ('2021-09-09', 5, 2, 3)
  ;

SELECT date_of_visit, doctor_name, surname, disease_name 
  FROM visits
    JOIN doctors ON doctor_id = doctors.id 
    JOIN patients ON patient_id = patients.id
    JOIN illnesses ON illness_id = illnesses.id  
;