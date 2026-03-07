SELECT ex.id_examen,re.fecha ,re.nombre_completo, re.genero ,re.tipo_tramite ,re.tipo_licencia ,


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
) AS respuesta_teorica,

(

CASE WHEN ( SELECT 
    SUM(rp.nota) 
    FROM respuesta_practico_usuario rp 
    where rp.examen_id_examen = ex.id_examen
) > 70 AND

(SELECT 
    SUM(
    CASE WHEN ru.respuesta = prt.respuesta 
        THEN 4 ELSE 0 
    END) 
    FROM respuesta_usuario ru 
    JOIN preguntas prt ON ru.pregunta_id_pregunta = prt.id 
    WHERE ru.examen_id_examen  = ex.id_examen
) > 70

THEN 'APROVADO' ELSE 'NO APROVADO' END


)  AS conclusion

FROM EXAMEN ex 
JOIN REGISTRO re ON ex.registro_id_registro = re.id_registro
   WHERE re.fecha BETWEEN TO_DATE('13/08/2025', 'DD/MM/YYYY') AND TO_DATE('13/08/2025', 'DD/MM/YYYY')


