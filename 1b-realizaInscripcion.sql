create or replace PROCEDURE REALIZAINSCRIPCION 
(
  COCURSO IN INSCRIPCIONES.CODIGO%TYPE  
, IDALUMNO IN INSCRIPCIONES.ID_PARTICIPANTE%TYPE  
, ESANTIGUO IN   INSCRIPCIONES.ANT_ALUMNO%Type
) IS  
  hayplazas boolean;
  tipoCurso CURSOS.tipo%Type;
  nivelCurso CURSOS.nivel%Type;
  importeCurso Inscripciones.importe%Type;
  descuento NUMBER(15,4);
  horasCurso CURSOS.horas%Type;
BEGIN
  hayplazas:=haycupo(cocurso);
  if(hayplazas)then
    select tipo,nivel,horas into tipoCurso,nivelCurso,horasCurso from cursos where codigo=cocurso;
    select importe into importeCurso from cuotas where nivel=nivelCurso and tipo=tipoCurso;
    if(tipoCurso='Particular')then
      importeCurso:=trunc(importeCurso*horasCurso);
    end if;
    if(esantiguo=1)then 
      descuento:=importeCurso/20;
      importeCurso:=round(importeCurso-descuento);
    end if;
    insert into inscripciones values (cocurso,idalumno,importeCurso,esAntiguo);
    dbms_output.put_line('inscrito');
  end if;
END REALIZAINSCRIPCION;