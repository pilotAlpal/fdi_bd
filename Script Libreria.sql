
drop table Cliente cascade constraints;
drop table Pedido cascade constraints;
drop table Autor cascade constraints;
drop table Autor_Libro cascade constraints;
drop table Libro cascade constraints;
drop table Libros_Pedido cascade constraints;

create table Cliente
(IdCliente CHAR(10) PRIMARY KEY,
 Nombre VARCHAR(25) NOT NULL,
 Direccion VARCHAR(60) NOT NULL,
 NumTC CHAR(16) NOT NULL);
 
create table Pedido
(IdPedido CHAR(10) PRIMARY KEY,
 IdCliente CHAR(10) NOT NULL REFERENCES Cliente on delete cascade,
 FechaPedido DATE NOT NULL,
 FechaExped DATE);

create table Autor
( idautor NUMBER PRIMARY KEY,
  Nombre VARCHAR(25));

create table Libro
(ISBN CHAR(15) PRIMARY KEY,
Titulo VARCHAR(60) NOT NULL,
A�o CHAR(4) NOT NULL,
PrecioCompra NUMBER(6,2) DEFAULT 0,
PrecioVenta NUMBER(6,2) DEFAULT 0);

create table Autor_Libro
(ISBN CHAR(15),
Autor NUMBER,
CONSTRAINT al_PK PRIMARY KEY (ISBN, Autor),
CONSTRAINT libroA_FK FOREIGN KEY (ISBN) REFERENCES Libro on delete cascade,
CONSTRAINT autor_FK FOREIGN KEY (Autor) REFERENCES Autor);


create table Libros_Pedido(
ISBN CHAR(15),
IdPedido CHAR(10),
Cantidad NUMBER(3) CHECK (cantidad >0),
CONSTRAINT lp_PK PRIMARY KEY (ISBN, idPedido),
CONSTRAINT libro_FK FOREIGN KEY (ISBN) REFERENCES Libro on delete cascade,
CONSTRAINT pedido_FK FOREIGN KEY (IdPedido) REFERENCES Pedido on delete cascade);

insert into Cliente values ('0000001','Margarita Sanchez', 'Arroyo del Camino 2','1234567890123456');
insert into Cliente values ('0000002','Angel Garcia', 'Puente Viejo 13', '1234567756953456');
insert into Cliente values ('0000003','Pedro Santillana', 'Molino de Abajo 42', '1237596390123456');
insert into Cliente values ('0000004','Rosa Prieto', 'Plaza Mayor 46', '4896357890123456');
insert into Cliente values ('0000005','Ambrosio Perez', 'Corredera de San Antonio 1', '1224569890123456');
insert into Cliente values ('0000006','Lola Arribas', 'Lope de Vega 32', '2444889890123456' );


insert into Pedido values ('0000001P','0000001', TO_DATE('01/12/2011'),TO_DATE('03/12/2011'));
insert into Pedido values ('0000002P','0000001', TO_DATE('01/12/2011'),null);
insert into Pedido values ('0000003P','0000002', TO_DATE('02/12/2011'),TO_DATE('03/12/2011'));
insert into Pedido values ('0000004P','0000004', TO_DATE('02/12/2011'),TO_DATE('05/12/2011'));
insert into Pedido values ('0000005P','0000005', TO_DATE('03/12/2011'),TO_DATE('03/12/2011'));
insert into Pedido values ('0000006P','0000003', TO_DATE('04/12/2011'),null);

insert into Autor values (1,'Matilde Asensi');
insert into Autor values (2,'Ildefonso Falcones');
insert into Autor values (3,'Carlos Ruiz Zafon');
insert into Autor values (4,'Miguel de Cervantes');
insert into Autor values (5,'Julia Navarro');
insert into Autor values (6,'Miguel Delibes');
insert into Autor values (7,'Fiodor Dostoievski');

insert into lIBRO values ('8233771378567', 'Todo bajo el cielo', '2008', 9.45, 13.45);
insert into lIBRO values ('1235271378662', 'La catedral del mar', '2009', 12.50, 19.25);
insert into lIBRO values ('4554672899910', 'La sombra del viento', '2002', 19.00, 33.15);
insert into lIBRO values ('5463467723747', 'Don Quijote de la Mancha', '2000', 49.00, 73.45);
insert into lIBRO values ('0853477468299', 'La sangre de los inocentes', '2011', 9.45, 13.45);
insert into lIBRO values ('1243415243666', 'Los santos inocentes', '1997', 10.45, 15.75);
insert into lIBRO values ('0482174555366', 'Noches Blancas', '1998', 4.00, 9.45);


insert into Autor_lIBRO values ('8233771378567',1);
insert into Autor_lIBRO values ('1235271378662',2);
insert into Autor_lIBRO values ('4554672899910',3);
insert into Autor_lIBRO values ('5463467723747',4);
insert into Autor_lIBRO values ('0853477468299',5);
insert into Autor_lIBRO values ('1243415243666',6);
insert into Autor_lIBRO values ('0482174555366',7);

insert into Libros_Pedido values ('8233771378567','0000001P', 1);
insert into Libros_Pedido values ('5463467723747','0000001P', 2);
insert into Libros_Pedido values ('0482174555366','0000002P', 1);
insert into Libros_Pedido values ('4554672899910','0000003P', 1);
insert into Libros_Pedido values ('8233771378567','0000003P', 1);
insert into Libros_Pedido values ('1243415243666','0000003P', 1);
insert into Libros_Pedido values ('8233771378567','0000004P', 1);
insert into Libros_Pedido values ('4554672899910','0000005P', 1);
insert into Libros_Pedido values ('1243415243666','0000005P', 1);
insert into Libros_Pedido values ('5463467723747','0000005P', 3);
insert into Libros_Pedido values ('8233771378567','0000006P', 5); 

