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

-- Operations for the pipeline binary extension

with Vulkan.Extensions.KHR;

package Vulkan.Extensions.KHR_Pipeline_Binary is
    use type KHR.Pipeline_Binary;

    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkCreatePipelineBinariesKHR
    function Create_Pipeline_Binaries
        (Device: in Vulkan.Device;
         Create_Info: in Extensions.KHR.Pipeline_Binary_Create_Info;
         Allocator: aliased in Allocation_Callbacks;
         Binaries: out Extensions.KHR.Pipeline_Binary_Handles_Info)
        return Result
        with Pre => Device /= No_Device,
             Post => Create_Pipeline_Binaries'Result in
                Success |
                Incomplete |
                Pipeline_Binary_Missing |
                Out_Of_Host_Memory |
                Out_Of_Device_Memory |
                Initialization_Failed and
                (if Create_Pipeline_Binaries'Result = Success then
                    (for all Binary of Binaries.Pipeline_Binaries =>
                        Binary /= KHR.No_Pipeline_Binary));

    function Create_Pipeline_Binaries
        (Device: in Vulkan.Device;
         Create_Info: in Extensions.KHR.Pipeline_Binary_Create_Info;
         Binaries: out Extensions.KHR.Pipeline_Binary_Handles_Info)
        return Result
        with Pre => Device /= No_Device,
             Post => Create_Pipeline_Binaries'Result in
                Success |
                Incomplete |
                Pipeline_Binary_Missing |
                Out_Of_Host_Memory |
                Out_Of_Device_Memory |
                Initialization_Failed and
                (if Create_Pipeline_Binaries'Result = Success then
                    (for all Binary of Binaries.Pipeline_Binaries =>
                        Binary /= KHR.No_Pipeline_Binary));

    -- vkDestroyPipelineBinaryKHR
    procedure Destroy_Pipeline_Binary
        (Device: in Vulkan.Device;
         Pipeline_Binary: in out KHR.Pipeline_Binary;
         Allocator: aliased in Allocation_Callbacks)
        with Inline,
             Pre => Device /= No_Device,
             Post => Pipeline_Binary = KHR.No_Pipeline_Binary;

    procedure Destroy_Pipeline_Binary
        (Device: in Vulkan.Device;
         Pipeline_Binary: in out KHR.Pipeline_Binary)
        with Inline,
             Pre => Device /= No_Device,
             Post => Pipeline_Binary = KHR.No_Pipeline_Binary;

    -- vkGetPipelineKeyKHR
    function Get_Pipeline_Key(Device: in Vulkan.Device;
                              Pipeline_Create_Info: in KHR.Pipeline_Create_Info;
                              Pipeline_Key: in out KHR.Pipeline_Binary_Key)
        return Result
        with Pre => Device /= No_Device and
                    Pipeline_Create_Info.Next /= null,
             Post => Get_Pipeline_Key'Result in Success |
                                                Out_Of_Host_Memory |
                                                Out_Of_Device_Memory;

    function Get_Pipeline_Key(Device: in Vulkan.Device;
                              Pipeline_Create_Info: in KHR.Pipeline_Create_Info)
        return KHR.Pipeline_Binary_Key
        with Pre => Device /= No_Device and
                    Pipeline_Create_Info.Next /= null;

    function Get_Pipeline_Key(Device: in Vulkan.Device;
                              Pipeline_Key: in out KHR.Pipeline_Binary_Key)
        return Result
        with Pre => Device /= No_Device,
             Post => Get_Pipeline_Key'Result in Success |
                                                Out_Of_Host_Memory |
                                                Out_Of_Device_Memory;

    function Get_Pipeline_Key(Device: in Vulkan.Device)
        return KHR.Pipeline_Binary_Key
        with Pre => Device /= No_Device;

    -- vkGetPipelineBinaryDataKHR
    function Get_Pipeline_Binary_Data_Size
        (Device: in Vulkan.Device;
         Info: in KHR.Pipeline_Binary_Data_Info;
         Pipeline_Binary_Key: in out KHR.Pipeline_Binary_Key)
        return Interfaces.C.size_t
        with Pre => Device /= No_Device and
                    Info.Pipeline_Binary /= KHR.No_Pipeline_Binary;

    function Get_Pipeline_Binary_Data
        (Device: in Vulkan.Device;
         Info: in KHR.Pipeline_Binary_Data_Info;
         Pipeline_Binary_Key: in out KHR.Pipeline_Binary_Key;
         Pipeline_Binary_Data: in out Byte_Vectors.Vector) return Result
    with Pre => Device /= No_Device and
                Info.Pipeline_Binary /= KHR.No_Pipeline_Binary,
         Post => Get_Pipeline_Binary_Data'Result in Success |
                                                    Out_Of_Host_Memory |
                                                    Out_Of_Device_Memory |
                                                    Not_Enough_Space;
    function Get_Pipeline_Binary_Data
        (Device: in Vulkan.Device;
         Info: in KHR.Pipeline_Binary_Data_Info;
         Pipeline_Binary_Key: in out KHR.Pipeline_Binary_Key)
        return Byte_Vectors.Vector
        with Pre => Device /= No_Device and
                    Info.Pipeline_Binary /= KHR.No_Pipeline_Binary;

    -- vkReleaseCapturedPipelineDataKHR
    function Release_Captured_Pipeline_Data
        (Device: in Vulkan.Device;
         Info: in out KHR.Release_Captured_Pipeline_Data_Info;
         Allocator: aliased in Allocation_Callbacks) return Result
        with Pre => Device /= No_Device and
                    Info.Pipeline /= No_Pipeline,
             Post => Release_Captured_Pipeline_Data'Result = Success;
    
    procedure Release_Captured_Pipeline_Data
        (Device: in Vulkan.Device;
         Info: in out KHR.Release_Captured_Pipeline_Data_Info;
         Allocator: aliased in Allocation_Callbacks)
        with Pre => Device /= No_Device and
                    Info.Pipeline /= No_Pipeline;

    function Release_Captured_Pipeline_Data
        (Device: in Vulkan.Device;
         Info: in out KHR.Release_Captured_Pipeline_Data_Info) return Result
        with Pre => Device /= No_Device and
                    Info.Pipeline /= No_Pipeline,
             Post => Release_Captured_Pipeline_Data'Result = Success;
    
    procedure Release_Captured_Pipeline_Data
        (Device: in Vulkan.Device;
         Info: in out KHR.Release_Captured_Pipeline_Data_Info)
        with Pre => Device /= No_Device and
                    Info.Pipeline /= No_Pipeline;
end Vulkan.Extensions.KHR_Pipeline_Binary;

