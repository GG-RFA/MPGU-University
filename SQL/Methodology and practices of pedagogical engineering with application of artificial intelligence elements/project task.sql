/* Удаляем базу данных, если она существует */
DROP DATABASE IF EXISTS `SCHOOL`;
/* Создаём таблицу, даём ей название и настраиваем кодировку */
CREATE DATABASE `SCHOOL` COLLATE=`utf8mb4_unicode_ci`;
/* Используем таблицу для дальнейшей реализации */
USE `SCHOOL`;
/* Создаём таблицу `pupils` */
CREATE TABLE `pupils` (
`pupil_id` INT,
`full_name` VARCHAR(60),
`photo` VARCHAR(521),
`email` VARCHAR(60),
`phone_number` VARCHAR(20),
`additional_information` VARCHAR(255),
/* Задаём первичный ключ */
PRIMARY KEY (`pupil_id`)
) ENGINE=InnoDB;
/* Создаём таблицу `classes` */
CREATE TABLE `classes` (
`pupil_id` INT,
`class_id` INT,
`name_class` VARCHAR(5),
`class_teacher` VARCHAR(60),
`number_of_students` INT,
/* Задаём первичные ключи */
PRIMARY KEY (`pupil_id`, `class_id`),
/* Задаём внешний ключ для связки таблиц */
CONSTRAINT `FK_classes` FOREIGN KEY (`pupil_id`) 
REFERENCES `pupils` (`pupil_id`) 
ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
/* Создаём таблицу `disciplines` */
CREATE TABLE `disciplines` (
`discipline_id` INT,
`discipline_name` VARCHAR(60),
`teacher_name` VARCHAR(128),
/* Задаём первичный ключ */
PRIMARY KEY(`discipline_id`)
) ENGINE=InnoDB;
/* Создаём таблицу `marks` */
CREATE TABLE `marks` (
`pupil_id` INT,
`discipline_id` INT,
`first_quarter_mark` INT,
`second_quarter_mark` INT,
`third_quarter_mark` INT,
`fourth_quarter_mark` INT,
`annual_mark` INT,
/* Задаём первичные ключи */
PRIMARY KEY (`pupil_id`, `discipline_id`),
/* Задаём внешние ключи для связки таблиц */
CONSTRAINT `FK_marks1` FOREIGN KEY (`pupil_id`) 
REFERENCES `pupils` (`pupil_id`) 
ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT `FK_marks2` FOREIGN KEY (`discipline_id`) 
REFERENCES `disciplines` (`discipline_id`) 
ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
/* Заполняем таблицу `pupils` данными */
INSERT INTO `pupils` (`pupil_id`,`full_name`,`photo`,`email`,`phone_number`,`additional_information`) VALUES
(12, 'Кабанов Мартин Тимофеевич', 'https://images.unsplash.com/photo-1695740022137-8bed179ebdcb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxODY2Nzh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2OTc3MzM2MTF8&ixlib=rb-4.0.3&q=80&w=1080', 'prefeixoxaju-6470@yopmail.com4', '+7 (495) 691-24-38', 'Отсутствует'),
(66, 'Лаврентьев Тимур Игоревич', 'https://images.unsplash.com/photo-1694714565699-0183e7de39d9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxODY2Nzh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2OTc3MzM2NjB8&ixlib=rb-4.0.3&q=80&w=1080', 'fonuppaheji-2963@yopmail.com', '+7 (495) 250-82-61', 'Отсутствует'),
(85, 'Наумов Юрий Максимович', 'https://images.unsplash.com/photo-1696512651954-b88254d9d62c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxODY2Nzh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2OTc3MzM2NzF8&ixlib=rb-4.0.3&q=80&w=1080', 'gipikaubrouni-1543@yopmail.com', '+7 (495) 640-54-64', 'Отсутствует'),
(49, 'Орехов Артур Аркадьевич', 'https://images.unsplash.com/photo-1697213799599-de2d228124e6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxODY2Nzh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2OTc3MzM2Nzl8&ixlib=rb-4.0.3&q=80&w=1080', 'yepremouceiffu-4100@yopmail.com', '+7 (495) 513-61-16', 'Отсутствует'),
(34, 'Доронин Любомир Робертович', 'https://images.unsplash.com/photo-1695220539847-31f3a2453bdd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxODY2Nzh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2OTc3MzM2ODV8&ixlib=rb-4.0.3&q=80&w=1080', 'epragrauyauddou-9933@yopmail.com', '+7 (495) 700-97-78', 'Отсутствует'),
(83, 'Кононова Ванесса Артемовна', 'https://images.unsplash.com/photo-1696865521494-a92c11ca773c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxODY2Nzh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2OTc3MzM2OTV8&ixlib=rb-4.0.3&q=80&w=1080', 'kehaddimmiheu-1625@yopmail.com', '+7 (495) 285-51-97', 'Отсутствует'),
(61, 'Мартынова Вида Мэлсовна', 'https://images.unsplash.com/photo-1694439977533-e047e5c56c67?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxODY2Nzh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2OTc3MzM3MDJ8&ixlib=rb-4.0.3&q=80&w=1080', 'duqueufiwoiyau-4896@yopmail.com', '+7 (495) 988-54-89', 'Отсутствует'),
(8, 'Логинова Калерия Яковлевна', 'https://images.unsplash.com/photo-1693683197888-81eeadae982c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxODY2Nzh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2OTc3MzM3MDl8&ixlib=rb-4.0.3&q=80&w=1080', 'leigoisseigretti-9358@yopmail.com', '+7 (495) 454-87-61', 'Отсутствует'),
(84, 'Козлова Жюли Арсеньевна', 'https://images.unsplash.com/photo-1695334650970-21f964219461?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxODY2Nzh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2OTc3MzM3MjN8&ixlib=rb-4.0.3&q=80&w=1080', 'xolemmoucacou-4873@yopmail.com', '+7 (495) 535-34-82', 'Отсутствует'),
(26, 'Полякова Лейла Андреевна', 'https://images.unsplash.com/photo-1695072331836-89ac8f96f922?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxODY2Nzh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2OTc3MzM3Mjl8&ixlib=rb-4.0.3&q=80&w=1080', 'cenoussiziyo-5849@yopmail.com', '+7 (495) 778-32-09', 'Отсутствует');
/* Заполняем таблицу `classes` данными */
INSERT INTO `classes` (`pupil_id`, `class_id`, `name_class`, `class_teacher`, `number_of_students`) VALUES
(12, 101, '9A', 'Дроздова Нина Мироновна', 20),
(66, 202, '9Б', 'Захарова Артемида Куприяновна', 22),
(85, 334, '9В', 'Мельникова Алия Еремеевна', 24),
(49, 445, '10А', 'Уварова Властилина Игоревна', 23),
(34, 505, '10Б', 'Федосеева Элина Парфеньевна', 27),
(83, 607, '10В', 'Зыкова Флора Петровна', 26),
(61, 710, '11А', 'Шарапова Гелианна Лукьяновна', 25),
(8, 807, '11Б', 'Князева Дарина Пётровна', 30),
(84, 909, '11В', 'Лебедева Лили Митрофановна', 21),
(26, 104, '8А', 'Кудрявцева Клара Валентиновна', 20);
/* Заполняем таблицу `disciplines` данными */
INSERT INTO `disciplines` (`discipline_id`, `discipline_name`, `teacher_name`) VALUES
(61, 'Алгебра', 'Андреев Устин Эдуардович'),
(15, 'Обществознание', 'Кудряшов Наум Макарович'),
(3, 'Русский язык', 'Цветков Дональд Сергеевич'),
(19, 'Английский язык', 'Афанасьев Филипп Федосеевич'),
(30, 'Физика', 'Фокин Мстислав Аркадьевич'),
(73, 'Химия', 'Красильникова Илона Натановна'),
(53, 'Правоведение', 'Самсонова Санда Георгиевна'),
(39, 'Геометрия', 'Крылова Анисья Максимовна'),
(63, 'История', 'Самсонова Эрида Михайловна'),
(34, 'Биология', 'Кулакова Иоанна Робертовна');
/* Заполняем таблицу `marks` данными */
INSERT INTO `marks` (`pupil_id`, `discipline_id`, `first_quarter_mark`, `second_quarter_mark`, `third_quarter_mark`, `fourth_quarter_mark`, `annual_mark`) VALUES
(12, 61, 4, 5, 4, 5, 5),
(66, 15, 4, 3, 4, 4, 4),
(85, 3, 3, 3, 4, 4, 4),
(49, 19, 5, 5, 4, 5, 5),
(34, 30, 5, 4, 4, 4, 4),
(83, 73, 3, 4, 4, 3, 3),
(61, 53, 4, 3, 4, 4, 4),
(8, 39, 4, 4, 5, 5, 4),
(84, 63, 3, 4, 5, 5, 5),
(26, 34, 5, 4, 4, 4, 4);
/* Создаём запрос на отображение всех таблиц в БД */
SHOW TABLES;
/* Создаём запросы на отображение структуры каждой таблицы */
DESCRIBE `pupils`;
DESCRIBE `classes`;
DESCRIBE `disciplines`;
DESCRIBE `marks`;
/* Создаём запрос на просмотр всех данных в таблице `pupils` */
SELECT * FROM `pupils`;
/* Создаём запрос на вывод поля с данными об ученике, ФИО которого 'Кабанов Мартин Тимофеевич' */
SELECT * 
FROM `pupils` 
WHERE `full_name` = 'Кабанов Мартин Тимофеевич'; 
/* Создаём запрос на получение ФИО преподавателей */
SELECT `teacher_name` 
FROM `disciplines`;
/* Создаём запрос на обновление оценки за первую четверть у конкретного ученика */
UPDATE `marks` 
SET `first_quarter_mark` = 4 
WHERE `pupil_id` = 85;
/* Создаём запрос на подсчёт количества классов, в которых количество учеников находится в диапазоне от 25 до 30 */
SELECT `class_teacher`, `number_of_students`
FROM `classes`
WHERE `number_of_students` >= 25 AND `number_of_students` <= 30;
/* Создаём запрос на получение ФИО учителей, отчество которых заканчивается на 'евич' */
SELECT * 
FROM `disciplines` 
WHERE `teacher_name` LIKE '%евич';
/* Создаём запрос на получение ФИО учителей, фамилия которых начинается на 'К%' */
SELECT * 
FROM `disciplines` 
WHERE `teacher_name` LIKE 'К%';
/* Создаём запрос на получение округлённого среднего количества учеников в классах */
SELECT ROUND(AVG(`number_of_students`))
FROM `classes`;