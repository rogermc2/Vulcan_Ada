
with System;

with Ada.Exceptions; use Ada.Exceptions;
with Ada.Text_IO; use Ada.Text_IO;
with Interfaces.C;
with Interfaces.C.Strings;

package body SDL_Backend is
   procedure Build_Window (Window : in out Windows.Window;
                           Width  : SDL.Positive_Dimension;
                           Height : SDL.Positive_Dimension;
                           Title  : String) is
      --  Declare the true raw C interface link
      function SDL_CreateWindow (Title      : Interfaces.C.Strings.chars_ptr;
                                 X, Y, W, H : Interfaces.C.int;
                                 Flags      : SDL.Video.Windows.Window_Flags)
                                 return System.Address;
      pragma Import (C, SDL_CreateWindow, "SDL_CreateWindow");

      --  Values for undefined window positioning
      SDL_WINDOWPOS_UNDEFINED : constant Interfaces.C.int := 16#1FFF0000#;
         use System;
         use Interfaces.C;
         use Interfaces.C.Strings;
         use SDL.Video.Windows;
         --  Build a true, null-terminated C string array
         C_Title : chars_ptr := New_String ("Real Engine Window");
         --  Fetch the raw address handle back
         Raw_Win_Addr : System.Address;
   begin
      Raw_Win_Addr := SDL_CreateWindow
      (Title => C_Title,
         X     => SDL_WINDOWPOS_UNDEFINED,
         Y     => SDL_WINDOWPOS_UNDEFINED,
         W     => int (Width),
         H     => int (Height),
         Flags => SDL.Video.Windows.Vulkan or
            SDL.Video.Windows.Allow_High_DPI);
      Free (C_Title);

      if Raw_Win_Addr = System.Null_Address then
         Put_Line ("Direct SDL_CreateWindow call failed!");
      else
         Put_Line
            ("Window structure built successfully using direct C layer.");
         --  Assign the internal record handle back to the Object wrapper
         --  Note: Depending on the binding this might look like
         --  Window.Internal := Raw_Win_Addr
      end if;

   exception
         when Error : others =>
            Put_Line ("SDL_Backend.Build_Window Exception information:  " &
                        Exception_Information (Error));
            raise;
   end Build_Window;

   function Get_SDL_Extensions (Window : Windows.Window)
      return SDL_Vulkan.Extension_Name_Arrays is
   begin
      SDL_Vulkan.Load_Library;
      return SDL_Vulkan.Get_Instance_Extensions (Window);

   exception
         when Error : others =>
            Put_Line
             ("SDL_Backend.Get_SDL_Extensions Exception information:  " &
               Exception_Information (Error));
            raise;
   end Get_SDL_Extensions;

end SDL_Backend;