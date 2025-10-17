# Vet Clinic Database Project

## Overview 

This project simulates the data management and analysis of a veterinary clinic using SQL. It includes two main parts:
* **Database Creation**: Building a fully relational vet clinic database using CREATE TABLE and INSERT INTO SQL statements, with realistic mock data generated through ChatGPT.
* **Data Analysis**: Running SQL queries to extract business insights from the dataset — helping to understand operations, client behavior, and financial performance.

The goal of this project is to demonstrate proficiency in database design, data population, and SQL-based data analysis

## Database Structure
The database consists of six interrelated tables, each representing a core entity in a veterinary clinic: 

| Table               | Description                                                                            |
| ------------------- | -------------------------------------------------------------------------------------- |
| **Owners**          | Contains details about pet owners (name, contact info, address).                       |
| **Pets**            | Stores pet information such as name, species, breed, and microchip number.             |
| **Vets**            | Contains data about veterinarians, their specialties, and hire dates.                  |
| **Appointments**    | Records all pet appointments with the corresponding vet and reason for visit.          |
| **Medical_Records** | Stores diagnoses, treatments, notes, and billing information per appointment.          |
| **Prescription**    | Details prescriptions related to each medical record, including medication and dosage. |

## Table Relationships 

| Relationship                       | Description                                                |
| ---------------------------------- | ---------------------------------------------------------- |
| **Owners → Pets**                  | One owner can have many pets (1:N).                        |
| **Pets → Appointments**            | One pet can have many appointments (1:N).                  |
| **Vets → Appointments**            | One vet can conduct many appointments (1:N).               |
| **Appointments → Medical_Records** | Each appointment has exactly one medical record (1:1).     |
| **Medical_Records → Prescription** | Each medical record can have multiple prescriptions (1:N). |

The relational structure allows for consistent data management and meaningful analytical joins. 

## Database Diagram
<img width="1188" height="562" alt="Screenshot 2025-10-16 214853" src="https://github.com/user-attachments/assets/2ad7063f-e75d-4ba6-b319-cd05860ff9f8" />

## Data Generation 
The dataset was generated using ChatGPT’s mock data generation capabilities, producing 100 rows per table (approximately 600 records in total).
The data includes realistic:
* Pet names, species, and breeds
* Vet names and specialties
* Owner contact details
* Appointment reasons and timestamps
* Diagnoses, treatments, and prescription details
* Realistic date ranges:
* hire_date for vets: 2020–2025
* appointment.date_time: 2024–2025

All data are mock and randomly generated — no real personal or medical information is used.

## Data Analysis
After creating and populating the database, multiple SQL queries were executed to perform data-driven analysis of clinic operation. 

| #  | Analysis Question                                                  | SQL Concept Used                 |
| -- | ------------------------------------------------------------------ | -------------------------------- |
| 1  | What are the **top 10 most common issues** for appointments?       | `GROUP BY`, `ORDER BY`, `TOP`    |
| 2  | What is the **average billing amount per visit**?                  | `AVG()`, `ROUND()`               |
| 3  | How much **revenue does each vet generate**?                       | `JOIN`, `SUM()`, `GROUP BY`      |
| 4  | What are the **most common diagnoses** recorded?                   | `COUNT()`, `GROUP BY`            |
| 5  | Who are the **most active owners** and how many pets do they have? | `JOIN`, `GROUP BY`, `COUNT()`    |
| 6  | What are the **most popular pet species**?                         | `GROUP BY`, `ORDER BY`           |
| 7  | How much do owners **pay on average per diagnosis**?               | `JOIN`, `AVG()`, `GROUP BY`      |
| 8  | What is the **trend of appointments over time**?                   | `YEAR()`, `MONTH()`, aggregation |
| 9  | Which vets have the **highest number of appointments**?            | `JOIN`, `COUNT()`, ranking       |
| 10 | How many **new vets were hired per year**?                         | `YEAR(hire_date)`, `COUNT()`     |
| 11 | What is the **total monthly revenue** of the clinic?               | `GROUP BY YEAR, MONTH`           |
| 12 | What is the **total prescription cost per visit**?                 | `SUM(quantity * unit_price)`     |

## Tools 
* MS SQL Server
* SQL Server Management Studio
* ChatGPT (for mock data generation)

  
