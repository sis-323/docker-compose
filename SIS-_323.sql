-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-05-27 01:21:56.4

-- tables
-- Table: ARCHIVO
CREATE TABLE ARCHIVO (
    id_archivo serial  NOT NULL,
    nombre_archivo varchar(100)  NOT NULL,
    md5 varchar(100)  NOT NULL,
    fecha_subido date  NOT NULL,
    CONSTRAINT ARCHIVO_pk PRIMARY KEY (id_archivo)
);

-- Table: ARCHIVO_ENTREGABLE
CREATE TABLE ARCHIVO_ENTREGABLE (
    id_archivo_entregable serial  NOT NULL,
    id_archivo int  NOT NULL,
    CONSTRAINT ARCHIVO_ENTREGABLE_pk PRIMARY KEY (id_archivo_entregable)
);

-- Table: ASIGNACIONES
CREATE TABLE ASIGNACIONES (
    id_asignacion serial  NOT NULL,
    id_tutor int  NULL,
    id_relator int  NULL,
    id_estudiante int  NOT NULL,
    estado boolean  NOT NULL,
    CONSTRAINT ASIGNACIONES_pk PRIMARY KEY (id_asignacion)
);

-- Table: ENTREGABLES_CRONOGRAMA
CREATE TABLE ENTREGABLES_CRONOGRAMA (
    id_cronograma serial  NOT NULL,
    titulo varchar(200)  NOT NULL,
    fecha_limite date  NOT NULL,
    descripcion varchar(1000)  NOT NULL,
    estado boolean  NOT NULL,
    CONSTRAINT ENTREGABLES_CRONOGRAMA_pk PRIMARY KEY (id_cronograma)
);

-- Table: ENTREGABLE_CRONOGRAMA_ARCHIVO
CREATE TABLE ENTREGABLE_CRONOGRAMA_ARCHIVO (
    id_entregable_archivo serial  NOT NULL,
    id_proyecto_final int  NOT NULL,
    id_cronograma int  NOT NULL,
    id_archivo int  NOT NULL,
    estado boolean  NOT NULL,
    CONSTRAINT ENTREGABLE_CRONOGRAMA_ARCHIVO_pk PRIMARY KEY (id_entregable_archivo)
);

-- Table: ENTREGABLE_ESTUDIANTE
CREATE TABLE ENTREGABLE_ESTUDIANTE (
    id_entregable serial  NOT NULL,
    id_archivo_entregable int  NOT NULL,
    id_cronograma int  NOT NULL,
    id_asignacion int  NOT NULL,
    fecha date  NOT NULL,
    estado varchar(20)  NOT NULL,
    CONSTRAINT ENTREGABLE_ESTUDIANTE_pk PRIMARY KEY (id_entregable)
);

-- Table: INSCRIPCION
CREATE TABLE INSCRIPCION (
    id_inscripcion serial  NOT NULL,
    id_observacion int  NULL,
    id_persona int  NOT NULL,
    id_propuesta int  NOT NULL,
    estado varchar(15)  NOT NULL,
    fecha_propuesta date  NOT NULL,
    semestre varchar(100)  NOT NULL,
    estado_propuest varchar(100)  NOT NULL,
    CONSTRAINT INSCRIPCION_pk PRIMARY KEY (id_inscripcion)
);

-- Table: MATERIAS_BIBLIOTECA
CREATE TABLE MATERIAS_BIBLIOTECA (
    id_materia_biblioteca serial  NOT NULL,
    materia varchar(150)  NOT NULL,
    estado boolean  NOT NULL,
    CONSTRAINT MATERIAS_BIBLIOTECA_pk PRIMARY KEY (id_materia_biblioteca)
);

-- Table: MATERIAS_PROYECTOS_FINALES
CREATE TABLE MATERIAS_PROYECTOS_FINALES (
    id_materia_proyecto int  NOT NULL,
    id_proyecto_final int  NOT NULL,
    id_materia_biblioteca int  NOT NULL,
    CONSTRAINT MATERIAS_PROYECTOS_FINALES_pk PRIMARY KEY (id_materia_proyecto)
);

