CREATE DATABASE IF NOT EXISTS idolkpop;
CREATE TABLE IF NOT EXISTS videos(
    name VARCHAR(255),
    description TEXT,
    link VARCHAR(255),
    video_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(video_id)
);
CREATE TABLE IF NOT EXISTS(
    name VARCHAR(255),
    description TEXT,
    link VARCHAR(255),
    photo_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(photo_id)
);
CREATE TABLE IF NOT EXISTS genres(
    name VARCHAR(255) UNIQUE NOT NULL,
    genre_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(genre_id)
);
CREATE TABLE IF NOT EXISTS projects(
    name VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    project_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(project_id)
);
CREATE TABLE IF NOT EXISTS movies(
    name VARCHAR(255) NOT NULL,
    release_date DATE,
    movie_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(movie_id)
);
CREATE TABLE IF NOT EXISTS tv_shows(
    name VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE,
    tv_show_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(tv_show_id)
);
CREATE TABLE IF NOT EXISTS partners(
    name VARCHAR(255) NOT NULL,
    partner_id INT(11) NOT NULL AUTO_INCREMENT,
    label_id,
    PRIMARY KEY(partner_id)
);
CREATE TABLE IF NOT EXISTS founders(
    name VARCHAR(255) NOT NULL,
    birthday DATE,
    death DATE,
    founder_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(founder_id)
);
CREATE TABLE IF NOT EXISTS owner(
    name VARCHAR(255) NOT NULL,
    birthday DATE,
    death DATE,
    owner_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(owner_id)
);
CREATE TABLE IF NOT EXISTS company_types(
    name VARCHAR(255) NOT NULL,
    company_type_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(company_type_id)
);
CREATE TABLE IF NOT EXISTS blood_types(
    name VARCHAR(255) NOT NULL,
    blood_type_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(blood_type_id)
);
CREATE TABLE IF NOT EXISTS labels(
    name VARCHAR(255) NOT NULL,
    founded DATE,
    ended DATE,
    owner VARCHAR(255),
    parent_label
    num_acts INT(11),
    official_site VARCHAR(255),
    youtube_site VARCHAR(255),
    instagram_site VARCHAR(255),
    twitter_site VARCHAR(255),
    daum_site VARCHAR(255),
    naver_site VARCHAR(255),
    viki_site VARCHAR(255),
    audition_site VARCHAR(255),
    wikipedia_site VARCHAR(255),
    synopsis TEXT,
    street VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255),
    zip VARCHAR(255),
    slogan TEXT,
    rss_feed VARCHAR(255),
    stock_symbol VARCHAR(255),
    revenue INT(11),
    net_income INT(11),
    label_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(label_id)
    company_type_id
);
