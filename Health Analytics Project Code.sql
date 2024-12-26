use healthdb; 

 -- Ques 1. Count and Percent of Female vs Male that have OCD &  Average Obsession Score by Gender. 
 
 with CTE as (
 SELECT
 Gender,
 count(`Patient ID`) as patient_count,
 round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obs_score
 
 FROM ocd_patient_dataset
 Group By Gender 
 Order By patient_count
 )
 
 select 
    sum(case when Gender = 'Female' then patient_count else 0 end) as count_female,
    sum(case when Gender = 'Male' then patient_count else 0 end) as count_male,
    
    round(sum(case when Gender = 'Female' then patient_count else 0 end)/
    (sum(case when Gender = 'Female' then patient_count else 0 end)+sum(case when Gender = 'Male' then patient_count else 0 end)) *100,2)
    as percent_female,
    
    round(sum(case when Gender = 'Male' then patient_count else 0 end)/
    (sum(case when Gender = 'Female' then patient_count else 0 end)+sum(case when Gender = 'Male' then patient_count else 0 end)) *100,2)
    as percent_male
    
    from CTE; 
    
    
    -- Ques 2. Count & Average Obsession Score by Ethnicities that have OCD.
    
    SELECT 
    Ethnicity,
    count(`Patient ID`) as patient_count,
    round(avg(`Y-BOCS Score (Obsessions)`),2) as obs_score
    FROM ocd_patient_dataset
    Group By Ethnicity
    Order By patient_count;
    
    
    -- Ques 3. Number of people diagnosed with OCD Month of Month.
    
    -- alter table ocd_patient_dataset
    -- modify `OCD Diagnosis Date` date;
    
    -- ALTER TABLE ocd_patient_dataset ADD COLUMN date_column DATE; 
    
    -- SET SQL_SAFE_UPDATES = 0;
    
    -- UPDATE ocd_patient_dataset
    -- SET date_column = STR_TO_DATE(`OCD Diagnosis Date`, '%d-%m-%Y');  
    
    SELECT
    date_format(date_column, '%Y-%m-01 00:00:00') as month_m, 
    count(`Patient ID`) as patient_count
    
    FROM ocd_patient_dataset
    Group By month_m
    Order By month_m;  
    
-- Ques 4. What is the most common Obsession Type (Count) & its respective Average Obsession Score?

SELECT 
`Obsession Type`,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as obs_score

FROM ocd_patient_dataset
Group By 1
Order By 2;

  
  -- Ques 5. What is the most common compulsion type (Count) & its respective Average Obsession Score?
  
  
    SELECT 
`Compulsion Type`,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as obs_score

FROM ocd_patient_dataset
Group By 1
Order By 2;

    
    
    
    
    
    
    
    
    
    
 