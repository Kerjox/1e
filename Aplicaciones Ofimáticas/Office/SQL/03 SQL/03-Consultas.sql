##Consulta 1
SELECT *
FROM [Participantes]
WHERE Laboral = 'estudiante'
ORDER BY FechaNacimiento
DESC;

##Consulta 2
SELECT *
FROM [Participantes]
WHERE (month(FechaNacimiento) = 1 OR month(FechaNacimiento) = 12)
ORDER BY FechaNacimiento AND Sexo;

##Consulta 3
SELECT *
FROM [Participantes]
WHERE Sexo = 'M' AND idParticipante BETWEEN 100 AND 200;

##Consulta 4
SELECT *
FROM [Participantes]
WHERE AlojamientoFoje = 'no' AND year(date())-year(FechaNacimiento) < 30;

##Consulta 5
SELECT *
FROM [Participantes]
WHERE Nombre LIKE '*l' AND Sexo ='V' AND AlojamientoFoje = 'si';

##Consulta 6
SELECT p.*, pr.Procedencia
FROM [Participantes] AS p,[Procedencia] AS pr
WHERE p.procedencia = pr.IdProcedencia AND Laboral = 'trabajador' AND (pr.Procedencia = 'Barcelona' OR pr.Procedencia = 'Huesca');

##Consulta 7
SELECT *
FROM [Participantes]
WHERE Nombre LIKE 'A?o*'
ORDER BY Sexo;

##Consulta 8
SELECT p.*,eq.altura,eq.pie
FROM [Participantes] AS p, [Equipamientos] AS eq
WHERE p.idParticipante = eq.IdEquipamiento AND (eq.altura BETWEEN 160 AND 170 OR eq.pie >= 40);

##Cosnulta 9
SELECT p.*,d.Deporte
FROM [Participantes] AS p,[Par-Dep] AS pd,[Deportes] AS d
WHERE p.idParticipante = pd.idParticipante AND pd.IdDeporte = d.IdDeporte AND (d.Deporte = 'Esquí' OR d.Deporte = 'Escalada')
ORDER BY Nombre;

##Consulta 10
SELECT p.*,pr.Procedencia
FROM [Participantes] AS p,[Procedencia] AS pr
WHERE p.Procedencia = pr.Idprocedencia AND (pr.procedencia = 'Zaragoza' OR pr.procedencia = 'Huesca') AND year(date())-year(FechaNacimiento) < 30;
