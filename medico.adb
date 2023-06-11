with Ada.Text_Io,Ada.Sequential_Io, Ada.Integer_Text_Io,Ada.Characters.Handling,nt_console;
use Ada.Characters.Handling,nt_console;

package body Medico is

use Ada.Text_Io, Ada.Integer_Text_Io;

-- Paquete archivo
package Archivo_Sec is new Ada.Sequential_Io(Emedico);
use Archivo_Sec;
F_Entrada: Archivo_Sec.File_Type;

-- Paquete arbol
function Menor(X, Y: Emedico) return Boolean is
begin
return x.Dni < Y.dni;
   end Menor;
   
function Mayor(X, Y: Emedico) return Boolean is
begin
return X.Dni > Y.dni;
end mayor;

 function Igual(X, Y: Emedico) return Boolean is
   begin
      return X.dni = Y.dni;
   end Igual;

-- Procedimiento para cuardar archivo
procedure Guardar_Archivo(X: in out Tmedico) is

   Registro:Emedico;
   
begin

   Create(F_Entrada,Out_File, "Medicos.dat");
   while not Vacio(X) loop
   registro:=info(x);
   Write(F_Entrada, registro);
   suprimir(x,info(x));
   
   
   end loop;
      
   Close(F_Entrada);
      
end guardar_archivo;

-- Procedimiento para abrir un archivo
procedure Abrir_Archivo(X: out Tmedico) is

registro:Emedico;

begin
   limpiar(x);
   
   Open(
      File => F_entrada,
      Mode => in_File,
      Name => "Medicos.dat"
      );
   
   while not End_Of_File(F_entrada) loop
     
      Read(F_Entrada, Registro);
      insertar(x,registro);
      end loop;
Close(File => F_Entrada);
   
end Abrir_Archivo;

-- Crea el registro medico se guarda en una Arbol y en un archivo
procedure Ingresar_medico(Arbol: in out Tmedico) is

   Registro:Emedico;
   resultado:boolean;

begin
   	  
    Abrir_archivo(Arbol); --Cargamos los elementos del archivo en el Arbol.

      Put_Line("Ingresar nombre del medico: ");
      Get_Line(Registro.Nombre, Registro.Longn);
      loop
      Get_Line(Registro.Nombre, Registro.Longn);
      begin
         for I in 1..Registro.Longn loop
            if Is_Digit(Registro.Nombre(I)) then
               raise Data_Error;
            end if;
         end loop;
         exit;  
      exception
              when others => begin Put_Line ("Error! Reingrese el nombre: ");
                  end;
            end;      
         end loop;
         Put_Line("Ingresar apellido del medico: ");
         loop
            begin    
               
               Get_Line(Registro.Apellido, Registro.Longa);
               
               for I in 1..Registro.Longa loop
                  if Is_Digit(Registro.Apellido(I)) then
                     raise Data_Error;
                  end if;
               end loop;
               
               exit; 
               Exception
               when Data_Error => begin Put_Line ("Error! Reingrese el apellido: ");
                  end;
            end;      
         end loop;
         Put_Line("Ingresar DNI del medico: "); 
		 loop
            begin
               Get(Registro.Dni);
               
               medico_esta(registro.Dni,resultado);
               
               if Resultado=True then
               raise MEDICO_YA_EXISTE;
               end if;
               
               exit;
                  exception
               when others => begin Put_Line ("Error! Reingrese el DNI: "); skip_line;
               end;
            end;      
         end loop;
         New_line;
         Put_Line ("Ingresar la especialidad del medico: ");
         Get_line(registro.Especialidad, registro.longe);
         loop
            begin
               Get_line(registro.Especialidad, registro.longe);     
               for I in 1..Registro.Longe loop
                  if Is_Digit(Registro.Especialidad(I)) then
                     raise Data_Error;
                  end if;
               end loop;
               exit;
                  exception
               when Data_Error => begin Put_Line ("Error! Reingrese la especialidad: ");
               end;
            end;   
         end loop;

			insertar(Arbol,Registro);
         Guardar_Archivo(Arbol);
         
   end Ingresar_Medico;
   
   procedure Medico_Esta(Elemento: in Integer; resultado: out boolean) is
    
    Arbol:Tmedico;
    buscar:Emedico;
      
      begin
         
         Buscar.Dni:=Elemento;
         Abrir_Archivo(Arbol);
         
            if Esta(Arbol,buscar) then
               Resultado:=True;
              
              else
            
            resultado:=False;
          
          end if;
       
       end Medico_Esta; 
         
   -- Muestra los datos de un medico buscado.
   procedure Existe_Medico(Arbol: in out Tmedico) is
      
      Busqueda,Resultado:Emedico;
      

      begin
        
        Abrir_Archivo(Arbol);
       
        Put_Line("Ingrese el DNI del medico a buscar:");
      
         loop
            begin
               
         Get(Busqueda.dni);
         New_Line;
         exit;
          exception
            when others => begin Put_Line ("Error! Reingrese el DNI: "); skip_line;
             end;
            end;      
         end loop;
         
         if not Vacio(Arbol) then
            If esta(arbol,busqueda) then
            
            resultado:=buscar(arbol,busqueda);
               
               clear_screen;
               Put(".________________________________________.");New_Line;
               Put("|                   |     |              |");New_Line; 
               Put("| Nombre y apellido | DNI | Especialidad |");New_Line;
               Put(".___________________|_____|______________. ");New_Line;        
                                                                  
               New_Line;
               Put(Resultado.Nombre(1..Resultado.Longn));
               put(" ");
               Put(Resultado.Apellido(1..Resultado.Longa));
               Put(" ");
               Put(Integer'Image(Resultado.Dni));
               Put(" ");
               put(resultado.Especialidad(1..resultado.longe));
               New_Line;
               New_Line;
               
            else
               
               Put_Line("Medico no encontrado!");
               new_line;
                
            end if;
            end if;
      
      end Existe_medico;
      
      -- Eliminar medico
      procedure Eliminar_medico(arbol: in out Tmedico) is
    
         Elemento:Emedico;
      
      begin
         
         limpiar(arbol);
         Abrir_Archivo(Arbol);
         
            Put_Line("Ingresar el DNI del medico que desea eliminar del listado: ");
         
            loop
            begin
               
            Get(Elemento.Dni);
            New_Line;
            exit;
            exception
               when others => begin Put_Line ("Error! Reingrese el DNI: "); skip_line;
                end;
               end;      
            end loop;
         
         if Esta(Arbol, Elemento) then
            
            Suprimir(Arbol, Elemento);
            Put_Line ("Medico eliminado con exito.");
            Guardar_archivo(Arbol);
            new_line;
         else 
            
            Put_Line("No se encuentra el medico en el listado.");
            New_line;
            end if;          
      end Eliminar_Medico;

end medico;
