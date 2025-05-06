
use modelo1; 
CREATE TABLE DimLote (
    id_lote INT PRIMARY KEY,
    lote VARCHAR(50),
    peso DECIMAL(10,2),
    id_grupo INT,
    id_pais INT
);


CREATE TABLE DimGrupoCentroCosto (
    id_grupo_centro_costo INT PRIMARY KEY,
    grupo_centro_costo VARCHAR(100)
);


CREATE TABLE DimDestino (
    id_destino INT PRIMARY KEY,
    destino VARCHAR(100),
    id_pais INT
);


CREATE TABLE DimModoTransporte (
    id_modo_transporte INT PRIMARY KEY,
    modo_transporte VARCHAR(50)
);


CREATE TABLE DimTiempo (
    tiempo_id INT PRIMARY KEY,
    mes INT,
    anio INT
);


CREATE TABLE FactEnvio (
    id_envio INT PRIMARY KEY,
    id_lote INT,
    id_destino INT,
    id_grupo_centro_costo INT,
    id_modo_transporte INT,
    tiempo_id INT,
    costo DECIMAL(12,2),
    FOREIGN KEY (id_lote) REFERENCES DimLote(id_lote),
    FOREIGN KEY (id_destino) REFERENCES DimDestino(id_destino),
    FOREIGN KEY (id_grupo_centro_costo) REFERENCES DimGrupoCentroCosto(id_grupo_centro_costo),
    FOREIGN KEY (id_modo_transporte) REFERENCES DimModoTransporte(id_modo_transporte),
    FOREIGN KEY (tiempo_id) REFERENCES DimTiempo(tiempo_id)
);
