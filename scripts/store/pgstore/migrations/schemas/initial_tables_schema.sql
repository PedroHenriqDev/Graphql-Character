CREATE TABLE IF NOT EXISTS Personages (
    id                  UUID              PRIMARY KEY       NOT NULL       DEFAULT gen_random_uuid(), 
    "name"              VARCHAR(100)                        NOT NULL,
    "description"       VARCHAR(255)                        NOT NULL,
    height              DOUBLE PRECISION                    NOT NULL,
    "weight"            DOUBLE PRECISION                    NOT NULL,
    "type"              personage_type                      NOT NULL
);

CREATE TABLE IF NOT EXISTS Features (
    id                   UUID              PRIMARY KEY      NOT NULL      DEFAULT gen_random_uuid(),
    characterId          UUID                               NOT NULL,
    "name"               VARCHAR(100)                       NOT NULL,
    "level"              skill_level                        NOT NULL      DEFAULT 'Novice',

    FOREIGN KEY(characterId) REFERENCES Personages(id)
);

CREATE TABLE IF NOT EXISTS Contents (
    id                  UUID              PRIMARY KEY       NOT NULL       DEFAULT gen_random_uuid(),
    characterId         UUID                                NOT NULL,
    "name"              VARCHAR(100)                        NOT NULL,
    "description"       VARCHAR(255)                        NOT NULL,
    datePublication     TIMESTAMP                           NOT NULL,

    FOREIGN KEY(characterId) REFERENCES Personages(id)
);

CREATE TABLE IF NOT EXISTS MovieGenres(
    contentId           UUID            REFERENCES Contents(id) ON DELETE CASCADE,
    genre               movie_genre,

    PRIMARY KEY (contentId, Genre)
);

CREATE TABLE IF NOT EXISTS SerieGenres(
    contentId           UUID            REFERENCES Contents(id) ON DELETE CASCADE,
    genre               serie_genre,

    PRIMARY KEY (contentId, genre)
);

CREATE TABLE IF NOT EXISTS GameGenres(
    contentId           UUID            REFERENCES Contents(id) ON DELETE CASCADE, 
    genre               game_genre,
    
    PRIMARY KEY (contentId, genre)
);

CREATE TABLE IF NOT EXISTS BookGenres(
    contentId           UUID            REFERENCES Contents(id) ON DELETE CASCADE,
    genre               book_genre,

    PRIMARY KEY (contentId, genre)
);
