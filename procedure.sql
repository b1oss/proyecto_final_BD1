DELIMITER //
DROP procedure IF EXISTS buscar_administrador //
create procedure buscar_administrador(correo varchar(60),contra varchar(60)) 
begin
	select p.contraseña 'contraseña' , pce.correo_electronico 'correo'
    from persona p
    inner join persona_correo_electronico pce
    on p.DNI=pce.DNI_persona
    inner join administrador a
    on p.DNI=a.DNI and pce.DNI_persona=a.DNI
    where pce.correo_electronico=correo;
end;
//
DELIMITER ;



drop procedure if exists insertar_bicicleta_montañera;
delimiter \\
create procedure insertar_bicicleta_montañera(in id_producto int,in precio decimal(12,2),
in color varchar(20),in material varchar(20),in objeto_extra varchar(40),in foto text)
begin
	insert into producto values (id_producto,precio);
    insert into bicicleta values (id_producto,color,material,foto);
    insert into bici_montañera values (id_producto,objeto_extra);
end;
\\
delimiter ;

drop procedure if exists insertar_bicicleta_urbana;
delimiter \\
create procedure insertar_bicicleta_urbana(in id_producto int,in precio decimal(12,2),
in color varchar(20),in material varchar(20),in objeto_extra varchar(40),in foto text)
begin
	insert into producto values (id_producto,precio);
    insert into bicicleta values (id_producto,color,material,foto);
    insert into bici_urbana values (id_producto,objeto_extra);
end;
\\
delimiter ;


drop procedure if exists insertar_bicicleta_infantil;
delimiter \\
create procedure insertar_bicicleta_infantil(in id_producto int,in precio decimal(12,2),
in color varchar(20),in material varchar(20),in objeto_extra varchar(40),in foto text)
begin
	insert into producto values (id_producto,precio);
    insert into bicicleta values (id_producto,color,material,foto);
    insert into bici_infantil values (id_producto,objeto_extra);
end;
\\
delimiter ;


drop procedure if exists insertar_bicicleta_freestyle;
delimiter \\
create procedure insertar_bicicleta_freestyle(in id_producto int,in precio decimal(12,2),
in color varchar(20),in material varchar(20),in foto text)
begin
	insert into producto values (id_producto,precio);
    insert into bicicleta values (id_producto,color,material,foto);
    insert into bici_freestyle values (id_producto);
end;
\\
delimiter ;


drop procedure if exists mostrar_bici_freestyle;
delimiter \\
create procedure mostrar_bici_freestyle()
begin
	select p.id_producto,p.precio,b.color,b.material,b.foto
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto
    inner join bici_freestyle bf
    on p.id_producto=bf.id_producto
    group by p.id_producto;
end;
\\
delimiter ;



drop procedure if exists mostrar_bici_infantil;
delimiter \\
create procedure mostrar_bici_infantil()
begin
	select p.id_producto,p.precio,b.color,b.material,bi.objeto_extra,b.foto
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto
    inner join bici_infantil bi
    on p.id_producto=bi.id_producto
    group by p.id_producto;
end;
\\
delimiter ;


delimiter \\
create procedure mostrar_bici_montañera()
begin
	select p.id_producto,p.precio,b.color,b.material,bm.objeto_extra,b.foto
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto
    inner join bici_montañera bm
    on p.id_producto=bm.id_producto
    group by p.id_producto;
end;
\\
delimiter ;


drop procedure if exists mostrar_bici_urbana;
delimiter \\
create procedure mostrar_bici_urbana()
begin
	select p.id_producto,p.precio,b.color,b.material,b.foto,bu.objeto_extra
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto
    inner join bici_urbana bu
    on p.id_producto=bu.id_producto
    group by p.id_producto;
end;
\\
delimiter ;



drop procedure if exists actualizar_bici_urbana;
delimiter \\
create procedure actualizar_bici_urbana(in id int,in precio decimal(12,2),in color varchar(20),
in material varchar(20),in extra varchar(60),in foto text)
begin
    update producto pr set pr.precio=precio where pr.id_producto=id;
    update bicicleta bi set bi.color=color,bi.material=material,bi.foto=foto where bi.id_producto=id;
    update bici_urbana bur set bur.objeto_extra=extra where bur.id_producto=id;
end;
\\
delimiter ;

drop procedure if exists actualizar_bici_urbana_id;
delimiter \\
create procedure actualizar_bici_urbana_id(in id int)
begin
	select p.id_producto,p.precio,b.color,b.material,bu.objeto_extra,b.foto
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto 
    inner join bici_urbana bu
    on p.id_producto=bu.id_producto
	where p.id_producto=id;
end;
\\
delimiter ;




drop procedure if exists actualizar_bici_freestyle;
delimiter \\
create procedure actualizar_bici_freestyle(in id int,in precio decimal(12,2),in color varchar(20),
in material varchar(20),in foto text)
begin
    update producto pr set pr.precio=precio where pr.id_producto=id;
    update bicicleta bi set bi.color=color,bi.material=material, bi.foto=foto where bi.id_producto=id;
