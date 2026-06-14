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

-- Operations for the multi draw extension

with Vulkan.Extensions.EXT;

package Vulkan.Extensions.EXT_Multi_Draw is
    use type Interfaces.Unsigned_32;

    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkCmdDrawMultiEXT
    procedure Draw(Command_Buffer: in Vulkan.Command_Buffer;
                   Vertex_Info: in EXT.Multi_Draw_Info_Vectors.Vector;
                   Instance_Count,
                   First_Instance,
                   Stride: in Interfaces.Unsigned_32)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    (if not Vertex_Info.Is_Empty then Stride rem 4 = 0);

    procedure Draw(Command_Buffer: in Vulkan.Command_Buffer;
                   Vertex_Info: in EXT.Multi_Draw_Info;
                   Instance_Count,
                   First_Instance,
                   Stride: in Interfaces.Unsigned_32)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    Stride rem 4 = 0;

    -- vkCmdDrawMultiIndexedEXT
    procedure Draw_Indexed
        (Command_Buffer: in Vulkan.Command_Buffer;
         Index_Info: in EXT.Multi_Draw_Indexed_Info_Vectors.Vector;
         Instance_Count, First_Instance, Stride: in Interfaces.Unsigned_32;
         Vertex_Offset: in Interfaces.Integer_32)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    (if not Index_Info.Is_Empty then Stride rem 4 = 0);

    procedure Draw_Indexed
        (Command_Buffer: in Vulkan.Command_Buffer;
         Index_Info: in EXT.Multi_Draw_Indexed_Info;
         Instance_Count, First_Instance, Stride: in Interfaces.Unsigned_32;
         Vertex_Offset: in Interfaces.Integer_32)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    Stride rem 4 = 0;

    procedure Draw_Indexed
        (Command_Buffer: in Vulkan.Command_Buffer;
         Index_Info: in EXT.Multi_Draw_Indexed_Info_Vectors.Vector;
         Instance_Count, First_Instance, Stride: in Interfaces.Unsigned_32)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    (if not Index_Info.Is_Empty then Stride rem 4 = 0);

    procedure Draw_Indexed
        (Command_Buffer: in Vulkan.Command_Buffer;
         Index_Info: in EXT.Multi_Draw_Indexed_Info;
         Instance_Count, First_Instance, Stride: in Interfaces.Unsigned_32)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    Stride rem 4 = 0;
end Vulkan.Extensions.EXT_Multi_Draw;

