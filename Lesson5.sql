
/* Операторы, фильтрация, сортировка и ограничение */

/* Задача 1
1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

*/

update users 
set 
	created_at = now(),
	updated_at = now()
;

/* Задача 2
2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

*/

ALTER TABLE users
  MODIFY created_at datetime;
ALTER TABLE users
  MODIFY created_at datetime;



/* Задача 3
3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
*/

select 
  id,
  storehouse_id,
  product_id,
  created_at,
  updated_at,
  CASE
	WHEN value = 0 THEN 9999
	ELSE value
  end as total
 FROM
  storehouses_products
 order by total;

/* Агрегация данных */

/* Задача 1
1. Подсчитайте средний возраст пользователей в таблице users
*/
SELECT
  avg(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age
FROM
  users;


/* Задача 2
2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.

*/

