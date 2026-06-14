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

-- Operations for the scissor exclusive extension

package Vulkan.Extensions.NV_Scissor_Exclusive is
    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkCmdSetExclusiveScissorEnableNV
    procedure Set_Exclusive_Scissor_Enable
        (Command_Buffer: in Vulkan.Command_Buffer;
         First_Exclusive_Scissor: in Interfaces.Unsigned_32;
         Exclusive_Scissor_Enables: in Boolean_Vectors.Vector)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    not Exclusive_Scissor_Enables.Is_Empty;

    procedure Set_Exclusive_Scissor_Enable
        (Command_Buffer: in Vulkan.Command_Buffer;
         First_Exclusive_Scissor: in Interfaces.Unsigned_32;
         Exclusive_Scissor_Enable: in Boolean)
        with Pre => Command_Buffer /= No_Command_Buffer;

    -- vkCmdSetExclusiveScissorNV
    procedure Set_Exclusive_Scissor
        (Command_Buffer: in Vulkan.Command_Buffer;
         First_Exclusive_Scissor: in Interfaces.Unsigned_32;
         Exclusive_Scissors: in Rect_2D_Vectors.Vector)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    not Exclusive_Scissors.Is_Empty;

    procedure Set_Exclusive_Scissor
        (Command_Buffer: in Vulkan.Command_Buffer;
         First_Exclusive_Scissor: in Interfaces.Unsigned_32;
         Exclusive_Scissor: in Rect_2D)
        with Pre => Command_Buffer /= No_Command_Buffer;
end Vulkan.Extensions.NV_Scissor_Exclusive;

