CREATE TABLE IF NOT EXISTS Genres (
    NAME VARCHAR(40) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Artists (
    id SERIAL PRIMARY KEY,
    NAME VARCHAR(40) NOT NULL,
    Alias TEXT,
    Genres_id INTEGER REFERENCES Genres (id)
);

CREATE TABLE IF NOT EXISTS Albums (
    id SERIAL PRIMARY KEY,
    NAME VARCHAR(40) NOT NULL,
    YEAR DATE,
    Artists_id INTEGER REFERENCES Artists (id)
);

CREATE TABLE IF NOT EXISTS Tracks (
    id SERIAL PRIMARY KEY,
    NAME VARCHAR(40) NOT NULL,
    Length NUMERIC,
    Albums_id INTEGER REFERENCES Albums (id)
);

CREATE TABLE IF NOT EXISTS Compilations (
    id SERIAL PRIMARY KEY,
    NAME VARCHAR(40) NOT NULL,
    YEAR DATE,
    Tracks_id INTEGER REFERENCES Tracks (id),
    Albums_id INTEGER REFERENCES Albums (id)
);

CREATE TABLE IF NOT EXISTS Genres_artists (
    id SERIAL PRIMARY KEY,
    Genres_id INTEGER REFERENCES Genres (id),
    Artists_id INTEGER REFERENCES Artists (id)
);

CREATE TABLE IF NOT EXISTS Albums_artists (
    id SERIAL PRIMARY KEY,
    Albums_id INTEGER REFERENCES Albums (id),
    Artists_id INTEGER REFERENCES Artists (id)
);

CREATE TABLE IF NOT EXISTS Compilations_tracks (
    id SERIAL PRIMARY KEY,
    Compilations_id INTEGER REFERENCES Compilations (id),
    Tracks_id INTEGER REFERENCES Tracks (id)
);