USE university_query;

-- Contare quanti iscritti ci sono stati ogni anno (la data di iscrizione sulla tabella students è enrolment_date)
SELECT COUNT(enrolment_date) AS iscritti_anno
FROM students s
GROUP BY YEAR(enrolment_date)
ORDER BY enrolment_date DESC; 

-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT s.name , s.surname , d.name
FROM students s
INNER JOIN degrees d 
ON s.degree_id = d.id
WHERE d.name = 'Corso di Laurea in Economia';

-- Selezionare tutti i corsi in cui insegna Fulvio Amato
SELECT t.name , t.surname , c.name , c.id 
FROM course_teacher ct
INNER JOIN teachers t 
ON  ct.teacher_id = t.id 
INNER JOIN courses c 
ON ct.course_id = c.id 
WHERE t.name = 'Fulvio' AND t.surname = 'Amato';

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, 
-- in ordine alfabetico per cognome e nome 
SELECT s.name , s.surname , d.name, d.level, d.address, d.email, d.website, d2.name 
FROM degrees d
INNER JOIN students s  
ON d.id = s.degree_id 
INNER JOIN departments d2 
ON d.department_id = d2.id 
ORDER BY s.surname, s.name ;

-- Contare quanti corsi di laurea ci sono per ogni dipartimento e mostrare nome dipartimento e numero di corsi
SELECT d2.name, COUNT(d2.name) AS numero_corsi_di_laurea
FROM degrees d
INNER JOIN departments d2 
ON d.department_id = d2.id
GROUP BY d2.name ;
