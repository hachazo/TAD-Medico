generic
   
   type Tipoelemento is private; -- Tipo de dato registro
      
package medico is
      
      type Tipolista is private;
      
      function Vacia (Lista: Tipolista) return Boolean;
      
      procedure Limpiar (Lista: in out Tipolista);
      
      function Info (Lista: Tipolista) return Tipoelemento;
      function Sig (Lista: Tipolista) return Tipolista;
      
      procedure Agregar_Registro (Lista: in out Tipolista; Registro: in Tipoelemento);
      procedure Eliminar_registro (Lista: in out Tipolista; Registro: Tipoelemento);
      
      function Buscar_datos_Registro (Lista: Tipolista; Registro: Tipoelemento) return Tipoelemento;
      
      Listavacia: exception;
      
      private
         
         
      type Tiponodo;
      type Tipolista is access Tiponodo;
      
      type Tiponodo is record
         Info: Tipoelemento;
         Sig: Tipolista;
      end record;
   
   
   end Medico;
  
