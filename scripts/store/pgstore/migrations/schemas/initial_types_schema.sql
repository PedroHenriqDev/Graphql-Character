CREATE TYPE personage_type AS ENUM (
     'Hero',
     'Villain',
     'AntiHero',
     'AntiVillain',
     'Sidekick',
     'Mentor'
);

CREATE TYPE skill_level AS ENUM (
     'Novice',
     'Intermediate',
     'Advanced',
     'Expert',
     'Master'
);

CREATE TYPE movie_genre AS ENUM (
    'Action',
    'Adventure',
    'Comedy',
    'Drama',
    'Fantasy',
    'Horror',
    'Mystery',
    'Romance',
    'SciFi',
    'Thriller',
    'Documentary',
    'Animation',
    'Musical',
    'Crime',
    'Historical',
    'Western'
);


CREATE TYPE serie_genre AS ENUM (
    'Action',
    'Adventure',
    'Comedy',
    'Drama',
    'Fantasy',
    'Horror',
    'Mystery',
    'Romance',
    'SciFi',
    'Thriller',
    'Documentary',
    'Crime',
    'Historical',
    'Political',
    'Supernatural',
    'Family',
    'Reality',
    'Anthology'
);

CREATE TYPE game_genre AS ENUM (
    'Action',
    'Adventure',
    'RPG', 
    'Shooter',
    'Strategy',
    'Simulation',
    'Sports',
    'Racing',
    'Puzzle',
    'Platformer',
    'Fighting',
    'Horror',
    'Survival',
    'Sandbox',
    'MMO',
    'Roguelike',
    'BattleRoyale',
    'Music',
    'Educational'
);

CREATE TYPE book_genre AS ENUM(
    'Fiction',
    'NonFiction',
    'Mystery',
    'Thriller',
    'ScienceFiction',
    'Fantasy',
    'Historical',
    'Romance',
    'Horror',
    'Biography',
    'Autobiography',
    'SelfHelp',
    'Health',
    'Science',
    'Travel',
    'Cooking',
    'TrueCrime',
    'Poetry',
    'Classic',
    'YoungAdult',
    'Children'
);
