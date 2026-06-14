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

with Vulkan.Extensions.KHR;

package Vulkan.Extensions.AMD_Display_Native_HDR is
    use type Vulkan.Extensions.KHR.Swapchain;

    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkSetLocalDimmingAMD
    procedure Set_Local_Dimming(Device: in Vulkan.Device;
                                Swapchain: in KHR.Swapchain;
                                Local_Dimming_Enable: in Boolean)
        with Inline,
             Pre => Device /= No_Device and
                    Swapchain /= Extensions.KHR.No_Swapchain;
end Vulkan.Extensions.AMD_Display_Native_HDR;

