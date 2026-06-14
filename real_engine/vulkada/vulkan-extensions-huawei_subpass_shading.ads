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

-- Operations for the subpass shading extension

package Vulkan.Extensions.HUAWEI_Subpass_Shading is
    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI
    function Get_Device_Subpass_Shading_Max_Workgroup_Size
        (Device: in Vulkan.Device;
         Render_Pass: in Vulkan.Render_Pass;
         Max_Workgroup_Size: out Extent_2D) return Result
        with Inline,
             Pre => Device /= No_Device and
                    Render_Pass /= No_Render_Pass,
             Post => Get_Device_Subpass_Shading_Max_Workgroup_Size'Result in
                Success |
                Out_Of_Device_Memory |
                Out_Of_Host_Memory |
                Surface_Lost |
                Unknown |
                Validation_Failed;

    function Get_Device_Subpass_Shading_Max_Workgroup_Size
        (Device: in Vulkan.Device;
         Render_Pass: in Vulkan.Render_Pass) return Extent_2D
        with Inline,
             Pre => Device /= No_Device and
                    Render_Pass /= No_Render_Pass;

    -- vkCmdSubpassShadingHUAWEI
    procedure Subpass_Shading(Command_Buffer: in Vulkan.Command_Buffer)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer;
end Vulkan.Extensions.HUAWEI_Subpass_Shading;

