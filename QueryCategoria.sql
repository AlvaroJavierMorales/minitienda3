-- -----------------------------------------------------------
-- CATEGORIAS -----------------------------------------------------------
-- -----------------------------------------------------------
-- Isertar *****************************************************
DELIMITER //
create procedure procInsertCategoria(IN v_descripcion VARCHAR(45))
begin
insert into tbl_categorias (cat_descripcion) values (v_descripcion);
end//
DELIMITER ;
-- Actualizar *****************************************************
DELIMITER //
create procedure procUpdateCategorias(IN v_id INT, IN v_descripcion varchar(45))
BEGIN
update tbl_categorias
set cat_descripcion = v_descripcion 
where cat_id = v_id;
END//
DELIMITER ;
-- Mostrar  *****************************************************
DELIMITER //
create procedure procSelectCategoria()
begin
select cat_id, cat_descripcion from tbl_categorias;
end//
DELIMITER ;
-- Eliminar *****************************************************
DELIMITER //
create procedure procDeleteCategoria(IN v_id INT)
bEGIN 
delete from tbl_categorias where cat_id = v_id;
END//
DELIMITER ;



