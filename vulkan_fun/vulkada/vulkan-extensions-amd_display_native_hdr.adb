-- This file is part of VulkAda.

-- VulkAda is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as
-- published by the Free Software Foundation, either version 3 of
-- the License, or (at your option) any later version.

-- VulkAda is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.

-- You should have received a copy of the GNU Lesser General Public
-- License along with VulkAda.
-- If not, see <http://www.gnu.org/licenses/>.

-- Copyright 2026 Phaser Cat Games LLC

-- Operations for the display native HDR extension

with Vulkan.Core;
with Vulkan.Utilities;

package body Vulkan.Extensions.AMD_Display_Native_HDR is
    -- Loaded extension functions.
    type vkSetLocalDimmingAMD_Access is
        access procedure(Device: in Vulkan.Device;
                         Swapchain: in KHR.Swapchain;
                         Local_Dimming_Enable: in Interfaces.Unsigned_32)
        with Convention => C;
    
    vkSetLocalDimmingAMD: vkSetLocalDimmingAMD_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkSetLocalDimmingAMD_Access);
    begin
        Load(vkSetLocalDimmingAMD, "vkSetLocalDimmingAMD");
    end Load_Extension;

    procedure Set_Local_Dimming(Device: in Vulkan.Device;
                                Swapchain: in KHR.Swapchain;
                                Local_Dimming_Enable: in Boolean) is
    begin
        vkSetLocalDimmingAMD(Device,
                             Swapchain,
                             Utilities.To_C(Local_Dimming_Enable));
    end Set_Local_Dimming;
end Vulkan.Extensions.AMD_Display_Native_HDR;

