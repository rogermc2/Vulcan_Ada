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

-- Operations for the color write enable extension

package Vulkan.Extensions.EXT_Color_Write_Enable is
    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkCmdSetColorWriteEnableEXT
    procedure Set_Color_Write_Enable
        (Command_Buffer: in Vulkan.Command_Buffer;
         Color_Write_Enables: in Boolean_Vectors.Vector)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    not Color_Write_Enables.Is_Empty;

    procedure Set_Color_Write_Enable(Command_Buffer: in Vulkan.Command_Buffer;
                                     Color_Write_Enable: in Boolean)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer;
end Vulkan.Extensions.EXT_Color_Write_Enable;

