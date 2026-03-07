SELECT re.tipo_tramite,re.fecha ,count(re.tipo_tramite) 
FROM REGISTRO re 
WHERE re.fecha BETWEEN TO_DATE('01/01/2023', 'DD/MM/YYYY') AND TO_DATE('13/03/2023', 'DD/MM/YYYY') 
GROUP BY re.tipo_tramite, re.fecha
UNION ALL
SELECT re.tipo_licencia,re.fecha,count(re.tipo_licencia)
FROM REGISTRO re 
WHERE re.fecha BETWEEN TO_DATE('01/01/2023', 'DD/MM/YYYY') AND TO_DATE('13/03/2023', 'DD/MM/YYYY') 
GROUP BY re.tipo_licencia, re.fecha
