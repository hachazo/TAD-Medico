with Ada.Text_IO,ada.Integer_Text_IO,menu; use ada.Text_IO,menu,ada.Integer_Text_IO;

procedure Programa_principal is

   Option: Integer;
   
begin
   
   while Option/=5 loop
      
   Put(".___________________________________________________________________________________.");New_Line;
   Put("|                                                                                   |");New_Line; 
   Put("|                                  Clinica San Pedro                                |");New_Line;
   put("|                                                                                   |");New_line;
   put("| Telefono: +123456789 Email: consultas@sanpedro.com Direccion: Alberti 445 Bs. As. |");new_line;
   Put(".___________________________________________________________________________________. ");New_Line;     
      
   Put_Line(".____________________________________.");
   Put_Line("|                                    |");
   Put_Line("|         PROGRAMA PRINCIPAL         |");
   Put_Line("|          MENU DE OPCIONES          |");
   Put_Line(".____________________________________.");
   new_line;
   Put_Line("Elija la operacion a ejecutar:"); 
   new_line;
   Put_Line("1. Gestionar medicos.");
   Put_Line("2. Gestionar pacientes.");
   Put_Line("3. Informes.");
   Put_Line("4. Turnos");
   Put_Line("5. Salir del programa.");
   New_line;
   
   Put("Ingrese su opcion: ");
   new_line;
   Get(option);
   New_Line;
   
   case Option is
         when 1 => 
            menu.medicos_menu;
         when 2 => 
            null; 
         when 3 =>
            null;
         when 4 =>
            null;
         when 5 =>
            Put_Line(" ");
         when others => 
            Put_Line("Opcion invalida");
         end case;
      
      end loop;

end Programa_principal;