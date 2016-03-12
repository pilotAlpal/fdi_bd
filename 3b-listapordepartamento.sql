create or replace PROCEDURE LISTAPORDEPARTAMENTO AS 
cursor cursorEmpleados is
/*select nombre,salario,CODDEPT from EMPLEADOS 
where dni in(select dni from empleados  
              group by CODDEPT
              having salario<avg(salario))
order by CODDEPT;*/
select nombre,salario,coddept
from
empleados natural join
(select avg(salario) medio,coddept from empleados group by coddept)
where salario<medio
;
nombEmp EMPLEADOS.NOMBRE%TYPE;
salEmp EMPLEADOS.SALARIO%TYPE;
coDep EMPLEADOS.CODDEPT%TYPE;
TB constant varchar2(1):=CHR(9);
BEGIN
open cursorEmpleados;
loop
  fetch cursorEmpleados into nombEmp,salEmp,coDep;
  exit when cursorEmpleados%NOTFOUND;
   dbms_output.put_line(lpad(nombEmp,10,' ')||TB||lpad(salEmp,20,' ')||TB||lpad(coDep,20,' '));
  NULL;
end loop;
close cursorEmpleados;
END LISTAPORDEPARTAMENTO;