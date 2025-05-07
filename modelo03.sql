use modelo3;


CREATE TABLE DimProyecto (
    id_proyecto INT PRIMARY KEY,
    proyecto VARCHAR(100),
    id_cliente INT
);


CREATE TABLE DimCliente (
    id_cliente INT PRIMARY KEY,
    cliente VARCHAR(100),
    telefono VARCHAR(20)
);


CREATE TABLE DimResponsable (
    id_responsable INT PRIMARY KEY,
    responsable VARCHAR(100),
    id_empresa INT
);


CREATE TABLE DimEmpresa (
    id_empresa INT PRIMARY KEY,
    empresa VARCHAR(100)
);


CREATE TABLE DimLocalidad (
    id_localidad INT PRIMARY KEY,
    localidad VARCHAR(100),
    id_pais INT
);


CREATE TABLE DimPais (
    id_pais INT PRIMARY KEY,
    pais VARCHAR(100)
);


CREATE TABLE DimTiempo (
    tiempo_id INT PRIMARY KEY,
    dia INT,
    mes INT,
    anio INT
);


CREATE TABLE FactPaqueteTrabajo (
    id_paquete INT PRIMARY KEY,
    id_proyecto INT,
    id_responsable INT,
    id_localidad INT,
    tiempo_id INT,
    costos DECIMAL(12,2),
    cantidad_paquetes INT,
    FOREIGN KEY (id_proyecto) REFERENCES DimProyecto(id_proyecto),
    FOREIGN KEY (id_responsable) REFERENCES DimResponsable(id_responsable),
    FOREIGN KEY (id_localidad) REFERENCES DimLocalidad(id_localidad),
    FOREIGN KEY (tiempo_id) REFERENCES DimTiempo(tiempo_id)
);
