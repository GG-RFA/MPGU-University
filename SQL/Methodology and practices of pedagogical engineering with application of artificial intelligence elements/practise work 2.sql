/* Удаляем базу данных, если она существует */
DROP DATABASE IF EXISTS `PRODUCTS`;
/* Создаём таблицу, даём ей название и настраиваем кодировку */
CREATE DATABASE `PRODUCTS` COLLATE=`utf8mb4_unicode_ci`;
/* Используем таблицу для дальнейшей реализации */
USE `PRODUCTS`;
/* Создаём таблицу `business_menu` */
CREATE TABLE `business_menu` (
  `BL` INT,
  `name` VARCHAR(60),
  `basis` VARCHAR(60),
  `type` VARCHAR(60),
  `price_of_portion` INT,
  /* Задаём первичный ключ */
  PRIMARY KEY (`BL`)
) ENGINE=InnoDB;
/* Создаём таблицу `business_menu` */
CREATE TABLE `products` (
  `BL` INT,
  `PR` INT,
  `product` VARCHAR(60),
  `protein` INT,
  `fats` INT,
  `carbohydrates` INT,
  `K` INT,
  `Ca` INT,
  `Na` INT,
  `B2` NUMERIC(10,1),
  `PP`  NUMERIC(10,1),
  `C` int,
  /* Задаём первичный ключ */
  PRIMARY KEY (`BL`, `PR`),
   /* Задаём внешний ключ для связки таблиц */
  CONSTRAINT `FK_products` FOREIGN KEY (`BL`) REFERENCES `business_menu` (`BL`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
/* Заполняем таблицу `business_menu` данными */
INSERT INTO `business_menu` (`BL`, `name`, `basis`, `type`, `price_of_portion`) VALUES
(1, 'Омлет', 'Яйца', 'Горячее блюдо', 100),
(2, 'Сырная тарелка', 'Сыры', 'Закуска', 150),
(3, 'Мясная тарелка', 'Мясо', 'Закуска', 200),
(4, 'Овощная тарелка', 'Овощи', 'Закуска', 120),
(5, 'Фруктовая тарелка', 'Фрукты', 'Закуска', 130),
(6, 'Куриные крылья', 'Курица', 'Горячее блюдо', 180),
(7, 'Свинина на гриле', 'Свинина', 'Горячее блюдо', 250),
(8, 'Лосось на пару', 'Лосось', 'Горячее блюдо', 300),
(9, 'Ризотто с грибами', 'Рис', 'Горячее блюдо', 220),
(10, 'Жаркое по-деревенски', 'Корейка свиная', 'Горячее блюдо', 230),
(11, 'Чай черный', 'Вода, чайные листья', 'Напиток', 50),
(12, 'Кофе эспрессо', 'Кофейные зерна, вода', 'Напиток', 80),
(13, 'Сок апельсиновый', 'Апельсины', 'Напиток', 100),
(14, 'Тирамису', 'Сыр маскарпоне, бисквиты, кофе', 'Десерт', 150),
(15, 'Панна-котта', 'Сливки, желатин, сахар', 'Десерт', 120),
(16, 'Рулет Баунти', 'Печенье, какао-порошок, сахар', 'Десерт', 140),
(17, 'Классический чизкейк', 'Крекер, масло сливочное, сахар', 'Десерт', 160);
/* Заполняем таблицу `products` данными */
INSERT INTO `products` (`BL`, `PR`, `product`, `protein`, `fats`, `carbohydrates`, `K`, `Ca`, `Na`, `B2`, `PP`, `C`) VALUES
(1, 1, 'Говядина', 189, 124, 0, 3150, 90, 600, 1.5, 28.0, 0),
(2, 2, 'Судак', 190, 80, 0, 1870, 270, 0, 1.1, 10.0, 30),
(3, 3, 'Масло', 60, 825, 90, 230, 220, 740, 0.1, 1.0, 0),
(4, 4, 'Майонез', 31, 670, 26, 480, 280, 0, 0.0, 0.0, 0),
(5, 5, 'Яйца', 127, 115, 7, 1530, 550, 710, 4.4, 1.9, 0),
(6, 6, 'Сметана', 26, 300, 28, 950, 850, 320, 1.0, 1.0, 2),
(7, 7, 'Молоко', 28, 32, 47, 1460, 1210, 1500, 1.3, 1.0, 10),
(8, 8, 'Творог', 167, 90, 13, 1120, 1640, 1410, 2.7, 4.0, 5),
(9, 9, 'Морковь', 13, 1, 70, 2000, 510, 210, 0.7, 9.9, 50),
(10, 10, 'Лук', 17, 0, 95, 1750, 310, 180, 0.2, 2.0, 100),
(11, 11, 'Помидоры', 6, 0, 42, 290, 140, 400, 0.4, 5.3, 250),
(12, 12, 'Зелень', 9, 0, 20, 340, 275, 75, 1.2, 4.0, 380),
(13, 13, 'Рис', 70, 6, 773, 540, 240, 260, 0.4, 16.0, 0),
(14, 14, 'Мука', 106, 13, 732, 1760, 240, 120, 1.2, 22.0, 0),
(15, 15, 'Яблоки', 4, 0, 113, 2480, 160, 260, 0.3, 3.0, 130),
(16, 16, 'Сахар', 0, 0, 998, 30, 20, 10, 0.0, 0.0, 0),
(17, 17, 'Кофе', 127, 36, 9, 9710, 180, 180, 0.3, 1.8, 0);
/* Создаём запросы, где выводим тремя разными способами все блюда, стоимость каждого из которых находится в диапазоне от 10 до 99 рублей */
/* 1-й способ */
SELECT * FROM `business_menu` WHERE `price_of_portion` BETWEEN 10 AND 99;
/* 2-й способ */
SELECT * FROM `business_menu` WHERE `price_of_portion` >= 10 AND `price_of_portion` <= 99;
/* 3-й способ */
SELECT * FROM `business_menu` WHERE `price_of_portion` IN (SELECT `price_of_portion` FROM `business_menu` 
WHERE `price_of_portion` >= 10 AND `price_of_portion` <= 99);
/* Создаём запрос, где вычисляем количество блюд каждого вида в порядке, обратном алфавиту */
SELECT `type`, COUNT(*) AS `count` FROM `business_menu` GROUP BY `type` ORDER BY `type` DESC;
/* Создаём запрос, где выводим все продукты, не содержащие жиров, упорядочив их основу по алфавиту */
SELECT `products`.`product`, `products`.`protein`, `products`.`fats`, `products`.`carbohydrates`, `products`.`K`, `products`.`Ca`, `products`.`Na`, 
`products`.`B2`, `products`.`PP`, `products`.`C` FROM `products` JOIN `business_menu` ON `products`.`BL` = `business_menu`.`BL` WHERE `products`.`fats` = 0 
ORDER BY `business_menu`.`basis` ASC;
/* Создаём запрос, где выводим содержание белков и углеводов для каждого блюда */
SELECT `name`, `protein`, `carbohydrates` FROM `business_menu`LEFT JOIN `products` ON `basis` = `product`;
/* Создаём запрос, где рассчитываем калорийность каждого блюда по формуле: ((Белки + Углеводы)*4.1 + Жиры*9.3) */
SELECT `name`, ((`protein` + `carbohydrates`) * 4.1 + `fats` * 9.3) AS `calories` FROM `business_menu`
LEFT JOIN `products` ON `basis` = `product`;
/* Отключаем режим безопасного обновления для избежания ошибки */
SET SQL_SAFE_UPDATES = 0;
/* Создаём запрос, где обновляем данные в таблице: уменьшаем в 2 раза стоимость блюд на основе молока */
UPDATE `business_menu` SET `price_of_portion` = `price_of_portion` / 2 WHERE `basis` = 'Молоко';
/* Включаем режим безопасного обновления */
SET SQL_SAFE_UPDATES = 1;
/* Отключаем режим безопасного обновления для избежания ошибки */
SET SQL_SAFE_UPDATES = 0;
/* Создаём запрос, где удаляем из таблицы записи о блюдах, в состав которых входит картофель */
DELETE FROM `business_menu` WHERE `basis` IN (SELECT `product` FROM `products` WHERE `product` = 'Картофель');
/* Включаем режим безопасного обновления */
SET SQL_SAFE_UPDATES = 1;