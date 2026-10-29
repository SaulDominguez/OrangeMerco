## FF58CCC3-3BD4-4789-ACF1-F55D9BB7BDC8

**Name** (not equal to External Key)**:** Fiestononon_2025_Encuesta

**Description:** n/a

**Folder:** Data Extensions/Fiestononon2025/

**Fields in table:** 13

**Sendable:** Yes (`Contact_Id` to `Subscriber Key`)

**Testable:** No

**Retention Policy:** none

| Name | FieldType | MaxLength | IsPrimaryKey | IsNullable | DefaultValue |
| --- | --- | --- | --- | --- | --- |
| Contact_Id | Text | 255 | + | - |  |
| nombres | Text | 254 | - | + |  |
| apellidos | Text | 254 | - | + |  |
| Genero | Text | 50 | - | + |  |
| fechaNacimiento | Date |  | - | + |  |
| Sucursal | Text | 254 | - | + |  |
| telefono | Phone | 50 | - | + |  |
| fechaRegistro | Date |  | + | - | GETDATE() |
| locale | Locale | 5 | - | + |  |
| isNew | Boolean |  | - | + |  |
| privacidad | Boolean |  | - | - | True |
| comunicacion | Boolean |  | - | + | False |
| contesto | Boolean |  | - | - | True |
