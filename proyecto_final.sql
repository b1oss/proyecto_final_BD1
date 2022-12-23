CREATE DATABASE tienda_bicicleta;

USE tienda_bicicleta;

CREATE TABLE cliente (
	cliente_ID INTEGER PRIMARY KEY,
    nombre VARCHAR(50),
    prim_apell VARCHAR(50),
    seg_apell VARCHAR(50),
    genero CHAR,
    distrito VARCHAR(50),
    correo VARCHAR(100),
    contrasenia VARCHAR(100)
);

CREATE TABLE empleado (
	empleado_ID INTEGER PRIMARY KEY,
    nombre VARCHAR(50),
    prim_apell VARCHAR(50),
    seg_apell VARCHAR(50),
    genero CHAR,
    correo VARCHAR(100),
    fecha_nacimiento date,
    contrasenia VARCHAR(100)
);

CREATE TABLE telefonos_empleado (
	empleado_ID INTEGER PRIMARY KEY,
    telefonos INTEGER
);

CREATE TABLE bicicletas (
	bicicleta_ID INTEGER PRIMARY KEY,
    modelo VARCHAR(50),
    precio FLOAT,
    marca VARCHAR(50),
    total_productos INTEGER,
    cambios CHAR,
    tipo_frenos VARCHAR(50),
    radio_aros FLOAT,
    tipo VARCHAR(50)
);

CREATE TABLE fabricante_bicicletas (
	bicicleta_ID INTEGER PRIMARY KEY,
    telefonos INTEGER
);

CREATE TABLE coderas (
	coderas_ID INTEGER PRIMARY KEY,
    modelo VARCHAR(50),
    precio FLOAT,
    marca VARCHAR(50),
    total_productos INTEGER,
    talla VARCHAR(5),
    material VARCHAR(50)
);

CREATE TABLE fabricante_coderas (
	coderas_ID INTEGER PRIMARY KEY,
    telefonos INTEGER
);

CREATE TABLE rodilleras (
	rodilleras_ID INTEGER PRIMARY KEY,
    modelo VARCHAR(50),
    precio FLOAT,
    marca VARCHAR(50),
    total_productos INTEGER,
    talla VARCHAR(5),
    material VARCHAR(50)
);

CREATE TABLE fabricante_rodilleras (
	rodilleras_ID INTEGER PRIMARY KEY,
    telefonos INTEGER
);

CREATE TABLE cascos (
	cascos_ID INTEGER PRIMARY KEY,
    modelo VARCHAR(50),
    precio FLOAT,
    marca VARCHAR(50),
    total_productos INTEGER,
    talla VARCHAR(5),
    peso FLOAT
);

CREATE TABLE fabricante_cascos (
	cascos_ID INTEGER PRIMARY KEY,
    telefonos INTEGER
);

CREATE TABLE compra (
    compra_ID INTEGER,
    cliente_ID INTEGER,
    compra_total FLOAT,
    fecha_compra DATE,
    PRIMARY KEY(compra_ID, cliente_ID)
)

CREATE TABLE compra_bicicletas (
	compra_ID INTEGER,
    cliente_ID INTEGER,
    bicicleta_ID INTEGER,
    unidades INTEGER,
    precio_total FLOAT,
    PRIMARY KEY(compra_ID, cliente_ID, bicicleta_ID)
);

CREATE TABLE compra_coderas (
	compra_ID INTEGER,
    cliente_ID INTEGER,
    coderas_ID INTEGER,
    unidades INTEGER,
    precio_total FLOAT,
    PRIMARY KEY(compra_ID, cliente_ID, coderas_ID)
);

CREATE TABLE compra_rodilleras (
	compra_ID INTEGER,
    cliente_ID INTEGER,
    rodilleras_ID INTEGER,
    unidades INTEGER,
    precio_total FLOAT,
    PRIMARY KEY(compra_ID, cliente_ID, rodilleras_ID)
);

CREATE TABLE compra_cascos (
	compra_ID INTEGER,
    cliente_ID INTEGER,
    cascos_ID INTEGER,
    unidades INTEGER,
    precio_total FLOAT,
    PRIMARY KEY(compra_ID, cliente_ID, cascos_ID)
);

CREATE TABLE venta (
	venta_ID INTEGER,
    empleado_ID INTEGER,
    costo_total FLOAT,
    cantidad_productos INTEGER,
    fecha_venta DATE,
    PRIMARY KEY(venta_ID, empleado_ID)
);

CREATE TABLE venta_bicicletas(
    venta_ID INTEGER,
    empleaado_ID INTEGER,
    bicicleta_ID INTEGER,
    rodilleras_ID INTEGER,
    unidades INTEGER,
    costo_total FLOAT,
    PRIMARY KEY(venta_ID, empleaado_ID, bicicleta_ID)
)

CREATE TABLE venta_coderas(
    venta_ID INTEGER,
    empleaado_ID INTEGER,
    coderas_ID INTEGER,
    rodilleras_ID INTEGER,
    unidades INTEGER,
    costo_total FLOAT,
    PRIMARY KEY(venta_ID, empleaado_ID, coderas_ID)
)

CREATE TABLE venta_cascos(
    venta_ID INTEGER,
    empleaado_ID INTEGER,
    cascos_ID INTEGER,
    rodilleras_ID INTEGER,
    unidades INTEGER,
    costo_total FLOAT,
    PRIMARY KEY(venta_ID, empleaado_ID, cascos_ID)
)

CREATE TABLE venta_rodilleras(
    venta_ID INTEGER,
    empleaado_ID INTEGER,
    rodilleras_ID INTEGER,
    rodilleras_ID INTEGER,
    unidades INTEGER,
    costo_total FLOAT,
    PRIMARY KEY(venta_ID, empleaado_ID, rodilleras_ID)
)

CREATE TABLE atiende (
	cliente_ID INTEGER,
    empleado_ID INTEGER,
    PRIMARY KEY(cliente_ID, empleaado_ID)
);

ALTER TABLE telefonos_empleado ADD FOREIGN KEY (empleado_ID) REFERENCES empleado(empleado_ID);
ALTER TABLE fabricante_coderas ADD FOREIGN KEY (coderas_ID) REFERENCES coderas(coderas_ID);