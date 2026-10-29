SELECT
    fn.No_Tienda,
    fn.Nombre,
    fn.Apellido,
    fn.Correo,
    fn.Telefono,
    fn.Contact_Id
FROM
    FIESTONONON_cargamanual_Bienvenida fn
    LEFT JOIN BDD_General bg ON bg.Contact_Id = fn.Contact_Id
WHERE
    bg.Contact_Id IS NULL
