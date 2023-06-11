with Ada.Text_Io,Ada.Integer_Text_Io,Menu,medico,nt_console;--, menu_os, menu_pacien, menu_turnos; 
use ada.Text_IO,menu,ada.Integer_Text_IO,nt_console;

procedure Programa_principal is

   Option: Integer;
   
begin
   
   while Option/=6 loop
      
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
   Put_Line("3. Gestionar obras sociales.");
   Put_Line("4. Informes.");
   Put_Line("5. Turnos");   
   Put_Line("6. Salir del programa.");
   New_line;
   
   Put("Ingrese su opcion: ");
   new_line;
   Get(option);
   New_Line;
   
   case Option is
         when 1 => 
            Menu.Medicos_Menu;
            clear_screen;
         when 2 => 
           -- menu_pacien.pacientes_menu; 
           null;
         when 3 =>
           -- Menu_Os.obrasocial_menu;           null;
         when 4 =>
            null;
         when 5 =>
           --  Menu_Turnos.Turnos_Pacientes_Medicos;
           null;
         when 6 =>
            Put_Line(" ");
         when others => 
            Put_Line("Opcion invalida");
         end case;
      
      end loop;

end Programa_principal;