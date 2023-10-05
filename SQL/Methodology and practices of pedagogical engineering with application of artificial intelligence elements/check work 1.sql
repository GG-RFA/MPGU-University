/* Удаляем базу данных, если она существует */
DROP DATABASE IF EXISTS `CHECKWORK1`;
/* Создаём таблицу, даём ей название и настраиваем кодировку */
CREATE DATABASE `CHECKWORK1` COLLATE=`utf8mb4_unicode_ci`;
/* Используем таблицу для дальнейшей реализации */
USE `CHECKWORK1`;
/* Удаляем таблицы, если они существуют (это не является обязательным, если удаляем БД, но пусть будет для демонстрации знаний) */
DROP TABLE IF EXISTS `provider`;
DROP TABLE IF EXISTS `product`;
/* Создаём таблицу `provider` */
CREATE TABLE `provider` (
  `provider_id` INT(2) ZEROFILL,
  `provider_name` VARCHAR(20),
  `INN` INT,
  `date_of_registration` DATE,
  `address` VARCHAR(60),
  `phone` VARCHAR(20),
  /* Задаём первичный ключ */
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB;
/* Создаём таблицу `provider` */
CREATE TABLE `product` (
  `provider_id` INT(2) ZEROFILL,
  `product_id` INT(3) ZEROFILL,
  `article` INT,
  `product_name` VARCHAR(20),
  `product_count` INT,
  `price` INT,
  /* Задаём первичный ключ */
  PRIMARY KEY (`product_id`),
  /* Задаём внешний ключ для связки таблиц */
  CONSTRAINT `FK_product` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB;
/* Заполняем таблицу `provider` данными */
INSERT INTO `provider` (`provider_id`, `provider_name`, `INN`, `date_of_registration`, `address`, `phone`) VALUES
(01, 'ООО Медсервис', 77111, '2020-02-17', 'Ул. Чурилина, дом 3', '+7(905)135-87-67'),
(02, 'ООО Медсервис', 77201, '2018-06-25', 'Ул. Строителей, дом 1', '+7(966)384-81-24'),
(03, 'ИП Иванов И.И', 75365, '2020-10-01', 'Ул. Космонавтов, дом 5', '+7(928)422-87-36');
/* Заполняем таблицу `product` данными */
INSERT INTO `product` (`provider_id`, `product_id`,`article`,`product_name`,`product_count`,`price`) VALUES
(01, 001, 00111154, 'Бинт 5 см', 150, 10),
(02, 002, 12220000, 'Маска одноразовая', 5000, 20),
(03, 003, 80000456, 'Нош-па', 200, 50);
/* Создаём запрос, где выбираем/выводим названия, количество и цену всех товаров, поставляемых поставщиком ООО Медсервис, и сортируем полученные данные по алфавиту */
SELECT `product`.`product_name`, `product`.`product_count`, `product`.`price` FROM `product` 
INNER JOIN `provider` ON `product`.`provider_id` = `provider`.`provider_id` WHERE `provider`.`provider_name` = 'ООО Медсервис'
ORDER BY `product`.`product_name`;
/* Создаём запрос, где подсчитываем количество товаров, цена которых меньше 1000 руб., но при этом больше 100 руб. */
SELECT COUNT(*) FROM `product` WHERE `price` > 100 AND `price` < 1000;
/* Создаём запрос, где выбираем/выводим названия товаров и их артикул, количество которых больше чем 500 шт. на складе */
SELECT `product`.`product_name`, `product`.`article` FROM `product` WHERE `product_count` > 500;
/* Отключаем режим безопасного обновления для избежания ошибки */
SET SQL_SAFE_UPDATES = 0;
/* Создаём запрос, где удаляем товары, цена которых меньше 10 руб. и в названии есть буквосочетание "энерго" */
DELETE FROM `product` WHERE `price` < 10 AND `product_name` LIKE '%энерго%';
/* Включаем режим безопасного обновления */
SET SQL_SAFE_UPDATES = 1;
/* Создаём запрос, где выводим всю информацию о товарах и название их поставщиков */
SELECT * FROM `product` INNER JOIN `provider` ON `product`.`provider_id` = `provider`.`provider_id`;