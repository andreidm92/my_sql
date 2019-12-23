/*
 Эта база предназначена для отслеживания новостей от руководителей и менеджеров крупнейших
 инвестиционных компаний, которые они распространяют как через официльные медиа, так и 
 через социальные сети. 
    
 */


DROP DATABASE IF EXISTS gold_inform;
CREATE DATABASE gold_inform;
USE gold_inform;

-- KEY EXECUTIVES NAME

DROP TABLE IF EXISTS companies_name;
CREATE TABLE companies_name(
	id SERIAL PRIMARY KEY,
	company_name VARCHAR(100),

	INDEX companies_name_idx(company_name)
);


DROP TABLE IF EXISTS fin_statements;
CREATE TABLE fin_statements (
	id SERIAL PRIMARY KEY,
	company_f_id BIGINT UNSIGNED NOT NULL,
	year DATE,
    revenue BIGINT,
    gross_profit BIGINT,
    ebitda BIGINT,
    net_income BIGINT,
    fixed_assets BIGINT,
    current_assets BIGINT,
    current_liabilities BIGINT,
    lt_liabilities BIGINT,
    equity BIGINT,
    	
    FOREIGN KEY (company_f_id) REFERENCES companies_name(id)
);


DROP TABLE IF EXISTS profile;
CREATE TABLE profile (
	id SERIAL PRIMARY KEY,
	people_name VARCHAR(250),
	bithday DATE,
	gender CHAR(6),
	foto_file VARCHAR(250) DEFAULT NULL,
	citizenship VARCHAR(50),
	person_facebook_link VARCHAR(1000) DEFAULT NULL,
	person_instagram_link VARCHAR(1000) DEFAULT NULL,
	person_twitter_link VARCHAR(1000) DEFAULT NULL,
	
	INDEX profile_idx(people_name)
	
	
);


DROP TABLE IF EXISTS education;
CREATE TABLE education (
	id SERIAL primary key,
	name_id  BIGINT UNSIGNED NOT null,
	person_name VARCHAR(250),
	name_of_university VARCHAR(250),
	faculty VARCHAR(250),
	start_education DATE,
	end_education DATE,
	
	FOREIGN KEY (name_id) REFERENCES profile(id)
);

	
DROP TABLE IF EXISTS work_experience;
CREATE TABLE work_experience (
	name1_id BIGINT UNSIGNED NOT null,
	person1_name VARCHAR(250),
	company_id BIGINT UNSIGNED NOT null,
	job_position VARCHAR(250),
	start_work	DATE,
	end_work DATE,
	
	INDEX work_experience (person1_name),
	FOREIGN KEY (name1_id) REFERENCES profile(id),
	FOREIGN KEY (company_id) REFERENCES companies_name(id)
);



DROP TABLE IF EXISTS media_types;
	CREATE TABLE media_types(
	id  SERIAL PRIMARY KEY,
    media_name VARCHAR(255)
       
);


DROP TABLE IF EXISTS media_source;
	CREATE TABLE media_source(
	id SERIAL PRIMARY KEY,
    source_name VARCHAR(255)
       
);

DROP TABLE IF EXISTS news;
	CREATE TABLE news(
	id SERIAL PRIMARY KEY,
    news_date DATE,
    news_body text,
    media_file VARCHAR(255) DEFAULT null,
    news_link VARCHAR(1000) DEFAULT null,
    media_n_id BIGINT UNSIGNED NOT null,
    media_source_n_id BIGINT UNSIGNED NOT null,
    type_of_news VARCHAR(50),
    news_owner BIGINT UNSIGNED NOT null,
    
    INDEX news(news_owner),
    FOREIGN KEY (news_owner) REFERENCES profile(id),
    FOREIGN KEY (media_n_id) REFERENCES media_types(id),
    FOREIGN KEY (media_source_n_id) REFERENCES media_source(id)
);

DROP TABLE IF EXISTS likes;
CREATE TABLE likes(
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW()
    , FOREIGN KEY (user_id) REFERENCES profile(id)
    , FOREIGN KEY (media_id) REFERENCES news(id)
);

DROP TABLE IF EXISTS communities;
CREATE TABLE communities(
	id SERIAL PRIMARY KEY,
	name VARCHAR(150),

	INDEX communities_name_idx(name)
);

DROP TABLE IF EXISTS users_communities;
CREATE TABLE users_communities(
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,
  
	PRIMARY KEY (user_id, community_id), -- пїЅпїЅпїЅпїЅпїЅ пїЅпїЅ пїЅпїЅпїЅпїЅ 2 пїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ
    FOREIGN KEY (user_id) REFERENCES profile(id),
    FOREIGN KEY (community_id) REFERENCES communities(id)
);


DROP TABLE IF EXISTS list_facebook_friends;
	CREATE TABLE list_facebook_friends(
	id  SERIAL PRIMARY KEY,
    name_friends VARCHAR(255),
    
    INDEX list_facebook_friends(name_friends)
       
);


DROP TABLE IF EXISTS facebook_friends;
	CREATE TABLE facebook_friends(
	user_id BIGINT UNSIGNED NOT NULL,
	friend_id BIGINT UNSIGNED NOT NULL,
    
    PRIMARY KEY (user_id, friend_id), 
    FOREIGN KEY (user_id) REFERENCES profile(id),
    FOREIGN KEY (friend_id) REFERENCES list_facebook_friends(id)

);
