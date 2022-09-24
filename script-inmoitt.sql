DROP KEYSPACE INMOITT;
CREATE KEYSPACE INMOITT WITH REPLICATION={'class':'SimpleStrategy', 'replication_factor':1};
USE INMOITT;

/*TIPOS DE DATOS*/
CREATE TYPE notario(
nombre VARCHAR,
apellido VARCHAR,
correo VARCHAR,
foto VARCHAR
);

CREATE TYPE agente(
nombre VARCHAR,
apellido VARCHAR,
correo VARCHAR,
foto VARCHAR
);

CREATE TYPE direccion(
calle VARCHAR,
codigoPostal VARCHAR,
colonia VARCHAR,
numeroExterior INT,
numeroInterior INT
);

CREATE TYPE valuador(
nombre VARCHAR,
apellido VARCHAR,
correo VARCHAR,
foto VARCHAR
);
/**************************************************/
/*TABLAS SOBRE INMOBILIARIAS*/
CREATE TABLE INMOBILIARIAS(
NOMBRE VARCHAR,
DIRECCION FROZEN<DIRECCION>,
ESTADO VARCHAR,
VALUADORES LIST<FROZEN<VALUADOR>>,
NOTARIOS LIST<FROZEN<NOTARIO>>,
AGENTES LIST<FROZEN<AGENTE>>,
CORREO VARCHAR,
PASSWORD VARCHAR,
PRIMARY KEY(NOMBRE, ESTADO)
)WITH COMMENT='C1';

CREATE TABLE CLIENTE_INMOBILIARIA(
CORREO VARCHAR,
INMOBILIARIA VARCHAR,
NOMBRE VARCHAR,
APELLIDO VARCHAR,
FOTO VARCHAR,
PRIMARY KEY(INMOBILIARIA, CORREO)
)WITH COMMENT='I3';
/***************************************************/
/*TABLAS SOBRE EL CLIENTE*/
CREATE TABLE CLIENTES(
CORREO VARCHAR,
PASSWORD VARCHAR,
NOMBRE VARCHAR,
APELLIDO VARCHAR,
PRIMARY KEY(CORREO, NOMBRE, APELLIDO)
)WITH COMMENT='C8'
/*************************************************************/
/*TABLAS DE FLETES*/
CREATE TABLE PAQUETES(
ID VARCHAR,
ID_ITEM VARCHAR,
ITEM VARCHAR,
FOTO VARCHAR,
PRIMARY KEY(ID, ID_ITEM)
)WITH COMMENT='C5, F1';

CREATE TABLE CARGADORES(
RFC VARCHAR,
NOMBRE VARCHAR,
APELLIDO VARCHAR,
PASSWORD VARCHAR,
TELEFONO VARCHAR,
PRIMARY KEY(RFC, NOMBRE, APELLIDO)
)WITH COMMENT='C7, F3';

CREATE TABLE TRANSPORTES(
MATRICULA VARCHAR PRIMARY KEY,
CAPACIDAD DECIMAL
)WITH COMMENT='C6, F2';

CREATE TABLE ITEMS(
ID VARCHAR PRIMARY KEY,
NOMBRE VARCHAR,
ANCHO DECIMAL,
ALTO DECIMAL,
FOTO VARCHAR
);

CREATE TABLE FLETES(
ID VARCHAR,
TRANSPORTE VARCHAR,
DESTINO FROZEN<DIRECCION>,
PAQUETE VARCHAR,
CLIENTE VARCHAR,
TELEFONO VARCHAR,
PRIMARY KEY (ID, TRANSPORTE, PAQUETE)
);
/*************************************************/
/*TABLAS DE INMUEBLES*/
CREATE TABLE INMUEBLES(
TITULO VARCHAR,
ESTADO VARCHAR,
FOTO VARCHAR,
DIRECCION FROZEN<DIRECCION>,
PRECIO_RENTA DECIMAL,
PRECIO_VENTA DECIMAL,
CUARTOS SMALLINT,
PISOS SMALLINT,
METROS_CUADRADOS DECIMAL,
DESCRIPCION VARCHAR,
SERVICIOS SET<VARCHAR>,
NOTARIO FROZEN<NOTARIO>,
PRIMARY KEY (TITULO, ESTADO)
)WITH COMMENT='C2, C3, C5, I1, I2';

CREATE TABLE INMUEBLES_INMOBILIARIA(
INMOBILIARIA VARCHAR,
TITULO VARCHAR,
ESTADO VARCHAR,
FOTO VARCHAR,
DIRECCION FROZEN<DIRECCION>,
PRECIO_RENTA DECIMAL,
PRECIO_VENTA DECIMAL,
METROS_CUADRADOS DECIMAL,
PRIMARY KEY (INMOBILIARIA, ESTADO, TITULO)
)WITH COMMENT='I1';

CREATE TABLE INMUEBLES_CLIENTE(
CLIENTE VARCHAR,
TITULO VARCHAR,
ESTADO VARCHAR,
FOTO VARCHAR,
DIRECCION FROZEN<DIRECCION>,
PRECIO_RENTA DECIMAL,
PRECIO_VENTA DECIMAL,
METROS_CUADRADOS DECIMAL,
ACREDITADO BOOLEAN,
PRIMARY KEY (CLIENTE, ESTADO, TITULO)
)WITH COMMENT='C9';