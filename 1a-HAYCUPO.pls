create or replace FUNCTION HAYCUPO(co char) RETURN boolean IS 
ocupadas number(10,0);
pLibres number(10,0);
miroCurso boolean;
miroInscripciones boolean;
BEGIN
 
  miroCurso :=false;
  miroinscripciones:=true;

  select count(*) into ocupadas from inscripciones where codigo=co;
  
  miroCurso:=true;
  miroinscripciones:=false;
  
  select plazas into pLibres from Cursos where codigo=co;
  
  if (ocupadas<pLibres)
  then
      dbms_output.put_line('puede apuntarse');
      return true;
  else
  return false;
  end if;
  
  exception when no_data_found then
   if (miroCurso) then
  dbms_output.put_line('no se encuentra el curso');
  elsif (miroInscripciones) then
  dbms_output.put_line('Nadie apuntado');
  end if;
  
END HAYCUPO;