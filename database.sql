CREATE DATABASE IF NOT EXISTS idolkpop;
CREATE TABLE IF NOT EXISTS videos(
    name VARCHAR(255),
    description TEXT,
    link VARCHAR(255),
    video_id INT(11) NOT NULL AUTO_INCREMENT,
    label_id INT(11),
    act_id INT(11),
    idol_id INT(11),
    FOREIGN KEY(label_id) REFERENCES labels(label_id),
    FOREIGN KEY(act_id) REFERENCES acts(act_id),
    FOREIGN KEY(idol_id) REFERENCES idols(idol_id),
    PRIMARY KEY(video_id)
);
CREATE TABLE IF NOT EXISTS photos(
    name VARCHAR(255),
    description TEXT,
    link VARCHAR(255),
    photo_id INT(11) NOT NULL AUTO_INCREMENT,
    label_id INT(11),
    act_id INT(11),
    idol_id INT(11),
    FOREIGN KEY(label_id) REFERENCES labels(label_id),
    FOREIGN KEY(act_id) REFERENCES acts(act_id),
    FOREIGN KEY(idol_id) REFERENCES idols(idol_id),
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
CREATE TABLE IF NOT EXISTS albums(
    name VARCHAR(255) NOT NULL,
    release_date DATE,
    chart_place INT(11),
    copies_sold INT(11),
    num_songs INT(11),
    album_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(album_id)
);
CREATE TABLE IF NOT EXISTS songs(
    name VARCHAR(255) NOT NULL,
    release_date DATE,
    track_num INT(11),
    chart_place INT(11),
    copies_sold INT(11),
    album_id INT(11),
    song_id INT(11) NOT NULL AUTO_INCREMENT,
    FOREIGN KEY(album_id) REFERENCES albums(album_id),
    PRIMARY KEY(song_id)
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
CREATE TABLE IF NOT EXISTS gender_types(
    name VARCHAR(255) NOT NULL,
    gender_type_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(gender_type_id)
);
CREATE TABLE IF NOT EXISTS blood_types(
    name VARCHAR(255) NOT NULL,
    blood_type_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(blood_type_id)
);
CREATE TABLE IF NOT EXISTS managers(
    name VARCHAR(255) NOT NULL,
    manager_id INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(manager_id)
);
CREATE TABLE IF NOT EXISTS labels(
    name VARCHAR(255) NOT NULL,
    founded DATE,
    ended DATE,
    owner VARCHAR(255),
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
    company_type_id INT(11),
    FOREIGN KEY company_type_id REFERENCES company_types(company_type_id),
    PRIMARY KEY(label_id)
);
CREATE TABLE IF NOT EXISTS acts(
    name VARCHAR(255) NOT NULL,
    nickname VARCHAR(255),
    korean_name VARCHAR(255),
    fandom_name VARCHAR(255),
    official_color VARCHAR(255),
    founded DATE,
    disbanded DATE,
    num_members INT(11),
    official_site VARCHAR(255),
    youtube_site VARCHAR(255),
    instagram_site VARCHAR(255),
    twitter_site VARCHAR(255),
    daum_site VARCHAR(255),
    naver_site VARCHAR(255),
    viki_site VARCHAR(255),
    wikipedia_site VARCHAR(255),
    official_fan_site VARCHAR(255),
    synopsis TEXT,
    rss_feed VARCHAR(255),
    gender_id INT(11),
    act_id INT(11) NOT NULL AUTO_INCREMENT,
    FOREIGN KEY gender_id REFERENCES gender_types(gender_type_id),
    PRIMARY KEY(act_id)
);
CREATE TABLE IF NOT EXISTS idols(
    name VARCHAR(255) NOT NULL,
    stage_name VARCHAR(255),
    korean_name VARCHAR(255),
    birthday DATE,
    birth_city VARCHAR(255),
    birth_country VARCHAR(255),
    death DATE,
    group_role VARCHAR(255),
    official_site VARCHAR(255),
    youtube_site VARCHAR(255),
    instagram_site VARCHAR(255),
    twitter_site VARCHAR(255),
    daum_site VARCHAR(255),
    naver_site VARCHAR(255),
    viki_site VARCHAR(255),
    wikipedia_site VARCHAR(255),
    official_fan_site VARCHAR(255),
    synopsis TEXT,
    rss_feed VARCHAR(255),
    gender_id INT(11),
    idol_id INT(11) NOT NULL AUTO_INCREMENT,
    FOREIGN KEY gender_id REFERENCES gender_types(gender_type_id),
    PRIMARY KEY(idol_id)
);
CREATE TABLE IF NOT EXISTS acts_idols(
    idol_id INT(11) NOT NULL,
    act_id INT(11) NOT NULL,
    joined DATE NOT NULL,
    left DATE,
    FOREIGN KEY(idol_id) REFERENCES idols(idol_id),
    FOREIGN KEY(act_id) REFERENCES acts(act_id),
    CONSTRAINT pk_acts_idols PRIMARY KEY(idol_id, act_id, joined)
);
CREATE TABLE IF NOT EXISTS acts_acts(
    sub_act_id INT(11) NOT NULL,
    parent_act_id INT(11) NOT NULL,
    joined DATE NOT NULL,
    left DATE,
    FOREIGN KEY(sub_act_id) REFERENCES acts(act_id),
    FOREIGN KEY(parent_act_id) REFERENCES acts(act_id),
    CONSTRAINT pk_acts_acts PRIMARY KEY(parent_act_id, sub_act_id, joined)
);
CREATE TABLE IF NOT EXISTS labels_acts(
    act_id INT(11) NOT NULL,
    label_id INT(11) NOT NULL,
    joined DATE NOT NULL,
    left DATE,
    FOREIGN KEY(act_id) REFERENCES acts(act_id),
    FOREIGN KEY(label_id) REFERENCES labels(label_id),
    CONSTRAINT pk_labels_acts PRIMARY KEY(act_id, label_id, joined)
);
CREATE TABLE IF NOT EXISTS labels_labels(
    sub_label_id INT(11) NOT NULL,
    parent_label_id INT(11) NOT NULL,
    joined DATE NOT NULL,
    left DATE,
    FOREIGN KEY(sub_label_id) REFERENCES labels(label_id),
    FOREIGN KEY(parent_label_id) REFERENCES labels(label_id),
    CONSTRAINT pk_labels_labels PRIMARY KEY(parent_label_id, sub_label_id, joined)
);
