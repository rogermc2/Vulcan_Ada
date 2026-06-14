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

package Vulkan.Extensions.HUAWEI_Invocation_Mask is
    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkCmdBindInvocationMaskHUAWEI
    procedure Bind_Invocation_Mask(Command_Buffer: in Vulkan.Command_Buffer;
                                   Image_View: in Vulkan.Image_View;
                                   Image_Layout: in Vulkan.Image_Layout)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer;

    procedure Bind_Invocation_Mask(Command_Buffer: in Vulkan.Command_Buffer;
                                   Image_Layout: in Vulkan.Image_Layout)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer;
end Vulkan.Extensions.HUAWEI_Invocation_Mask;

