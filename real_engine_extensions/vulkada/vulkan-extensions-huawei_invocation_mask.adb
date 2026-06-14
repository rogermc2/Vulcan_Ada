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

-- Operations for the invocation mask extension

with Vulkan.Core;

package body Vulkan.Extensions.HUAWEI_Invocation_Mask is
    -- Loaded extension functions.
    type vkCmdBindInvocationMaskHUAWEI_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Image_View: in Vulkan.Image_View;
                         Image_Layout: in Vulkan.Image_Layout)
        with Convention => C;

    vkCmdBindInvocationMaskHUAWEI: vkCmdBindInvocationMaskHUAWEI_Access;

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
            new Load_Pointer(vkCmdBindInvocationMaskHUAWEI_Access);
    begin
        Load(vkCmdBindInvocationMaskHUAWEI, "vkCmdBindInvocationMaskHUAWEI");
    end Load_Extension;

    procedure Bind_Invocation_Mask(Command_Buffer: in Vulkan.Command_Buffer;
                                   Image_View: in Vulkan.Image_View;
                                   Image_Layout: in Vulkan.Image_Layout) is
    begin
        vkCmdBindInvocationMaskHUAWEI(Command_Buffer, Image_View, Image_Layout);
    end Bind_Invocation_Mask;

    procedure Bind_Invocation_Mask(Command_Buffer: in Vulkan.Command_Buffer;
                                   Image_Layout: in Vulkan.Image_Layout) is
    begin
        vkCmdBindInvocationMaskHUAWEI(Command_Buffer,
                                      No_Image_View,
                                      Image_Layout);
    end Bind_Invocation_Mask;
end Vulkan.Extensions.HUAWEI_Invocation_Mask;

