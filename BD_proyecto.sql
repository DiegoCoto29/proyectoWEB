/*Se crea la base de datos */
drop schema if exists proyecto;
drop user if exists usuario_prueba;
CREATE SCHEMA proyecto ;

/*Se crea un usuario para la base de datos llamado "usuario_prueba" y tiene la contraseña "Usuario_Clave."*/
create user 'usuario_prueba'@'%' identified by 'Usuar1o_Clave.';

/*Se asignan los prvilegios sobr ela base de datos TechShop al usuario creado */
grant all privileges on proyecto.* to 'usuario_prueba'@'%';
flush privileges;

/* la tabla de categoria contiene categorias de productos*/
create table proyecto.categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(30) NOT NULL,
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_categoria))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table proyecto.producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  descripcion VARCHAR(1000) NOT NULL,  
  detalle VARCHAR(1600) NOT NULL, 
  precio double,
  existencias int,  
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_producto),
  foreign key fk_producto_caregoria (id_categoria) references categoria(id_categoria)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Se crea la tabla de clientes llamada cliente... igual que la clase Cliente */
CREATE TABLE proyecto.usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  password varchar(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(25) NULL,
  telefono VARCHAR(15) NULL,
  ruta_imagen varchar(1024),
  activo boolean,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table proyecto.factura (
  id_factura INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha date,  
  total double,
  estado int,
  PRIMARY KEY (id_factura),
  foreign key fk_factura_usuario (id_usuario) references usuario(id_usuario)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table proyecto.venta (
  id_venta INT NOT NULL AUTO_INCREMENT,
  id_factura INT NOT NULL,
  id_producto INT NOT NULL,
  precio double, 
  cantidad int,
  PRIMARY KEY (id_venta),
  foreign key fk_ventas_factura (id_factura) references factura(id_factura),
  foreign key fk_ventas_producto (id_producto) references producto(id_producto) 
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Se insertan 3 registros en la tabla cliente como ejemplo */
/*INSERT INTO proyecto.usuario (id_usuario, username,password,nombre, apellidos, correo, telefono,ruta_imagen,activo) VALUES 
(1,'juan','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','Juan', 'Castro Mora',    'jcastro@gmail.com',    '4556-8978', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Juan_Diego_Madrigal.jpg/250px-Juan_Diego_Madrigal.jpg',true),
(2,'rebeca','$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi','Rebeca',  'Contreras Mora', 'acontreras@gmail.com', '5456-8789','https://upload.wikimedia.org/wikipedia/commons/0/06/Photo_of_Rebeca_Arthur.jpg',true),
(3,'pedro','$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO','Pedro', 'Mena Loria',     'lmena@gmail.com',      '7898-8936','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Eduardo_de_Pedro_2019.jpg/480px-Eduardo_de_Pedro_2019.jpg?20200109230854',true);
*/
/*Se insertan 3 categorias de productos como ejemplo */
INSERT INTO proyecto.categoria (id_categoria,descripcion,ruta_imagen,activo) VALUES 
('1','Celulares', 'https://tecstore.pe/media/magefan_blog/1_76_1_.jpg',   true), 
('2','Pantallas',  'https://btcr.cr/wp-content/uploads/2021/05/tienda-monitores-costa-rica-samsung-298x300.jpg',   true),
('3','Discos Duros','https://hardzone.es/app/uploads-hardzone.es/2019/05/Toshiba-HDD-01.jpg?x=480&y=375&quality=40',true),
('4','Accesorios','https://cuotafacilrafa.com/wp-content/uploads/2023/05/accesorios-pc-768x512-1.png',    false);

/*Se insertan 3 productos por categoria */
INSERT INTO proyecto.producto (id_producto,id_categoria,descripcion,detalle,precio,existencias,ruta_imagen,activo) VALUES
(1,1,'El nuevo Huawei P60 Pro es el mejor smartphone para capturar fotos, ya que la cámara Telefoto de Ultra Iluminación proporciona más luz y tomás fotografías mucho más nítidas sin importar la distancia. La apertura variable permite un mejor efecto de desenfoque y capturas nocturnas increíbles.','Color Negro, 512GB, 16RAM',560000,5,'https://consumer.huawei.com/content/dam/huawei-cbg-site/common/mkt/pdp/admin-image/phones/p60-pro/specs/black.png',true),
(2,1,'El Samsung Galaxy S23 representa una vez más a los móviles de gama alta de tamaño reducido, con una pantalla AMOLED de 6,1 pulgadas y resolución Full HD+ que presume de una velocidad de refresco de 120 Hz adaptativa y 1.750 nits de brillo.','Color Negro, 512GB, 16RAM',700000,10,'https://image-us.samsung.com/us/smartphones/galaxy-s23/compare/images/galaxy-s23-ultra-compare-sky-blue-s.jpg',true),
(3,1,'La pantalla del iPhone 14 tiene esquinas redondeadas que rematan el diseño curvo del dispositivo, y esas esquinas se encuentran dentro de un rectángulo estándar. Si se mide el rectángulo estándar en diagonal, la pantalla tiene 6,06 pulgadas (la superficie real de visión es inferior).','Color Blanco, 512GB, 16RAM',800000,15,'https://tienda.antel.com.uy/razuna/assets/1/A76004DF6D8649C690937D44D0919E94/img/75810C459386471A997455E982657FC1/iPhone14-pro-max-2_75810C459386471A997455E982657FC1.jpg',true),
(4,2,'Monitor Led 21.5" Samsung F350 5ms - 60Hz - 1920x1080 VGA-HDMI','Color Blanco',55000,12,'https://www.intelec.co.cr/image/cache/catalog/catalogo/Monitores/LS22F350FHLXZP-800x800w.jpg.webp',true),
(5,2,'MONITOR LED 23.8" ACER NITRO KG243Y 1MS - 100HZ - 1920X1080 HDMI-VGA','Color Gris',70000,10,'https://www.intelec.co.cr/image/cache/catalog/catalogo/Monitores/UM.QX3AA.H01-800x800w.jpg.webp',true),
(6,2,'Monitor Led IPS 27" Asus VZ279HE 5ms - 75Hz - 1920x1080 HDMI-VGA','Color Negro',100000,5,'https://www.intelec.co.cr/image/cache/catalog/catalogo/Monitores/90LM02X0-B014B0-800x800w.jpg.webp',true),
(7,3,'Toshiba X300 Disco duro interno de 3.5 pulgadas para rendimiento y juegos','Interno 10TB',60000,5,'https://m.media-amazon.com/images/I/71Wi43InX6L.AC_UY218.jpg',true),
(8,3,'Seagate BarraCuda - Disco duro interno de 3.5 pulgadas','Interno 4TB',40000,7,'https://m.media-amazon.com/images/I/71ijXHv0jHL.AC_UY218.jpg',true),
(9,3,'Western Digital Disco duro interno WD Red Pro NAS','Interno 20TB',150000,3,'https://m.media-amazon.com/images/I/712voXb5bDL.AC_UL320.jpg',true),
(10,4,'LEVN Auriculares USB con micrófono para PC','Color Negro',20000,10,'https://m.media-amazon.com/images/I/61cgqYUv5zL.AC_UY218.jpg',true),
(11,4,'MageGee MK-Box - Teclado mecánico portátil','Color Negro',25000,7,'https://m.media-amazon.com/images/I/618zZ7u3sUL.AC_UY218.jpg',true),
(12,4,'Altavoces de PC con 6 modos LED coloridos','Color Negro',33000,3,'https://m.media-amazon.com/images/I/81b1vgAABmL.AC_UY218.jpg',true);






/*Se crean 6 facturas */   /*'Activa','Pagada','Anulada')*/
/*INSERT INTO proyecto.factura (id_factura,id_usuario,fecha,total,estado) VALUES
(1,1,'2022-01-05',211560,2),
(2,2,'2022-01-07',554340,2),
(3,3,'2022-01-07',871000,2),
(4,1,'2022-01-15',244140,1),
(5,2,'2022-01-17',414800,1),
(6,3,'2022-01-21',420000,1);*/

/*INSERT INTO proyecto.venta (id_venta,id_factura,id_producto,precio,cantidad) values
(1,1,5,45000,3),
(2,1,9,15780,2),
(3,1,10,15000,3),
(4,2,5,45000,1),
(5,2,14,154000,3),
(6,2,9,15780,3),
(7,3,14,154000,1),
(8,3,6,57000,1),
(9,3,15,330000,2),
(10,1,6,57000,2),
(11,1,8,27600,3),
(12,1,9,15780,3),
(13,2,8,27600,3),
(14,2,14,154000,2),
(15,2,3,24000,1),
(16,3,15,330000,1),
(17,3,12,45000,1),
(18,3,10,15000,3);*/

create table proyecto.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references usuario(id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*insert into proyecto.rol (id_rol, nombre, id_usuario) values
 (1,'ROLE_ADMIN',1), (2,'ROLE_VENDEDOR',1), (3,'ROLE_USER',1),
 (4,'ROLE_VENDEDOR',2), (5,'ROLE_USER',2),
 (6,'ROLE_USER',3);*/