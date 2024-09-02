-- Crear tabla Cliente
CREATE TABLE CLIENTE (
    id_cliente VARCHAR2(12),
    nombre VARCHAR2(100),
    apellido VARCHAR2(100),
    email VARCHAR2(100),
    telefono VARCHAR2(15),
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
);

-- Crear tabla Habitacion
CREATE TABLE Habitacion (
    id_habitacion NUMBER GENERATED BY DEFAULT AS IDENTITY,
    numero_habitacion VARCHAR2(10),
    tipo_habitacion VARCHAR2(50),
    precio_por_noche NUMBER(10, 2),
    estado VARCHAR2(20),
    CONSTRAINT pk_habitacion PRIMARY KEY (id_habitacion)
);

-- Crear tabla Recepcionista
CREATE TABLE Recepcionista (
    id_empleado VARCHAR(12),
    nombre VARCHAR2(100),
    apellido VARCHAR2(100),
    cargo VARCHAR2(50),
    contacto VARCHAR2(100),
    CONSTRAINT pk_empleado PRIMARY KEY (id_empleado)
);

-- Crear tabla Reserva
CREATE TABLE Reserva (
    id_reserva NUMBER GENERATED BY DEFAULT AS IDENTITY,
    id_cliente VARCHAR(12),
    id_habitacion NUMBER,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR2(20),
    CONSTRAINT pk_reserva PRIMARY KEY (id_reserva),
    CONSTRAINT fk_reserva_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    CONSTRAINT fk_reserva_habitacion FOREIGN KEY (id_habitacion) REFERENCES Habitacion(id_habitacion)
);

-- Crear tabla Pago
CREATE TABLE Pago (
    id_pago NUMBER GENERATED BY DEFAULT AS IDENTITY,
    id_reserva NUMBER,
    fecha_pago DATE,
    monto NUMBER(10, 2),
    metodo_pago VARCHAR2(50),
    CONSTRAINT pk_pago PRIMARY KEY (id_pago),
    CONSTRAINT fk_pago_reserva FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva)
);
