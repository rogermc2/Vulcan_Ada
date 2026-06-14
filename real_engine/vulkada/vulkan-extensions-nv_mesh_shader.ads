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

-- Operations for the mesh shader extension

package Vulkan.Extensions.NV_Mesh_Shader is
    use type Interfaces.Unsigned_32;

    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkCmdDrawMeshTasksNV
    procedure Draw_Mesh_Tasks(Command_Buffer: in Vulkan.Command_Buffer;
                              Task_Count, First_Task: in Interfaces.Unsigned_32)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer;

    -- vkCmdDrawMeshTasksIndirectNV
    procedure Draw_Mesh_Tasks(Command_Buffer: in Vulkan.Command_Buffer;
                              Buffer: in Vulkan.Buffer;
                              Offset: in Device_Size;
                              Draw_Count, Stride: in Interfaces.Unsigned_32)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer and
                    Buffer /= No_Buffer and
                    (if Draw_Count > 1 then Stride rem 4 = 0);

    -- vkCmdDrawMeshTasksIndirectCountNV
    procedure Draw_Mesh_Tasks(Command_Buffer: in Vulkan.Command_Buffer;
                              Buffer: in Vulkan.Buffer;
                              Offset: in Device_Size;
                              Count_Buffer: in Vulkan.Buffer;
                              Count_Buffer_Offset: in Device_Size;
                              Max_Draw_Count, Stride: in Interfaces.Unsigned_32)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer and
                    Buffer /= No_Buffer and
                    Count_Buffer /= No_Buffer and
                    Stride rem 4 = 0;
end Vulkan.Extensions.NV_Mesh_Shader;