-- Table: MODALIDADES
CREATE TABLE MODALIDADES (
    id_modalidad serial  NOT NULL,
    modalidad varchar(100)  NOT NULL,
    CONSTRAINT MODALIDADES_pk PRIMARY KEY (id_modalidad)
);

-- Table: OBSERVACION
CREATE TABLE OBSERVACION (
    id_observacion serial  NOT NULL,
    observaci text  NOT NULL,
    fecha date  NOT NULL,
    subido_por varchar(100)  NOT NULL,
    CONSTRAINT OBSERVACION_pk PRIMARY KEY (id_observacion)
);

-- Table: PANEL
CREATE TABLE PANEL (
    id_panel serial  NOT NULL,
    nombre_panel varchar(50)  NOT NULL,
    CONSTRAINT PANEL_pk PRIMARY KEY (id_panel)
);

-- Table: PROPUESTAS
CREATE TABLE PROPUESTAS (
    id_propuesta serial  NOT NULL,
    id_archivo int  NOT NULL,
    titulo varchar(300)  NOT NULL,
    id_persona int  NOT NULL,
    estado boolean  NOT NULL,
    CONSTRAINT PROPUESTAS_pk PRIMARY KEY (id_propuesta)
);

-- Table: PROYECTOS_FINALES
CREATE TABLE PROYECTOS_FINALES (
    id_proyecto_final serial  NOT NULL,
    id_asignacion int  NOT NULL,
    titulo varchar(200)  NOT NULL,
    resumen varchar(2000)  NOT NULL,
    year varchar(15)  NOT NULL,
    materia int  NOT NULL,
    estado boolean  NOT NULL,
    finalizado boolean  NOT NULL,
    CONSTRAINT PROYECTOS_FINALES_pk PRIMARY KEY (id_proyecto_final)
);

-- Table: Persona
CREATE TABLE Persona (
    id_persona serial  NOT NULL,
    id_modalidad int  NOT NULL,
    id_kc varchar(100)  NOT NULL,
    nombre varchar(100)  NOT NULL,
    apellido_paterno varchar(100)  NOT NULL,
    apellido_materno varchar(100)  NOT NULL,
    correo varchar(200)  NOT NULL,
    numero_celular varchar(20)  NOT NULL,
    estado boolean  NOT NULL,
    grupo varchar(20)  NOT NULL,
    semestre varchar(100)  NOT NULL,
    CONSTRAINT Persona_pk PRIMARY KEY (id_persona)
);

-- Table: REQUISITOS_ESTUDIANTE
CREATE TABLE REQUISITOS_ESTUDIANTE (
    id_requisito_estudiante serial  NOT NULL,
    id_inscripcion int  NOT NULL,
    id_archivo int  NOT NULL,
    id_persona int  NOT NULL,
    nombre_requisito varchar(100)  NOT NULL,
    CONSTRAINT REQUISITOS_ESTUDIANTE_pk PRIMARY KEY (id_requisito_estudiante)
);

-- Table: REQUISITOS_PANEL
CREATE TABLE REQUISITOS_PANEL (
    id_requisitos_panel serial  NOT NULL,
    id_panel int  NOT NULL,
    id_archivo int  NOT NULL,
    nombre_requisito varchar(200)  NOT NULL,
    descripcion varchar(500)  NOT NULL,
    CONSTRAINT REQUISITOS_PANEL_pk PRIMARY KEY (id_requisitos_panel)
);

-- Table: SESIONES_VISITA
CREATE TABLE SESIONES_VISITA (
    id_sesision serial  NOT NULL,
    id_asignacion int  NOT NULL,
    fecha date  NOT NULL,
    observacion varchar(2000)  NOT NULL,
    estudiante_asistio boolean  NOT NULL,
    estado boolean  NOT NULL,
    CONSTRAINT SESIONES_VISITA_pk PRIMARY KEY (id_sesision)
);

-- End of file.

