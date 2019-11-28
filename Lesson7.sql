
/* Тема “Сложные запросы” */

/* Задача 1
1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/
Select 
	user_id,
	count(*),
	(select name from users where id = user_id) as name
from orders group by user_id;



/* Задача 2
2. Выведите список товаров products и разделов catalogs, который соответствует товару.
*/

select 
	name,
	description,
	catalog_id,
	(select name from catalogs where id = catalog_id) as catalog_name
from products; 

