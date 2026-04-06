USE Universidad;
GO
-- ============================================
-- TABLAS DEPENDIENTES NECESARIAS (sin componente)
-- ============================================
-- 1. universidad
INSERT INTO universidad (id, nombre, tipo, ciudad) VALUES
(1, N'Universidad Nacional de Colombia', N'Pública', N'Bogotá'),
(2, N'Universidad de Antioquia', N'Pública', N'Medellín'),
(3, N'Universidad del Valle', N'Pública', N'Cali');
GO
-- 2. facultad
INSERT INTO facultad (id, nombre, tipo, fecha_fun, universidad) VALUES
(101, N'Facultad de Ingeniería', N'Ingeniería', '1990-05-15', 1),
(102, N'Facultad de Ciencias', N'Ciencias', '1985-08-20', 2),
(103, N'Facultad de Humanidades', N'Humanidades', '1975-03-10', 3);
GO
-- 3. programa
INSERT INTO programa (id, nombre, tipo, nivel, fecha_creacion, fecha_cierre, 
                      numero_cohortes, cant_graduados, fecha_actualizacion, ciudad, facultad) VALUES
(201, N'Ingeniería de Sistemas', N'Pregrado', N'Universitario', '2000-01-01', NULL, 
 '10', '350', '2024-06-01', N'Bogotá', 101),
(202, N'Biología', N'Pregrado', N'Universitario', '1995-02-01', NULL, 
 '8', '280', '2024-05-15', N'Medellín', 102),
(203, N'Literatura', N'Maestría', N'Posgrado', '2005-09-01', NULL, 
 '5', '120', '2024-04-20', N'Cali', 103);
GO
-- ============================================
-- TABLAS CON COMPONENTES (INDEPENDIENTES)
-- ============================================
-- 4. linea_investigacion (IDENTITY_INSERT ON)
SET IDENTITY_INSERT linea_investigacion ON;
INSERT INTO linea_investigacion (id, nombre, descripcion) VALUES
(1, N'Inteligencia Artificial', N'Desarrollo de algoritmos de aprendizaje automático y visión por computadora'),
(2, N'Biología Molecular', N'Estudio de procesos celulares y genéticos a nivel molecular'),
(3, N'Energías Renovables', N'Investigación en fuentes de energía sostenible y eficiencia energética');
SET IDENTITY_INSERT linea_investigacion OFF;
GO
-- 5. area_conocimiento
INSERT INTO area_conocimiento (id, gran_area, area, disciplina) VALUES
(301, N'Ciencias Naturales', N'Ciencias Biológicas', N'Biología Molecular'),
(302, N'Ingeniería y Tecnología', N'Ingeniería de Sistemas', N'Inteligencia Artificial'),
(303, N'Humanidades', N'Literatura', N'Literatura Contemporánea');
GO
-- 6. termino_clave
INSERT INTO termino_clave (termino, termino_ingles) VALUES
(N'machine learning', N'machine learning'),
(N'genómica', N'genomics'),
(N'sostenibilidad', N'sustainability'),
(N'literatura digital', N'digital literature');
GO
-- 7. red
INSERT INTO red (idr, nombre, url, pais) VALUES
(401, N'Red Colombiana de IA', N'https://redia.co', N'Colombia'),
(402, N'Red Latinoamericana de Biología', N'https://redlabio.org', N'Argentina'),
(403, N'Red Iberoamericana de Humanidades', N'https://redih.org', N'España');
GO
-- 8. aliado
INSERT INTO aliado (nit, razon_social, nombre_contacto, correo, telefono, ciudad) VALUES
(9001234567, N'Microsoft Colombia', N'Carlos Rodríguez', N'carlos@microsoft.com', N'3001234567', N'Bogotá'),
(9007654321, N'Biogen Inc.', N'Ana Gómez', N'ana.gomez@biogen.com', N'3109876543', N'Medellín'),
(9005558888, N'Editorial Planeta', N'Lucía Fernández', N'lucia@editorialplaneta.com', N'3205556677', N'Cali');
GO
-- ============================================
-- TABLAS CON COMPONENTES (DEPENDIENTES DE LAS ANTERIORES)
-- ============================================
-- 9. docente
INSERT INTO docente (cedula, nombres, apellidos, genero, cargo, fecha_nacimiento, correo, 
                     telefono, url_cvlac, fecha_actualizacion, escalafon, perfil, 
                     cat_minciencia, conv_minciencia, nacionalidaad, linea_investigacion_principal) VALUES
(1001, N'María', N'González Pérez', N'Femenino', N'Profesor Asociado', '1978-03-22', 
 N'maria.gonzalez@unal.edu.co', N'3112223344', N'https://cvlac.com/mgonzalez', 
 '2024-01-15', N'Asociado', N'Experta en IA y machine learning con 15 años de experiencia', 
 N'Senior', N'2023', N'Colombia', 1),
(1002, N'Carlos', N'Ramírez López', N'Masculino', N'Profesor Titular', '1970-07-30', 
 N'carlos.ramirez@udea.edu.co', N'3123334455', N'https://cvlac.com/cramirez', 
 '2024-02-20', N'Titular', N'Investigador en biología molecular y genética', 
 N'Senior', N'2022', N'Colombia', 2),
