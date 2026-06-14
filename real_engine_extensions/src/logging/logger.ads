
with Vulkan; use Vulkan;

package Logger is
   function Is_Enabled return Boolean;
   procedure Print (Message : String);
   procedure Print (List : String_Vectors.Vector);
   procedure Print (Extensions : Vulkan.Extension_Properties_Vectors.Vector);
   procedure Print (Layers : Vulkan.Layer_Properties_Vectors.Vector);
   procedure Set_Mode (Mode : Boolean);

private
   Enabled : Boolean := True;

end Logger;