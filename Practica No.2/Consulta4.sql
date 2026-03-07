SELECT 
    pre.id,
    SUM(CASE 
        WHEN ru.respuesta = pre.respuesta THEN 1 
        ELSE 0 
    END) AS No_aciertos
FROM registro re 
JOIN examen ex ON re.id_registro = ex.registro_id_registro 
JOIN respuesta_usuario ru ON ru.examen_id_examen = ex.id_examen 
JOIN preguntas pre ON pre.id = ru.pregunta_id_pregunta 
WHERE re.fecha BETWEEN TO_DATE('01/01/2023', 'DD/MM/YYYY') AND TO_DATE('01/01/2026', 'DD/MM/YYYY')
GROUP BY pre.id
ORDER BY No_aciertos DESC;