
SELECT * FROM
(
SELECT ex.id_examen, re.fecha, re.nombre_completo,

(SELECT 
    SUM(rp.nota) 
    FROM respuesta_practico_usuario rp 
    where rp.examen_id_examen = ex.id_examen
) AS respuesta_practica,

(SELECT 
    SUM(
    CASE WHEN ru.respuesta = prt.respuesta 
        THEN 4 ELSE 0 
    END) 
    FROM respuesta_usuario ru 
    JOIN preguntas prt ON ru.pregunta_id_pregunta = prt.id 
    WHERE ru.examen_id_examen  = ex.id_examen
) AS respuesta_teorica

FROM EXAMEN ex 
JOIN REGISTRO re ON ex.registro_id_registro = re.id_registro
WHERE re.fecha BETWEEN TO_DATE('01/01/2023', 'DD/MM/YYYY') AND TO_DATE('01/01/2026', 'DD/MM/YYYY')
) subconsulta
WHERE respuesta_practica > 70 AND respuesta_teorica > 70

