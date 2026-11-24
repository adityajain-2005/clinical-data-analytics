use project_clinical ;
select * from patient_data;
select count(patient_id),`condition`  from patient_data group by `condition`
order by count(patient_id) desc;
select `condition`, count(recovery_days) from patient_data group by `condition` order by count(recovery_days) desc; 
select recovery_days,`condition` from patient_data where `condition`="anemia";
select `condition`,sum(billing_amount) as total_hypertension_billing from patient_data where `condition`="hypertension";
select count(patient_id) as young_patients_of_hypetension,`condition` from patient_data where age between 18 and 30  and `condition`="hypertension" ;
select count(patient_id) as old_patients_of_hypetension,`condition` from patient_data where age between 30 and 80  and `condition`="hypertension" ;
select patient_id ,`condition` from patient_data 
where age >=50  and `condition`="diabetes" order by recovery_days , billing_amount limit 1  ;

select round(sum(billing_amount/recovery_days),2) as 'spend_money/day', `condition` from patient_data group by `condition`;

select patient_id ,`condition`,billing_amount,recovery_days,age from patient_data where  `condition`="diabetes";
select row_number()over(order by age desc), age,avg(billing_amount) as average_patient_bill,avg(recovery_days) as average_recovery_days
 from patient_data
 group by age;