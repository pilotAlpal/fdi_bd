create or replace TRIGGER MANTIENECONTADOR 
AFTER INSERT OR DELETE ON TRAYECTOS 
FOR EACH ROW
BEGIN
  if deleting then
  update contratos set NUMTRAYECTOS=NUMTRAYECTOS-1 where referencia=:new.referencia;
  elsif inserting then
  update contratos set NUMTRAYECTOS=NUMTRAYECTOS+1 where referencia=:new.referencia;  
  end if;
END;