##Consulta 1
SELECT *
FROM [Participantes] ORDER BY FechaNacimiento;

##Consulta 2
SELECT *
FROM [Participantes] ORDER BY Sexo,FechaNacimiento DESC;

##Consulta 3
SELECT Nombre,Sexo,FechaNacimiento
FROM [Participantes] ORDER BY Nombre;

##Consulta 4
SELECT TOP 5 *
FROM [Participantes] ORDER BY FechaNacimiento;

##Consulta 5
SELECT *
FROM [Participantes]
WHERE Sexo = 'M' ORDER BY Nombre;

##Consulta 6
SELECT *
FROM [Participantes]
WHERE AlojamientoFoje = 'no';

##Consulta 7
SELECT *
FROM [Participantes]
WHERE IdParticipante = 1000;

##Consulta 8
SELECT *
FROM [Participantes]
WHERE IdParticipante BETWEEN 500 AND 550;

##Consulta 9
SELECT *
FROM [Participantes]
WHERE Laboral = 'jubilado' OR Laboral = 'estudiante'
ORDER BY Sexo;

##Consulta 10
SELECT IdParticipante,Nombre,FechaNacimiento
FROM [Participantes]
WHERE Laboral = 'estudiante'
ORDER BY FechaNacimiento DESC;

##Consulta 11
SELECT *
FROM [Participantes]
WHERE IdParticipante < 1980;

##Consulta 12
SELECT Nombre,FechaNacimiento
FROM [Participantes]
WHERE year(FechaNacimiento) BETWEEN 1980 AND 1986;

##Consulta 13
SELECT*
FROM [Participantes]
WHERE year(date())-YEAR(FechaNacimiento) = 50;

##Consulta 14
SELECT*
FROM [Participantes]
WHERE month(FechaNacimiento) = 4 
ORDER BY Nombre;

##Consulta 15
SELECT *
FROM [Participantes]
WHERE day(FechaNacimiento) = day(date()) AND month(FechaNacimiento) = month(date()) AND Sexo = 'V';

##Consulta 16
SELECT *
FROM [Participantes]
WHERE Nombre LIKE 'C*';

##Consulta 17
SELECT *
FROM [Participantes]
WHERE Nombre LIKE 'V*' OR Nombre LIKE 'P*';

##Consulta 18
SELECT *
FROM [Participantes]
WHERE Nombre LIKE 'M*a';

##Consulta 19
SELECT *
FROM [Participantes]
WHERE Nombre LIKE '??s*';

##Consulta 20
SELECT *
FROM [Participantes]
WHERE Nombre LIKE '?????' ORDER BY Nombre;

##Consulta 21
SELECT *
FROM [Participantes]
WHERE Nombre LIKE '[C-H]*' AND Sexo = 'M';

###########CONSULTAS UNIÓN###########

##Consulta 22
SELECT P.Nombre,P.Sexo,P.Laboral,Pr.Procedencia
FROM [Participantes] AS p, [Procedencia] AS pr
WHERE (p.Procedencia = pr.IdProcedencia) AND pr.Procedencia = 'Zaragoza';

##Consulta 23
SELECT P.Nombre,P.Sexo,P.Laboral,Pr.Procedencia 
FROM [Participantes] AS p, [Procedencia] AS pr
WHERE (p.Procedencia = pr.IdProcedencia) AND (pr.Procedencia = 'Madrid' OR pr.Procedencia = 'Sevilla');

##Consulta 24
SELECT P.Nombre,P.Sexo,P.Laboral,Pr.Procedencia
FROM [Participantes] AS p, [Procedencia] AS pr
WHERE (p.Procedencia = pr.IdProcedencia) AND (pr.Procedencia = 'Zaragoza' OR pr.Procedencia = 'Huesca' OR pr.Procedencia = 'Teruel');

##Consulta 25
SELECT P.Nombre,P.Sexo,P.Laboral,Pr.Procedencia
FROM [Participantes] AS p, [Procedencia] AS pr
WHERE (p.Procedencia = pr.IdProcedencia) AND (pr.Procedencia = 'Barcelona' OR pr.Procedencia = 'Tarragona' OR pr.Procedencia = 'Lleida' OR pr.Procedencia = 'Girona');

