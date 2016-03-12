create or replace TRIGGER GENERAMENSAJE 
  AFTER DELETE ON COMISIONCC 
  FOR EACH ROW
  declare
  codigo deposito.cc%type;
  BEGIN
    select cc into codigo from deposito where cc=:old.cc;
    insert into log values(:old.cc||'Deposito asociado');
    exception when no_data_found then
    insert into log values(:old.cc||'Cliente Preferente');
  END;