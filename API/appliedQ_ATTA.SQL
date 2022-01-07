CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_new_user`(IN username varchar(50),IN pas  varchar(50),in typee int,in rdate date)
BEGIN
INSERT INTO `museum`.`user_` (`username_`, `password_`, `type_`, `register_date`) VALUES (username,pas, typee, rdate);

END



CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_type`(in usernn varchar(50), in pass varchar(50))
BEGIN
select type_ from museum.user_ where username_ = usernn and password_ = pass;
END





