--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`, `students`.`surname`, `degrees`.`name`  
FROM `students`
INNER JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = 'Corso di laurea in economia';

--2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `degrees`.`name` AS 'Corso', `departments`.`name` AS 'Dipartimento'
FROM `degrees`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name`= 'Dipartimento di Neuroscienze';

--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `courses`.`name` AS 'Corso', `teachers`.`name`,`teachers`.`surname`
FROM `courses`
JOIN `course_teacher`
ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers`
ON `course_teacher`.`teacher_id`= `teachers`.`id`
WHERE `teachers`.`id` ='44';


--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`surname`AS 'Cognome', `students`.`name` AS 'Nome', `students`.`date_of_birth` AS 'Data di nascita', `degrees`.`name` AS 'Corso di laurea', `departments`.`name` AS 'Dipartimento'
FROM `departments`
JOIN`degrees`
ON `degrees`.`department_id`= `departments`.`id`
JOIN `students`
on `students`.`degree_id` = `degrees`.`id`
ORDER BY(`students`.`surname`);

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT DISTINCT `degrees`.`name`AS 'Corso di laurea',  `courses`.`name`AS 'Corso', `courses`.`id`, `departments`.`name` AS 'Dipartimento', `teachers`.`name` AS 'Professore' ,`teachers`.`surname` AS ''
FROM `departments`
JOIN `degrees`
ON `degrees`.`department_id` = `departments`.`id`
JOIN `courses`
ON `courses`.`degree_id` =  `degrees`.`id`
JOIN `course_teacher`
ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers`
ON `course_teacher`.`teacher_id`= `teachers`.`id`
ORDER BY(`degrees`.`name`);

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT `departments`.`name`, `teachers`.`name` AS 'Professore', `teachers`.`surname` AS ''
FROM `departments`
JOIN `degrees`
ON `degrees`.`department_id` = `departments`.`id`
JOIN `courses`
ON `courses`.`degree_id` = `degrees`.`id`
JOIN `course_teacher`
ON `course_teacher`.`course_id` =`courses`.`id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `departments`.`id` = '5';


--7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami