
with Logger;
with Instances;

package body Renderer is

   procedure Initialize is
   begin
      Logger.Print ("Render: Start making a graphics engine");
      Instances.Initialize (Instance);
   end Initialize;

   procedure Finalize is
   begin
      Logger.Print ("Render: Goodbye see you later!");
   end Finalize;

end Renderer;