
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

--  with GNAT.Compiler_Version;

with Vulkan;
with Vulkan.Core;

procedure Vulkan_Fun is
   use type Vulkan.Result;
   App_Info : aliased Vulkan.Application_Info;
   Create_Info : Vulkan.Instance_Create_Info;
   Result      : Vulkan.Result;
   Version     : Vulkan.Version_Number;
   Instance    : Vulkan.Instance;
   Layers : Vulkan.Layer_Properties_Vectors.Vector :=
      Vulkan.Core.Enumerate_Instance_Layer_Properties;
begin
   for layer of Layers loop
      Put_Line (To_String (layer.Name));
   end loop;

   Version := Vulkan.Core.Enumerate_Instance_Version;
   App_Info.API_Version := Version;
   App_Info.Application_Name := To_Unbounded_String ("Test");
   App_Info.Application_Version := Version;
   App_Info.Engine_Name := To_Unbounded_String ("ID Tech 12");

   Create_Info.Application_Info := App_Info'Unchecked_Access;
   Result := Vulkan.Core.Create (Create_Info, Instance);

   if Result = Vulkan.Success then
      Put_Line ("Success!");
   else
      Put_Line ("Failure!");
   end if;

   Vulkan.Core.Destroy (Instance);
   Put_Line ("Instance destroyed.");

end Vulkan_Fun;
