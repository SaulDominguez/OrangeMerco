SELECT
    f.nombres,
    f.apellidos,
    f.Contact_Id,
    f.created_at,
    f.telefono,
    f.Locale,
    f.Email
FROM
    Fiestononon_2025_General_BKP_Completo f
    LEFT JOIN All_Contacts_Number_Mobile a ON f.telefono = a.MobileNumber
WHERE
    a.MobileNumber IS NULL
