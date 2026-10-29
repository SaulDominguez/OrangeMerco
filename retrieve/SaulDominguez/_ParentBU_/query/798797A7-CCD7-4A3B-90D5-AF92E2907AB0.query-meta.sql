/* =====================================================================
5. Generaron boleto pero no lo han recogido
Fuentes: Ora_Pre_Fiestononon (lo más reciente) + Historico_Premios_Merco
Canje y entrega son registros distintos con el mismo SubscriberKey.
- Tiene premio: algún registro con Premio_Canjeado = true en Ora
O TienePremio = true en el histórico
- Ya lo recogió: algún registro con Premio_Entregado = true en Ora
O PremioEntregado = true en el histórico
Sale quien tiene premio y NO lo ha recogido en ninguna de las dos.
DE destino sugerida: Seg_Boleto_SinRecoger
===================================================================== */
SELECT
    b.Contact_Id,
    b.Email,
    b.Nombre,
    b.Apellido,
    b.Phone,
    b.Sucursal,
    b.NumSucursal,
    b.FechaNacimiento,
    b.Locale,
    b.Genero,
    b.Estado,
    b.Ciudad,
    b.MedioComunicacion,
    b.Frecuencia,
    b.Colonia,
    b.OptInWhatsapp,
    b.frutasVerduras,
    b.Salchichoneria,
    b.CarnesPescados,
    b.Panaderia,
    b.abarrotes,
    b.articulosBebe,
    b.bebidas,
    b.higieneCuidadoPersonal,
    b.MercanciasGenerales,
    b.OptOutWhatsapp,
    b.Zona,
    b.NoRecibirComunicacion,
    b.ClienteNL,
    b.ClienteSALT,
    b.ClienteMVA_CARB_PN,
    b.DateModified,
    b.ServicioDomicilio,
    b.WA_VIP,
    b.WA_ALL,
    b.SMS_codigo_entry,
    b.Tiene_Telefono,
    b.Tiene_Correo,
    b.Tiene_Ambos
FROM
    BDD_General_Completa b
WHERE
    /* Tiene premio (Ora o histórico) */
    (
        EXISTS (
            SELECT
                1
            FROM
                Ora_Pre_Fiestononon o
            WHERE
                o.SubscriberKey = b.Contact_Id
                AND o.Premio_Canjeado = 1
        )
        OR EXISTS (
            SELECT
                1
            FROM
                Historico_Premios_Merco h
            WHERE
                h.contactId = b.Contact_Id
                AND h.TienePremio = 1
        )
    )
    /* No lo ha recogido en ninguna de las dos */
    AND NOT EXISTS (
        SELECT
            1
        FROM
            Ora_Pre_Fiestononon o
        WHERE
            o.SubscriberKey = b.Contact_Id
            AND o.Premio_Entregado = 1
    )
    AND NOT EXISTS (
        SELECT
            1
        FROM
            Historico_Premios_Merco h
        WHERE
            h.contactId = b.Contact_Id
            AND h.PremioEntregado = 1
    )
