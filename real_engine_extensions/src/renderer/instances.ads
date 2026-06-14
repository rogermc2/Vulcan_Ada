
with Vulkan;
with SDL_Backend; use SDL_Backend;

package Instances is
   procedure Initialize
    (Instance : in out Vulkan.Instance;
      SDL_Extensions : SDL_Vulkan.Extension_Name_Arrays);
   procedure Destroy (Instance : in out Vulkan.Instance);

end Instances;
