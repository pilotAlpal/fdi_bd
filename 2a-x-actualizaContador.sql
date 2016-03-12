create or replace PROCEDURE ACTUALIZACONTADOR 
(
  REFE IN CONTRATOS.REFERENCIA%TYPE 
) AS
cuantos Number(5,0);
BEGIN
  select count(*) into cuantos from trayectos where referencia=refe ;
  update Contratos SET NUMTRAYECTOS = cuantos where REFERENCIA = refe;
  DBMS_OUTPUT.PUT_LINE(cuantos);
  DBMS_OUTPUT.PUT_LINE(refe);
  DBMS_OUTPUT.PUT_LINE('actualizado');
  exception
  WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('No se encontraron cursos');
END ACTUALIZACONTADOR;