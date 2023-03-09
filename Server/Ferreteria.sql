CREATE TABLE [persona] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [identificacion] varchar(20),
  [nombres] varchar(100),
  [apellidos] varchar(100),
  [genero] varchar(25),
  [fecha_nacimiento] datetime,
  [telefono] varchar(15),
  [correo] varchar(100),
  [ciudad] varchar(50), 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP

)
GO

CREATE TABLE [cliente] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [id_persona] int,
  [estado] varchar(20), 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
)
GO

CREATE TABLE [empleado] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [id_persona] int,
  [cargo] varchar(30),
  [fecha_contraro] datetime,
  [salario] decimal(10,2),
  [estado] varchar(20), 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
)
GO

CREATE TABLE [login] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [id_persona] int,
  [pass] varchar(200), 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
)
GO

CREATE TABLE [productos] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [nombre_prod] varchar(70),
  [descripcion] varchar(150),
  [precio_venta] decimal(10,2),
  [stock_actual] int,
  [estado] varchar(30), 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
)
GO

CREATE TABLE [categoria] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [nom_categoria] varchar(50),
  [descripcion] varchar(150),
  [estado] varchar(30), 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
)
GO

CREATE TABLE [prod_cat] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [id_prod] int,
  [id_car] int, 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
)
GO

CREATE TABLE [proveedor] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] varchar(70),
  [direccion] varchar(70),
  [telefono] varchar(70),
  [email] varchar(70),
  [estado] varchar(30), 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
)
GO

CREATE TABLE [compra] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [id_proveedor] int,
  [fecha_compra] datetime,
  [total_pago] decimal(10,2),
  [estado] varchar(30), 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
)
GO

CREATE TABLE [compra_detalle] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [id_compra] int,
  [id_producto] int,
  [cantidad] int,
  [precio_u] decimal(10,2), 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
)
GO

CREATE TABLE [venta] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [id_cliente] int,
  [id_empleado] int,
  [fecha_venta] datetime,
  [total_pago] decimal(10,2),
  [estado] varchar(30), 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
)
GO

CREATE TABLE [venta_detalle] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [id_venta] int,
  [id_producto] int,
  [cantidad] int,
  [precio_u] decimal(10,2), 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
)
GO

ALTER TABLE [cliente] ADD FOREIGN KEY ([id_persona]) REFERENCES [persona] ([id])
GO

ALTER TABLE [empleado] ADD FOREIGN KEY ([id_persona]) REFERENCES [persona] ([id])
GO

ALTER TABLE [login] ADD FOREIGN KEY ([id]) REFERENCES [persona] ([id])
GO

ALTER TABLE [prod_cat] ADD FOREIGN KEY ([id_prod]) REFERENCES [productos] ([id])
GO

ALTER TABLE [prod_cat] ADD FOREIGN KEY ([id_car]) REFERENCES [categoria] ([id])
GO

ALTER TABLE [compra_detalle] ADD FOREIGN KEY ([id_compra]) REFERENCES [compra] ([id])
GO

ALTER TABLE [compra] ADD FOREIGN KEY ([id_proveedor]) REFERENCES [proveedor] ([id])
GO

ALTER TABLE [compra_detalle] ADD FOREIGN KEY ([id_producto]) REFERENCES [productos] ([id])
GO

ALTER TABLE [venta_detalle] ADD FOREIGN KEY ([id_venta]) REFERENCES [venta] ([id])
GO

ALTER TABLE [venta_detalle] ADD FOREIGN KEY ([id_producto]) REFERENCES [productos] ([id])
GO

ALTER TABLE [venta] ADD FOREIGN KEY ([id_cliente]) REFERENCES [cliente] ([id])
GO

ALTER TABLE [venta] ADD FOREIGN KEY ([id_empleado]) REFERENCES [empleado] ([id])
GO
