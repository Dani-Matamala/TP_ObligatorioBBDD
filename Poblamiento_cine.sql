delete from PERSONA;
delete from CLIENTE;
delete from ENCARGADO;
delete from ENTRADA;
delete from FUNCION;
delete from PUBLICIDAD;
delete from SALA;
delete from ASIENTO
delete from PREFIERE;

-- Poblar tabla PERSONA
INSERT INTO PERSONA (tipoDoc, NroDocumento, apellido, nombre, fechaNacimiento, telefono, correoElectronico)
VALUES
  ('DNI', '12345678', 'González', 'María', '1990-05-15', '1234567890', 'maria@gmail.com'),
  ('DNI', '98765432', 'López', 'Juan', '1985-09-30', '0987654321', 'juan@gmail.com'),
  ('DNI', '54321678', 'Martínez', 'Luis', '1995-02-20', '5555555555', 'luis@gmail.com'),
  ('CI', '87654321', 'Pérez', 'Ana', '1992-11-10', '9876543210', 'ana@gmail.com'),
  ('CI', '13579246', 'Rodríguez', 'Carlos', '1988-07-05', '1111111111', 'carlos@gmail.com');

-- Poblar tabla CLIENTE
INSERT INTO CLIENTE (tipoDoc, NroDocumento, situacionFiscal)
VALUES
  ('DNI', '12345678', 'Responsable Inscripto'),
  ('DNI', '98765432', 'Monotributista'),
  ('CI', '87654321', 'Consumidor Final');

-- Poblar tabla ENCARGADO
INSERT INTO ENCARGADO (tipoDoc, NroDocumento, legajo, categoria)
VALUES
  ('DNI', '54321678', 'L001', 'Senior'),
  ('CI', '13579246', 'L002', 'Junior');

-- Poblar tabla ENTRADA
INSERT INTO ENTRADA (NumeroEntrada, tipoDocCliente, NroDocumentoCliente, NroAsiento, idSala, idFuncion, fechaEmision)
VALUES
  (1, 'DNI', '12345678', 2, 1, 1, '2023-05-20'),
  (2, 'DNI', '98765432', 2, 2, 1, '2023-05-21'),
  (3, 'CI', '87654321', 3, 3, 2, '2023-05-22');

-- Poblar tabla FUNCION
INSERT INTO FUNCION (IdFuncion, Fecha, Hora, IdSala, idPublicidadInicio, idPublicidadFinal)
VALUES
  (1, '2023-05-20', '19:00:00', 1, 1, 2),
  (2, '2023-05-21', '20:30:00', 2, 3, 4);

-- Poblar tabla PUBLICIDAD
INSERT INTO PUBLICIDAD (id, Duracion)
VALUES
  (1, 30),
  (2, 45),
  (3, 60),
  (4, 15);

-- Poblar tabla SALA
INSERT INTO SALA (idSala, nombre, cantidadAsientos, tipo, tipoDocEncargado, NroDocumentoEncargado)
VALUES
  (1, 'Sala 1', 100, 'monster', 'DNI', '54321678'),
  (2, 'Sala 2', 80, '3D', 'CI', '13579246'),
  (3, 'Sala 3', 120, 'Normal', 'DNI', '54321678');

-- Poblar tabla ASIENTO
INSERT INTO ASIENTO (idSala, nroAsiento, fila)
VALUES
  (1, 1, 1),
  (1, 2, 1),
  (1, 3, 2),
  (2, 1, 1),
  (2, 2, 1),
  (2, 3, 2),
  (3, 1, 1),
  (3, 2, 1),
  (3, 3, 2);

-- Poblar tabla PREFIERE
INSERT INTO PREFIERE (tipoDocCliente, NroDocumentoCliente, idPublicidad, Motivo)
VALUES
  ('DNI', '12345678', 1, 'Me gusta el estilo'),
  ('DNI', '98765432', 2, 'Prefiero anuncios más cortos');


-- Elimina los datos existentes en la tabla ASIENTO si es necesario
DELETE FROM ASIENTO WHERE idSala = 1;

-- Agrega los asientos en 10 filas numeradas con letras a la sala con id 1
INSERT INTO ASIENTO (idSala, nroAsiento, fila)
SELECT 1 AS idSala, CONCAT(CHAR(64 + (i-1)/8 + 1), (i-1)%8 + 1) AS nroAsiento, CHAR(64 + (i-1)/8 + 1) AS fila
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) AS filas
CROSS JOIN (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8) AS columnas;
