COPY movies
TO '...../all_movies_ratings.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ';', QUOTE '"');

COPY movies (title, release_year, rating)
TO '...../movies_summary.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',', QUOTE '"');

COPY (
    SELECT title, rating
    FROM movies
    ORDER BY rating DESC
)
TO '...../movies_top_ratings.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',', QUOTE '"');
