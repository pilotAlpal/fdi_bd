create or replace TRIGGER REGISTRARECORD 
AFTER INSERT ON MARCAS 
for each row
declare
tiempomarca MARCAS.TIEMPO%type;
tiemporecord records.tiempo%type;
BEGIN
  select tiempo into tiempomarca from records where prueba=:new.prueba;
  if(tiempomarca<:new.tiempo)
  then
  update records 
  set tiempo = tiempomarca
  where PRUEBA=:new.prueba;
  DBMS_OUTPUT.PUT_LINE('actualizado');
  end if;
  exception when no_data_found then
  insert into records values(:new.prueba,:new.tiempo);
  DBMS_OUTPUT.PUT_LINE('insertado');
END;