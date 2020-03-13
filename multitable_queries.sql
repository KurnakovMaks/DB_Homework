/*--Вывести все имена и фамилии студентов, и название хобби, которым занимается этот студент.
SELECT st.name, st.surname, h.name
FROM students st INNER JOIN hobbies h
ON st.id = h.id
*/
/*Вывести информацию о студенте, занимающимся хобби самое продолжительное время.
SELECT st.*, min(sh.date_start)
FROM students st INNER JOIN students_hobbies sh
ON st.id = sh.id
WHERE (sh.date_finish is Null)
GROUP BY st.id
ORDER BY min
LIMIT 1
*/
/*--Вывести имя, фамилию(, номер зачетки и дату рождения для студентов), средний балл которых выше среднего, а сумма риска всех хобби, которыми он занимается в данный момент, больше 0.9.
SELECT st.name, st.surname, st.birth_date, avg(score), sum(h.risk)
FROM students st INNER JOIN students_hobbies sh
ON st.id = sh.student_id
INNER JOIN hobbies h
ON sh.hobby_id = h.id
WHERE sh.date_finish is Null
GROUP BY st.name, st.surname, st.score, st.birth_date
HAVING sum(h.risk) > 0.9 and st.score > (SELECT avg(score) from students)
*/
/*Вывести фамилию, имя, название хобби и длительность в месяцах, для всех завершенных хобби.
SELECT st.surname, st.name, h.name, 
	  extract (year from age(sh.date_finish, sh.date_start)) * 12
	+ extract(month from age(sh.date_finish, sh.date_start)) as month
FROM students st INNER JOIN students_hobbies sh
ON st.id = sh.student_id
INNER JOIN hobbies h
ON sh.hobby_id = h.id
WHERE (sh.date_finish is not Null)
*/
/*Вывести фамилию, имя, зачетку, дату рождения студентов, которым исполнилось N полных лет на текущую дату, и которые имеют более 1 действующего хобби.
SELECT st.surname, st.name, st.birth_date, count(sh.hobby_id)
From Students st Inner Join Students_Hobbies sh
on st.id = sh.student_id
WHERE extract(year from age(now()::date,st.birth_date))=20 and (sh.date_finish is Null)
Group by st.surname, st.name, st.birth_date
Having count(sh.hobby_id) > 1
*/
/*Найти средний балл в каждой группе, учитывая только баллы студентов, которые имеют хотя бы одно действующее хобби.
SELECT st.n_group, avg(st.score)
from students st, students_hobbies sh
WHERE (sh.date_finish is not Null)
GROUP BY n_group
*/
/*Найти название, риск, длительность в месяцах самого продолжительного хобби из действующих, указав номер зачетки студента и номер его группы.
Select h.name, h.risk, extract (year from age(now()::date, sh.date_start)) * 12
					   + extract(month from age(now()::date, sh.date_start)) as length_hobby, st.n_group
from hobbies h inner join students_hobbies sh
on h.id = sh.hobby_id
inner join students st
on sh.student_id = st.id
where (sh.date_finish is null)
Order by sh.date_start asc
*/
/*Найти все хобби, которыми увлекаются студенты, имеющие максимальный балл.
SELECT st.n_group, st.name,st.surname, h.name
FROM students st inner join students_hobbies sh
on st.id = sh.student_id
inner join hobbies h
on sh.hobby_id = h.id
WHERE sh.date_finish is not Null
Group by st.n_group, st.name, h.name, st.surname
*/
/*Найти все действующие хобби, которыми увлекаются (троечники) хорошисты 2-го курса.
SELECT DISTINCT h.name
FROM students st inner join students_hobbies sh
on st.id = sh.student_id
inner join hobbies h
on sh.hobby_id = h.id
WHERE st.n_group::varchar LIKE '2%' 
  and st.score < 4.5
  and sh.date_finish is null
*/
/*Найти номера курсов, на которых более 50% студентов имеют более одного действующего хобби.
*/SELECT DISTINCT substr(st.n_group::varchar,1,1) as n_course
FROM students st inner join students_hobbies sh
on st.id = sh.student_id
inner join hobbies h
on sh.hobby_id = h.id
WHERE (sh.date_finish is Null)
Group by st.surname, st.name, st.n_group
Having count(sh.hobby_id) > 1

