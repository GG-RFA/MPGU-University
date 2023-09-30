/* Дропаем таблицу, если она существует */
DROP DATABASE IF EXISTS `PRACTISEWORK1`;
/* Создаём таблицу, даём ей название и настраиваем кодировку */
CREATE DATABASE `PRACTISEWORK1` COLLATE=`utf8mb4_unicode_ci`;
USE `PRACTISEWORK1`;
/* Дропаем таблицы, если они существуют */
DROP TABLE IF EXISTS `pet`;
DROP TABLE IF EXISTS `event`;
/* Создаём таблицу `pet` */
CREATE TABLE `pet` (
  `name` VARCHAR(20),
  `owner` VARCHAR(20),
  `species` VARCHAR(20),
  `sex` CHAR(1),
  `birth` DATE,
  `death` DATE
) ENGINE=InnoDB;
/* Создаём таблицу `event` */
CREATE TABLE `event` (
  `name` VARCHAR(20),
  `date` DATE,
  `type` VARCHAR(15),
   `remark` VARCHAR(255)
) ENGINE=InnoDB;
/* Заполняем таблицу `pet` данными */
INSERT INTO `pet` (`name`, `owner`,`species`,`sex`,`birth`,`death`) VALUES
('Fluffy', 'Harold', 'cat', 'f', '2005-02-04', NULL),
('Claws', 'Gwen', 'cat', 'm', '2006-03-17', NULL),
('Buffy', 'Harold', 'dog', 'f', '1999-05-13', NULL),
('Fang', 'Benny', 'dog', 'm', '2000-08-27', NULL),
('Bowser', 'Diane', 'dog', 'm', '2008-08-31', '2005-07-29'),
('Chirpy', 'Gwen', 'bird', 'f', '2008-09-11', NULL),
('Whister', 'Gwen', 'bird', NULL, '2007-12-09', NULL),
('Slim', 'Benny', 'snake', 'f', '2007-12-09', NULL),
('Puffball', 'Diane', 'hamster', 'f', '2009-03-30', NULL);
/* Заполняем таблицу `event` данными */
INSERT INTO `event` (`name`, `date`,`type`,`remark`) VALUES
('Fluffy', '2005-05-15', 'litter', '4 kittens, 3 female, 1 male'),
('Buffy', '2003-06-23', 'litter', '5 puppies, 2 female, 3 male'),
('Buffy', '2004-06-19', 'litter', '3 puppies, 3 female'),
('Chirpy', '2009-03-21', 'vet', 'needed beak straightened'),
('Slim', '2007-08-03', 'vet', 'broken rib'),
('Bowser', '2001-10-12', 'kennel', NULL),
('Fang', '2008-10-12', 'kennel', NULL),
('Fang', '2008-08-28', 'birthday', 'Gave him a new chew toy'),
('Claws', '2008-03-17', 'birthday', 'Gave him a new flea collar'),
('Whistler', '2008-12-09', 'birthday', 'First birthday');
/* Проверяем наличие в БД таблиц */
SHOW TABLES;
/* Убеждаемся в правильности создания таблицы `pet` */
DESCRIBE `pet`;
/* Просматриваем все данные в таблице */
SELECT * FROM `pet`;
/* Отключаем режим безопасного обновления для избежания ошибки */
SET SQL_SAFE_UPDATES = 0;
/* Обновляем ошибочно введённые данные при помощи оператора UPDATE */
UPDATE `pet` SET `birth` = '2000-06-14' WHERE `name` = 'Bowser';
/* Включаем режим безопасного обновления */
SET SQL_SAFE_UPDATES = 1;
/* Создаём запрос на вывод поля с данными о собаке, имя которой Bowser */
SELECT * FROM `pet` WHERE `name` = 'Bowser'; 
/* Создаём запрос, в котором получаем информацию о животных, родившихся после 2008-го года */
 SELECT * FROM `pet` WHERE `birth` >= '2008-1-1'; 
