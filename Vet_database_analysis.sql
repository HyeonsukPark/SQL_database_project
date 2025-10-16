-- Dataset check 
SELECT * FROM dbo.Owners
SELECT * FROM dbo.Pets
SELECT * FROM dbo.Vets
SELECT * FROM dbo.Medical_Records
SELECT * FROM dbo.Appointments
SELECT * FROM dbo.Prescription 

-- Analysis -- 


-- 10 Most common appointment reasons
SELECT Top 10 reason, COUNT(*) AS total_appointments 
FROM dbo.Appointments
GROUP BY reason 
ORDER BY total_appointments DESC;


-- Average billing per visit
SELECT 
   ROUND(AVG(billing_amount), 2) AS avg_billing,
   ROUND(SUM(billing_amount), 2) AS total_revenue
FROM Medical_Records;


-- Revenue by vet 
SELECT 
   v.vet_id, 
   v.first_name + ' ' + v.last_name AS vet_name, 
   ROUND(SUM(m.billing_amount), 2) AS total_revenue 
FROM dbo.Medical_Records m 
JOIN Appointments a ON m.appointment_Id = a.appointment_id
JOIN Vets v ON a.vet_id = v.vet_id
GROUP BY v.vet_id, v.first_name, v.last_name
ORDER BY total_revenue DESC;


-- Most commong diagnoses
SELECT Top 10 diagnosis, COUNT(*) AS diagnoses 
FROM dbo.Medical_Records 
GROUP BY diagnosis 
ORDER BY diagnoses DESC;


-- Active owners and their number of pets
SELECT 
  o.owner_id, 
  o.first_name + ' ' + o.last_name AS owner_name,
  COUNT(p.pet_id) AS pet_count
FROM Owners o 
LEFT JOIN Pets p ON o.owner_id = p.owner_id 
GROUP BY o.owner_id, o.first_name, o.last_name
ORDER BY pet_count DESC;


-- Most popular pet species
SELECT species, COUNT(*) AS Total_pets
FROM Pets p 
GROUP by species
ORDER BY Total_pets DESC


-- Average cost per diagnosis
SELECT
  diagnosis,
  ROUND(AVG(billing_amount), 2) AS avg_cost
FROM Medical_Records 
GROUP BY diagnosis 
ORDER BY avg_cost DESC;


-- Appointment trend over time
SELECT
   YEAR(date_time) AS year,
   MONTH(date_time) AS month,
   COUNT(*) AS total_appointments
FROM Appointments
GROUP BY YEAR(date_time), MONTH(date_time)
ORDER BY year, month;


-- Vets with total appintments
SELECT 
    v.vet_id,
    v.first_name + ' ' + v.last_name AS vet_name,
    COUNT(a.appointment_id) AS total_appointments
FROM Appointments a
JOIN Vets v ON a.vet_id = v.vet_id
GROUP BY v.vet_id, v.first_name, v.last_name
ORDER BY total_appointments DESC;


-- New vets hired per year 
SELECT 
    YEAR(hire_date) AS hire_year, 
    COUNT(*) AS hires
FROM Vets
GROUP BY YEAR(hire_date)
ORDER BY hire_year;


-- Total revenue per month
SELECT 
    YEAR(a.date_time) AS year,
    MONTH(a.date_time) AS month,
    SUM(m.billing_amount) AS total_revenue
FROM Medical_Records m
JOIN Appointments a ON m.appointment_id = a.appointment_id
GROUP BY YEAR(a.date_time), MONTH(a.date_time)
ORDER BY year, month;


-- Total cost of prescribed items per visit 
SELECT 
    m.record_id,
    SUM(p.quantity * p.unit_price) AS prescription_cost
FROM Prescription p
JOIN Medical_Records m ON p.record_id = m.record_id
GROUP BY m.record_id
ORDER BY prescription_cost DESC;


