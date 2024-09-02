--Procedimientos para pruebas CRUD

--Insertar
CREATE OR REPLACE PROCEDURE sp_insertar_cliente (
    p_id IN VARCHAR2,
    p_nombre IN VARCHAR2,
    p_apellido IN VARCHAR2,
    p_email IN VARCHAR2,
    p_telefono IN VARCHAR2
) AS
BEGIN
    INSERT INTO Cliente (id_cliente, nombre, apellido, email, telefono)
    VALUES (p_id, p_nombre, p_apellido, p_email, p_telefono);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Cliente insertado correctamente: ' || p_nombre || ' ' || p_apellido);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al insertar cliente: ' || SQLERRM);
        ROLLBACK;
END sp_insertar_cliente;
/


-- Select
CREATE OR REPLACE PROCEDURE sp_leer_clientes IS
    CURSOR c_clientes IS
        SELECT * FROM Cliente;
BEGIN
    FOR r IN c_clientes LOOP
        DBMS_OUTPUT.PUT_LINE('ID Cliente: ' || r.id_cliente || ', Nombre: ' || r.nombre || ', Apellido: ' || r.apellido || ', Email: ' || r.email);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Lectura de clientes completada correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al leer clientes: ' || SQLERRM);
END sp_leer_clientes;
/


--UPDATE
CREATE OR REPLACE PROCEDURE sp_actualizar_cliente (
    p_id_cliente IN VARCHAR2,
    p_nombre IN VARCHAR2
) AS
BEGIN
    UPDATE Cliente
    SET nombre = p_nombre
    WHERE id_cliente = p_id_cliente;
    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Cliente actualizado correctamente: ID ' || p_id_cliente);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontró el cliente con ID: ' || p_id_cliente);
    END IF;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar cliente: ' || SQLERRM);
        ROLLBACK;
END sp_actualizar_cliente;
/


--DELETE
CREATE OR REPLACE PROCEDURE sp_eliminar_cliente (
    p_id_cliente IN VARCHAR2
) AS
BEGIN
    DELETE FROM Cliente
    WHERE id_cliente = p_id_cliente;
    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Cliente eliminado correctamente: ID ' || p_id_cliente);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontró el cliente con ID: ' || p_id_cliente);
    END IF;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar cliente: ' || SQLERRM);
        ROLLBACK;
END sp_eliminar_cliente;













