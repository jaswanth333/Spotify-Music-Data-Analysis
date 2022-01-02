create database spotify;
use spotify;

create table spotify(   
track_name varchar(255),
track_artist varchar(255),
track_popularity int,	
playlist_genre varchar(50),	
danceability varchar(255),	
energy float,	
keyness float,	
loudness float,	
mode float,	
speechiness	float,
acousticness float,	
instrumentalness float,	
liveness float,	
valence	float,
tempo float,
duration_ms	float,
year year);	

drop table spotify;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/final.csv'
INTO TABLE spotify 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


select * from spotify;

##What are the Top 10 trending songs?
select track_name,playlist_genre,track_popularity from spotify order by track_popularity desc limit 10;

##What is the Average criteria inorder to featured as popular song? 
select playlist_genre as Genre,ROUND(AVG(danceability),2) as avg_danceability,ROUND(AVG(energy),2) as avg_energy,
ROUND(AVG(loudness) ,2) as avg_loudness,ROUND(AVG(mode) ,2) as avg_mode,
ROUND(AVG(speechiness) ,2) as avg_speechiness,ROUND(AVG(acousticness) ,2) as avg_acousticness,
ROUND(AVG(instrumentalness) ,2) as avg_instrumentalness,ROUND(AVG(liveness) ,2) as avg_liveness,
ROUND(AVG(valence) ,2) as avg_valence,ROUND(AVG(tempo) ,1) as avg_tempo
from spotify group by playlist_genre;


##How many songs were sung by each artist?
select track_artist,count(*) as Total_songs from spotify group by track_artist order by count(*) desc;

#Popularity with respect to genre
select playlist_genre,avg(track_popularity)  as Avg_Popularity  from spotify group by playlist_genre order by Avg_Popularity desc;
