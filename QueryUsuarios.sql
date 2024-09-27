-- -----------------------------------------------------------
-- USUARIOS -----------------------------------------------------------
-- -----------------------------------------------------------
-- INSERTAR *****************************************************
DELIMITER //
create procedure procInsertUsuario(
IN v_correo varchar(89),
IN v_contrasena text, 
IN v_salt text,
IN v_estado varchar(45))
BEGIN
insert into tbl_usuarios(usu_correo,
usu_contrasena,
usu_salt,
usu_estado) values (v_correo,v_contrasena,v_salt,v_estado);
END//
DELIMITER ;
-- MOSTRAR *****************************************************
DELIMITER //
create procedure procSelectUsuario()
begin
Select usu_id,usu_correo,usu_contrasena,usu_salt,usu_salt,usu_estado
from tbl_usuarios;
end//
DELIMITER ;
-- ACTUALIZAR *****************************************************
DELIMITER //
create procedure procUpdateUsuarios(IN v_id INT, IN v_correo varchar(89),
IN v_contrasena text, 
IN v_salt text,
IN v_estado varchar(45))
BEGIN 
update tbl_usuarios 
set usu_id = v_id,
usu_correo = v_correo,
usu_contrasena = v_contrasena,
usu_salt = v_salt,
usu_estado = v_estado
where usu_id = v_id;
END//
DELIMITER ;
-- ELIMINAR *****************************************************
DELIMITER //
create procedure procDeleteUsuario (IN v_id INT)
BEGIN 
delete from tbl_usuarios where usu_id = v_id;
END//
DELIMITER ;