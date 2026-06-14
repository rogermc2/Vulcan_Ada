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

-- Operations for the CUDA kernel launch extension

with Vulkan.Extensions.NV;

package Vulkan.Extensions.NV_CUDA_Kernel_Launch is
    use type Interfaces.C.size_t;
    use type System.Address;
    use type NV.CUDA_Module;
    use type NV.CUDA_Function;

    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkCreateCudaModuleNV
    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Module_Create_Info;
                    Allocator: aliased in Allocation_Callbacks;
                    Module: out NV.CUDA_Module) return Result
        with Pre => Device /= No_Device and
                    Create_Info.Data_Size /= 0 and
                    Create_Info.Data /= System.Null_Address,
             Post => Create'Result in Success |
                                      Initialization_Failed |
                                      Out_Of_Host_Memory |
                                      Unknown |
                                      Validation_Failed and
                     (if Create'Result = Success then
                        Module /= NV.No_CUDA_Module);

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Module_Create_Info;
                    Allocator: aliased in Allocation_Callbacks)
        return NV.CUDA_Module
        with Pre => Device /= No_Device and
                    Create_Info.Data_Size /= 0 and
                    Create_Info.Data /= System.Null_Address,
             Post => Create'Result /= NV.No_CUDA_Module;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Module_Create_Info;
                    Module: out NV.CUDA_Module) return Result
        with Pre => Device /= No_Device and
                    Create_Info.Data_Size /= 0 and
                    Create_Info.Data /= System.Null_Address,
             Post => Create'Result in Success |
                                      Initialization_Failed |
                                      Out_Of_Host_Memory |
                                      Unknown |
                                      Validation_Failed and
                     (if Create'Result = Success then
                        Module /= NV.No_CUDA_Module);

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Module_Create_Info)
        return NV.CUDA_Module
        with Pre => Device /= No_Device and
                    Create_Info.Data_Size /= 0 and
                    Create_Info.Data /= System.Null_Address,
             Post => Create'Result /= NV.No_CUDA_Module;

    -- vkGetCudaModuleCacheNV
    function Get_CUDA_Module_Cache_Size(Device: in Vulkan.Device;
                                        Module: in NV.CUDA_Module)
        return Interfaces.C.size_t
        with Pre => Device /= No_Device and
                    Module /= NV.No_CUDA_Module;

    function Get_CUDA_Module_Cache
        (Device: in Vulkan.Device;
         Module: in NV.CUDA_Module;
         Cache_Size: in out Interfaces.C.size_t;
         Cache_Data: in Interfaces.C.Extensions.void_ptr) return Result
        with Inline,
             Pre => Device /= No_Device and
                    Module /= NV.No_CUDA_Module,
             Post => Get_CUDA_Module_Cache'Result in Success |
                                                     Incomplete |
                                                     Initialization_Failed |
                                                     Unknown |
                                                     Validation_Failed;

    procedure Get_CUDA_Module_Cache
        (Device: in Vulkan.Device;
         Module: in NV.CUDA_Module;
         Cache_Size: in out Interfaces.C.size_t;
         Cache_Data: in Interfaces.C.Extensions.void_ptr)
        with Inline,
             Pre => Device /= No_Device and
                    Module /= NV.No_CUDA_Module;

    -- vkCreateCudaFunctionNV
    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Function_Create_Info;
                    Allocator: aliased in Allocation_Callbacks;
                    CUDA_Function: out NV.CUDA_Function) return Result
        with Pre => Device /= No_Device and
                    Create_Info.Module /= NV.No_CUDA_Module,
             Post => Create'Result in Success |
                                      Initialization_Failed |
                                      Out_Of_Host_Memory |
                                      Unknown |
                                      Validation_Failed and
                     (if Create'Result = Success then
                        CUDA_Function /= NV.No_CUDA_Function);

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Function_Create_Info;
                    Allocator: aliased in Allocation_Callbacks)
        return NV.CUDA_Function
        with Pre => Device /= No_Device and
                    Create_Info.Module /= NV.No_CUDA_Module,
             Post => Create'Result /= NV.No_CUDA_Function;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Function_Create_Info;
                    CUDA_Function: out NV.CUDA_Function) return Result
        with Pre => Device /= No_Device and
                    Create_Info.Module /= NV.No_CUDA_Module,
             Post => Create'Result in Success |
                                      Initialization_Failed |
                                      Out_Of_Host_Memory |
                                      Unknown |
                                      Validation_Failed and
                     (if Create'Result = Success then
                        CUDA_Function /= NV.No_CUDA_Function);

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Function_Create_Info)
        return NV.CUDA_Function
        with Pre => Device /= No_Device and
                    Create_Info.Module /= NV.No_CUDA_Module,
             Post => Create'Result /= NV.No_CUDA_Function;

    -- vkDestroyCudaModuleNV
    procedure Destroy(Device: in Vulkan.Device;
                      Module: in out NV.CUDA_Module;
                      Allocator: aliased in Allocation_Callbacks)
        with Pre => Device /= No_Device,
             Post => Module = NV.No_CUDA_Module;

    procedure Destroy(Device: in Vulkan.Device;
                      Module: in out NV.CUDA_Module)
        with Pre => Device /= No_Device,
             Post => Module = NV.No_CUDA_Module;

    -- vkDestroyCudaFunctionNV
    procedure Destroy(Device: in Vulkan.Device;
                      CUDA_Function: in out NV.CUDA_Function;
                      Allocator: aliased in Allocation_Callbacks)
        with Pre => Device /= No_Device,
             Post => CUDA_Function = NV.No_CUDA_Function;

    procedure Destroy(Device: in Vulkan.Device;
                      CUDA_Function: in out NV.CUDA_Function)
        with Pre => Device /= No_Device,
             Post => CUDA_Function = NV.No_CUDA_Function;

    -- vkCmdCudaLaunchKernelNV
    procedure Launch(Command_Buffer: in Vulkan.Command_Buffer;
                     Launch_Info: in NV.CUDA_Launch_Info)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    Launch_Info.CUDA_Function /= NV.No_CUDA_Function;
end Vulkan.Extensions.NV_CUDA_Kernel_Launch;

