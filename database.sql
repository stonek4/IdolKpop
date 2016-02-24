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
    PRIMARY KEY(partner_id)
);
CREATE TABLE IF NOT EXISTS founders(
    name VARCHAR(255) NOT NULL,
    birthday DATE,
    death DATE,
    founder_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(founder_id)
);
CREATE TABLE IF NOT EXISTS labels(
    
);
