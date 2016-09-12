insert into Perfil (nombre) values
('root');

insert into Permiso (nombre) values
('usuariosC'),
('usuariosR'),
('usuariosU'),
('usuariosD'),
('parametrosC'),
('parametrosR'),
('parametrosU'),
('parametrosD'),
('proveedoresC'),
('proveedoresR'),
('proveedoresU'),
('proveedoresD'),
('depositosC'),
('depositosR'),
('depositosU'),
('depositosD'),
('gallinerosC'),
('gallinerosR'),
('gallinerosU'),
('gallinerosD'),
('ventasC'),
('ventasR'),
('movimientosC'),
('movimientosR'),
('produccion'),
('perfilesC'),
('perfilesR'),
('perfilesU'),
('perfilesD');

insert into PerfilPermiso (idPerfil, idPermiso) values
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),
(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29);

insert into Usuario (nombreUsuario,nombre,apellido,contrasenia) values
					('root','DIOS','saiyajin','root');
					
insert into PerfilUsuario (idPerfil,idUsuario) values
(1,1);
