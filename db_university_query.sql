/*
 * Selezionare il dipartimento il cui capo è Bernardo Sanna
 * Selezionare tutti i corsi di laurea magistrale
 * Selezionare tutti i corsi che valgono più di 10 crediti
 * Selezionare tutti gli insegnanti che non hanno il numero di telefono
 * Selezionare tutti gli studenti che hanno più di 30 anni
 * Selezionare tutti gli studenti che hanno un indirizzo email gmail o yahoo
 * Selezionare tutti gli esami che si sono svolti a luglio 2020
*/

USE university_query;

SELECT *
FROM departments
WHERE head_of_department = 'Bernardo Sanna';

SELECT *
FROM degrees
WHERE level = 'magistrale';

SELECT *
FROM courses
WHERE cfu > 10;

SELECT *
FROM teachers
WHERE phone IS NULL;

SELECT *
FROM students
WHERE TIMESTAMPDIFF(YEAR, date_of_birth ,CURDATE())>30; 

SELECT *
FROM students
WHERE email LIKE '%gmail%' OR email LIKE '%yahoo%';

SELECT *
FROM exams
WHERE YEAR(`date`)=2020 AND MONTH(`date`)=7;
