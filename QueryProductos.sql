-- INSERTAR *****************************************************
DELIMITER //
create procedure procInsertProductos(IN v_codigo varchar(45), IN  v_descripcion varchar(45), 
IN v_cantidad INT, IN v_precio double,
IN v_prov_id INT,
IN v_cat_id INT)
BEGIN 
insert into  tbl_productos(pro_codigo,pro_descripcion,pro_cantidad,pro_precio, tbl_proveedores_prov_id,
tbl_categorias_cat_id) values (v_codigo,v_descripcion,v_cantidad,v_precio,
v_prov_id,
v_cat_id); 
END//
DELIMITER ;
-- MOSTRAR *****************************************************
DELIMITER //
create procedure procSelectProductos()
begin
select pro_id, pro_codigo, pro_descripcion, pro_cantidad, pro_precio from tbl_productos
 join tbl_proveedores ON  tbl_productos.tbl_proveedores_prov_id = prov_id
 join tbl_categorias ON tbl_productos.tbl_categorias_cat_id = cat_id;
end//
DELIMITER ;
-- ACTUALIZAR *****************************************************
DELIMITER //
create procedure procUpdateProductos(
IN v_id INT,
IN v_codigo varchar(45), 
IN v_descripcion varchar(100),
IN v_cantidad INT,
IN v_precio double,
IN v_prov_id INT,
IN v_cat_id INT)
begin
update tbl_productos 
set pro_codigo = v_descripcion,
pro_descripcion = v_descripcion,
pro_cantidad = v_cantidad,
pro_precio = v_precio,
tbl_proveedores_prov_id = v_prov_id,
tbl_categorias_cat_id = v_cat_id
where pro_id = v_id;
end//
DELIMITER ;
-- ELIMINAR *****************************************************
DELIMITER //
CREATE PROCEDURE procDeleteProductos(IN v_id INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Manejo de error, por ejemplo, puedes devolver un mensaje o código
        SELECT 'No se pudo eliminar, hay registros dependientes' AS mensaje;
    END;

    DELETE FROM tbl_productos WHERE pro_id = v_id;
END//
DELIMITER ;








