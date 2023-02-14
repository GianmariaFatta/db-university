-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `name` , `surname`, `date_of_birth`
FROM `students` 
WHERE `date_of_birth`LIKE '1990-%';

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `name`, `cfu` 
FROM `courses` 
WHERE`cfu`>10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `name`,`surname` ,`date_of_birth` 
FROM `students` 
WHERE`date_of_birth`<='1992-01-01';

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT `name` , `period`, `year` 
FROM `courses` 
WHERE `year`=1 
AND `period`='I semestre';

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT `id`,`hour`,`date` 
FROM `exams` 
WHERE `hour` >= '14:00:00' 
AND `date` = '2020-06-20';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT `name`,`level` 
FROM `degrees` 
WHERE `level`='magistrale';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(`name`) AS'departments' 
FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(`name`) AS 'teachers_without_phone' 
FROM `teachers` 
WHERE `phone` IS NULL;


-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*)AS 'studenti_iscritti', YEAR(`enrolment_date`) AS 'Year' 
FROM`students` 
GROUP BY `year`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*)AS 'teachers', `office_address` AS 'Office' 
FROM`teachers`
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id` AS 'esame',ROUND(AVG(`vote`))AS 'media_voti' 
FROM`exam_student` 
GROUP BY `esame`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT `degree_id` AS 'dipartimento', COUNT(`id`)AS 'corsi' 
FROM`courses` 
GROUP BY `dipartimento`;