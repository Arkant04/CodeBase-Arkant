DROP TABLE IF EXISTS peliculas;
DROP TABLE IF EXISTS usuarios;
PRAGMA foreign_keys = on;

CREATE TABLE 'usuarios'(
  'id' INTEGER NOT NULL UNIQUE,
  'nombre' TEXT NOT NULL UNIQUE,
  'email' TEXT NOT NULL UNIQUE,
  'favPeli' INTEGER,
  PRIMARY KEY ('id' AUTOINCREMENT)
  FOREIGN KEY ('favPeli') REFERENCES 'peliculas'('id')
);--STRICT;

CREATE TABLE 'peliculas'(
    'titulo' TEXT NOT NULL,
    'id' INTEGER NOT NULL,
    'genero' TEXT,
    'año' INTEGER NOT NULL,
    'director' TEXT NOT NULL,
    --'autor' TEXT NOT NULL,
    --FOREIGN KEY ('autor') REFERENCES 'usuarios' ('id'),
 PRIMARY KEY ('id' AUTOINCREMENT)
);--STRICT;


INSERT INTO usuarios (nombre, email) VALUES ('Pepe', 'Epep@gmail.com'),
('Alberto', 'kokointo@gmail.com');

INSERT INTO peliculas (titulo, genero, año, director) VALUES ('Django', 'western', 2012, 'Quentin Tarantino'),
('Interstellar', 'Drama', 2014, 'Christopher Nolan'),
('El corral, una fiesta muy bestia', 'comedia', 2006, 'Steve Oedekerk'),
('El gato con botas: Los tres diablos', 'animacion', 2012, 'Raman Hui'),
('Indiana Jones y el dial del destino', 'aventuras', 2023, 'James Mangold'),
('Harry Potter y la cámara secreta', 'fantasia', 2002, 'Chris Columbus'),
('El Señor de los Anillos: las dos torres', 'fantasia', 2002, 'Peter Jackson'),
('Spider-Man', 'Ciencia Ficcion', 2002, 'Sam Raimi'),
('Iron Man', 'SuperHeroes', 2008, 'Jon Favreau'),
('El viaje de Chihiro', 'fantasia', 2001, 'Hayao Miyazaki');

SELECT usuarios.nombre, peliculas.titulo AS peliculasFavoritas
FROM usuarios
JOIN peliculas ON usuarios.favPeli = peliculas.id