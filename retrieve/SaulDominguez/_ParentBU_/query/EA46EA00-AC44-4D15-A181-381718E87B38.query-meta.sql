SELECT
    NEWID() AS Contact_Id,
    jaral.email,
    jaral.telefono
FROM
    LISTA_CLIENTES_EL_JARAL jaral
    LEFT JOIN LISTA_CLIENTES_EL_JARAL_Con_Llave bbdg ON bbdg.email = jaral.email
WHERE
    bbdg.email IS NULL
