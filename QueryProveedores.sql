-- -----------------------------------------------------------
-- PROVEEDORES -----------------------------------------------------------
-- -----------------------------------------------------------
-- Insertar *****************************************************
DELIMITER //
create procedure procInsertProveedores(IN v_nit varchar(45), v_nombre varchar(45))
BEGIN
insert into tbl_proveedores(prov_nit, prov_nombre) values (v_nit, v_nombre);
END//
DELIMITER ;
-- MOSTRAR *****************************************************
DELIMITER //
create procedure procSelectProveedores()
BEGIN
select prov_id, prov_nit, prov_nombre from tbl_proveedores;
END//
DELIMITER ;
-- ACTUALIZAR *****************************************************
DELIMITER //
create procedure procUpdateProveedores(IN v_id INT, IN v_nit varchar(45), IN v_nombre varchar(45))
BEGIN
update tbl_proveedores set prov_nit = v_nit,
prov_nombre = v_nombre
where prov_id = v_id;
END//
DELIMITER ;
-- ELIMINAR *****************************************************
DELIMITER //
create procedure procDeleteProveedores(IN v_id INT)
begin
delete from tbl_proveedores where prov_id = v_id;
end//
DELIMITER ;