(1003, N'Ana', N'Martínez Ruiz', N'Femenino', N'Profesor Asistente', '1985-11-15', 
 N'ana.martinez@univalle.edu.co', N'3134445566', N'https://cvlac.com/amartinez', 
 '2024-03-10', N'Asistente', N'Especialista en literatura contemporánea y estudios culturales', 
 N'Asociado', N'2024', N'Colombia', NULL);
GO
-- 10. estudios_realizados
INSERT INTO estudios_realizados (id, titulo, universidad, fecha, tipo, ciudad, docente, 
                                 ins_acreditada, metodologia, perfil_egresado, pais) VALUES
(501, N'Doctorado en Ciencias de la Computación', N'Universidad de los Andes', '2010-05-20', 
 N'Doctorado', N'Bogotá', 1001, 1, N'Presencial', 
 N'Investigador en IA capaz de desarrollar soluciones innovadoras', N'Colombia'),
(502, N'Maestría en Biología Molecular', N'Universidad Nacional de Colombia', '2005-08-15', 
 N'Maestría', N'Bogotá', 1002, 1, N'Presencial', 
 N'Especialista en técnicas de laboratorio y análisis genético', N'Colombia'),
(503, N'Especialización en Literatura Comparada', N'Universidad de Antioquia', '2015-11-30', 
 N'Especialización', N'Medellín', 1003, 1, N'Virtual', 
 N'Analista crítico de obras literarias contemporáneas', N'Colombia');
GO
-- 11. evaluacion_docente (IDENTITY_INSERT ON)
SET IDENTITY_INSERT evaluacion_docente ON;
INSERT INTO evaluacion_docente (id, calificacion, semestre, docente) VALUES
(1, 4.5, N'2024-1', 1001),
(2, 4.8, N'2024-1', 1002),
(3, 4.2, N'2024-1', 1003);
SET IDENTITY_INSERT evaluacion_docente OFF;
GO
-- 12. reconocimiento (IDENTITY_INSERT ON)
SET IDENTITY_INSERT reconocimiento ON;
INSERT INTO reconocimiento (id, tipo, fecha, institucion, nombre, ambito, docente) VALUES
(1, N'Premio', '2023-06-15', N'Ministerio de Ciencia', N'Mejor Investigador en IA', N'Nacional', 1001),
(2, N'Distinción', '2022-11-20', N'Sociedad de Biología', N'Investigador Destacado', N'Internacional', 1002),
(3, N'Reconocimiento', '2024-03-10', N'Academia de la Lengua', N'Excelencia en Literatura', N'Regional', 1003);
SET IDENTITY_INSERT reconocimiento OFF;
GO
-- 13. docente_departamento
INSERT INTO docente_departamento (docente, departamento, dedicacion, modalidad, fecha_ingreso, fecha_salida) VALUES
(1001, 201, N'Tiempo Completo', N'Presencial', '2010-08-01', NULL),
(1002, 202, N'Tiempo Completo', N'Presencial', '2008-02-15', NULL),
(1003, 203, N'Medio Tiempo', N'Virtual', '2018-06-01', NULL);
GO
-- 14. alianza
INSERT INTO alianza (aliado, departamento, fecha_inicio, fecha_fin, docente) VALUES
(9001234567, 201, '2022-01-15', '2025-12-31', 1001),
(9007654321, 202, '2021-03-20', '2024-11-30', 1002),
(9005558888, 203, '2023-06-01', NULL, 1003);
GO
-- 15. estudio_ac
INSERT INTO estudio_ac (estudio, area_conocimiento) VALUES
(501, 302),
(502, 301),
(503, 303);
GO
-- 16. beca
INSERT INTO beca (estudios, tipo, institucion, fecha_inicio, fecha_fin) VALUES
(501, N'Doctoral', N'Colciencias', '2008-08-01', '2010-05-20'),
(502, N'Maestría', N'Universidad Nacional', '2004-02-01', '2005-08-15'),
(503, N'Especialización', N'Gobierno de Antioquia', '2015-01-15', '2015-11-30');
GO
-- 17. apoyo_profesoral
INSERT INTO apoyo_profesoral (estudios, con_apoyo, institucion, tipo) VALUES
(501, 1, N'Universidad de los Andes', N'Beca completa'),
(502, 1, N'Universidad Nacional', N'Beca parcial'),
(503, 0, N'Sin apoyo', N'Autofinanciado');
GO
-- 18. red_docente
INSERT INTO red_docente (red, docente, fecha_inicio, fecha_fin, act_destacadas) VALUES
(401, 1001, '2019-05-10', NULL, N'Organización del congreso anual de IA'),
(402, 1002, '2018-09-15', NULL, N'Publicación de artículos en revista internacional'),
(403, 1003, '2020-03-20', '2023-12-31', N'Coordinación de grupo de lectura');
GO
-- 19. intereses_futuros
INSERT INTO intereses_futuros (docente, termino_clave) VALUES
(1001, N'machine learning'),
(1002, N'genómica'),
(1003, N'literatura digital');
GO
-- ============================================
-- VERIFICACIÓN
-- ============================================
PRINT 'Datos insertados exitosamente para 19 tablas (17 con componentes + 3 dependientes)';
PRINT 'Total de registros: aproximadamente 3 por tabla';
GO