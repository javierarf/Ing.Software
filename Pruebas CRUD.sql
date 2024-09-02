--Ejecucion de pruebas CRUD
BEGIN  
    sp_insertar_cliente('123456789-0', 'Jose', 'Perez', 'Jose.perez@gmail.com', '987654321');
    sp_leer_clientes;
    sp_actualizar_cliente('123456789-0', 'Carlos');
    sp_leer_clientes;
    sp_eliminar_cliente('123456789-0');
    sp_leer_clientes;
END;


