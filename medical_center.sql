-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE "Doctors" (
    "DoctorID" SERIAL PRIMARY KEY,  
    "DoctorName" VARCHAR(100) NOT NULL,
    "Expertise" VARCHAR(100) NOT NULL
);

CREATE TABLE "Patients" (
    "PatientID" SERIAL PRIMARY KEY,  
    "PatientName" VARCHAR(100) NOT NULL
);

CREATE TABLE "Diseases" (
    "DiseaseID" SERIAL PRIMARY KEY,  
    "DiseaseName" VARCHAR(100) NOT NULL
);

CREATE TABLE "Visits" (
    "VisitID" SERIAL PRIMARY KEY,  
    "DoctorID" INT NOT NULL,
    "PatientID" INT NOT NULL,
    "VisitDate" DATE NOT NULL
);

CREATE TABLE "Diagnoses" (
    "DiagnosisID" SERIAL PRIMARY KEY,  
    "VisitID" INT NOT NULL,
    "DiseaseID" INT NOT NULL
);

CREATE TABLE "Patients_Diseases" (
    "PatientID" INT NOT NULL,
    "DiseaseID" INT NOT NULL,
    CONSTRAINT "pk_Patients_Diseases" PRIMARY KEY ("PatientID", "DiseaseID")
);

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_DoctorID" FOREIGN KEY("DoctorID")
REFERENCES "Doctors" ("DoctorID");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_PatientID" FOREIGN KEY("PatientID")
REFERENCES "Patients" ("PatientID");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_VisitID" FOREIGN KEY("VisitID")
REFERENCES "Visits" ("VisitID");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_DiseaseID" FOREIGN KEY("DiseaseID")
REFERENCES "Diseases" ("DiseaseID");

ALTER TABLE "Patients_Diseases" ADD CONSTRAINT "fk_Patients_Diseases_PatientID" FOREIGN KEY("PatientID")
REFERENCES "Patients" ("PatientID");

ALTER TABLE "Patients_Diseases" ADD CONSTRAINT "fk_Patients_Diseases_DiseaseID" FOREIGN KEY("DiseaseID")
REFERENCES "Diseases" ("DiseaseID");
