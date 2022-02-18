#01-Selecciona los participantes que tengan mas de 40 de pie, jueguen a baloncesto,midan mas de 170, sean varones y estudiantes
SELECT p.*,eq.Pie,d.Deporte,eq.Altura
FROM [Participantes] AS	p, [Equipamientos] AS eq, [Par-Dep] AS pd, [Deportes] AS d
WHERE p.IdParticipante = eq.IdEquipamiento AND p.IdParticipante = pd.IdParticipante AND pd.IdDeporte = d.IdDeporte AND (eq.Pie > 40 AND d.Deporte = 'Baloncesto' AND p.Sexo = 'V'AND p.laboral = 'estudiante' AND eq.Altura > 170);

#02-Selecciona los participantes que sean de Zaragoza, jueguen al futbol o al baloncesto, lleven la talla XL y ordenalos por fecha de nacimiento.
SELECT p.*,eq.Talla,d.Deporte,pr.Procedencia
FROM [Participantes] AS p, [Equipamientos] AS eq, [Par-Dep] AS pd, [Deportes] AS d, [Procedencia] AS pr
WHERE p.IdParticipante = eq.IdEquipamiento AND p.IdParticipante = pd.IdParticipante AND pd.IdDeporte = d.IdDeporte AND p.Procedencia = pr.IdProcedencia AND (pr.Procedencia = 'Zaragoza' AND (d.Deporte = 'Futbol' OR d.Deporte = 'Baloncesto') AND eq.Talla = 'XL')
ORDER BY p.FechaNacimiento;

#03-Selecciona nombre, laboral, sexo de participantes e indica que numero de pie calzan los que tienen una altura mayor a 180 y ordenalos por numero de pie en orden descendente.
SELECT p.Nombre,p.Laboral,p.Sexo,eq.Altura,eq.Pie
FROM [Participantes] AS p, [Equipamientos] AS eq
WHERE p.IdParticipante = eq.IdEquipamiento AND eq.Altura > 180
ORDER BY eq.Pie
DESC;

#04-Selecciona el Nombre de los participantes que lleven al talla XL, practiquen el deporte Futbol, Baloncesto, Gimnasia y que sean de Barcelona, ordenalos por nombre.
SELECT p.Nombre,eq.Talla,pr.Procedencia,d.Deporte
FROM [Participantes] AS p, [Equipamientos] AS eq, [Procedencia] AS pr, [Par-Dep] AS pd, [Deportes] AS d
WHERE p.IdParticipante = eq.IdEquipamiento AND p.Procedencia = pr.IdProcedencia AND p.IdParticipante = pd.IdParticipante AND pd.IdDeporte = d.IdDeporte AND eq.talla = 'XL' AND (d.Deporte = 'Futbol' OR d.Deporte = 'Baloncesto' OR d.Deporte = 'Gimnasia')
ORDER BY p.Nombre;

#05-Selecciona el deporte, el nombre, laboral, sexo, alojamineto, colaboracion, e indica que deporte practican los participantes que colaboran y ordenalos por nombre.
SELECT d.deporte,p.Nombre,p.Laboral,p.Sexo,p.AlojamientoFoje,p.Colaboracion
FROM [participantes] AS p, [Par-Dep] AS pd, [Deportes] AS d
WHERE p.IdParticipante = pd.IdParticipante AND pd.IdDeporte = d.IdDeporte AND p.Colaboracion = 'Si'
ORDER BY p.Nombre;