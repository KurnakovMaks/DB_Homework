--Выведите на экран номера групп и количество студентов, обучающихся в них
--SELECT n_group, COUNT(name)
--FROM Students st
--GROUP BY n_group
--ORDER BY st.n_group ASC

--Выведите на экран для каждой группы максимальный (средний?) балл
--SELECT n_group, MAX(score)
--FROM Students st
--GROUP BY n_group
--ORDER BY st.n_group ASC

--Подсчитать количество студентов с каждой фамилией
--SELECT name, COUNT(score)
--FROM Students st
--GROUP BY name
--ORDER BY st.name ASC

--Подсчитать студентов, которые родились в каждом году (пока не актуально)

--Для студентов каждой (курса?) группы подсчитать средний балл
--SELECT n_group, AVG(score)
--FROM Students st
--GROUP BY n_group
--ORDER BY st.n_group ASC

--Вывести одну группу с максимальным средним баллом
--SELECT n_group, AVG(score)
--FROM Students st
--GROUP BY n_group
--ORDER BY avg DESC
--LIMIT 1

--Для каждой группы подсчитать средний балл, вывести на экран только те номера групп и их средний балл, в которых он менее или равен 3.5. Отсортировать по от меньшего среднего балла к большему.
SELECT n_group, AVG(score)
FROM Students st
GROUP BY n_group
Having avg(st.score) <= 4.5
ORDER BY avg

--Для каждой группы в одном запросе вывести количество студентов, максимальный балл в группе, средний балл в группе, минимальный балл в группе
--SELECT n_group, COUNT(name), MAX(score), AVG(score), MIN(score)
--FROM Students st
--GROUP BY n_group
--ORDER BY n_group DESC

--Вывести студента/ов, который/ые имеют наибольший балл в заданной группе
--SELECT n_group, name 
--FROM Students
--WHERE score = (SELECT max(score) 
--               FROM Students) 
--Group by n_group, name
