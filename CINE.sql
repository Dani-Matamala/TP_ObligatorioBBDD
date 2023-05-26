-- Tabla PERSONA
CREATE TABLE PERSONA (
  tipoDoc INT,
  NroDocumento INT,
  apellido VARCHAR(50) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  fechaNacimiento DATE NOT NULL,
  telefono VARCHAR(50) NOT NULL,
  correoElectronico VARCHAR(100) NOT NULL,
  PRIMARY KEY (tipoDoc, NroDocumento)
);

-- Tabla CLIENTE
CREATE TABLE CLIENTE (
  tipoDoc INT,
  NroDocumento INT,
  situacionFiscal VARCHAR(50) NOT NULL,
  PRIMARY KEY (tipoDoc, NroDocumento),
  FOREIGN KEY (tipoDoc, NroDocumento) REFERENCES PERSONA(tipoDoc, NroDocumento)
  ON DELETE CASCADE 
  ON UPDATE CASCADE
);

-- Tabla ENCARGADO
CREATE TABLE ENCARGADO (
  tipoDoc INT,
  NroDocumento INT,
  legajo VARCHAR(50) NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  PRIMARY KEY (tipoDoc, NroDocumento),
  FOREIGN KEY (tipoDoc, NroDocumento) REFERENCES PERSONA(tipoDoc, NroDocumento)
  ON DELETE CASCADE 
  ON UPDATE CASCADE
);

-- Tabla ENTRADA
CREATE TABLE ENTRADA (
  NumeroEntrada INT,
  tipoDocCliente VARCHAR(3),
  NroDocumentoCliente INT,
  NroAsiento INT,
  idSala INT,
  idFuncion INT,
  fechaEmision DATE NOT NULL,
  PRIMARY KEY (NumeroEntrada),
  FOREIGN KEY (tipoDocCliente, NroDocumentoCliente) REFERENCES CLIENTE(tipoDoc, NroDocumento),
  FOREIGN KEY (idSala, NroAsiento) REFERENCES ASIENTO(idSala, nroAsiento),
  FOREIGN KEY (idFuncion) REFERENCES FUNCION(IdFuncion)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Tabla FUNCION
CREATE TABLE FUNCION (
  IdFuncion INT,
  Fecha DATE NOT NULL,
  Hora TIME NOT NULL,
  IdSala INT,
  idPublicidadInicio INT,
  idPublicidadFinal INT,
  PRIMARY KEY (IdFuncion),
  FOREIGN KEY (IdSala) REFERENCES SALA(idSala),
  FOREIGN KEY (idPublicidadInicio,  idPublicidadFinal) REFERENCES PUBLICIDAD(id),
  ON DELETE CASCADE 
  ON UPDATE CASCADE
);

-- Tabla PUBLICIDAD
CREATE TABLE PUBLICIDAD (
  id INT NOT NULL,
  Duracion INT NOT NULL,
  PRIMARY KEY (id)
);

-- Tabla SALA
CREATE TABLE SALA (
  idSala INT,
  nombre VARCHAR(50) NOT NULL,
  cantidadAsientos INT NOT NULL,
  tipo VARCHAR(50) NOT NULL,
  tipoDocEncargado INT,
  NroDocumentoEncargado INT,
  PRIMARY KEY (idSala),
  FOREIGN KEY (tipoDocEncargado, NroDocumentoEncargado) REFERENCES ENCARGADO(tipoDoc, NroDocumento)
  ON DELETE CASCADE 
  ON UPDATE CASCADE
);

-- Tabla ASIENTO
CREATE TABLE ASIENTO (
  idSala INT,
  nroAsiento INT,
  fila INT NOT NULL,
  PRIMARY KEY (idSala, nroAsiento),
  FOREIGN KEY (idSala) REFERENCES SALA(idSala)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Tabla PREFIERE
CREATE TABLE PREFIERE (
  tipoDocCliente VARCHAR(3),
  NroDocumentoCliente INT,
  idPublicidad INT,
  Motivo VARCHAR(50) NOT NULL,
  PRIMARY KEY (tipoDocCliente, NroDocumentoCliente, idPublicidad),
  FOREIGN KEY (tipoDocCliente, NroDocumentoCliente) REFERENCES CLIENTE(tipoDoc, NroDocumento),
  FOREIGN KEY (idPublicidad) REFERENCES PUBLICIDAD(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
