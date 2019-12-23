use gold_inform;

-- Выборка Подсчитать количество новостей по источнику

select 
	   source_name,
	   count(*)
	   
from news join media_source on news.media_source_n_id = media_source.id
group by source_name;


-- Выборка Подсчитать какие медиа файлы постил менеджер

select 
	   profile.people_name,
	   media_types.media_name,
	   count(*)
	
from news join media_types on news.media_source_n_id = media_types.id
		  join profile on news.news_owner = profile.id

WHERE news.news_owner = 15
group by profile.people_name;




-- Выборка определить тройку самого популярного института, который заканчивали менеджеры

select 
	   e.name_of_university,
	   count(*) cnt
	
from education e join profile p on e.name_id = p.id
		  

group by p.people_name
order by cnt desc
limit 3;



-- Процедура - выборка людей с одинаковым гражданством 
-- { CALL gold_inform.identity_citizenship(19) }

DROP PROCEDURE IF EXISTS gold_inform.identity_citizenship;

DELIMITER $$
$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gold_inform`.`identity_citizenship`(in id_citizenship int)
begin
	
	-- общее гражданство
	select p2.id
	from profile p1
	join profile p2 
	    on p1.citizenship = p2.citizenship
	where p1.id = id_citizenship 
;
end $$
DELIMITER ;



-- Горизонтальное представление

CREATE or replace VIEW new_view1
AS 
  select *
  FROM education
  WHERE 
  faculty = 'et';
 select * from new_view1;



-- Вертикальное представление

CREATE or replace VIEW new_view2
AS 
  select name_of_university, faculty, id
  FROM education
  order by faculty 
  ;
 select * from new_view2;
 


-- Триггер

DELIMITER //

CREATE TRIGGER rows_count AFTER INSERT on work_experience
FOR EACH ROW
BEGIN
  SELECT COUNT(*) INTO @total FROM work_experience;
END//

DELIMITER ;

