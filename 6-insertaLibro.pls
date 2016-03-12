create or replace TRIGGER INSETRALIBRO 
BEFORE INSERT ON EJEMPLARES 
for each row
declare
codigo Libros.ISBN%Type;
BEGIN
  select isbn into codigo from libros where isbn=:new.isbn;
  update libros set copias=copias+1 where isbn=:new.isbn;
  exception when no_data_found then
  insert into Libros values(:new.isbn,1);
END;