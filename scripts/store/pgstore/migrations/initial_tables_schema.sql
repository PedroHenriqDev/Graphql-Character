CREATE TABLE IF NOT EXISTS Characters (
    id                  UUID              PRIMARY KEY       NOT NULL       DEFAULT gen_random_uuid(), 
    "name"              VARCHAR(100)                        NOT NULL,
    "description"       VARCHAR(255)                        NOT NULL,
    height              DOUBLE PRECISION                    NOT NULL,
    "weight"            DOUBLE PRECISION                    NOT NULL,
    "type"              character_type                      NOT NULL
);

CREATE TABLE IF NOT EXISTS Features (
    id                   UUID              PRIMARY KEY      NOT NULL      DEFAULT gen_random_uuid(),
    characterId          UUID                               NOT NULL,
    "name"               VARCHAR(100)                       NOT NULL,
    "level"              skill_level                        NOT NULL      DEFAULT 'Novice',

    FOREIGN KEY(characterId) REFERENCES Characters(id)
);

CREATE TABLE IF NOT EXISTS Content (
    id                  UUID              PRIMARY KEY       NOT NULL       DEFAULT gen_random_uuid(),
    characterId         UUID                                NOT NULL,
    "name"              VARCHAR(100)                        NOT NULL,
    "description"       VARCHAR(255)                        NOT NULL,
    datePublication     TIMESTAMP                           NOT NULL,

    FOREIGN KEY(characterId) REFERENCES Characters(id)
);

CREATE TABLE IF NOT EXISTS MovieGenre(
    contentId           UUID            REFERENCES Content(id) ON DELETE CASCADE,
    genre               movie_genre,

    PRIMARY KEY (contentId, Genre)
);

CREATE TABLE IF NOT EXISTS SerieGenre(
    contentId           UUID            REFERENCES Content(id) ON DELETE CASCADE,
    genre               serie_genre,

    PRIMARY KEY (contentId, genre)
);

CREATE TABLE IF NOT EXISTS GameGenre(
    contentId           UUID            REFERENCES Content(id) ON DELETE CASCADE, 
    genre               game_genre,
    
    PRIMARY KEY (contentId, genre)
);

CREATE TABLE IF NOT EXISTS BookGenre(
    contentId           UUID            REFERENCES Content(id) ON DELETE CASCADE,
    genre               book_genre,

    PRIMARY KEY (contentId, genre)
);
