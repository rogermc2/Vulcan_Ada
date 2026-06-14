
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

package body Logger is

   procedure Set_Mode (Mode : Boolean) is
   begin
      Enabled := Mode;
   end Set_Mode;

   function Is_Enabled return Boolean is
   begin
      return Enabled;
   end Is_Enabled;

   procedure Print (Message : String) is
   begin
      if Enabled then
         Put_Line (Message);
      end if;

   end Print;

   procedure Print (List : String_Vectors.Vector) is
   begin
      if Enabled then
         for line of List loop
            Put_Line (line);
         end loop;
      end if;

   end Print;
   procedure Print (Extensions : Vulkan.Extension_Properties_Vectors.Vector) is
   begin
      if Enabled then
         for extension of Extensions loop
            Put_Line (To_String (extension.Name));
         end loop;
      end if;

   end Print;
   procedure Print (Layers : Vulkan.Layer_Properties_Vectors.Vector) is
   use Vulkan.Layer_Properties_Vectors;
   begin
      if Enabled then
         if Layers = Vulkan.Layer_Properties_Vectors.Empty_Vector then
            Put_Line ("The Layers vector is empty.");
         else
            for layer of Layers loop
               Put_Line (To_String (layer.Name));
            end loop;
         end if;
      end if;

   end Print;

end Logger;