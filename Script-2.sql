CREATE TABLE IF NOT EXISTS Genres (
    id INTEGER PRIMARY KEY,
    NAME VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artists (
    id INTEGER PRIMARY KEY,
    NAME VARCHAR(40) NOT NULL,
    Alias TEXT
);

CREATE TABLE IF NOT EXISTS Compilations (
    id INTEGER PRIMARY KEY,
    NAME VARCHAR(40) NOT NULL,
    YEAR DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
    id INTEGER PRIMARY KEY,
    NAME VARCHAR(40) NOT NULL,
    YEAR DATE,
    Artists_id INTEGER REFERENCES Artists (Artists_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
    id INTEGER PRIMARY KEY,
    NAME VARCHAR(40) NOT NULL,
    Length INTEGER,
    albums_id INTEGER NOT NULL references (Albums_id)
);

CREATE TABLE IF NOT EXISTS Genres_artists (
    Genres_id INTEGER REFERENCES Genres (Genres_id),
    Artists_id INTEGER REFERENCES Artists (Artists_id),
    primary key (Genres_id, Artists_id) 
);

CREATE TABLE IF NOT EXISTS Albums_artists (
    Albums_id INTEGER REFERENCES Albums (Albums_id),
    Artists_id INTEGER REFERENCES Artists (Artists_id),
    primary KEY(Albums_id, Artists_id)
);

CREATE TABLE IF NOT EXISTS Compilations_tracks (
    Compilations_id INTEGER REFERENCES Compilations (Compilations_id),
    Tracks_id INTEGER REFERENCES Tracks (Tracks_id),
    primary key (Compilations_id, Tracks_id)
);