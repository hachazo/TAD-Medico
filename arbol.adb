with Ada.Unchecked_Deallocation;
package body Arbol is
   
   procedure Free is new Ada.Unchecked_Deallocation (Tiponodo,Tarbol);
   function Vacio (Raiz:Tarbol) return Boolean is
   begin
      return Raiz=null;
   end Vacio;
   procedure Limpiar (Ptr:in out Tarbol) is
   begin
      if not Vacio(Ptr)then
         Limpiar(Ptr.Izq);
         Limpiar(Ptr.Der);         
		 Free(Ptr);
      end if;
   end Limpiar;
   procedure Insertar (Raiz:in out Tarbol; Elem: in Elemento) is
      Newnodo:Tarbol:=new Tiponodo'(Elem, null, null);
      Ptr:Tarbol:=Raiz;
      Anterior:Tarbol:=null;
   begin
      while Ptr/= null loop
         Anterior:=Ptr;
         if Ptr.Info>Elem then Ptr:=Ptr.Izq;
         else Ptr:=Ptr.Der;
         end if;
      end loop;
      if Anterior =null then Raiz:=Newnodo;
      else 
         if Anterior.Info>Elem then
            Anterior.Izq:=Newnodo;
            else 
            Anterior.Der:=Newnodo;
         end if;
      end If;
	  end Insertar;
         
   procedure Buscarmax (Arbol:in out Tarbol; Maxptr: out Tarbol) is
   begin
      if Arbol.Der = null then 
         Maxptr:=Arbol;
         Arbol:=Arbol.Izq;
      else
          Buscarmax(Arbol.Der,Maxptr);
		  end if;
   end Buscarmax;
   procedure Suprimirnodo(Arbol:in out Tarbol) is
      Temp:Tarbol;
      Suc:Tarbol;
   begin
      if Arbol.Izq=null and Arbol.Der=null then Free(Arbol);
      elsif Arbol.Izq =null then Temp:=Arbol;
         Arbol:=Arbol.Der;
         Free(Temp);
      elsif Arbol.Der=null then Temp:=Arbol;
	  Arbol:=Arbol.Izq;
            Free(Temp);
         else Buscarmax(Arbol.Izq,Suc);
            Arbol.Info:=Suc.Info;
            Free(Suc);
         end if;
         end suprimirnodo;

   procedure Suprimir (raiz: in out Tarbol;Valsup:in Elemento) is
   begin
      if raiz =null then raise Arbolvacio;
      elsif Valsup=raiz.Info then Suprimirnodo(raiz);
      elsif Valsup<raiz.Info then Suprimir(raiz.Izq,Valsup);
      else Suprimir (raiz.Der, Valsup);
      end if;
   end Suprimir;
   
   function Esta (Raiz: in Tarbol; Buscado:in Elemento) return Boolean is
   begin 
      if Vacio(Raiz) then return False;
      else if Raiz.Info=Buscado then return True;
         else if Raiz.Info>Buscado then return Esta(Raiz.Izq,Buscado);
            else return Esta(Raiz.Der,Buscado);
            end if;
         end if;
      end if;
   end Esta;
   
   function Izq (Ptr:Tarbol) return Tarbol is 
   begin
      if vacio(Ptr) then raise Arbolvacio;
      else return Ptr.Izq;
      end if;
   end Izq;
   function der (Ptr:Tarbol) return Tarbol is 
   begin
      if vacio(Ptr) then raise Arbolvacio;
      else return Ptr.der;
      end if;
   end der;
   function info (Ptr:Tarbol) return elemento is 
   begin
      if vacio(Ptr) then raise Arbolvacio;
      else return Ptr.info;
      end if;
   end Info;
	
	function Buscar (Raiz: in Tarbol; Buscado:in Elemento) return Elemento is
   begin 
      if Vacio(Raiz) then raise Arbolvacio;
      else if Raiz.Info=Buscado then 
         return raiz.info;
         else if Raiz.Info>Buscado then return buscar(Raiz.Izq,Buscado);
            else return buscar(Raiz.Der,Buscado);
            end if;
         end if;
      end if;
   end Buscar;
   
   end arbol;


   
      
