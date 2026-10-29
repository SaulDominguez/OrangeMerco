## 0144EFD8-9BEC-4CCC-AC7A-1C51EBB0380E

**Name** (not equal to External Key)**:** BDD_General_Inactivos

**Description:** Base de Datos general con SubscriberKey generado personas inactivas en la plataforma de Merco

**Folder:** Data Extensions/BDD Merco/Audiencias/

**Fields in table:** 5

**Sendable:** Yes (`Contact_Id` to `Subscriber Key`)

**Testable:** Yes

**Retention Policy:** none

| Name | FieldType | MaxLength | IsPrimaryKey | IsNullable | DefaultValue |
| --- | --- | --- | --- | --- | --- |
| Contact_Id | Text | 50 | + | - |  |
| Email | EmailAddress | 254 | - | - |  |
| Nombre | Text | 255 | - | + |  |
| Apellido | Text | 255 | - | + |  |
| Phone | Phone | 50 | - | + |  |
