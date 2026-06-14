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

with Vulkan.Core;
with Vulkan.Exceptions;

package body Vulkan.Extensions.HUAWEI_Subpass_Shading is
    -- Loaded extension functions.
    type vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI_Access is
        access function(Device: in Vulkan.Device;
                        Render_Pass: in Vulkan.Render_Pass;
                        Max_Workgroup_Size: out Extent_2D)
        return Result
        with Convention => C;

    vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI:
        vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI_Access;

    type vkCmdSubpassShadingHUAWEI_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer)
        with Convention => C;

    vkCmdSubpassShadingHUAWEI: vkCmdSubpassShadingHUAWEI_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is
            new Load_Pointer
                (vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI_Access);
        procedure Load is new Load_Pointer(vkCmdSubpassShadingHUAWEI_Access);
    begin
        Load(vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI,
             "vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI");
        Load(vkCmdSubpassShadingHUAWEI, "vkCmdSubpassShadingHUAWEI");
    end Load_Extension;

    function Get_Device_Subpass_Shading_Max_Workgroup_Size
        (Device: in Vulkan.Device;
         Render_Pass: in Vulkan.Render_Pass;
         Max_Workgroup_Size: out Extent_2D) return Result is
    begin
        return vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI
            (Device, Render_Pass, Max_Workgroup_Size);
    end Get_Device_Subpass_Shading_Max_Workgroup_Size;

    function Get_Device_Subpass_Shading_Max_Workgroup_Size
        (Device: in Vulkan.Device;
         Render_Pass: in Vulkan.Render_Pass) return Extent_2D is
        Size: Extent_2D;
    begin
        Exceptions.Check(vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI
            (Device, Render_Pass, Size));

        return Size;
    end Get_Device_Subpass_Shading_Max_Workgroup_Size;

    procedure Subpass_Shading(Command_Buffer: in Vulkan.Command_Buffer) is
    begin
        vkCmdSubpassShadingHUAWEI(Command_Buffer);
    end Subpass_Shading;
end Vulkan.Extensions.HUAWEI_Subpass_Shading;

