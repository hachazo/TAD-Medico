with arbol;
   
   package Medico is
   
   type Emedico is private;
   type Tmedico is private;
   
   MEDICO_YA_EXISTE,NO_EXISTE_LISTADO_MEDICO,Data_Error: exception;
   
     procedure Ingresar_Medico (Arbol: in out Tmedico);
     procedure Eliminar_medico (Arbol: in  out Tmedico);  
     procedure Existe_Medico (Arbol: in out Tmedico);
     procedure Guardar_Archivo(X: in out Tmedico);
     procedure Abrir_Archivo(X: out Tmedico); 
     procedure medico_esta(Elemento: in integer; resultado: out boolean); 
      private
         
     type Emedico is record
        Dni: Integer;
        Nombre: string(1..40);
        Apellido: string(1..40);
        Longn: Integer;
        Longa: Integer;
        Especialidad: string(1..40);
       Longe: Integer;
      end record;

   -- Paquete Arbol ordenada
    function Menor(X, Y: Emedico) return Boolean;
    function Mayor(X, Y: Emedico) return Boolean;
    function Igual(X, Y: Emedico) return Boolean;
    
    package arbolinc is new arbol(Emedico,menor,mayor,igual);
    use arbolinc;
 
    type Tmedico is new TArbol;
    
 end Medico;