##Consulta 26
SELECT p.*,eq.Altura
FROM [Participantes] AS p, [Equipamientos] AS eq
WHERE p.IdParticipante = eq.IdEquipamiento AND eq.Altura > 180
ORDER BY p.Sexo;

##Consulta 27
SELECT p.*,eq.Pie
FROM [Participantes] AS p, [Equipamientos] AS eq
WHERE p.IdParticipante = eq.IdEquipamiento AND eq.Pie > 43;

##Consulta 28
SELECT p.*,eq.Pie
FROM [Participantes] AS p, [Equipamientos] AS eq
WHERE p.IdParticipante = eq.IdEquipamiento AND eq.Talla = 'XXL'AND eq.Altura <=170;

##Consulta 29
SELECT p.*,eq.Talla
FROM [Participantes] AS p, [Equipamientos] AS eq
WHERE p.IdParticipante = eq.IdEquipamiento AND p.Sexo = 'M' AND eq.Talla = 'M';

##Consulta 30
SELECT p.*,eq.Talla
FROM [Participantes] AS p, [Equipamientos] AS eq
WHERE p.IdParticipante = eq.IdEquipamiento AND (p.Laboral = 'Jubilado' OR p.Laboral = 'Estudiante') AND eq.Talla = 'XL';

##Consulta 31
SELECT p.*,eq.Pie
FROM [Participantes] AS p, [Equipamientos] AS eq
WHERE p.IdParticipante = eq.IdEquipamiento AND p.Sexo = 'V' AND eq.Pie < 39;

##Consulta 32
SELECT p.*,eq.Talla,pr.Procedencia
FROM [Participantes] AS p, [Equipamientos] AS eq, [Procedencia] AS pr
WHERE p.IdParticipante = eq.IdEquipamiento AND p.Procedencia = pr.IdProcedencia AND eq.Talla = 'L' AND pr.Procedencia = 'Zaragoza';

##Consulta 33
SELECT p.*,eq.Talla,pr.Procedencia
FROM [Participantes] AS p, [Equipamientos] AS eq, [Procedencia] AS pr
WHERE p.IdParticipante = eq.IdEquipamiento AND p.Procedencia = pr.IdProcedencia AND (eq.Talla = 'S' OR eq.Talla = 'M') AND (pr.Procedencia = 'Zaragoza' OR pr.Procedencia = 'Huesca' OR pr.Procedencia = 'Teruel')
ORDER BY p.FechaNacimiento;

##Consulta 34
SELECT p.*,dp.Deporte
FROM [Participantes] AS p, [Deportes] AS dp, [Par-Dep] AS pd
WHERE p.IdParticipante = pd.IdParticipante AND pd.IdDeporte = dp.IdDeporte AND dp.Deporte = 'Esquí';

##Consulta 35
SELECT p.*,dp.Deporte
FROM [Participantes] AS p, [Deportes] AS dp, [Par-Dep] AS pd
WHERE p.IdParticipante = pd.IdParticipante AND pd.IdDeporte = dp.IdDeporte AND (dp.Deporte = 'Esquí' OR dp.Deporte = 'Natación');

##Consulta 36
SELECT p.*,dp.Deporte,pr.Procedencia
FROM [Participantes] AS p, [Deportes] AS dp, [Procedencia] AS pr, [Par-Dep] AS pd
WHERE p.Procedencia = pr.IdProcedencia AND p.IdParticipante = pd.IdParticipante AND pd.IdDeporte = dp.IdDeporte AND (pr.Procedencia = 'Barcelona' AND dp.Deporte = 'Fútbol');

##Consulta 38
SELECT p.*,pr.Procedencia
FROM [Participantes] AS p, [Procedencia] AS pr
WHERE p.Procedencia = pr.Idprocedencia AND (pr.Procedencia = 'Zaragoza' OR pr.Procedencia = 'Huesca' OR pr.Procedencia = 'Teruel') AND year(date())-year(p.Fechanacimiento) < 32;