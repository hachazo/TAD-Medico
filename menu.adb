with Ada.Text_Io, Ada.Integer_Text_Io,medico; 
use Ada.Text_Io, Ada.Integer_Text_Io,medico;

package body menu is

   procedure Medicos_Menu is
      
   Arbol:Tmedico;
   
begin
   
   while Option/=4 loop
         Put_Line(".__________________________.");
         put_line("|                          |  ");
         Put_Line("| Medicos: menu principal. |");
         Put_Line(".__________________________.");
      new_line;
      Put_Line("Elija la operacion a ejecutar:"); 
      new_line;
   Put_Line("1. Agregar Medico");
   Put_Line("2. Borrar Medico");
   Put_Line("3. Buscar un Medico");
   put_line("4. Salir al menu principal");
   new_line;
   Get(option);
   New_Line;
  
   case Option is
         when 1 => 
               Ingresar_Medico(Arbol);
            when 2 => 
               Eliminar_Medico(Arbol); 
            when 3 =>
               Existe_medico(Arbol);
            when 4 =>
               Put_Line(" ");
            when others => 
               Put_Line("Opcion invalida");
      end case;
      
   end loop;
end medicos_menu;

end menu;