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

-- Operations for the device generated commands extension

with Vulkan.Extensions.NV;

package Vulkan.Extensions.NV_Device_Generated_Commands is
    use type NV.Indirect_Commands_Layout;

    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkGetGeneratedCommandsMemoryRequirementsNV
    procedure Get_Generated_Commands_Memory_Requirements
        (Device: in Vulkan.Device;
         Info: in NV.Generated_Commands_Memory_Requirements_Info;
         Memory_Requirements: in out Memory_Requirements_2)
        with Pre => Device /= No_Device and
                    Info.Indirect_Commands_Layout /=
                    NV.No_Indirect_Commands_Layout;

    function Get_Generated_Commands_Memory_Requirements
        (Device: in Vulkan.Device;
         Info: in NV.Generated_Commands_Memory_Requirements_Info)
        return Memory_Requirements_2
        with Pre => Device /= No_Device and
                    Info.Indirect_Commands_Layout /=
                    NV.No_Indirect_Commands_Layout;

    -- vkCmdPreprocessGeneratedCommandsNV
    procedure Preprocess_Generated_Commands
        (Command_Buffer: in Vulkan.Command_Buffer;
         Generated_Commands_Info: in NV.Generated_Commands_Info)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    Generated_Commands_Info.Indirect_Commands_Layout /=
                    NV.No_Indirect_Commands_Layout and
                    not Generated_Commands_Info.Streams.Is_Empty and
                    Generated_Commands_Info.Preprocess_Buffer /= No_Buffer;

    -- vkCmdExecuteGeneratedCommandsNV
    procedure Execute_Generated_Commands
        (Command_Buffer: in Vulkan.Command_Buffer;
         Is_Preprocessed: in Boolean;
         Generated_Commands_Info: in NV.Generated_Commands_Info)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    Generated_Commands_Info.Indirect_Commands_Layout /=
                    NV.No_Indirect_Commands_Layout and
                    not Generated_Commands_Info.Streams.Is_Empty and
                    Generated_Commands_Info.Preprocess_Buffer /= No_Buffer;

    -- vkCmdBindPipelineShaderGroupNV
    procedure Bind_Pipeline_Shader_Group
        (Command_Buffer: in Vulkan.Command_Buffer;
         Pipeline_Bind_Point: in Vulkan.Pipeline_Bind_Point;
         Pipeline: in Vulkan.Pipeline;
         Group_Index: in Interfaces.Unsigned_32)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    Pipeline /= No_Pipeline;

    -- vkCreateIndirectCommandsLayoutNV
    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.Indirect_Commands_Layout_Create_Info;
                    Allocator: aliased in Allocation_Callbacks;
                    Indirect_Commands_Layout: out NV.Indirect_Commands_Layout)
        return Result
        with Pre => Device /= No_Device,
             Post => Create'Result in Success |
                                      Out_Of_Host_Memory |
                                      Out_Of_Device_Memory |
                                      Unknown |
                                      Validation_Failed and
                     (if Create'Result = Success then
                        Indirect_Commands_Layout /=
                        NV.No_Indirect_Commands_Layout);

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.Indirect_Commands_Layout_Create_Info;
                    Allocator: aliased in Allocation_Callbacks)
        return NV.Indirect_Commands_Layout
        with Pre => Device /= No_Device,
             Post => Create'Result /= NV.No_Indirect_Commands_Layout;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.Indirect_Commands_Layout_Create_Info;
                    Indirect_Commands_Layout: out NV.Indirect_Commands_Layout)
        return Result
        with Pre => Device /= No_Device,
             Post => Create'Result in Success |
                                      Out_Of_Host_Memory |
                                      Out_Of_Device_Memory |
                                      Unknown |
                                      Validation_Failed and
                     (if Create'Result = Success then
                        Indirect_Commands_Layout /=
                        NV.No_Indirect_Commands_Layout);

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.Indirect_Commands_Layout_Create_Info)
        return NV.Indirect_Commands_Layout
        with Pre => Device /= No_Device,
             Post => Create'Result /= NV.No_Indirect_Commands_Layout;

    -- vkDestroyIndirectCommandsLayoutNV
    procedure Destroy(Device: in Vulkan.Device;
                      Indirect_Commands_Layout:
                        in out NV.Indirect_Commands_Layout;
                      Allocator: aliased in Allocation_Callbacks)
        with Inline,
             Pre => Device /= No_Device,
             Post => Indirect_Commands_Layout = NV.No_Indirect_Commands_Layout;

    procedure Destroy(Device: in Vulkan.Device;
                      Indirect_Commands_Layout:
                        in out NV.Indirect_Commands_Layout)
        with Inline,
             Pre => Device /= No_Device,
             Post => Indirect_Commands_Layout = NV.No_Indirect_Commands_Layout;
end Vulkan.Extensions.NV_Device_Generated_Commands;

