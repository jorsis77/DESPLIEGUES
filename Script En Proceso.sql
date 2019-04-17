ALTER TABLE cib.producto ADD CONSTRAINT producto_un UNIQUE (descripcion);

ALTER TABLE cib.producto ALTER COLUMN id TYPE serial USING id::serial;


-- CREAR SECUENCIA ID EN TABLA PRODUCTO  
CREATE SEQUENCE cib.seq_prod_id;
ALTER TABLE cib.producto ALTER COLUMN id SET DEFAULT nextval('cib.seq_prod_id');
ALTER TABLE cib.producto ALTER COLUMN id SET NOT NULL;
ALTER SEQUENCE cib.seq_prod_id OWNED BY cib.producto.id;    -- 8.2 or later

-- INICIALIZO LA SECUENCIA
SELECT MAX(id) FROM cib.producto;
SELECT setval('seq_prod_id', 5);  -- replace 5 by SELECT MAX result

-- Crear secuencia IP para la tabla PC cuando, se utiliza cuando es nulo el campo por ejemplo para los play, los pc deben mandar el valor de la ip

	CREATE SEQUENCE cib.seq_pc_ip;  -- Secuencia de la IP
	ALTER TABLE cib.pc ALTER COLUMN ip SET DEFAULT nextval('cib.seq_pc_ip');
	ALTER TABLE cib.pc ALTER COLUMN ip SET NOT NULL;
	ALTER SEQUENCE cib.seq_pc_ip OWNED BY cib.pc.ip;    -- 8.2 or later

-- INICIALIZO LA SECUENCIA
SELECT MAX(ip) FROM cib.pc;
SELECT setval('cib.seq_pc_ip', 5);  -- replace 5 by SELECT MAX result
 


--Borrar constraint en tabla producto
ALTER TABLE cib.pc DROP CONSTRAINT pc_ip_numero_pc_key;

-- numero_pc debe ser unico 
ALTER TABLE cib.pc ADD CONSTRAINT pc_un UNIQUE (numero_pc);

ALTER TABLE cib.time_btn ADD CONSTRAINT time_btn_producto_fk FOREIGN KEY (idprod) REFERENCES cib.producto(id);


