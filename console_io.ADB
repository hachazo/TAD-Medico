-- in modification, HM

pragma C_Pass_By_Copy (128);
with Text_Io;

with Interfaces; use Interfaces;
with Interfaces.C; use Interfaces.C;
with Ada.Strings, Ada.Strings.Maps, Ada.Strings.Fixed;
use  Ada.Strings, Ada.Strings.Maps, Ada.Strings.Fixed;
with Ada.Characters.Handling;

package body Console_Io is
  
  pragma Linker_Options ("-luser32");   -- for GNAT only
  
  ---------------------
  -- WIN32 INTERFACE --
  ---------------------
  Mapo,Mapa: Character_Mapping;
  
  -- basic types
  subtype Bool   	is Interfaces.C.Int;
  subtype Cstring	is Interfaces.C.Char_Array;
  
  -- Access Types
  subtype Zstring is Cstring(0..255);
  type Lpzstring is access all Zstring;
  pragma Convention (C,Lpzstring);
  
  -----------------------
  -- PACKAGE VARIABLES --
  -----------------------
  Ts,Os,As,Cs1,Cs2: String(1..255);
  T_String, O_String,A_String: aliased Zstring;
  P_A: Lpzstring := A_String'access;    -- Equivalent to String Sa
  P_O: Lpzstring := O_String'access;    -- Equivalent to String Os
  P_T: Lpzstring := T_String'access;    -- Equivalent to String Ts
  Result: Bool;
  -------------------------
  -- SUPPORTING SERVICES --
  -------------------------
  
  function Oemtochar(O_String,A_String: Lpzstring) return Bool;     -- Microsoft says: Result always TRUE
  pragma Import (Stdcall, Oemtochar, "OemToCharA");
  function Chartooem(A_String,O_String: Lpzstring) return Bool;     -- Microsoft says: Result always TRUE                                  
  pragma Import (Stdcall, Chartooem, "CharToOemA");
  
  
  procedure Get_Line(Item: out String; Last: out Natural)
  is
  begin
    Text_Io.Get_Line(Item,Last);
    Item(1..Last):= Translate(Item(1..Last),Mapa);
  end;
  
  procedure Put_Line(Item: in String)
  is
  begin
    Put(Item);
    Text_Io.New_Line;
  end;
  procedure Put(Item: in String)
  is
  begin
    Text_Io.Put(Translate(Item,Mapo));
  end;
  procedure Put(Item: in Character) is
    St: String(1..1);
  begin
    St(1):=Item;
    Text_Io.Put(Translate(St,Mapo));
  end;
  
  Ic: Integer;
  Ch:Character; 
  
  begin
    
    for I in 1..255 loop
      Ts(I):=Character'Val(I);          -- Ts:= string of 255 characters 
    end loop;
    
    T_String:= To_C(Ts);                -- T_string:= Equivalent Char_Array 
    
    Result:= Chartooem(P_T,P_O);        -- O_string:=  OEM characters corresponding to T_string;
    Result:= Oemtochar(P_T,P_A);        -- A_string:= ANSI characters corresponding to T_string;
    
    Os:=Interfaces.C.To_Ada(O_String);  -- Os := OEM  characters corresponding to Ts;
    As:=Interfaces.C.To_Ada(A_String);  -- As := ANSI characters corresponding to Ts;

    Os(128..159):= (others=>Character'Val(254));       --  Iso6429 Control characters => box-char;
                                                       -- (Assigned seemingly random values by CharToOemA) 
    
    Mapo:=To_Mapping(Ts,Os);            -- Mapping from ANSI to OEM  (used for Put)
    Mapa:=To_Mapping(Ts,As);            -- Mapping from OEM  to ANSI (used for Get)
    

  end ;
  
  
