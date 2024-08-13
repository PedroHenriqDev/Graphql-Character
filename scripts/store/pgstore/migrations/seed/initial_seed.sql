-- Ativar extensão para gerar UUIDs
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Inserir Personagens
INSERT INTO Personages (id, name, description, height, weight, type) VALUES
  (gen_random_uuid(), 'John Wick', 'A skilled assassin seeking vengeance.', 1.85, 85.0, 'Hero'),
  (gen_random_uuid(), 'Darth Vader', 'A Sith Lord with immense power.', 2.02, 115.0, 'Villain'),
  (gen_random_uuid(), 'Sherlock Holmes', 'A brilliant detective with exceptional deductive skills.', 1.82, 74.0, 'Hero'),
  (gen_random_uuid(), 'Voldemort', 'The Dark Wizard seeking to conquer the magical world.', 1.80, 70.0, 'Villain'),
  (gen_random_uuid(), 'Gandalf', 'A wise wizard who aids in the fight against evil.', 1.78, 80.0, 'Mentor'),
  (gen_random_uuid(), 'Frodo Baggins', 'A hobbit tasked with destroying a powerful ring.', 1.30, 55.0, 'Hero');

-- Inserir Features
INSERT INTO Features (id, characterId, name, level) VALUES
  (gen_random_uuid(), (SELECT id FROM Personages WHERE name = 'John Wick' LIMIT 1), 'Marksmanship', 'Master'),
  (gen_random_uuid(), (SELECT id FROM Personages WHERE name = 'Darth Vader' LIMIT 1), 'Force Powers', 'Master'),
  (gen_random_uuid(), (SELECT id FROM Personages WHERE name = 'Sherlock Holmes' LIMIT 1), 'Deductive Reasoning', 'Master'),
  (gen_random_uuid(), (SELECT id FROM Personages WHERE name = 'Voldemort' LIMIT 1), 'Dark Magic', 'Master'),
  (gen_random_uuid(), (SELECT id FROM Personages WHERE name = 'Gandalf' LIMIT 1), 'Wizardry', 'Master'),
  (gen_random_uuid(), (SELECT id FROM Personages WHERE name = 'Frodo Baggins' LIMIT 1), 'Bravery', 'Advanced');

-- Inserir Content
INSERT INTO Contents (id, characterId, name, description, datePublication) VALUES
  (gen_random_uuid(), (SELECT id FROM Personages WHERE name = 'John Wick' LIMIT 1), 'John Wick', 'A film about a retired assassin seeking revenge.', '2014-10-24 00:00:00'),
  (gen_random_uuid(), (SELECT id FROM Personages WHERE name = 'Darth Vader' LIMIT 1), 'Star Wars: Episode IV - A New Hope', 'A film where Darth Vader pursues the Rebel Alliance.', '1977-05-25 00:00:00'),
  (gen_random_uuid(), (SELECT id FROM Personages WHERE name = 'Sherlock Holmes' LIMIT 1), 'Sherlock Holmes', 'A film about the famous detective solving mysteries.', '2009-12-25 00:00:00'),
  (gen_random_uuid(), (SELECT id FROM Personages WHERE name = 'Voldemort' LIMIT 1), 'Harry Potter and the Half-Blood Prince', 'A film focusing on Voldemort’s rise to power.', '2009-07-15 00:00:00'),
  (gen_random_uuid(), (SELECT id FROM Personages WHERE name = 'Gandalf' LIMIT 1), 'The Lord of the Rings: The Fellowship of the Ring', 'A film about Gandalf and the quest to destroy the One Ring.', '2001-12-19 00:00:00'),
  (gen_random_uuid(), (SELECT id FROM Personages WHERE name = 'Frodo Baggins' LIMIT 1), 'The Lord of the Rings: The Return of the King', 'A film about Frodo’s final journey to destroy the One Ring.', '2003-12-17 00:00:00'),
  (gen_random_uuid(), (SELECT id FROM Personages WHERE name = 'Sherlock Holmes' LIMIT 1), 'Sherlock Holmes', 'A TV series featuring the modern-day Sherlock Holmes.', '2010-07-25 00:00:00'),
  (gen_random_uuid(), (SELECT id FROM Personages WHERE name = 'Gandalf' LIMIT 1), 'The Hobbit: An Unexpected Journey', 'A film detailing Gandalf’s adventure with Bilbo Baggins.', '2012-12-14 00:00:00'),
  (gen_random_uuid(), (SELECT id FROM Personages WHERE name = 'Frodo Baggins' LIMIT 1), 'The Hobbit', 'A novel about the adventures of Bilbo Baggins.', '1937-09-21 00:00:00');

-- Inserir MovieGenres
INSERT INTO MovieGenres (contentId, genre) VALUES
  ((SELECT id FROM Contents WHERE name = 'John Wick' LIMIT 1), 'Action'),
  ((SELECT id FROM Contents WHERE name = 'Star Wars: Episode IV - A New Hope' LIMIT 1), 'SciFi'),
  ((SELECT id FROM Contents WHERE name = 'Sherlock Holmes' LIMIT 1), 'Action'),
  ((SELECT id FROM Contents WHERE name = 'Harry Potter and the Half-Blood Prince' LIMIT 1), 'Fantasy'),
  ((SELECT id FROM Contents WHERE name = 'The Lord of the Rings: The Fellowship of the Ring' LIMIT 1), 'Fantasy'),
  ((SELECT id FROM Contents WHERE name = 'The Lord of the Rings: The Return of the King' LIMIT 1), 'Fantasy'),
  ((SELECT id FROM Contents WHERE name = 'The Hobbit: An Unexpected Journey' LIMIT 1), 'Fantasy');

-- Inserir SerieGenres
INSERT INTO SerieGenres (contentId, genre) VALUES
  ((SELECT id FROM Contents WHERE name = 'Sherlock Holmes' LIMIT 1), 'Drama'),
  ((SELECT id FROM Contents WHERE name = 'Sherlock Holmes' LIMIT 1), 'Mystery');

-- Inserir BookGenres
INSERT INTO BookGenres (contentId, genre) VALUES
  ((SELECT id FROM Contents WHERE name = 'The Hobbit' LIMIT 1), 'Fantasy');

-- Inserir GameGenres
INSERT INTO GameGenres (contentId, genre) VALUES
  ((SELECT id FROM Contents WHERE name = 'John Wick' LIMIT 1), 'Action'),
  ((SELECT id FROM Contents WHERE name = 'Sherlock Holmes' LIMIT 1), 'Puzzle'),
  ((SELECT id FROM Contents WHERE name = 'Harry Potter and the Half-Blood Prince' LIMIT 1), 'RPG');
