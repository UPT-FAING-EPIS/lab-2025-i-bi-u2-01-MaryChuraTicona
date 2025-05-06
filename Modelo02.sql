use modelo2;



CREATE TABLE DimCliente (
    id_cliente INT PRIMARY KEY,
    cliente VARCHAR(100),
    direccion VARCHAR(255),
    id_tipo INT
);


CREATE TABLE DimTipo (
    id_tipo INT PRIMARY KEY,
    tipo VARCHAR(50)
);

CREATE TABLE DimAgencia (
    id_agencia INT PRIMARY KEY,
    agencia_viajes VARCHAR(100),
    id_operador INT
);


CREATE TABLE DimOperador (
    id_operador INT PRIMARY KEY,
    operador VARCHAR(100)
);


CREATE TABLE DimViaje (
    id_viaje INT PRIMARY KEY,
    viaje VARCHAR(100),
    descripcion VARCHAR(255),
    id_destino INT
);


CREATE TABLE DimDestino (
    id_destino INT PRIMARY KEY,
    destino VARCHAR(100),
    id_pais INT
);


CREATE TABLE DimPais (
    id_pais INT PRIMARY KEY,
    pais VARCHAR(100)
);


CREATE TABLE DimTiempo (
    tiempo_id INT PRIMARY KEY,
    mes INT,
    trimestre INT,
    anio INT
);


CREATE TABLE FactReserva (
    id_reserva INT PRIMARY KEY,
    id_cliente INT,
    id_agencia INT,
    id_viaje INT,
    tiempo_id INT,
    FOREIGN KEY (id_cliente) REFERENCES DimCliente(id_cliente),
    FOREIGN KEY (id_agencia) REFERENCES DimAgencia(id_agencia),
    FOREIGN KEY (id_viaje) REFERENCES DimViaje(id_viaje),
    FOREIGN KEY (tiempo_id) REFERENCES DimTiempo(tiempo_id)
);
