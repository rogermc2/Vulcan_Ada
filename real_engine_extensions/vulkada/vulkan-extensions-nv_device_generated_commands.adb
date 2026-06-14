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

with Vulkan.Core;
with Vulkan.C_V1_1;
with Vulkan.C_NV;
with Vulkan.Utilities;
with Vulkan.Objects_Common_Access;
with Vulkan.Extension_Records;

package body Vulkan.Extensions.NV_Device_Generated_Commands is
    -- Loaded extension functions.
    type vkGetGeneratedCommandsMemoryRequirementsNV_Access is
        access procedure
            (Device: in Vulkan.Device;
             Info: in C_NV.Generated_Commands_Memory_Requirements_Info_C;
             Memory_Requirements: in out C_V1_1.Memory_Requirements_2_C)
        with Convention => C;

    vkGetGeneratedCommandsMemoryRequirementsNV:
        vkGetGeneratedCommandsMemoryRequirementsNV_Access;

    type vkCmdPreprocessGeneratedCommandsNV_Access is
        access procedure
            (Command_Buffer: in Vulkan.Command_Buffer;
             Generated_Commands_Info: in C_NV.Generated_Commands_Info_C)
        with Convention => C;

    vkCmdPreprocessGeneratedCommandsNV:
        vkCmdPreprocessGeneratedCommandsNV_Access;

    type vkCmdExecuteGeneratedCommandsNV_Access is
        access procedure
            (Command_Buffer: in Vulkan.Command_Buffer;
             Is_Preprocessed: in Interfaces.Unsigned_32;
             Generated_Commands_Info: in C_NV.Generated_Commands_Info_C)
        with Convention => C;

    vkCmdExecuteGeneratedCommandsNV: vkCmdExecuteGeneratedCommandsNV_Access;

    type vkCmdBindPipelineShaderGroupNV_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Pipeline_Bind_Point: in Vulkan.Pipeline_Bind_Point;
                         Pipeline: in Vulkan.Pipeline;
                         Group_Index: in Interfaces.Unsigned_32)
        with Convention => C;

    vkCmdBindPipelineShaderGroupNV: vkCmdBindPipelineShaderGroupNV_Access;

    type vkCreateIndirectCommandsLayoutNV_Access is
        access function
            (Device: in Vulkan.Device;
             Create_Info: in C_NV.Indirect_Commands_Layout_Create_Info_C;
             Allocator: access constant Allocation_Callbacks;
             Indirect_Commands_Layout: out NV.Indirect_Commands_Layout)
        return Result
        with Convention => C;

    vkCreateIndirectCommandsLayoutNV: vkCreateIndirectCommandsLayoutNV_Access;

    type vkDestroyIndirectCommandsLayoutNV_Access is
        access procedure
            (Device: in Vulkan.Device;
             Indirect_Commands_Layout: in NV.Indirect_Commands_Layout;
             Allocator: access constant Allocation_Callbacks)
        with Convention => C;

    vkDestroyIndirectCommandsLayoutNV: vkDestroyIndirectCommandsLayoutNV_Access;

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
            new Load_Pointer(vkGetGeneratedCommandsMemoryRequirementsNV_Access);
        procedure Load is
            new Load_Pointer(vkCmdPreprocessGeneratedCommandsNV_Access);
        procedure Load is
            new Load_Pointer(vkCmdExecuteGeneratedCommandsNV_Access);
        procedure Load is
            new Load_Pointer(vkCmdBindPipelineShaderGroupNV_Access);
        procedure Load is
            new Load_Pointer(vkCreateIndirectCommandsLayoutNV_Access);
        procedure Load is
            new Load_Pointer(vkDestroyIndirectCommandsLayoutNV_Access);
    begin
        Load(vkGetGeneratedCommandsMemoryRequirementsNV,
             "vkGetGeneratedCommandsMemoryRequirementsNV");
        Load(vkCmdPreprocessGeneratedCommandsNV,
             "vkCmdPreprocessGeneratedCommandsNV");
        Load(vkCmdExecuteGeneratedCommandsNV,
             "vkCmdExecuteGeneratedCommandsNV");
        Load(vkCmdBindPipelineShaderGroupNV, "vkCmdBindPipelineShaderGroupNV");
        Load(vkCreateIndirectCommandsLayoutNV,
             "vkCreateIndirectCommandsLayoutNV");
        Load(vkDestroyIndirectCommandsLayoutNV,
             "vkDestroyIndirectCommandsLayoutNV");
    end Load_Extension;

    package Indirect_Commands_Layouts_Common is new Objects_Common_Access
        (NV.Indirect_Commands_Layout_Create_Info,
         C_NV.Indirect_Commands_Layout_Create_Info_C,
         NV.Indirect_Commands_Layout,
         NV.No_Indirect_Commands_Layout,
         C_NV.To_C,
         C_NV.Free,
         vkCreateIndirectCommandsLayoutNV_Access,
         vkDestroyIndirectCommandsLayoutNV_Access,
         vkCreateIndirectCommandsLayoutNV,
         vkDestroyIndirectCommandsLayoutNV);

    procedure Get_Generated_Commands_Memory_Requirements
        (Device: in Vulkan.Device;
         Info: in NV.Generated_Commands_Memory_Requirements_Info;
         Memory_Requirements: in out Memory_Requirements_2) is
        Info_C: C_NV.Generated_Commands_Memory_Requirements_Info_C :=
            C_NV.To_C(Info);
        Requirements_C: C_V1_1.Memory_Requirements_2_C;
    begin
        Requirements_C.Next := Extension_Records.To_C(Memory_Requirements.Next);

        vkGetGeneratedCommandsMemoryRequirementsNV(Device,
                                                   Info_C,
                                                   Requirements_C);
        C_V1_1.To_Ada(Memory_Requirements, Requirements_C);
        C_NV.Free(Info_C);
        Extension_Records.Free(Requirements_C.Next);
    end Get_Generated_Commands_Memory_Requirements;

    function Get_Generated_Commands_Memory_Requirements
        (Device: in Vulkan.Device;
         Info: in NV.Generated_Commands_Memory_Requirements_Info)
        return Memory_Requirements_2 is
        Requirements: Memory_Requirements_2;
    begin
        Get_Generated_Commands_Memory_Requirements(Device, Info, Requirements);

        return Requirements;
    end Get_Generated_Commands_Memory_Requirements;

    procedure Preprocess_Generated_Commands
        (Command_Buffer: in Vulkan.Command_Buffer;
         Generated_Commands_Info: in NV.Generated_Commands_Info) is
        Info_C: C_NV.Generated_Commands_Info_C :=
            C_NV.To_C(Generated_Commands_Info);
    begin
        vkCmdPreprocessGeneratedCommandsNV(Command_Buffer, Info_C);
        C_NV.Free(Info_C);
    end Preprocess_Generated_Commands;

    procedure Execute_Generated_Commands
        (Command_Buffer: in Vulkan.Command_Buffer;
         Is_Preprocessed: in Boolean;
         Generated_Commands_Info: in NV.Generated_Commands_Info) is
        Info_C: C_NV.Generated_Commands_Info_C :=
            C_NV.To_C(Generated_Commands_Info);
    begin
        vkCmdExecuteGeneratedCommandsNV(Command_Buffer,
                                        Utilities.To_C(Is_Preprocessed),
                                        Info_C);
        C_NV.Free(Info_C);
    end Execute_Generated_Commands;

    procedure Bind_Pipeline_Shader_Group
        (Command_Buffer: in Vulkan.Command_Buffer;
         Pipeline_Bind_Point: in Vulkan.Pipeline_Bind_Point;
         Pipeline: in Vulkan.Pipeline;
         Group_Index: in Interfaces.Unsigned_32) is
    begin
        vkCmdBindPipelineShaderGroupNV(Command_Buffer,
                                       Pipeline_Bind_Point,
                                       Pipeline,
                                       Group_Index);
    end Bind_Pipeline_Shader_Group;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.Indirect_Commands_Layout_Create_Info;
                    Allocator: aliased in Allocation_Callbacks;
                    Indirect_Commands_Layout: out NV.Indirect_Commands_Layout)
        return Result renames Indirect_Commands_Layouts_Common.Create;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.Indirect_Commands_Layout_Create_Info;
                    Allocator: aliased in Allocation_Callbacks)
        return NV.Indirect_Commands_Layout
        renames Indirect_Commands_Layouts_Common.Create;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.Indirect_Commands_Layout_Create_Info;
                    Indirect_Commands_Layout: out NV.Indirect_Commands_Layout)
        return Result renames Indirect_Commands_Layouts_Common.Create;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.Indirect_Commands_Layout_Create_Info)
        return NV.Indirect_Commands_Layout
        renames Indirect_Commands_Layouts_Common.Create;

    procedure Destroy(Device: in Vulkan.Device;
                      Indirect_Commands_Layout:
                        in out NV.Indirect_Commands_Layout;
                      Allocator: aliased in Allocation_Callbacks)
        renames Indirect_Commands_Layouts_Common.Destroy;

    procedure Destroy(Device: in Vulkan.Device;
                      Indirect_Commands_Layout:
                        in out NV.Indirect_Commands_Layout)
        renames Indirect_Commands_Layouts_Common.Destroy;
end Vulkan.Extensions.NV_Device_Generated_Commands;

