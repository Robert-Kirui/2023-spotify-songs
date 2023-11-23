## 2023 Spotify Songs
---

### Overview 
This analysis aims to determine the most popular tracks and artists on Spotify in 2023 based on the number of streams gained and the number of tracks published. It also seeks to establish the variation in the total number of streams for different tracks based on the year, month, and day the tracks were released.  

### Data Source 
The dataset for this analysis was obtained from Kaggle, and can be downloaded [here](https://www.kaggle.com/datasets/nelgiriyewithana/top-spotify-songs-2023).
The dataset contains 953 records with fields track name, artist(s) name, number of artists, year released, month released, day released, total number of streams on sportify, number of sportify playlists the song is included in, presence and rank of the song on sportify charts, number of Apple Music playlists the song is included in, presence and rank of the song on Apple Music charts, number of Deezer playlists the song is included in, presence and rank of the song on Deezer charts, presence and rank of the song on Shazam charts, beats per minute, key of the song, mode of the song (major or minor), danceability (%), valence (%), energy %, acousticness (%), instrumentalness %, liveness (%), and speechiness %. 

### Data Cleaning and Preparation
- Handling missing values
  - Other than columns #in_shazam_charts (missing 50 values) and key_of_song (missing 94 values), all the records in the dataset have all the values.
- Duplicate values
  - It is possible that more than one artist can use same track name for their songs. Therefore, songs with same track name but different artists were not considered duplicate in this analysis. However, songs with same track name and same artist(s) were considered duplicate, and were removed.
  - For example, the following duplicate records were removed because of similar track name and artist(s) name:
    1. SPIT IN MY FACE! By ThxSoMch – same track name, same artist name, and same year, month, and date released
    2. Take my breath by The Weekend - same track name, same artist name, and same year, month, and date released
    3. SNAP by Rosa Linn - same track name, same artist name, and same year, month, and date released
    4. About Damn Time by Lizzo - same track name and same artist name
   
### Data Analysis 
The analysis sought to answer the following key questions:
1. Which are the most streamed songs on Spotify in 2023 overall?
2. Which artists have the most songs on Spotify in 2023, and do they tend to perform better overall?
3. Are there songs that perform better on Apple Music or Deezer than on Spotify?


```SQL
/* Most streamed songs overall */
SELECT TOP 20 
	track_name, 
	artist_name, 
	year_released,
	month_released, 
	day_released, 
	number_of_streams
FROM Spotify_2023
ORDER BY number_of_streams DESC;
```

```SQL
/* Artists with most songs*/
SELECT 
	artist_name, 
	COUNT(track_name) AS number_of_songs
FROM Spotify_2023
GROUP BY artist_name
ORDER BY number_of_songs DESC;
```

```SQL
/* TOP 15 in spotify playlists */
SELECT TOP 15 track_name, artist_name, in_spotify_playlists
FROM Spotify_2023
ORDER BY in_spotify_playlists DESC;

/* TOP 15 in spotify charts */
SELECT TOP 15 track_name, artist_name, in_spotify_charts
FROM Spotify_2023
ORDER BY in_spotify_charts DESC;

/* TOP 15 in Apple Music playlists */
SELECT TOP 15 track_name, artist_name, in_Apple_playlists
FROM Spotify_2023
ORDER BY in_Apple_playlists DESC;

/* TOP 15 in Apple Music charts */
SELECT TOP 15 track_name, artist_name, in_apple_charts
FROM Spotify_2023
ORDER BY in_apple_charts DESC;

/* TOP 15 in Deezer playlists */
SELECT TOP 15 track_name, artist_name, in_deezer_playlists
FROM Spotify_2023
ORDER BY in_deezer_playlists DESC;

/* TOP 15 in Deezer charts */
SELECT TOP 15 track_name, artist_name, in_deezer_charts
FROM Spotify_2023
ORDER BY in_deezer_charts DESC;

/* TOP 15 in Shazam charts */
SELECT TOP 15 track_name, artist_name, in_shazam_charts
FROM Spotify_2023
ORDER BY in_shazam_charts DESC;
```


```SQL
/* Spotify vs Apple Music vs Deezer */
SELECT TOP 10 
	track_name, 
	artist_name, 
	in_spotify_playlists
FROM Spotify_2023
ORDER BY in_spotify_playlists DESC;

SELECT TOP 10 
	track_name, 
	artist_name, 
	in_apple_playlists
FROM Spotify_2023
ORDER BY in_apple_playlists DESC;

SELECT TOP 10 
	track_name, 
	artist_name, 
	in_deezer_playlists
FROM Spotify_2023
ORDER BY in_deezer_playlists DESC;
```


### Findings
- ‘Blinding Lights’ by The Weeknd, and ‘Shape of You’ by Ed Sheeran are the two most streamed songs on Spotify in 2023 with 3.7 billion and 3.5 billion streams respectively.
- Artists Taylor Swift, The Weeknd, SZA, Bad Bunny, Harry Styles, Kendrick Lamar, and Morgan Wallen have the most songs on Spotify.
- Despite having the most songs on Spotify, only artists Taylor Swift (3 platforms), The Weeknd (5 platforms), and Harry Styles (4 platforms) seem to perform better overall as their songs appear in top 15 in at least 3 platforms (Spotify, Apple Music, Deezer, and Shazam)
- Some songs perform better on Apple Music or Deezer than on Spotify as it is evident that only a few songs that appear in top 10 highest number of Spotify playlists also appear in top 10 highest number of Apple Music and Deezer playlists. This means that some songs are streamed more on Spotify, others are streamed more on Apple Music, and others streamed more on Deezer.



 
