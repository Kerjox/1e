##Consulta 01
##Busca las peliculas que tienen el genero 'Comedia'
SELECT p.Nombre,g.Nombre
FROM [PELICULAS] AS p, [GENERO] AS g, [PEL-GEN] AS pg
WHERE p.IdPelicula = pg.IdPelicula AND pg.IdGenero = g.IdGenero AND g.Nombre = 'Comedia';

##Consulta 02
##Busca el nombre de las pelicuals que ha hecho Chris Pratt
SELECT ac.Nombre, p.Nombre
FROM [ACTORES] AS ac, [PELICULAS] AS p, [PEL-ACT] AS pa
WHERE ac.IdActor = pa.IdActor AND pa.IdPelicula = p.IdPelicula AND ac.Nombre = 'Chris Pratt'
ORDER BY p.Nombre;

##Consulta 03
## Busca los actores que son britanicos/as
SELECT nac.Nacionalidad, ac.Nombre
FROM [NACIONALIDAD] AS nac, [ACTORES] AS ac
WHERE ac.Nacionalidad = nac.IdNacionalidad AND nac.Nacionalidad = 'REINO UNIDO'
ORDER BY ac.Nombre;

##Consulta 04
##Busca los actores que han ganado algun premio 'Ganador/a', pon todos los campos del premio
SELECT ac.Nombre, pna.Año, pna.Premiacion, pna.Categoria, pna.Pelicula, pna.Resultado
FROM [ACTORES] AS ac, [PREM-NOM-ACTORES] AS pna
WHERE ac.IdActor = pna.Actor AND pna.Resultado = 'Ganador/a'
ORDER BY ac.Nombre, pna.Año;

##Consulta 05
##Busca las peliculas que ha hecho Steven Spielberg
SELECT p.Nombre, dir.Nombre
FROM [PELICULAS] AS p, [DIRECTORES] AS dir
WHERE dir.IdDirector = p.Director AND dir.Nombre = 'Steven Spielberg'
ORDER BY p.Año;