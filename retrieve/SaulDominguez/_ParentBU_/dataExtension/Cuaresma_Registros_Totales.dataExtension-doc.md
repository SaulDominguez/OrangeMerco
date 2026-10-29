## Cuaresma_Registros_Totales

**Description:** n/a

**Folder:** Data Extensions/OrangeDCX/Cuaresma/

**Fields in table:** 12

**Sendable:** Yes (`Contact_Id` to `Subscriber Key`)

**Testable:** Yes

**Retention Policy:** none

| Name | FieldType | MaxLength | IsPrimaryKey | IsNullable | DefaultValue |
| --- | --- | --- | --- | --- | --- |
| Contact_Id | Text | 50 | + | - |  |
| Nombre | Text | 254 | - | + |  |
| Apellido | Text | 254 | - | + |  |
| Telefono | Phone | 50 | - | + |  |
| Sucursal | Text | 254 | - | + |  |
| Correo | EmailAddress | 254 | - | + |  |
| Ticket | Text |  | - | + |  |
| TicketFolio | Text | 254 | + | - |  |
| Validado | Boolean |  | - | + | False |
| Descalificado | Boolean |  | - | + | False |
| ProcesadoPor | Text | 254 | - | + |  |
| RowNo | Number |  | - | + |  |
