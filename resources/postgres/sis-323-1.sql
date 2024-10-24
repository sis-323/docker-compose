-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-06-15 21:56:31.034

-- tables
-- Table: ACTA_DEFENSA
CREATE TABLE ACTA_DEFENSA (
    id_acta serial  NOT NULL,
    id_archivo int  NOT NULL,
    id_proyecto_final int  NOT NULL,
    fecha date  NOT NULL,
    nota int  NOT NULL,
    estado varchar(50)  NOT NULL,
    horario varchar(100)  NOT NULL,
    id_carta int  NOT NULL,
    CONSTRAINT ACTA_DEFENSA_pk PRIMARY KEY (id_acta)
);

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

-- Table: CARTA_CUMPLIMIENTO
CREATE TABLE CARTA_CUMPLIMIENTO (
    id_carta serial  NOT NULL,
    id_archivo int  NOT NULL,
    id_proyecto_final int  NOT NULL,
    fecha DATE  NOT NULL,
    hora timestamp  NOT NULL,
    aprobada_por_tutor boolean  NULL,
    aprobado_por_relator boolean  NULL,
    CONSTRAINT CARTA_CUMPLIMIENTO_pk PRIMARY KEY (id_carta)
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
    id_proyecto_final int  NOT NULL,
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
    id_materia_proyecto serial  NOT NULL,
    id_materia_biblioteca int  NOT NULL,
    id_proyecto_aprobado int  NOT NULL,
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
    year varchar(15)  NOT NULL,
    estado boolean  NOT NULL,
    finalizado boolean  NOT NULL,
    CONSTRAINT PROYECTOS_FINALES_pk PRIMARY KEY (id_proyecto_final)
);

-- Table: PROYECTO_APROBADO
CREATE TABLE PROYECTO_APROBADO (
    id_proyecto_aprobado serial  NOT NULL,
    id_acta int  NOT NULL,
    fecha_aprobado date  NOT NULL,
    resumen text  NOT NULL,
    titulo_oficial varchar(1000)  NOT NULL,
    autor varchar(250)  NOT NULL,
    CONSTRAINT PROYECTO_APROBADO_pk PRIMARY KEY (id_proyecto_aprobado)
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
    observacion varchar(2000)  NULL,
    estudiante_asistio boolean  NULL,
    estado boolean  NOT NULL,
    hora date  NOT NULL,
    plataforma varchar(30)  NOT NULL,
    enlace varchar(500)  NOT NULL,
    accion_realizada text  NOT NULL,
    CONSTRAINT SESIONES_VISITA_pk PRIMARY KEY (id_sesision)
);

