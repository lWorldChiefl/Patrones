Create database Proyecto_Patrones
Use Proyecto_Patrones

							/*LOGIN*/

	/*Creamos la Tabla TiposUsuarios*/
Create Table Tipos_Usuarios
(
	userTypeId int primary key identity,
	userTypeDescription varchar(100)
);
GO


	/*Creamos la Tabla Usuarios*/
Create Table Usuarios
(
	userId int primary key identity,
	userName varchar(80),
	userEmail varchar(120),
	userPassword varchar(16),
	userTypeId int,
	foreign key (userTypeId) references Tipos_Usuarios(userTypeId)
);
GO
	

						/*PROYECTOS*/

	/*Creamos la tabla Categorias*/
Create Table Categorias
(
	categoryId int primary key identity,
	categoryName varchar(60),
	categoryDescription varchar(180)
);
GO

	/*Creamos la tabla Proyectos*/
Create Table Proyectos
(
	proyectId int primary key identity,
	proyectName varchar(60),
	proyectDescription varchar(120),
	proyectStock int,
	proyectImage varchar(120),
	categoryId int,
	foreign key (categoryId) references Categorias(categoryId)
);
GO

	/*Creamos la tabla Detalles*/
Create Table Detalles
(
	detailsId int primary key identity,
	proyectId int,
	userId int,
	foreign key (proyectId) references Proyectos(proyectId),
	foreign key (userId) references Usuarios(userId)
);
GO


SELECT * FROM Tipos_Usuarios

INSERT INTO Tipos_Usuarios VALUES ('Empresa')
INSERT INTO Tipos_Usuarios VALUES ('Cliente')


SELECT * FROM Categorias

INSERT INTO Categorias VALUES ('Páginas Web', 'Desarrollo de aplicaciones destinadas a web')
INSERT INTO Categorias VALUES ('Sistemas', 'Desarrollo de sistemas')
INSERT INTO Categorias VALUES ('Aplicaciones Móviles', 'Desarrollo de aplicaciones para smarthphones')
