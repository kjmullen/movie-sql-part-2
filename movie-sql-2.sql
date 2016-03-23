-- Find all fantasy movies using the many
-- to many join between movies and genres
-- through movie_genre table.


SELECT *
FROM movies m
JOIN movie_genre mg ON m.movieid = mg.movieid
WHERE mg.genre_id = 15;

-- For each genre find the total number
-- of reviews as well as the average
-- review sort by highest average review.

select g.genre_id, avg(r.rating) as Average, count(r.rating) as Count
FROM movie_genre g
JOIN ratings r ON g.movieid = r.movieid
GROUP BY g.genre_id
ORDER BY Average DESC;

-- Create a new table called actors
-- (We are going to pretend the actor can only play in one movie)
-- The table should include name, character name,
-- foreign key to movies and date of birth at least plus an id field.

CREATE TABLE public.actors
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    character_name VARCHAR(255) NOT NULL,
    movie_id INT NOT NULL,
    dob DATE
);

-- Pick 3 movies and create insert statements
-- for 10 actors each. You should use the
-- multi value insert statements

INSERT INTO actors (name, character_name, movie_id, dob)
VALUES('Tom Hanks', 'Woody', 1, '1956-07-09'),
    ('Tim Allen', 'Buzz Lightyear', 1, '1953-06-13'),
    ('Wallace Shawn', 'Rex', 1, '1943-11-12'),
    ('John Morris','Andy', 1, '1984-10-2'),
    ('Robin Williams', 'Alan Parrish', 2, '1951-07-21'),
    ('Michael Caine', 'Cutter', 48780, '1933-03-14'),
    ('Christian Bale','Alfred Borden',48780, '1974-01-30'),
    ('Hugh Jackman','Robert Angier',48780, '1968-10-12'),
    ('David Bowie','Nikola Tesla',48780, '1947-01-08'),
    ('Andy Serkis','Alley',48780, '1964-04-20');

-- Create a new column in the movie table
-- to hold the MPAA rating.
-- UPDATE 5 different movies to their correct rating

ALTER TABLE movies
ADD mpaa_rating VARCHAR(10);

UPDATE movies
SET mpaa_rating ='PG-13'
WHERE movieid = 48780;

UPDATE movies
SET mpaa_rating ='G'
WHERE movieid = 1;

UPDATE movies
SET mpaa_rating ='PG'
WHERE movieid = 2;

UPDATE movies
SET mpaa_rating ='PG-13'
WHERE movieid = 3;

UPDATE movies
SET mpaa_rating ='R'
WHERE movieid = 4;
