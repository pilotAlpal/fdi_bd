create or replace TRIGGER REGISTRACAMBIOS 
AFTER UPDATE OF SALARIO ON EMPLEADOS 
FOR EACH ROW
BEGIN
  insert into cambios values (seqcambios.nextval,:new.dni,:old.salario,:new.salario);
END;