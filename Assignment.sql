CREATE TABLE Hospital(
Hospital_Name VARCHAR(100),
Hospital_Location VARCHAR(100),
Department VARCHAR(50),
Doctors_Count int,
Patients_Count int,
Admission_date date,
Discharge_date date,
Medical_Expenses NUMERIC(10,2)
);
-- Table data imported directly
SELECT * FROM hospital;


-- 1. Total Number of Patients
SELECT SUM(patients_count) AS Total_Patient
FROM hospital;

-- 2. Average Number of Doctors per Hospital
SELECT hospital_name, AVG(doctors_count) AS Average_doctors_available
FROM hospital
GROUP BY hospital_name
;

-- 3. Top 3 Departments with the Highest Number of Patients
SELECT department, SUM(patients_count) AS Number_of_Patients
FROM hospital
GROUP BY department
ORDER BY Number_of_Patients DESC
LIMIT 3;

-- 4. Hospital with the Maximum Medical Expenses
SELECT hospital_name, SUM(medical_expenses) AS Total_Medical_Expense
FROM hospital
GROUP BY hospital_name
ORDER BY Total_Medical_Expense DESC
LIMIT 1;

-- 5. Daily Average Medical Expenses
SELECT Admission_Date,
       AVG(Medical_Expenses) AS daily_average_medical_expense
FROM hospital
GROUP BY Admission_Date
ORDER BY Admission_Date;


-- 6. Longest Hospital Stay
SELECT hospital_name,hospital_location, admission_date,discharge_date, 
discharge_date-admission_date AS Patient_Stay_days
FROM hospital
ORDER BY Patient_Stay_days DESC
LIMIT 1;

-- 7. Total Patients Treated Per City
SELECT hospital_location, SUM(patients_count) AS Patients_Treated
FROM hospital
GROUP BY hospital_location
ORDER BY Patients_Treated DESC;

-- 8. Average Length of Stay Per Department
SELECT department, AVG(discharge_date-admission_date) AS Average_Staying_Days
FROM hospital
GROUP BY department
ORDER BY Average_Staying_Days DESC ;

-- 9. Identify the Department with the Lowest Number of Patients
SELECT department, SUM(patients_count) AS Number_of_Patients
FROM hospital
GROUP BY department
ORDER BY Number_of_Patients
LIMIT 1;

-- 10. Monthly Medical Expenses Report
SELECT TO_CHAR(admission_date,'mm-yyyy') AS Month,
		SUM(medical_expenses) AS Total_Medical_Expense
FROM hospital
GROUP BY Month
ORDER BY Month;


