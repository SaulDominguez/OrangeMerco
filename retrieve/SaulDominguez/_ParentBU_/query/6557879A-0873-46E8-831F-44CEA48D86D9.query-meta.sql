SELECT
    fn.No_Tienda AS NumSucursal,
    fn.Nombre,
    fn.Apellido,
    fn.Correo AS Email,
    fn.Telefono AS Phone,
    fn.Contact_Id
FROM
    FIESTONONON_cargamanual_BienvenidaAddGeneral fn
