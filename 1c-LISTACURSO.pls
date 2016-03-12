create or replace PROCEDURE LISTACURSO AS 
TB constant varchar2(1):=CHR(9);
coI CURSOS.Codigo%Type;
noI CURSOS.Nombre%Type;
niI CURSOS.Nivel%Type;
tipoCurso CURSOS.Tipo%Type;
numI CURSOS.plazas%Type;
precioCuotas NUMBER(8,2);
horasCurso CURSOS.Horas%Type;

cursor cInfo is
  select codigo,nombre,nivel,tipo,horas  from Cursos order by nivel;
BEGIN
  dbms_output.put_line(lpad('Codigo',8,' ')||TB||rpad('nombre',100,' ')||TB||lpad('nivel',12,' ')||TB||rpad('cuantos',10,' ')||(TB||lpad('ganado',12,' ')));
 open cInfo;
  loop
  fetch cInfo into coI,noI,niI,tipoCurso,horasCurso;
  exit when cInfo%NOTFOUND;
  select count(*) into numI from Inscripciones where codigo=coI;
  select importe*numI into precioCuotas from Cuotas where nivel=niI and tipo=tipoCurso;
  if(tipoCurso='Particulares')then
  precioCuotas:=precioCuotas*horasCurso;
  end if;
  dbms_output.put_line(lpad(coI,8,' ')||TB||rpad(noI,100,' ')||TB||lpad(niI,12,' ')
    ||TB||rpad(numI,10,' ')||(TB||lpad(precioCuotas,12,' ')));
  end loop;
 close cInfo; 
END LISTACURSO;