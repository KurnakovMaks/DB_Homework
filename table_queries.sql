-- Вывести всех студентов, средний балл которых от 4 до 4.5
--SELECT name, surname, score
--From Students st
--WHERE st.score between 4 and 4.5 --в промежутке
--WHERE st.score >= 4 and st.score <= 4.5 --//и те и те

-- Вывести при помощи CAST студентов заданного курса (использовать Like)
--SELECT name, surname, n_group
--From Students st
--WHERE CAST (st.n_group as char(4)) LIKE '2%'

-- Вывести всех студентов, отсортировать по убыванию номера группы и имени от а до я
--SELECT name, surname, n_group
--From Students st
--ORDER BY st.n_group DESC, st.surname ASC

-- Вывести студентов, средний балл которых больше 4 и отсортировать по баллу от большего к меньшему
--SELECT name, surname, score
--From Students st
--WHERE st.score>4
--ORDER BY st.score DESC

-- Вывести на экран название и риск футбола и хоккея
--SELECT name, risk
--From Hobbies h
--WHERE h.name = 'Футбол' or h.name = 'Хоккей'

-- Вывести id хобби и id студента которые начали заниматься хобби между двумя датами и студенты должны до сих пор заниматься хобби
--SELECT id, student_id--, date_start, date_finish
--From Students_hobbies sh
--WHERE sh.date_start between '2015/03/05' and '2020/02/23'
--	                and sh.date_finish IS Null

-- Вывести студентов, средний балл которых больше 4.5 и отсортировать по баллу от большего к меньшему
--SELECT name, surname, score
--From Students st
--WHERE st.score>4.5
--ORDER BY st.score DESC

-- Из предыдущего запроса вывести несколькими способами на экран только 5 студентов с максимальным баллом
--SELECT name, surname, score
--From Students st
--WHERE st.score>4.5
--ORDER BY st.score DESC
--LIMIT 5

--Выведите хобби и с использованием условного оператора сделайте риск словами:
/*SELECT name, risk,
CASE
     WHEN risk>=8 THEN 'Very high' /*ELSE 'Очень низкий < 2'*/
     WHEN risk>=6 and risk<8 THEN 'High' /*ELSE 'Очень низкий < 2'*/
	 WHEN risk>=4 and risk<6 THEN 'Middle'
	 WHEN risk>=2 and risk<4 THEN 'Low'
	 ELSE 'Very low'
	 END
From Hobbies*/

--Вывести 3 хобби с максимальным риском
--SELECT name, risk
--From Hobbies h
--ORDER BY h.risk DESC
--LIMIT 3