/*Вывести номера групп, в которых не менее 60% студентов имеют балл не ниже 4.

Для каждого курса подсчитать количество различных действующих хобби на курсе.

Вывести номер зачётки, фамилию и имя, дату рождения и номер курса для всех отличников, не имеющих хобби. Отсортировать данные по возрастанию в пределах курса по убыванию даты рождения.
Select st.name,st.surname,st.birth_date,st.score
FROM students st inner join students_hobbies sh
on st.id = sh.student_id
inner join hobbies h
on sh.hobby_id = h.id
where sh.date_finish is not null
and score>=4.5 
order by st.birth_date DESC
*/
/*Создать представление, в котором отображается вся информация о студентах, которые продолжают заниматься хобби в данный момент и занимаются им как минимум 5 лет.
Create view doing_hobby_5 as
Select st.*
FROM students st inner join students_hobbies sh
on st.id = sh.student_id
inner join hobbies h
on sh.hobby_id = h.id
WHERE sh.date_finish is null and extract (year from age(now()::date, sh.date_start))>=5
*/
/*Для каждого хобби вывести количество людей, которые им занимаются.
select h.name, count(sh.student_id) as stud_on_hobby
from students_hobbies sh inner join hobbies h
on sh.hobby_id = h.id
group by hobby_id, h.name
order by stud_on_hobby desc
*/
/*Вывести ИД самого популярного хобби.
select h.id as most_popular_hobby_id 
from students_hobbies sh inner join hobbies h
on sh.hobby_id = h.id
group by h.id
order by count(sh.student_id)  desc
limit 1
*/
/*Вывести всю информацию о студентах, занимающихся самым популярным хобби.
*/Select h.name, h.risk,st.name,st.n_group,extract (year from age(now()::date, sh.date_start)) * 12
                       + extract(month from age(now()::date, sh.date_start)) as da
                       FROM students st inner join students_hobbies sh
on st.id = sh.student_id
inner join hobbies h
on sh.hobby_id = h.id
order by da DESC limit 10

/*Вывести ИД 3х хобби с максимальным риском.
select h.risk as most_risk_hobby_id 
from hobbies h
order by risk desc
limit 3
*/
/*Вывести 10 студентов, которые занимаются одним (или несколькими) хобби самое продолжительно время.
*/Create or replace view num19 as  
Select h.name as hobby_name, h.risk,st.name as student_name,st.n_group,extract (year from age(now()::date, sh.date_start)) * 12
                       + extract(month from age(now()::date, sh.date_start)) as month_length
                       FROM students st inner join students_hobbies sh
on st.id = sh.student_id
inner join hobbies h
on sh.hobby_id = h.id
order by month_length DESC
limit 10

/*Вывести номера групп (без повторений), в которых учатся студенты из предыдущего запроса.
select distinct n_group
from num19
*/
/*Создать представление, которое выводит номер зачетки, имя и фамилию студентов, отсортированных по убыванию среднего балла.
Create or replace view fio_stud as  
select name,surname
from students
order by score desc
*/
/*Представление: найти каждое популярное хобби на каждом курсе.
*/

/*Представление: найти хобби с максимальным риском среди самых популярных хобби на 2 курсе
select h.risk as most_popular_risk_hobby_id, h.name
FROM students st INNER JOIN students_hobbies sh
ON st.id = sh.student_id
INNER JOIN hobbies h
ON sh.hobby_id = h.id
WHERE st.n_group::varchar LIKE '2%'
order by risk desc
limit 1
*/

/*Представление: для каждого курса подсчитать количество студентов на курсе и количество отличников.

Представление: самое популярное хобби среди всех студентов.

Создать обновляемое представление.

Для каждой буквы алфавита из имени найти максимальный, средний и минимальный балл. (Т.е. среди всех студентов, чьё имя начинается на А (Алексей, Алина, Артур, Анджела) найти то, что указано в задании. Вывести на экран тех, максимальный балл которых больше 3.6

Для каждой фамилии на курсе вывести максимальный и минимальный средний балл. (Например, в университете учатся 4 Иванова (1-2-3-4). 1-2-3 учатся на 2 курсе и имеют средний балл 4.1, 4, 3.8 соответственно, а 4 Иванов учится на 3 курсе и имеет балл 4.5. На экране должно быть следующее: 2 Иванов 4.1 3.8 3 Иванов 4.5 4.5

Для каждого года рождения подсчитать количество хобби, которыми занимаются или занимались студенты.

Для каждой буквы алфавита в имени найти максимальный и минимальный риск хобби.
Для каждого месяца из даты рождения вывести средний балл студентов, которые занимаются хобби с названием «Футбол»

Вывести информацию о студентах, которые занимались или занимаются хотя бы 1 хобби в следующем формате: Имя: Иван, фамилия: Иванов, группа: 1234

Найдите в фамилии в каком по счёту символа встречается «ов». Если 0 (т.е. не встречается, то выведите на экран «не найдено».

Дополните фамилию справа символом # до 10 символов.

При помощи функции удалите все символы # из предыдущего запроса.

Выведите на экран сколько дней в апреле 2018 года.

Выведите на экран какого числа будет ближайшая суббота.

Выведите на экран век, а также какая сейчас неделя года и день года.

Выведите всех студентов, которые занимались или занимаются хотя бы 1 хобби. Выведите на экран Имя, Фамилию, Названию хобби, а также надпись «занимается», если студент продолжает заниматься хобби в данный момент или «закончил», если уже не занимает.

Для каждой группы вывести сколько студентов учится на 5,4,3,2. Использовать обычное математическое округление.
																	 */