/* Создаём запрос, комбинируя несколько условий для получения информации о всех собаках женского пола*/
SELECT * FROM `pet` WHERE `species` = 'dog' AND `sex` = 'f'; 
/* Создаём запрос, комбинируя несколько условий для получения информации обо всех змеях и птицах */
SELECT * FROM `pet` WHERE `species` = 'snake' OR `species` = 'bird'; 
/* Создаём запрос, используя операторы AND и OR совместно для получения информации обо всех кошках женского пола и всех собаках мужского пола */
SELECT * FROM `pet` WHERE (`species` = 'cat' AND `sex` = 'm') OR (`species` = 'dog' AND `sex` = 'f'); 
/* Создаём запрос на получение имён владельцев животных */
SELECT `owner` FROM `pet`;
/* Создаём запрос на сокращение количества выводимых строк */
SELECT DISTINCT `owner` FROM `pet`; 
/* Создаём запрос, используя оператор WHERE для комбинирования выбора строк и столбцов, где требуется получить информацию о датах рождения кошек и собак */
SELECT `name`, `species`, `birth` FROM `pet` WHERE `species` = 'dog' OR `species` = 'cat'; 
/* Создаём запрос на сортировку дат рождения */
SELECT `name`, `birth` FROM `pet` ORDER BY `birth`; 
/* Создаём запрос на сортировку в обратном порядке к имени столбца */
SELECT `name`, `birth` FROM `pet` ORDER BY `birth` DESC; 
/* Создаём запрос на сортировку нескольких столбцов, где сортируем сначала по типу животного, а затем по дате рождения. 
После этого располагаем наиболее молодых животных определённого типа в начале списка  */
SELECT `name`, `species`, `birth` FROM `pet` ORDER BY `species`, `birth` DESC; 
/* Создаём запрос на вывод даты рождения и возраста каждого животного, а также текущей даты */
SELECT `name`, `birth`, CURRENT_DATE, (YEAR(CURRENT_DATE)-YEAR(`birth`)) - (RIGHT(CURRENT_DATE,5) < RIGHT(`birth`,5)) AS `age` 
FROM `pet`; 
/* Создаём похожий запрос, но с сортировкой результата по имени */
SELECT `name`, `birth`, CURRENT_DATE, (YEAR(CURRENT_DATE)-YEAR(`birth`)) - (RIGHT(CURRENT_DATE,5) < RIGHT(`birth`,5)) AS `age` 
FROM `pet` ORDER BY `name`; 
/* Создаём похожий запрос, но с сортировкой результата по возрасту */
SELECT `name`, `birth`, CURRENT_DATE, (YEAR(CURRENT_DATE)-YEAR(`birth`)) - (RIGHT(CURRENT_DATE,5) < RIGHT(`birth`,5)) AS `age` 
FROM `pet` ORDER BY `age`; 
/* Создаём запрос, где определим возраст, которого достигли умершие животные на момент смерти */
SELECT `name`, `birth`, `death`, (YEAR(`death`) - YEAR(`birth`)) - (RIGHT(`death`,5) < RIGHT(`birth`,5)) AS `age` FROM `pet` 
WHERE `death` IS NOT NULL ORDER BY `age`; 
/* Создаём запрос, где определим, у каких животных дни рождения наступят в следующем месяце */
SELECT `name`, `birth`, MONTH(`birth`) FROM `pet`; 
/* Создаём запрос, который будет работать вне зависимости от того, какой сейчас месяц */
SELECT `name`, `birth` FROM `pet` WHERE MONTH(`birth`) = MONTH(DATE_ADD(NOW(), INTERVAL 1 MONTH)); 
/* Создаём похожий запрос, но прибавляем единицу к номеру месяца, следующего за текущим */
SELECT `name`, `birth` FROM `pet` WHERE MONTH(`birth`) = MOD(MONTH(NOW()), 12) + 1;
/* Создаём запрос на нахождение всех имён, начинающихся с буквы b */
SELECT * FROM `pet` WHERE `name` LIKE 'b%';
/* Создаём запрос на нахождение всех имён,  заканчивающихся на fy */
SELECT * FROM `pet` WHERE `name` LIKE '%fy';
/* Создаём запрос на нахождение всех имён, содержащие букву w */
SELECT * FROM `pet` WHERE `name` LIKE '%w%';
/* Создаём запрос на нахождение всех имён, содержащие ровно пять символов, при помощи шаблонного символа '_____' */
SELECT * FROM `pet` WHERE `name` LIKE '_____';
/* Создаём запрос, где посчитаем, сколько животных принадлежит каждому владельцу */
SELECT `owner`, COUNT(*) FROM `pet` GROUP BY `owner`;
/* Создаём запрос, где проверяем возможный вывод ошибки, если не использовать команду GROUP BY */
SELECT `owner`, COUNT(*) FROM `pet`;
/* Создаём запрос, где подсчитываем кол-во животных каждого вида */
SELECT `species`, COUNT(*) FROM `pet` GROUP BY `species`; 
/* Создаём запрос, где подсчитываем количество животных каждого пола */
SELECT `sex`, COUNT(*) FROM `pet` GROUP BY `sex`;
/* Создаём запрос, где подсчитываем количество животных каждого вида с учётом пола */
SELECT `species`, `sex`, COUNT(*) FROM `pet` GROUP BY `species`, `sex`; 
/* Создаём запрос, где подсчитываем количество кошек и собак c учётом пола */
SELECT `species`, `sex`, COUNT(*) FROM `pet` WHERE `species` = 'dog' OR `species` = 'cat' 
GROUP BY `species`, `sex`; 
/* Создаём запрос, где подсчитываем количество животных каждого пола с учётом только тех экземпляров, пол которых известен */
SELECT `species`, `sex`, COUNT(*) FROM `pet` WHERE `sex` IS NOT NULL GROUP BY `species`, `sex`; 
/* Создаём запрос, где узнаём, в каком возрасте животные давали приплод */
SELECT `pet`.`name`, (TO_DAYS(date) - TO_DAYS(birth)) / 365 AS `age`, `remark` FROM `pet`, `event` 
WHERE `pet`.`name` = `event`.`name` AND `type` = 'litter'; 
/* Создаём запрос, где нужно обнаружить среди животных "семейные пары" */
SELECT `p1`.`name`, `p1`.`sex`, `p2`.`name`, `p2`.`sex`, `p1`.`species` FROM `pet` AS `p1`, `pet` AS `p2` 
WHERE `p1`.`species` = `p2`.`species` AND `p1`.`sex` = 'f' AND `p2`.`sex` = 'm';
