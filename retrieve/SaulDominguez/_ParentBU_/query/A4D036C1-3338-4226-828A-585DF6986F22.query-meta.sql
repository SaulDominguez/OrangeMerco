SELECT
    bg.SubscriberKey,
    pz1.Email,
    pz1.Nombre,
    pz1.Apellido,
    pz1.Phone
FROM
    ipWarming_Base_Dia12_Old pz1
    INNER JOIN BDD_General bg ON pz1.Email = bg.Email
