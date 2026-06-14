
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
   begin
      if Enabled then
         for layer of Layers loop
            Put_Line (To_String (layer.Name));
         end loop;
      end if;

   end Print;
   --  procedure Print  (Message : String;
   --   Properties : Vulkan.Layer_Properties_Vectors.Vector) is
   --     use Vulkan.Layer_Properties_Vectors;
   --     Curs  : Cursor := Properties.First;
   --     Props : Vulkan.Layer_Properties;
   --  begin 
   --     if Enabled then
   --        Put_Line (Message);
   --        while Has_Element (Curs) loop
   --           Props := Element (Curs);
   --           Put_Line ("Name:" & To_String (Props.Name));
   --           Put_Line ("Spec_Version:" &
   --              Natural'Image (Natural (Props.Spec_Version)));
   --           Put_Line ("Implementation_Version:" &
   --              Natural'Image (Natural (Props.Implementation_Version)));
   --           Put_Line ("Description:");
   --           Put_Line (To_String (Props.Description));
   --           Next (Curs);
   --        end loop;

   --     end if;

   --  end Print;

end Logger;