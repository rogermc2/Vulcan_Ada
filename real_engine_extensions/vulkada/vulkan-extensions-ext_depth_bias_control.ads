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

-- Operations for the depth bias control extension

with Vulkan.Extensions.EXT;

package Vulkan.Extensions.EXT_Depth_Bias_Control is
    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkCmdSetDepthBias2EXT
    procedure Set_Depth_Bias(Command_Buffer: in Vulkan.Command_Buffer;
                             Depth_Bias_Info: in EXT.Depth_Bias_Info)
        with Pre => Command_Buffer /= No_Command_Buffer;
end Vulkan.Extensions.EXT_Depth_Bias_Control;