-- foreign keys
-- Reference: ACTA_DEFENSA_ARCHIVO (table: ACTA_DEFENSA)
ALTER TABLE ACTA_DEFENSA ADD CONSTRAINT ACTA_DEFENSA_ARCHIVO
    FOREIGN KEY (id_archivo)
    REFERENCES ARCHIVO (id_archivo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ACTA_DEFENSA_CARTA_CUMPLIMIENTO (table: ACTA_DEFENSA)
ALTER TABLE ACTA_DEFENSA ADD CONSTRAINT ACTA_DEFENSA_CARTA_CUMPLIMIENTO
    FOREIGN KEY (id_carta)
    REFERENCES CARTA_CUMPLIMIENTO (id_carta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ACTA_DEFENSA_PROYECTOS_FINALES (table: ACTA_DEFENSA)
ALTER TABLE ACTA_DEFENSA ADD CONSTRAINT ACTA_DEFENSA_PROYECTOS_FINALES
    FOREIGN KEY (id_proyecto_final)
    REFERENCES PROYECTOS_FINALES (id_proyecto_final)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ARCHIVO_ENTREGABLE_ARCHIVO (table: ARCHIVO_ENTREGABLE)
ALTER TABLE ARCHIVO_ENTREGABLE ADD CONSTRAINT ARCHIVO_ENTREGABLE_ARCHIVO
    FOREIGN KEY (id_archivo)
    REFERENCES ARCHIVO (id_archivo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ASIGNACIONES_ESTUDIANTE (table: ASIGNACIONES)
ALTER TABLE ASIGNACIONES ADD CONSTRAINT ASIGNACIONES_ESTUDIANTE
    FOREIGN KEY (id_relator)
    REFERENCES Persona (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ASIGNACIONES_RELATOR (table: ASIGNACIONES)
ALTER TABLE ASIGNACIONES ADD CONSTRAINT ASIGNACIONES_RELATOR
    FOREIGN KEY (id_estudiante)
    REFERENCES Persona (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ASIGNACIONES_TUTOR (table: ASIGNACIONES)
ALTER TABLE ASIGNACIONES ADD CONSTRAINT ASIGNACIONES_TUTOR
    FOREIGN KEY (id_tutor)
    REFERENCES Persona (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: CARTA_CUMPLIMIENTO_PROYECTOS_FINALES (table: CARTA_CUMPLIMIENTO)
ALTER TABLE CARTA_CUMPLIMIENTO ADD CONSTRAINT CARTA_CUMPLIMIENTO_PROYECTOS_FINALES
    FOREIGN KEY (id_proyecto_final)
    REFERENCES PROYECTOS_FINALES (id_proyecto_final)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ENTREGABLE_CRONOGRAMA_ARCHIVO_ARCHIVO (table: ENTREGABLE_CRONOGRAMA_ARCHIVO)
ALTER TABLE ENTREGABLE_CRONOGRAMA_ARCHIVO ADD CONSTRAINT ENTREGABLE_CRONOGRAMA_ARCHIVO_ARCHIVO
    FOREIGN KEY (id_archivo)
    REFERENCES ARCHIVO (id_archivo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ENTREGABLE_CRONOGRAMA_ARCHIVO_ENTREGABLE_CRONOGRAMA (table: ENTREGABLE_CRONOGRAMA_ARCHIVO)
ALTER TABLE ENTREGABLE_CRONOGRAMA_ARCHIVO ADD CONSTRAINT ENTREGABLE_CRONOGRAMA_ARCHIVO_ENTREGABLE_CRONOGRAMA
    FOREIGN KEY (id_cronograma)
    REFERENCES ENTREGABLES_CRONOGRAMA (id_cronograma)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ENTREGABLE_CRONOGRAMA_ARCHIVO_PROYECTOS_FINALES (table: ENTREGABLE_CRONOGRAMA_ARCHIVO)
ALTER TABLE ENTREGABLE_CRONOGRAMA_ARCHIVO ADD CONSTRAINT ENTREGABLE_CRONOGRAMA_ARCHIVO_PROYECTOS_FINALES
    FOREIGN KEY (id_proyecto_final)
    REFERENCES PROYECTOS_FINALES (id_proyecto_final)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ENTREGABLE_ESTUDIANTE_ARCHIVO_ENTREGABLE (table: ENTREGABLE_ESTUDIANTE)
ALTER TABLE ENTREGABLE_ESTUDIANTE ADD CONSTRAINT ENTREGABLE_ESTUDIANTE_ARCHIVO_ENTREGABLE
    FOREIGN KEY (id_archivo_entregable)
    REFERENCES ARCHIVO_ENTREGABLE (id_archivo_entregable)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ENTREGABLE_ESTUDIANTE_ASIGNACIONES (table: ENTREGABLE_ESTUDIANTE)
ALTER TABLE ENTREGABLE_ESTUDIANTE ADD CONSTRAINT ENTREGABLE_ESTUDIANTE_ASIGNACIONES
    FOREIGN KEY (id_asignacion)
    REFERENCES ASIGNACIONES (id_asignacion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ENTREGABLE_ESTUDIANTE_ENTREGABLES_CRONOGRAMA (table: ENTREGABLE_ESTUDIANTE)
ALTER TABLE ENTREGABLE_ESTUDIANTE ADD CONSTRAINT ENTREGABLE_ESTUDIANTE_ENTREGABLES_CRONOGRAMA
    FOREIGN KEY (id_cronograma)
    REFERENCES ENTREGABLES_CRONOGRAMA (id_cronograma)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ENTREGABLE_ESTUDIANTE_PROYECTOS_FINALES (table: ENTREGABLE_ESTUDIANTE)
ALTER TABLE ENTREGABLE_ESTUDIANTE ADD CONSTRAINT ENTREGABLE_ESTUDIANTE_PROYECTOS_FINALES
    FOREIGN KEY (id_proyecto_final)
    REFERENCES PROYECTOS_FINALES (id_proyecto_final)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: INSCRIPCION_OBSERVACION (table: INSCRIPCION)
ALTER TABLE INSCRIPCION ADD CONSTRAINT INSCRIPCION_OBSERVACION
    FOREIGN KEY (id_observacion)
    REFERENCES OBSERVACION (id_observacion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: INSCRIPCION_PROPUESTA (table: INSCRIPCION)
ALTER TABLE INSCRIPCION ADD CONSTRAINT INSCRIPCION_PROPUESTA
    FOREIGN KEY (id_propuesta)
    REFERENCES PROPUESTAS (id_propuesta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: INSCRIPCION_Persona (table: INSCRIPCION)
ALTER TABLE INSCRIPCION ADD CONSTRAINT INSCRIPCION_Persona
    FOREIGN KEY (id_persona)
    REFERENCES Persona (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: MATERIAS_PROYECTOS_FINALES_MATERIAS_BIBLIOTECA (table: MATERIAS_PROYECTOS_FINALES)
ALTER TABLE MATERIAS_PROYECTOS_FINALES ADD CONSTRAINT MATERIAS_PROYECTOS_FINALES_MATERIAS_BIBLIOTECA
    FOREIGN KEY (id_materia_biblioteca)
    REFERENCES MATERIAS_BIBLIOTECA (id_materia_biblioteca)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: MATERIAS_PROYECTOS_FINALES_PROYECTO_APROBADO (table: MATERIAS_PROYECTOS_FINALES)
ALTER TABLE MATERIAS_PROYECTOS_FINALES ADD CONSTRAINT MATERIAS_PROYECTOS_FINALES_PROYECTO_APROBADO
    FOREIGN KEY (id_proyecto_aprobado)
    REFERENCES PROYECTO_APROBADO (id_proyecto_aprobado)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PROPUESTAS_Persona (table: PROPUESTAS)
ALTER TABLE PROPUESTAS ADD CONSTRAINT PROPUESTAS_Persona
    FOREIGN KEY (id_persona)
    REFERENCES Persona (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PROPUESTA_ARCHIVO (table: PROPUESTAS)
ALTER TABLE PROPUESTAS ADD CONSTRAINT PROPUESTA_ARCHIVO
    FOREIGN KEY (id_archivo)
    REFERENCES ARCHIVO (id_archivo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PROYECTOS_FINALES_ASIGNACIONES (table: PROYECTOS_FINALES)
ALTER TABLE PROYECTOS_FINALES ADD CONSTRAINT PROYECTOS_FINALES_ASIGNACIONES
    FOREIGN KEY (id_asignacion)
    REFERENCES ASIGNACIONES (id_asignacion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PROYECTO_APROBADO_ACTA_DEFENSA (table: PROYECTO_APROBADO)
ALTER TABLE PROYECTO_APROBADO ADD CONSTRAINT PROYECTO_APROBADO_ACTA_DEFENSA
    FOREIGN KEY (id_acta)
    REFERENCES ACTA_DEFENSA (id_acta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Persona_MODALIDADES (table: Persona)
ALTER TABLE Persona ADD CONSTRAINT Persona_MODALIDADES
    FOREIGN KEY (id_modalidad)
    REFERENCES MODALIDADES (id_modalidad)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: REQUISITOS_ESTUDIANTE_ARCHIVO (table: REQUISITOS_ESTUDIANTE)
ALTER TABLE REQUISITOS_ESTUDIANTE ADD CONSTRAINT REQUISITOS_ESTUDIANTE_ARCHIVO
    FOREIGN KEY (id_archivo)
    REFERENCES ARCHIVO (id_archivo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: REQUISITOS_ESTUDIANTE_INSCRIPCION (table: REQUISITOS_ESTUDIANTE)
ALTER TABLE REQUISITOS_ESTUDIANTE ADD CONSTRAINT REQUISITOS_ESTUDIANTE_INSCRIPCION
    FOREIGN KEY (id_inscripcion)
    REFERENCES INSCRIPCION (id_inscripcion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: REQUISITOS_ESTUDIANTE_Persona (table: REQUISITOS_ESTUDIANTE)
ALTER TABLE REQUISITOS_ESTUDIANTE ADD CONSTRAINT REQUISITOS_ESTUDIANTE_Persona
    FOREIGN KEY (id_persona)
    REFERENCES Persona (id_persona)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: REQUISITOS_PANEL_ARCHIVO (table: REQUISITOS_PANEL)
ALTER TABLE REQUISITOS_PANEL ADD CONSTRAINT REQUISITOS_PANEL_ARCHIVO
    FOREIGN KEY (id_archivo)
    REFERENCES ARCHIVO (id_archivo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: REQUISITOS_PANEL_PANEL (table: REQUISITOS_PANEL)
ALTER TABLE REQUISITOS_PANEL ADD CONSTRAINT REQUISITOS_PANEL_PANEL
    FOREIGN KEY (id_panel)
    REFERENCES PANEL (id_panel)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: SESIONES_VISITA_ASIGNACIONES (table: SESIONES_VISITA)
ALTER TABLE SESIONES_VISITA ADD CONSTRAINT SESIONES_VISITA_ASIGNACIONES
    FOREIGN KEY (id_asignacion)
    REFERENCES ASIGNACIONES (id_asignacion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Table_33_ARCHIVO (table: CARTA_CUMPLIMIENTO)
ALTER TABLE CARTA_CUMPLIMIENTO ADD CONSTRAINT Table_33_ARCHIVO
    FOREIGN KEY (id_archivo)
    REFERENCES ARCHIVO (id_archivo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

--
insert into MODALIDADES (modalidad) values ('Taller de Grado');

insert into PERSONA (id_modalidad, id_kc, nombre, apellido_paterno, apellido_materno, correo, numero_celular, estado, grupo, semestre)
values (1, 'c52cbb95-5483-4781-857b-15c7a37d464c', 'Administrador', 'Sistema de', 'Titulaciones', 'mail@test.com', '1002321', true, 'professors', 'II-2024');

insert into PERSONA (id_modalidad, id_kc, nombre, apellido_paterno, apellido_materno, correo, numero_celular, estado, grupo, semestre)
values (1, '47b30713-21c1-44c7-8105-a4a35b3beda0', 'Juan', 'Perez', 'Gutierrez', 'juan.perez@ucb.edu.bo', '65117251', true, 'students', 'II-2024');

insert into PERSONA (id_modalidad, id_kc, nombre, apellido_paterno, apellido_materno, correo, numero_celular, estado, grupo, semestre)
values (1, 'adfbaf75-146f-4519-b37e-6eb56869d1d5', 'Lourdes', 'Peredo', 'Peredez', 'lourdes@gmail.com', '99991919', true, 'tutors', 'II-2024');


