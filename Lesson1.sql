

/* Задача 1
Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
*/
-- Создал файл my.cnf и положил его в директорию C:\Program Files\MySQL\MySQL Server 8.0
-- Код  my.cnf
[mysql]
user=root
password=Rerehepf19

/* Задача 2
Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
*/

DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

create table users (
	id INT auto_increment not null primary key,
	name VARCHAR(150) unique
);

/* Задача 3
Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
*/
cd "C:\Program Files\MySQL\MySQL Server 8.0\bin"
mysqldump -uroot -p example > example.sql
mysql -uroot -p sample < database.sql