end;
\\
delimiter ;


drop procedure if exists actualizar_bici_freestyle_id;

delimiter \\
create procedure actualizar_bici_freestyle_id(in id int)
begin
	select p.id_producto,p.precio,b.color,b.material,b.foto
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto
    inner join bici_freestyle bf
    on p.id_producto=bf.id_producto
	where p.id_producto=id;
end;
\\
delimiter ;






drop procedure if exists actualizar_bici_infantil;
delimiter \\
create procedure actualizar_bici_infantil(in id int,in precio decimal(12,2),in color varchar(20),
in material varchar(20),in extra varchar(60),in foto text)
begin
    update producto pr set pr.precio=precio where pr.id_producto=id;
    update bicicleta bi set bi.color=color,bi.material=material,bi.foto=foto where bi.id_producto=id;
    update bici_infantil bin set bin.objeto_extra=extra where bin.id_producto=id;
end;
\\
delimiter ;

drop procedure if exists actualizar_bici_infantil_id;

delimiter \\
create procedure actualizar_bici_infantil_id(in id int)
begin
	select p.id_producto,p.precio,b.color,b.material,bin.objeto_extra,b.foto
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto
    inner join bici_infantil bin
    on p.id_producto=bin.id_producto
	where p.id_producto=id;
end;
\\
delimiter ;



drop procedure if exists actualizar_bici_montañera;
delimiter \\
create procedure actualizar_bici_montañera(in id int,in precio decimal(12,2),in color varchar(20),
in material varchar(20),in extra varchar(60),in foto text)
begin
    update producto pr set pr.precio=precio where pr.id_producto=id;
    update bicicleta bi set bi.color=color,bi.material=material,bi.foto=foto where bi.id_producto=id;
    update bici_montañera bm set bm.objeto_extra=extra where bm.id_producto=id;
end;
\\
delimiter ;



drop procedure if exists actualizar_bici_montañera_id;
delimiter \\
create procedure actualizar_bici_montañera_id(in id int)
begin
	select p.id_producto,p.precio,b.color,b.material,bm.objeto_extra,b.foto
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto
    inner join bici_montañera bm
    on p.id_producto=bm.id_producto
	where p.id_producto=id;
end;
\\
delimiter ;

drop procedure if exists registrar_cliente;
delimiter \\
create procedure registrar_cliente(in DNI int,in nombre varchar(30),in primer_ape varchar(30),
in segundo_ape varchar(30),in pass varchar(30),in email varchar(30),in tele integer,in presu integer)
begin
	insert into persona values(DNI,nombre,primer_ape,segundo_ape,pass);
    insert into persona_correo_electronico values(DNI,email);
    insert into persona_telefono values(DNI,tele);
    insert into usuario values(DNI,presu);
end;
\\
delimiter ;



drop procedure if exists verificar_cliente;    
delimiter \\
create procedure verificar_cliente(in correo_electronico varchar(30),in contraseña varchar(30))
begin
	select p.DNI,p.nombres,p.primero_apellido,p.segundo_apellido,pt.telefono,pce.correo_electronico,p.contraseña  
            from persona p
            inner join persona_correo_electronico pce
            on p.DNI=pce.DNI_persona
            inner join persona_telefono pt
            on pt.DNI_persona=p.DNI
            inner join usuario u
            on p.DNI=u.DNI and pce.DNI_persona=u.DNI
			where pce.correo_electronico=correo_electronico and p.contraseña=contraseña
            group by p.DNI;
end;
\\
delimiter ;

drop procedure if exists actualizar_cliente;    
delimiter \\
create procedure actualizar_cliente(
in dni integer,in nombres varchar(30),in primer_ape varchar(30),segundo_ape varchar(30),
in contra varchar(30),in email varchar(30),in tele integer)
begin
	update persona p set p.nombres=nombres,p.primero_apellido=primer_ape,
    p.segundo_apellido=segundo_ape,p.contraseña=contra where p.DNI=dni;
    update persona_correo_electronico pce set pce.correo_electronico=email
    where pce.DNI_persona=dni;
    update persona_telefono pt set pt.DNI_persona=dni,pt.telefono=tele where pt.DNI_persona=dni;
    update usuario u set u.DNI=dni where u.DNI=dni;
end;
\\
delimiter ;


drop procedure if exists actualizar_cliente_id;
delimiter \\
create procedure actualizar_cliente_id(in id int)
begin
	select p.dni,p.nombres,p.primero_apellido,p.segundo_apellido,p.contraseña,pce.correo_electronico,
    pt.telefono
    from persona p
    inner join persona_correo_electronico pce
    on p.DNI=pce.DNI_persona
    inner join persona_telefono pt
    on p.DNI=pt.DNI_persona
    inner join usuario u
    on p.DNI=u.DNI
    where p.DNI=id
    group by p.DNI;
end;
\\
delimiter ;
