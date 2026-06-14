
package Logger is

---------------------------------------------------------------------------
--  Set the mode of the logger (enabled or disabled)
---------------------------------------------------------------------------
   procedure Set_Mode (Mode : Boolean);
   function Is_Enabled return Boolean;
   procedure Print (Message : String);

private
   Enabled : Boolean := True;

end Logger;