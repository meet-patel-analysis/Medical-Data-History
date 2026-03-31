use project_medical_data_history;
select * from patients;

-- Q1: select  first_name, last_name, gender
from patients where gender='M';

-- Q2: select  first_name, last_name
from patients where allergies is null;

-- Q3: select first_name from patients
where first_name like 'c%';

-- Q4: select first_name, last_name
from patients where weight between 100 and 120;

-- Q5: update patients set allergies = 'NKA'
where allergies is null;
select * from patients LIMIT 5;

-- Q5: select first_name,last_name,
allergies as original_data,
coalesce(allergies, 'NKA') as fixed_data
from patients; 

-- Q6: select concat(first_name,' ',last_name) as full_name
from patients;
select concat(first_name,' ',last_name) as full_name
from doctors;

-- Q7: SELECT 
    p.first_name, 
    p.last_name, 
    pr.province_name
FROM patients p
JOIN province_names pr 
  ON p.province_id = pr.province_id;

-- Q8: select count(*) from patients
where birth_date like '%2010';

-- Q9: select first_name,last_name,height
from patients where height = (select max(height)
from patients);

-- Q10: select * from patients
where patient_id in (1,45,539,879,1000);

-- Q11: select count(*) from admissions;
select * from admissions;

-- Q12: select * from admissions
where admission_date = discharge_date;

-- Q13: select count(*) from admissions where patient_id = '579';

-- Q14: select distinct city from patients
where province_id = 'NS';

-- Q15: select first_name,last_name,birth_date 
from patients where height > 160 and weight > 70;

-- Q16: select distinct year(birth_date) from patients
order by year(birth_date) ASC;

-- Q17: select first_name from patients
group by first_name having count(first_name) = 1;

-- Q18: select patient_id,first_name from patients
where first_name like 's%s' and length(first_name)
= 6;

-- Q19: select p.patient_id,p.first_name,p.last_name 
from patients p join admissions a on 
p.patient_id = a.patient_id where 
a.diagnosis = 'dementia';

-- Q20: select first_name from patients order by
length(first_name),first_name;

-- Q21: SELECT 
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_count, 
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_count
FROM patients;

-- Q22&23: SELECT patient_id,diagnosis
FROM admissions
GROUP BY patient_id,diagnosis
HAVING COUNT(*) > 1;

-- Q24: select city,
count(*) As patient_count
from patients group by city
order by patient_count desc,
city asc;

-- Q25: SELECT first_name, last_name, 'Doctor' AS role
FROM doctors
UNION ALL
SELECT first_name, last_name, 'Patient' AS role
FROM patients;

-- Q26: SELECT allergies,COUNT(*) AS allergy_count
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY allergy_count DESC;

-- Q27: SELECT 
    first_name, 
    last_name, 
    birth_date
FROM patients
WHERE birth_date BETWEEN '1970-01-01' AND '1979-12-31'
ORDER BY birth_date ASC;

-- Q28: select concat (upper(last_name),',', lower(first_name))
as full_name from patients order by first_name desc;

-- Q29: select province_id, sum(height) as
total_height from patients group by
province_id having total_height
>= 7000;

-- Q30: select (max(weight) - min(weight)) as
weight_difference from patients
where last_name = 'Maroni';

-- Q31: select day(admission_date) as day_number,
count(*) as number_of_admissions from 
admissions group by day_number order by
number_of_admissions desc;

-- Q32: SELECT 
(FLOOR(weight / 10) * 10) AS weight_group,
COUNT(*) AS patient_count
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC;

-- Q33: SELECT patient_id,weight,height, 
CASE WHEN weight / POWER(height / 100.0, 2) >= 30 THEN 1 
ELSE 0 END AS isObese
FROM patients;

-- Q34: SELECT
  p.patient_id,
  p.first_name,
  p.last_name,
  d.specialty
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
JOIN doctors d ON a.attending_doctor_id = d.doctor_id
WHERE a.diagnosis = 'Epilepsy'
AND d.first_name = 'Lisa';