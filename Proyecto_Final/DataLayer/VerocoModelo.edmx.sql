
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/08/2016 11:02:14
-- Generated from EDMX file: C:\Users\Sky\Documents\GitHub\Patrones\Proyecto_Final\DataLayer\VerocoModelo.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Proyecto_Patrones];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Detalles__proyec__1A14E395]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Detalles] DROP CONSTRAINT [FK__Detalles__proyec__1A14E395];
GO
IF OBJECT_ID(N'[dbo].[FK__Detalles__userId__1B0907CE]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Detalles] DROP CONSTRAINT [FK__Detalles__userId__1B0907CE];
GO
IF OBJECT_ID(N'[dbo].[FK__Proyectos__categ__173876EA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Proyectos] DROP CONSTRAINT [FK__Proyectos__categ__173876EA];
GO
IF OBJECT_ID(N'[dbo].[FK__Usuarios__userTy__1273C1CD]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK__Usuarios__userTy__1273C1CD];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Categorias]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categorias];
GO
IF OBJECT_ID(N'[dbo].[Detalles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Detalles];
GO
IF OBJECT_ID(N'[dbo].[Proyectos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Proyectos];
GO
IF OBJECT_ID(N'[dbo].[Tipos_Usuarios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tipos_Usuarios];
GO
IF OBJECT_ID(N'[dbo].[Usuarios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuarios];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Categorias'
CREATE TABLE [dbo].[Categorias] (
    [categoryId] int IDENTITY(1,1) NOT NULL,
    [categoryName] varchar(60)  NULL,
    [categoryDescription] varchar(180)  NULL
);
GO

-- Creating table 'Detalles'
CREATE TABLE [dbo].[Detalles] (
    [detailsId] int IDENTITY(1,1) NOT NULL,
    [productId] int  NULL,
    [detailsQuantity] int  NULL,
    [detailsPrice] int  NULL,
    [proyectId] int  NULL,
    [userId] int  NULL
);
GO

-- Creating table 'Facturas'
CREATE TABLE [dbo].[Facturas] (
    [invoiceId] int IDENTITY(1,1) NOT NULL,
    [invoiceDate] datetime  NULL,
    [detailsId] int  NULL,
    [userId] int  NULL
);
GO

-- Creating table 'Productos'
CREATE TABLE [dbo].[Productos] (
    [productId] int IDENTITY(1,1) NOT NULL,
    [productName] varchar(60)  NULL,
    [productPrice] int  NULL,
    [productStock] int  NULL,
    [categoryId] int  NULL,
    [productImage] varchar(120)  NULL
);
GO

-- Creating table 'Tipos_Usuarios'
CREATE TABLE [dbo].[Tipos_Usuarios] (
    [userTypeId] int IDENTITY(1,1) NOT NULL,
    [userTypeDescription] varchar(100)  NULL
);
GO

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [userId] int IDENTITY(1,1) NOT NULL,
    [userName] varchar(80)  NULL,
    [userEmail] varchar(120)  NULL,
    [userPassword] varchar(16)  NULL,
    [userTypeId] int  NULL
);
GO

-- Creating table 'Proyectos'
CREATE TABLE [dbo].[Proyectos] (
    [proyectId] int IDENTITY(1,1) NOT NULL,
    [proyectName] varchar(60)  NULL,
    [proyectDescription] varchar(120)  NULL,
    [proyectStock] int  NULL,
    [proyectImage] varchar(120)  NULL,
    [categoryId] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [categoryId] in table 'Categorias'
ALTER TABLE [dbo].[Categorias]
ADD CONSTRAINT [PK_Categorias]
    PRIMARY KEY CLUSTERED ([categoryId] ASC);
GO

-- Creating primary key on [detailsId] in table 'Detalles'
ALTER TABLE [dbo].[Detalles]
ADD CONSTRAINT [PK_Detalles]
    PRIMARY KEY CLUSTERED ([detailsId] ASC);
GO

-- Creating primary key on [invoiceId] in table 'Facturas'
ALTER TABLE [dbo].[Facturas]
ADD CONSTRAINT [PK_Facturas]
    PRIMARY KEY CLUSTERED ([invoiceId] ASC);
GO

-- Creating primary key on [productId] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [PK_Productos]
    PRIMARY KEY CLUSTERED ([productId] ASC);
GO

-- Creating primary key on [userTypeId] in table 'Tipos_Usuarios'
ALTER TABLE [dbo].[Tipos_Usuarios]
ADD CONSTRAINT [PK_Tipos_Usuarios]
    PRIMARY KEY CLUSTERED ([userTypeId] ASC);
GO

-- Creating primary key on [userId] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([userId] ASC);
GO

-- Creating primary key on [proyectId] in table 'Proyectos'
ALTER TABLE [dbo].[Proyectos]
ADD CONSTRAINT [PK_Proyectos]
    PRIMARY KEY CLUSTERED ([proyectId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [categoryId] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [FK__Productos__categ__173876EA]
    FOREIGN KEY ([categoryId])
    REFERENCES [dbo].[Categorias]
        ([categoryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Productos__categ__173876EA'
CREATE INDEX [IX_FK__Productos__categ__173876EA]
ON [dbo].[Productos]
    ([categoryId]);
GO

-- Creating foreign key on [productId] in table 'Detalles'
ALTER TABLE [dbo].[Detalles]
ADD CONSTRAINT [FK__Detalles__detail__1A14E395]
    FOREIGN KEY ([productId])
    REFERENCES [dbo].[Productos]
        ([productId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Detalles__detail__1A14E395'
CREATE INDEX [IX_FK__Detalles__detail__1A14E395]
ON [dbo].[Detalles]
    ([productId]);
GO

-- Creating foreign key on [detailsId] in table 'Facturas'
ALTER TABLE [dbo].[Facturas]
ADD CONSTRAINT [FK__Facturas__detail__1DE57479]
    FOREIGN KEY ([detailsId])
    REFERENCES [dbo].[Detalles]
        ([detailsId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Facturas__detail__1DE57479'
CREATE INDEX [IX_FK__Facturas__detail__1DE57479]
ON [dbo].[Facturas]
    ([detailsId]);
GO

-- Creating foreign key on [userId] in table 'Facturas'
ALTER TABLE [dbo].[Facturas]
ADD CONSTRAINT [FK__Facturas__userId__1CF15040]
    FOREIGN KEY ([userId])
    REFERENCES [dbo].[Usuarios]
        ([userId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Facturas__userId__1CF15040'
CREATE INDEX [IX_FK__Facturas__userId__1CF15040]
ON [dbo].[Facturas]
    ([userId]);
GO

-- Creating foreign key on [userTypeId] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [FK__Usuarios__userTy__1273C1CD]
    FOREIGN KEY ([userTypeId])
    REFERENCES [dbo].[Tipos_Usuarios]
        ([userTypeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Usuarios__userTy__1273C1CD'
CREATE INDEX [IX_FK__Usuarios__userTy__1273C1CD]
ON [dbo].[Usuarios]
    ([userTypeId]);
GO

-- Creating foreign key on [categoryId] in table 'Proyectos'
ALTER TABLE [dbo].[Proyectos]
ADD CONSTRAINT [FK__Proyectos__categ__173876EA]
    FOREIGN KEY ([categoryId])
    REFERENCES [dbo].[Categorias]
        ([categoryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Proyectos__categ__173876EA'
CREATE INDEX [IX_FK__Proyectos__categ__173876EA]
ON [dbo].[Proyectos]
    ([categoryId]);
GO

-- Creating foreign key on [proyectId] in table 'Detalles'
ALTER TABLE [dbo].[Detalles]
ADD CONSTRAINT [FK__Detalles__proyec__1A14E395]
    FOREIGN KEY ([proyectId])
    REFERENCES [dbo].[Proyectos]
        ([proyectId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Detalles__proyec__1A14E395'
CREATE INDEX [IX_FK__Detalles__proyec__1A14E395]
ON [dbo].[Detalles]
    ([proyectId]);
GO

-- Creating foreign key on [userId] in table 'Detalles'
ALTER TABLE [dbo].[Detalles]
ADD CONSTRAINT [FK__Detalles__userId__1B0907CE]
    FOREIGN KEY ([userId])
    REFERENCES [dbo].[Usuarios]
        ([userId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Detalles__userId__1B0907CE'
CREATE INDEX [IX_FK__Detalles__userId__1B0907CE]
ON [dbo].[Detalles]
    ([userId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------