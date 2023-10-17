/* Удаляем базу данных, если она существует */
DROP DATABASE IF EXISTS `EXAMS`;
/* Создаём таблицу, даём ей название и настраиваем кодировку */
CREATE DATABASE `EXAMS` COLLATE=`utf8mb4_unicode_ci`;
/* Используем таблицу для дальнейшей реализации */
USE `EXAMS`;
/* Создаём таблицу `faculties` */
CREATE TABLE `faculties` (
`code_faculty` INT,
`name_faculty` VARCHAR(60),
PRIMARY KEY (`code_faculty`)
) ENGINE=InnoDB;
/* Создаём таблицу `groups` */
CREATE TABLE `groups` (
`code_group` INT,
`code_faculty` INT,
`number_group` INT,
/* Задаём первичный ключ */
PRIMARY KEY (`code_group`),
/* Задаём внешний ключ для связки таблиц */
CONSTRAINT `FK_groups` FOREIGN KEY (`code_faculty`) REFERENCES `faculties` (`code_faculty`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
/* Создаём таблицу `students` */
CREATE TABLE `students` (
`code_student` INT,
`code_group` INT,
`full_name` VARCHAR(60),
/* Задаём первичный ключ */
PRIMARY KEY (`code_student`),
/* Задаём внешний ключ для связки таблиц */
CONSTRAINT `FK_students` FOREIGN KEY (`code_group`) REFERENCES `groups` (`code_group`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
/* Создаём таблицу `marks` */
CREATE TABLE `marks` (
`code_mark` INT,
`code_discipline` INT,
`code_student` INT,
`mark` INT,
`datе` DATE,
/* Задаём первичный ключ */
PRIMARY KEY (`code_mark`),
/* Задаём внешний ключ для связки таблиц */
CONSTRAINT `FK_marks` FOREIGN KEY (`code_student`) REFERENCES `students` (`code_student`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
/* Создаём индекс для таблицы `marks` */
CREATE INDEX `marks_code_discipline` ON `marks` (`code_discipline`);
/* Создаём таблицу `disciplines` */
CREATE TABLE `disciplines` (
`code_discipline` INT,
`name_discipline` VARCHAR(60),
/* Задаём первичный ключ */
PRIMARY KEY (`code_discipline`),
/* Задаём внешний ключ для связки таблиц */
CONSTRAINT `FK_disciplines` FOREIGN KEY (`code_discipline`) REFERENCES `marks` (`code_discipline`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
/* Заполняем таблицу `faculties` данными */
INSERT INTO `faculties` (`code_faculty`, `name_faculty`) VALUES
(1, 'Факультет информационных технологий'),
(2, 'Факультет экономики и управления'),
(3, 'Факультет права');
/* Заполняем таблицу `groups` данными */
INSERT INTO `groups` (`code_group`, `code_faculty`, `number_group`) VALUES
(1, 1, 101),
(2, 1, 202),
(3, 2, 303),
(4, 2, 404),
(5, 3, 505);
/* Заполняем таблицу `students` данными */
INSERT INTO `students` (`code_student`, `code_group`, `full_name`) VALUES
(1, 1, 'Иванов И.И.'),
(2, 1, 'Петров П.П.'),
(3, 2, 'Сидоров С.С.'),
(4, 2, 'Кузнецов К.К.'),
(5, 3, 'Николаев Н.Н.'),
(6, 3, 'Смирнова О.А.'),
(7, 4, 'Васильева А.С.'),
(8, 4, 'Григорьева Е.В.'),
(9, 5, 'Александров А.А.'),
(10, 5, NULL);
/* Заполняем таблицу `marks` данными */
INSERT INTO `marks` (`code_mark`, `code_discipline`, `code_student`, `mark`, `datе`) VALUES
(1, 1, 1, 4, '2014-01-25'),
(2, 2, 2, 5, '2014-03-13'),
(3, 3, 3, 3, '2014-03-25'),
(4, 5, 4, 4, '2014-03-25'),
(5, 4, 5, 5, '2014-01-25'),
(6, 3, 6, 4, '2014-03-25'),
(7, 1, 7, 3, '2014-03-13'),
(8, 2, 8, 5, '2014-03-13'),
(9, 6, 9, 4, '2014-01-25'),
(10, 5, 10, 3, '2014-03-13'),
(11, 1, 1, 5, '2014-01-25'),
(12, 3, 2, 4, '2014-01-25'),
(13, 2, 3, 3, '2014-03-25'),
(14, 2, 4, 5, '2014-03-25'),
(15, 4, 5, 4, '2014-03-25'),
(16, 3, 2, 3, '2014-01-25'),
(17, 3, 3, 4, '2014-03-13'),
(18, 2, 4, 4, '2014-03-25'),
(19, 2, 5, 3, '2014-03-25'),
(20, 3, 6, 5, '2014-03-13');
/* Заполняем таблицу `disciplines` данными */
INSERT INTO `disciplines` (`code_discipline`, `name_discipline`) VALUES
(1, 'Математический анализ'),
(2, 'Программирование'),
(3, 'Экономика'),
(4, 'Менеджмент'),
(5, 'Гражданское право'),
(6, 'Уголовное право');
/* - Задание № 2 - */
/* Создаём запрос с оператором OR, позволяющий выбрать информацию об оценках, полученных 25.01.2014 или 13.03.2014, или 25.03.2014 */
SELECT * FROM `marks` WHERE `datе`='2014-01-25' OR `datе`='2014-03-13' OR `datе`='2014-03-25';
/* Создаём аналогичный запрос с оператором IN */
SELECT * FROM `marks` WHERE `datе` IN ('2014-01-25', '2014-03-13', '2014-03-25');
/* - Задание № 3 - */
/* Создаём запрос, где выбираем информацию об оценках, лежащих в диапазоне от 2 до 4 */
SELECT * FROM `marks` WHERE `mark` BETWEEN 2 AND 4;
/* - Задание № 4 - */
/* Создаём запрос, где выбираем информацию о студентах, фамилия которых начинается с "C" и заканчивается "ов" */
SELECT `full_name` FROM `students` WHERE `full_name` LIKE 'С%ов _._.';
/* - Задание № 5 - */
/* Создаём запрос, где выбираем данные обо всех студентах, фамилии которых известны */
SELECT `full_name` FROM `students` WHERE `full_name` IS NOT NULL;
/* Создаём запрос, используя оператор CASE */
SELECT `code_student`, `code_group`,
CASE 
    WHEN `full_name` IS NULL THEN 'Нет данных' 
    ELSE `full_name`
END AS `results` FROM `students`;
/* - Задание № 6 - */
/* Создаём запрос, где выводим поля с названиями ФИО и Код_группы для всех студентов, имеющих Код_студента > 6 */
SELECT `full_name` AS `Full name`, `code_group` AS `Code group`
FROM `students` WHERE `code_student` > 6;
/* - Задание № 7 - */
/* Создаём запрос, где изменяем название группы, используя функции CONCAT и UPPER */
SELECT CONCAT('Группа-', UPPER(`number_group`)) AS `Group number`
FROM `groups`;
/* Создаём запрос, где выводим информацию вида "Группа-501а" для всех групп, номер которых начинается с 5 */
SELECT CONCAT('Группа-', SUBSTRING(`number_group`, 1, 3), ' (выпускники)') AS `Group name`
FROM `groups` WHERE `number_group` LIKE '5%';
/* - Задание № 8 - */
/* Создаём запрос по таблице "Студенты", где выбираем всю информацию о студентах, для которых известны ФИО. ФИО упорядочиваем по убыванию */
SELECT * FROM `students` WHERE `full_name` IS NOT NULL
ORDER BY `full_name` DESC;
/* Создаём запрос, где упорядочиваем всех студентов после десятого сначала по коду группы, затем по ФИО */
SELECT `code_group`, `full_name` FROM `students` WHERE `code_student` > 10
ORDER BY `code_group` ASC, `full_name` DESC;
/* Создаём запрос по любой из таблиц, где выполняем упорядочивание по трём столбцам */
SELECT * FROM `marks` 
ORDER BY `code_discipline` ASC, `code_student` ASC, `mark` DESC;
/* Переписываем второй запрос */
SELECT `code_group`, `full_name` FROM `students` WHERE `code_student` > 5 
ORDER BY 1 ASC, 2 DESC;
/* Переписываем третий запрос */
SELECT * FROM `marks` 
ORDER BY 2 ASC, 3 ASC, 4 DESC;
/* - Задание № 9 - */
/* Создаём запрос, где вычисляем среднее значение */
SELECT AVG(CAST(`mark` AS FLOAT)) AS `Average mark`, COUNT(*) AS `Total marks` FROM `marks`;
/* Переписываем первый запрос, где заменяем COUNT(*) на COUNT() и подбираем столбец в качестве аргумента */
SELECT AVG(CAST(`mark` AS FLOAT)) AS `Average mark`, COUNT(`mark`) AS `Total marks` FROM `marks`
WHERE `code_discipline` = 2;
/* Создаём 3 запроса, где будут использоваться агрегирующие функции */
/* Создаём 1-й запрос, где производим выборку количества студентов в каждой группе */
SELECT `code_group`, COUNT(*) as `students_count` FROM `students` 
GROUP BY `code_group`;
/* Создаём 2-й запрос, где производим выборку максимальной оценки по каждому предмету */
SELECT `code_discipline`, MAX(`mark`) as `Max mark` FROM `marks` 
GROUP BY `code_discipline`;
/* Создаём 3-й запрос, где производим выборку минимальной и максимальной оценки по каждому студенту */
SELECT `code_student`, MIN(`mark`) as `Min mark`, MAX(`mark`) as `Max mark` FROM `marks` 
GROUP BY `code_student`;
/* Создаём запрос, где используем оператор DISTINCT, отбрасывающий все дубликаты значений, в том числе и NULL */
SELECT COUNT(DISTINCT `mark`) FROM `marks`;
/* Создаём запрос, где используем оператор DISTINCT с другой агрегирующей функцией */
SELECT AVG(DISTINCT `mark`) FROM `marks`;
/* - Задание № 10 - */
/* Создаём запрос, где получаем список фамилий студентов с указанием групп, в которых они учатся */
SELECT `students`.`full_name`, `groups`.`number_group` FROM `students`, `groups`
WHERE `students`.`code_group` = `groups`.`code_group`;
/* Изменяем запрос, где в список входят студенты, фамилии которых начинаются на "А" и на "В" */
SELECT `students`.`full_name`, `groups`.`number_group` FROM `students`, `groups`
WHERE `students`.`code_group` = `groups`.`code_group` AND (`students`.`full_name` LIKE 'А%' OR `students`.`full_name` LIKE 'В%');
/* - Задание № 11 - */
/* Создаём многотабличный запрос с использованием псевдонимов */
SELECT `full_name`, `number_group` FROM `students` `a`, `groups` `b`
WHERE `a`.`code_group` = `b`.`code_group` 
ORDER BY `a`.`full_name`;
/* Создаём запрос к трём связанным таблицам */
SELECT `name_faculty`, `full_name` FROM `faculties` `a`, `students` `b`, `groups` `c`
WHERE `a`.`code_faculty` = `c`.`code_faculty` AND `c`.`code_group` = `b`.`code_group`
ORDER BY `a`.`name_faculty`;
/* - Задание № 12 - */
/* Создаём запрос, эквивалентный запросу 1 из задания № 11, но уже с использованием внутреннего соединения таблиц */
SELECT `full_name`, `number_group` FROM `students` `a` 
INNER JOIN `groups` `b` ON `a`.`code_group` = `b`.`code_group`
ORDER BY `a`.`full_name`;
/* Создаём запрос, эквивалентный запросу 2 из задания № 11, но уже с использованием внутреннего соединения таблиц */
SELECT `name_faculty`, `full_name` FROM `faculties` `a`
INNER JOIN `groups` `c` ON `a`.`code_faculty`=`c`.`code_faculty`
INNER JOIN `students` `b` ON `c`.`code_group`=`b`.`code_group`
ORDER BY `a`.`name_faculty`;
/* Создаём запроc, который выводит ФИО студента, название дисциплины, оценку и дату сдачи экзамена для всех записей в таблице marks, а также название факультета и номер группы студента */
SELECT `full_name`, `name_discipline`, `mark`, `name_faculty`,`number_group`
FROM `students` `s`
INNER JOIN `groups` `g` ON `s`.`code_group` = `g`.`code_group`
INNER JOIN `faculties` `f` ON `g`.`code_faculty` = `f`.`code_faculty`
INNER JOIN `marks` `m` ON `s`.`code_student` = `m`.`code_student`
INNER JOIN `disciplines` `d` ON `m`.`code_discipline` = `d`.`code_discipline`;