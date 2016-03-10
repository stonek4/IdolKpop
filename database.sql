CREATE TABLE IF NOT EXISTS genres(
  genre_id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) UNIQUE NOT NULL,
  PRIMARY KEY(genre_id)
);
CREATE TABLE IF NOT EXISTS projects(
  project_id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  start_date DATE,
  end_date DATE,
  PRIMARY KEY(project_id)
);
CREATE TABLE IF NOT EXISTS movies(
  movie_id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  release_date DATE,
  PRIMARY KEY(movie_id)
);
CREATE TABLE IF NOT EXISTS tv_shows(
  tv_show_id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  start_date DATE,
  end_date DATE,
  PRIMARY KEY(tv_show_id)
);
CREATE TABLE IF NOT EXISTS albums(
  album_id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  album_art VARCHAR(255),
  release_date DATE,
  chart_place INT(11),
  copies_sold INT(11),
  num_songs INT(11),
  PRIMARY KEY(album_id)
);
CREATE TABLE IF NOT EXISTS songs(
  song_id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  release_date DATE,
  track_num INT(11),
  chart_place INT(11),
  copies_sold INT(11),
  album_id INT(11),
  mv_link VARCHAR(255),
  FOREIGN KEY(album_id) REFERENCES albums(album_id),
  PRIMARY KEY(song_id)
);
CREATE TABLE IF NOT EXISTS partners(
  partner_id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY(partner_id)
);
CREATE TABLE IF NOT EXISTS labels(
  label_id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  full_name VARCHAR(255),
  korean_name VARCHAR(255),
  founded DATE,
  ended DATE,
  owner VARCHAR(255),
  official_site VARCHAR(255),
  youtube_site VARCHAR(255),
  instagram_site VARCHAR(255),
  twitter_site VARCHAR(255),
  daum_site VARCHAR(255),
  facebook_site VARCHAR(255),
  weibo_site VARCHAR(255),
  audition_site VARCHAR(255),
  wikipedia_site VARCHAR(255),
  introduction_video VARCHAR(255),
  synopsis TEXT,
  house_number VARCHAR(255),
  dong VARCHAR(255),
  city VARCHAR(255),
  metropolitan VARCHAR(255),
  country VARCHAR(255),
  slogan TEXT,
  rss_feed VARCHAR(255),
  revenue INT(11),
  net_income INT(11),
  company_type VARCHAR(255),
  PRIMARY KEY(label_id)
);
CREATE TABLE IF NOT EXISTS acts(
  act_id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  nickname VARCHAR(255),
  korean_name VARCHAR(255),
  fandom_name VARCHAR(255),
  official_color VARCHAR(255),
  founded DATE,
  disbanded DATE,
  manager VARCHAR(255),
  official_site VARCHAR(255),
  youtube_site VARCHAR(255),
  instagram_site VARCHAR(255),
  twitter_site VARCHAR(255),
  daum_site VARCHAR(255),
  facebook_site VARCHAR(255),
  weibo_site VARCHAR(255),
  wikipedia_site VARCHAR(255),
  official_fan_site VARCHAR(255),
  synopsis TEXT,
  rss_feed VARCHAR(255),
  gender VARCHAR(255),
  PRIMARY KEY(act_id)
);
CREATE TABLE IF NOT EXISTS idols(
  idol_id INT(11) NOT NULL AUTO_INCREMENT,
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
  facebook_site VARCHAR(255),
  weibo_site VARCHAR(255),
  wikipedia_site VARCHAR(255),
  official_fan_site VARCHAR(255),
  introduction_video VARCHAR(255),
  synopsis TEXT,
  rss_feed VARCHAR(255),
  gender VARCHAR(255),
  blood_type VARCHAR(255),
  PRIMARY KEY(idol_id)
);
CREATE TABLE IF NOT EXISTS photos(
  photo_id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  description TEXT,
  link VARCHAR(255),
  label_id INT(11),
  act_id INT(11),
  idol_id INT(11),
  FOREIGN KEY(label_id) REFERENCES labels(label_id),
  FOREIGN KEY(act_id) REFERENCES acts(act_id),
  FOREIGN KEY(idol_id) REFERENCES idols(idol_id),
  PRIMARY KEY(photo_id)
);
CREATE TABLE IF NOT EXISTS music_shows(
  music_show_id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  episode INT(11),
  show_date DATE,
  winning_act INT(11),
  winning_idol INT(11),
  tv_show_id INT(11),
  FOREIGN KEY(winning_act) REFERENCES acts(act_id),
  FOREIGN KEY(winning_idol) REFERENCES idols(idol_id),
  FOREIGN KEY(tv_show_id) REFERENCES tv_shows(tv_show_id),
  PRIMARY KEY(music_show_id, name, episode)
);
CREATE TABLE IF NOT EXISTS acts_idols(
  idol_id INT(11) NOT NULL,
  act_id INT(11) NOT NULL,
  joined DATE NOT NULL,
  separated DATE,
  FOREIGN KEY(idol_id) REFERENCES idols(idol_id),
  FOREIGN KEY(act_id) REFERENCES acts(act_id),
  CONSTRAINT pk_acts_idols PRIMARY KEY(idol_id, act_id, joined)
);
CREATE TABLE IF NOT EXISTS acts_acts(
  sub_act_id INT(11) NOT NULL,
  parent_act_id INT(11) NOT NULL,
  joined DATE NOT NULL,
  separated DATE,
  FOREIGN KEY(sub_act_id) REFERENCES acts(act_id),
  FOREIGN KEY(parent_act_id) REFERENCES acts(act_id),
  CONSTRAINT pk_acts_acts PRIMARY KEY(
    parent_act_id,
    sub_act_id,
    joined
  )
);
CREATE TABLE IF NOT EXISTS labels_acts(
  act_id INT(11) NOT NULL,
  label_id INT(11) NOT NULL,
  joined DATE NOT NULL,
  separated DATE,
  FOREIGN KEY(act_id) REFERENCES acts(act_id),
  FOREIGN KEY(label_id) REFERENCES labels(label_id),
  CONSTRAINT pk_labels_acts PRIMARY KEY(act_id, label_id, joined)
);
CREATE TABLE IF NOT EXISTS labels_labels(
  sub_label_id INT(11) NOT NULL,
  parent_label_id INT(11) NOT NULL,
  joined DATE NOT NULL,
  separated DATE,
  FOREIGN KEY(sub_label_id) REFERENCES labels(label_id),
  FOREIGN KEY(parent_label_id) REFERENCES labels(label_id),
  CONSTRAINT pk_labels_labels PRIMARY KEY(
    parent_label_id,
    sub_label_id,
    joined
  )
);
CREATE TABLE IF NOT EXISTS idols_songs(
  idol_id INT(11) NOT NULL,
  song_id INT(11) NOT NULL,
  FOREIGN KEY(idol_id) REFERENCES idols(idol_id),
  FOREIGN KEY(song_id) REFERENCES songs(song_id),
  CONSTRAINT pk_songs_idols PRIMARY KEY(song_id, idol_id)
);
CREATE TABLE IF NOT EXISTS idols_albums(
  idol_id INT(11) NOT NULL,
  album_id INT(11) NOT NULL,
  FOREIGN KEY(idol_id) REFERENCES idols(idol_id),
  FOREIGN KEY(album_id) REFERENCES albums(album_id),
  CONSTRAINT pk_albums_idols PRIMARY KEY(album_id, idol_id)
);
CREATE TABLE IF NOT EXISTS idols_partners(
  idol_id INT(11) NOT NULL,
  partner_id INT(11) NOT NULL,
  FOREIGN KEY(idol_id) REFERENCES idols(idol_id),
  FOREIGN KEY(partner_id) REFERENCES partners(partner_id),
  CONSTRAINT pk_partners_idols PRIMARY KEY(partner_id, idol_id)
);
CREATE TABLE IF NOT EXISTS idols_tv_shows(
  idol_id INT(11) NOT NULL,
  tv_show_id INT(11) NOT NULL,
  FOREIGN KEY(idol_id) REFERENCES idols(idol_id),
  FOREIGN KEY(tv_show_id) REFERENCES tv_shows(tv_show_id),
  CONSTRAINT pk_tv_shows_idols PRIMARY KEY(tv_show_id, idol_id)
);
CREATE TABLE IF NOT EXISTS idols_movies(
  idol_id INT(11) NOT NULL,
  movie_id INT(11) NOT NULL,
  FOREIGN KEY(idol_id) REFERENCES idols(idol_id),
  FOREIGN KEY(movie_id) REFERENCES movies(movie_id),
  CONSTRAINT pk_movies_idols PRIMARY KEY(movie_id, idol_id)
);
CREATE TABLE IF NOT EXISTS idols_projects(
  idol_id INT(11) NOT NULL,
  project_id INT(11) NOT NULL,
  FOREIGN KEY(idol_id) REFERENCES idols(idol_id),
  FOREIGN KEY(project_id) REFERENCES projects(project_id),
  CONSTRAINT pk_projects_idols PRIMARY KEY(project_id, idol_id)
);
CREATE TABLE IF NOT EXISTS idols_genres(
  idol_id INT(11) NOT NULL,
  genre_id INT(11) NOT NULL,
  FOREIGN KEY(idol_id) REFERENCES idols(idol_id),
  FOREIGN KEY(genre_id) REFERENCES genres(genre_id),
  CONSTRAINT pk_genres_idols PRIMARY KEY(genre_id, idol_id)
);
CREATE TABLE IF NOT EXISTS acts_songs(
  act_id INT(11) NOT NULL,
  song_id INT(11) NOT NULL,
  FOREIGN KEY(act_id) REFERENCES acts(act_id),
  FOREIGN KEY(song_id) REFERENCES songs(song_id),
  CONSTRAINT pk_songs_acts PRIMARY KEY(song_id, act_id)
);
CREATE TABLE IF NOT EXISTS acts_albums(
  act_id INT(11) NOT NULL,
  album_id INT(11) NOT NULL,
  FOREIGN KEY(act_id) REFERENCES acts(act_id),
  FOREIGN KEY(album_id) REFERENCES albums(album_id),
  CONSTRAINT pk_albums_acts PRIMARY KEY(album_id, act_id)
);
CREATE TABLE IF NOT EXISTS acts_partners(
  act_id INT(11) NOT NULL,
  partner_id INT(11) NOT NULL,
  FOREIGN KEY(act_id) REFERENCES acts(act_id),
  FOREIGN KEY(partner_id) REFERENCES partners(partner_id),
  CONSTRAINT pk_partners_acts PRIMARY KEY(partner_id, act_id)
);
CREATE TABLE IF NOT EXISTS acts_tv_shows(
  act_id INT(11) NOT NULL,
  tv_show_id INT(11) NOT NULL,
  FOREIGN KEY(act_id) REFERENCES acts(act_id),
  FOREIGN KEY(tv_show_id) REFERENCES tv_shows(tv_show_id),
  CONSTRAINT pk_tv_shows_acts PRIMARY KEY(tv_show_id, act_id)
);
CREATE TABLE IF NOT EXISTS acts_movies(
  act_id INT(11) NOT NULL,
  movie_id INT(11) NOT NULL,
  FOREIGN KEY(act_id) REFERENCES acts(act_id),
  FOREIGN KEY(movie_id) REFERENCES movies(movie_id),
  CONSTRAINT pk_movies_acts PRIMARY KEY(movie_id, act_id)
);
CREATE TABLE IF NOT EXISTS acts_projects(
  act_id INT(11) NOT NULL,
  project_id INT(11) NOT NULL,
  FOREIGN KEY(act_id) REFERENCES acts(act_id),
  FOREIGN KEY(project_id) REFERENCES projects(project_id),
  CONSTRAINT pk_projects_acts PRIMARY KEY(project_id, act_id)
);
CREATE TABLE IF NOT EXISTS acts_genres(
  act_id INT(11) NOT NULL,
  genre_id INT(11) NOT NULL,
  FOREIGN KEY(act_id) REFERENCES acts(act_id),
  FOREIGN KEY(genre_id) REFERENCES genres(genre_id),
  CONSTRAINT pk_genres_acts PRIMARY KEY(genre_id, act_id)
);
CREATE TABLE IF NOT EXISTS labels_songs(
  label_id INT(11) NOT NULL,
  song_id INT(11) NOT NULL,
  FOREIGN KEY(label_id) REFERENCES labels(label_id),
  FOREIGN KEY(song_id) REFERENCES songs(song_id),
  CONSTRAINT pk_songs_labels PRIMARY KEY(song_id, label_id)
);
CREATE TABLE IF NOT EXISTS labels_albums(
  label_id INT(11) NOT NULL,
  album_id INT(11) NOT NULL,
  FOREIGN KEY(label_id) REFERENCES labels(label_id),
  FOREIGN KEY(album_id) REFERENCES albums(album_id),
  CONSTRAINT pk_albums_labels PRIMARY KEY(album_id, label_id)
);
CREATE TABLE IF NOT EXISTS labels_partners(
  label_id INT(11) NOT NULL,
  partner_id INT(11) NOT NULL,
  FOREIGN KEY(label_id) REFERENCES labels(label_id),
  FOREIGN KEY(partner_id) REFERENCES partners(partner_id),
  CONSTRAINT pk_partners_labels PRIMARY KEY(partner_id, label_id)
);
CREATE TABLE IF NOT EXISTS labels_tv_shows(
  label_id INT(11) NOT NULL,
  tv_show_id INT(11) NOT NULL,
  FOREIGN KEY(label_id) REFERENCES labels(label_id),
  FOREIGN KEY(tv_show_id) REFERENCES tv_shows(tv_show_id),
  CONSTRAINT pk_tv_shows_labels PRIMARY KEY(tv_show_id, label_id)
);
CREATE TABLE IF NOT EXISTS labels_movies(
  label_id INT(11) NOT NULL,
  movie_id INT(11) NOT NULL,
  FOREIGN KEY(label_id) REFERENCES labels(label_id),
  FOREIGN KEY(movie_id) REFERENCES movies(movie_id),
  CONSTRAINT pk_movies_labels PRIMARY KEY(movie_id, label_id)
);
CREATE TABLE IF NOT EXISTS labels_projects(
  label_id INT(11) NOT NULL,
  project_id INT(11) NOT NULL,
  FOREIGN KEY(label_id) REFERENCES labels(label_id),
  FOREIGN KEY(project_id) REFERENCES projects(project_id),
  CONSTRAINT pk_projects_labels PRIMARY KEY(project_id, label_id)
);
