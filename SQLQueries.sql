SELECT * FROM Spotify_2023;

/* Most Streamed Songs Overall */
SELECT TOP 15 
	track_name, 
	artist_name, 
	year_released,
	month_released, 
	day_released, 
	number_of_streams
FROM Spotify_2023
ORDER BY number_of_streams DESC;


/* Artists with most songs */
SELECT 
	artist_name, 
	COUNT(track_name) AS number_of_songs
FROM Spotify_2023
GROUP BY artist_name
ORDER BY number_of_songs DESC;


/* TOP 15 in spotify playlists */
SELECT TOP 15 track_name, artist_name, in_spotify_playlists
FROM Spotify_2023
ORDER BY in_spotify_playlists DESC;

/* spotify charts */
SELECT TOP 15 track_name, artist_name, in_spotify_charts
FROM Spotify_2023
ORDER BY in_spotify_charts DESC;

/* TOP 15 in Apple Music playlists */
SELECT TOP 15 track_name, artist_name, in_Apple_playlists
FROM Spotify_2023
ORDER BY in_Apple_playlists DESC;

/* Apple Music charts */
SELECT TOP 15 track_name, artist_name, in_apple_charts
FROM Spotify_2023
ORDER BY in_apple_charts DESC;

/* TOP 15 in Deezer playlists */
SELECT TOP 15 track_name, artist_name, in_deezer_playlists
FROM Spotify_2023
ORDER BY in_deezer_playlists DESC;

/* Deezer charts */
SELECT TOP 15 track_name, artist_name, in_deezer_charts
FROM Spotify_2023
ORDER BY in_deezer_charts DESC;

/* TOP 15 in Shazam charts */
SELECT TOP 15 track_name, artist_name, in_shazam_charts
FROM Spotify_2023
ORDER BY in_shazam_charts DESC;



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