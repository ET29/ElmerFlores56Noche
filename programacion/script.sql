CREATE DATABASE tienda_online;

CREATE TABLE usuario(
    id INT AUTO_INCREMENT NOT NULL,
    nombre_usuario VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    clave VARCHAR(10) NOT NULL UNIQUE,
    fecha_creacion DATE NOT NULL,
    telefono_contacto VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);


CREATE TABLE categoria(
    id_categoria INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    PRIMARY KEY (id_categoria)
);


CREATE TABLE proovedor(
    id_proovedor INT AUTO_INCREMENT NOT NULL,
    nombre_proovedor VARCHAR(150) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    clave VARCHAR(10) NOT NULL UNIQUE,
    telefono_contacto VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (id_proovedor)
);


CREATE TABLE producto(
    id INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    precio INT NOT NULL,
    cantidad INT NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_subida DATE NOT NULL,
    ruta_imagen TEXT NOT NULL,
    categoria_referencia INT NOT NULL,
    proovedor_referencia INT NOT NULL,
    FOREIGN KEY (categoria_referencia) REFERENCES categoria(id_categoria),
    FOREIGN KEY (proovedor_referencia) REFERENCES proovedor(id_proovedor),
    PRIMARY KEY (id)
);


-- ES LA COMPRA QUE ELLOS LE HICIERON AL PROOVEDOR
CREATE TABLE compra(
    id_compra INT AUTO_INCREMENT NOT NULL,
    fecha_compra DATE NOT NULL,
    referencia_producto INT NOT NULL,
    referencia_proovedor INT NOT NULL,
    FOREIGN KEY (referencia_proovedor) REFERENCES proovedor(id_proovedor),
    FOREIGN KEY (referencia_producto) REFERENCES producto(id),
    PRIMARY KEY (id_compra)
);

-- LA VENTA ES LA QUE SE LE DA AL USUARIO O CLIENTE
CREATE TABLE venta(
    id_venta INT AUTO_INCREMENT NOT NULL,
    fecha_venta DATE NOT NULL,
    referencia_producto INT NOT NULL,
    referencia_usuario INT NOT NULL,
    FOREIGN KEY (referencia_usuario) REFERENCES usuario(id),
    FOREIGN KEY (referencia_producto) REFERENCES producto(id),
    PRIMARY KEY (id_venta)
);


-- PARA COMENTARIOS - ESTA EN PROCESO
CREATE TABLE coment(
    id_coment INT AUTO_INCREMENT NOT NULL,
    contenido TEXT NOT NULL,
    referencia_producto INT NOT NULL,
    referencia_usuario INT NOT NULL,
    FOREIGN KEY (referencia_usuario) REFERENCES usuario(id),
    FOREIGN KEY (referencia_producto) REFERENCES producto(id),
    PRIMARY KEY (id_coment)
);