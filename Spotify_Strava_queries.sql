
--create temp tables 
CREATE TABLE spotify AS SELECT * FROM './demo_data/my_spotify_data/*.json';

--and spit it out as a parquat file
COPY (SELECT * FROM spotify) TO 'spotify.parquet' (FORMAT PARQUET);


--a spotify wrapped style thing for each year I've had spotify https://duckdb.org/docs/sql/functions/dateformat.html#format-specifiers
SELECT master_metadata_album_artist_name,date_part('year', ts) listen_year, master_metadata_track_name, count(master_metadata_track_name) count_tracks
FROM 'spotify.parquet'  as spotify
WHERE listen_year = 2016
AND ms_played > 60000
GROUP BY master_metadata_track_name, master_metadata_album_artist_name, listen_year
ORDER BY count_tracks desc;

--Strava gives dates like this - "Jul 18, 2017, 6:39:45 AM", time stamp formating needed to import this https://duckdb.org/docs/sql/functions/dateformat.html#format-specifiers
CREATE TABLE strava AS SELECT * FROM read_csv('./demo_data/strava/activities.csv', header = TRUE, TIMESTAMPFORMAT ='%b %-d, %Y, %I:%M:%S %p', types = {'Activity Date': 'TIMESTAMP'});


SELECT "Activity Date", "Elapsed Time" FROM strava;

--add a finish timestamp
ALTER TABLE strava ADD COLUMN "Activity Date Finish" TIMESTAMP;
 
 --update the finish date and time
UPDATE strava
SET "Activity Date Finish" = "Activity Date" + "Elapsed Time" * INTERVAL 1 SECOND;

SELECT "Activity ID", "Activity Name",Distance,"Activity Date", "Activity Date Finish"
FROM strava
ORDER BY 4 DESC;

-----------------------------------

--see what I was listening to on each run
SELECT "Activity ID", "Activity Name",Distance, ts, "Activity Date Finish", spotify.master_metadata_album_artist_name, spotify.master_metadata_track_name, date_part('year', ts) listen_year
FROM spotify
JOIN strava
   ON spotify.ts BETWEEN strava."Activity Date" AND strava."Activity Date Finish"
WHERE ms_played > 60000 
ORDER BY ts;			 


 
 
