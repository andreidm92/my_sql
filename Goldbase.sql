DROP DATABASE IF EXISTS gold_inform;
CREATE DATABASE gold_inform;
USE gold_inform;

DROP TABLE IF EXISTS companies_name;
CREATE TABLE companies_name(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),

	INDEX companies_name_idx(name)
);

DROP TABLE IF EXISTS fin_statements;
CREATE TABLE fin_statements (
	company_id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    company_name VARCHAR(50),
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
    number_shares BIGINT,
    current_share_value BIGINT,	
    INDEX company_index(company_name),
    FOREIGN KEY (company_name) REFERENCES companies_name(name)
);

DROP TABLE IF EXISTS people_finsector;
CREATE TABLE people_finsector (
	user_id SERIAL PRIMARY KEY,
	user_name VARCHAR(50),
    gender CHAR(1),
    birthday DATE,
    photo_id BIGINT UNSIGNED NULL,
    citizenship VARCHAR(100),
    current_company_name VARCHAR(50),
    current_position VARCHAR(50),
    previous_company_name VARCHAR(50),
    person_facebook_link VARCHAR(150),
    person_Instagram_link VARCHAR(150),
    person_twitter_link VARCHAR(150),

    FOREIGN KEY (current_company_name) REFERENCES companies_name(name),
    FOREIGN KEY (previous_company_name) REFERENCES companies_name(name)
);

	DROP TABLE IF EXISTS media_name;
	CREATE TABLE media_name(
	media_name_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    created_at DATETIME DEFAULT NOW()
    
);

DROP TABLE IF EXISTS media_types;
	CREATE TABLE media_types(
	media_id SERIAL PRIMARY KEY,
    type_name VARCHAR(255),
    created_at DATETIME DEFAULT NOW()
    
);

DROP TABLE IF EXISTS person_news;
	CREATE TABLE person_news(
	news_id SERIAL PRIMARY KEY,
    news_name VARCHAR(255),
    news_media VARCHAR(255),
    news_body VARCHAR(500),
    person_id BIGINT UNSIGNED NOT NULL,
    person_name VARCHAR(255),
    news_date DATE,
    created_at DATETIME DEFAULT NOW(),
    
    -- FOREIGN KEY (news_name) REFERENCES media_name(name),
    -- FOREIGN KEY (news_media) REFERENCES media_types(type_name)
    FOREIGN KEY (person_id) REFERENCES people_finsector(user_id)
);