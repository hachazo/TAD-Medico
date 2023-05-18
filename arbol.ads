generic
   type Elemento is private;
   
   with function "<" (X,Y:Elemento) return Boolean;
   with function ">" (X,Y:Elemento) return Boolean;
   with function "=" (X,Y:Elemento) return Boolean;

   package Arbol is
      
	  type TArbol is private;
      function Vacio (Raiz:Tarbol) return Boolean;
      procedure Insertar(Raiz:in out Tarbol; Elem: in Elemento);
      procedure Suprimir(Raiz:in out Tarbol; Valsup: in Elemento);
	  
	  function Esta (Raiz: in Tarbol; Buscado: in Elemento) return Boolean;
	  function buscar (Raiz: in Tarbol; Buscado: in Elemento) return Elemento;
      
	  procedure Limpiar (Ptr: in out Tarbol);
      
	  function Izq (Ptr: Tarbol) return Tarbol;
      function der (Ptr: Tarbol) return Tarbol;
      function Info (Ptr: Tarbol) return Elemento;
      
	  Arbolvacio:exception;
      
	  private
      type Tiponodo ;
      type Tarbol is access Tiponodo;
      type Tiponodo is
      
	  record
         Info:Elemento;
         Izq:Tarbol;
         Der:Tarbol;
		 end record;
      
	  end arbol;
      


      
