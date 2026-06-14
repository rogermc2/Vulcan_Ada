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

with Vulkan.Core;

package body Vulkan.Extensions.NV_Mesh_Shader is
    -- Loaded extension functions.
    type vkCmdDrawMeshTasksNV_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Task_Count, First_Task: in Interfaces.Unsigned_32)
        with Convention => C;

    vkCmdDrawMeshTasksNV: vkCmdDrawMeshTasksNV_Access;

    type vkCmdDrawMeshTasksIndirectNV_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Buffer: in Vulkan.Buffer;
                         Offset: in Device_Size;
                         Draw_Count, Stride: in Interfaces.Unsigned_32)
        with Convention => C;

    vkCmdDrawMeshTasksIndirectNV: vkCmdDrawMeshTasksIndirectNV_Access;

    type vkCmdDrawMeshTasksIndirectCountNV_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Buffer: in Vulkan.Buffer;
                         Offset: in Device_Size;
                         Count_Buffer: in Vulkan.Buffer;
                         Count_Buffer_Offset: in Device_Size;
                         Max_Draw_Count, Stride: in Interfaces.Unsigned_32)
        with Convention => C;

    vkCmdDrawMeshTasksIndirectCountNV: vkCmdDrawMeshTasksIndirectCountNV_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkCmdDrawMeshTasksNV_Access);
        procedure Load is new Load_Pointer(vkCmdDrawMeshTasksIndirectNV_Access);
        procedure Load is
            new Load_Pointer(vkCmdDrawMeshTasksIndirectCountNV_Access);
    begin
        Load(vkCmdDrawMeshTasksNV, "vkCmdDrawMeshTasksNV");
        Load(vkCmdDrawMeshTasksIndirectNV, "vkCmdDrawMeshTasksIndirectNV");
        Load(vkCmdDrawMeshTasksIndirectCountNV, 
             "vkCmdDrawMeshTasksIndirectCountNV");
    end Load_Extension;

    procedure Draw_Mesh_Tasks(Command_Buffer: in Vulkan.Command_Buffer;
                              Task_Count,
                              First_Task: in Interfaces.Unsigned_32) is
    begin
        vkCmdDrawMeshTasksNV(Command_Buffer, First_Task, Task_Count);
    end Draw_Mesh_Tasks;

    procedure Draw_Mesh_Tasks(Command_Buffer: in Vulkan.Command_Buffer;
                              Buffer: in Vulkan.Buffer;
                              Offset: in Device_Size;
                              Draw_Count, Stride: in Interfaces.Unsigned_32) is
    begin
        vkCmdDrawMeshTasksIndirectNV(Command_Buffer,
                                     Buffer,
                                     Offset,
                                     Draw_Count,
                                     Stride);
    end Draw_Mesh_Tasks;

    procedure Draw_Mesh_Tasks(Command_Buffer: in Vulkan.Command_Buffer;
                              Buffer: in Vulkan.Buffer;
                              Offset: in Device_Size;
                              Count_Buffer: in Vulkan.Buffer;
                              Count_Buffer_Offset: in Device_Size;
                              Max_Draw_Count,
                              Stride: in Interfaces.Unsigned_32) is
    begin
        vkCmdDrawMeshTasksIndirectCountNV(Command_Buffer,
                                          Buffer,
                                          Offset,
                                          Count_Buffer,
                                          Count_Buffer_Offset,
                                          Max_Draw_Count,
                                          Stride);
    end Draw_Mesh_Tasks;
end Vulkan.Extensions.NV_Mesh_Shader;

