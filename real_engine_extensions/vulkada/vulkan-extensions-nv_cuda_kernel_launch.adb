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

with Vulkan.Core;
with Vulkan.C_NV;
with Vulkan.Objects_Common_Access;
with Vulkan.Exceptions;

package body Vulkan.Extensions.NV_CUDA_Kernel_Launch is
    -- Loaded extension functions.
    type vkCreateCudaModuleNV_Access is
        access function(Device: in Vulkan.Device;
                        Create_Info: in C_NV.CUDA_Module_Create_Info_C;
                        Allocator: access constant Allocation_Callbacks;
                        Module: out NV.CUDA_Module) return Result
        with Convention => C;

    vkCreateCudaModuleNV: vkCreateCudaModuleNV_Access;

    type vkGetCudaModuleCacheNV_Access is
        access function(Device: in Vulkan.Device;
                        Module: in NV.CUDA_Module;
                        Cache_Size: out Interfaces.C.size_t;
                        Cache_Data: Interfaces.C.Extensions.void_ptr)
        return Result
        with Convention => C;

    vkGetCudaModuleCacheNV: vkGetCudaModuleCacheNV_Access;

    type vkCreateCudaFunctionNV_Access is
        access function(Device: in Vulkan.Device;
                        Create_Info: in C_NV.CUDA_Function_Create_Info_C;
                        Allocator: access constant Allocation_Callbacks;
                        CUDA_Function: out NV.CUDA_Function) return Result
        with Convention => C;

    vkCreateCudaFunctionNV: vkCreateCudaFunctionNV_Access;

    type vkDestroyCudaModuleNV_Access is
        access procedure(Device: in Vulkan.Device;
                         Module: in NV.CUDA_Module;
                         Allocator: access constant Allocation_Callbacks)
        with Convention => C;

    vkDestroyCudaModuleNV: vkDestroyCudaModuleNV_Access;

    type vkDestroyCudaFunctionNV_Access is
        access procedure(Device: in Vulkan.Device;
                         CUDA_Function: in NV.CUDA_Function;
                         Allocator: access constant Allocation_Callbacks)
        with Convention => C;

    vkDestroyCudaFunctionNV: vkDestroyCudaFunctionNV_Access;

    type vkCmdCudaLaunchKernelNV_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Launch_Info: in C_NV.CUDA_Launch_Info_C)
        with Convention => C;

    vkCmdCudaLaunchKernelNV: vkCmdCudaLaunchKernelNV_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkCreateCudaModuleNV_Access);
        procedure Load is new Load_Pointer(vkGetCudaModuleCacheNV_Access);
        procedure Load is new Load_Pointer(vkCreateCudaFunctionNV_Access);
        procedure Load is new Load_Pointer(vkDestroyCudaModuleNV_Access);
        procedure Load is new Load_Pointer(vkDestroyCudaFunctionNV_Access);
        procedure Load is new Load_Pointer(vkCmdCudaLaunchKernelNV_Access);
    begin
        Load(vkCreateCudaModuleNV, "vkCreateCudaModuleNV");
        Load(vkGetCudaModuleCacheNV, "vkGetCudaModuleCacheNV");
        Load(vkCreateCudaFunctionNV, "vkCreateCudaFunctionNV");
        Load(vkDestroyCudaModuleNV, "vkDestroyCudaModuleNV");
        Load(vkDestroyCudaFunctionNV, "vkDestroyCudaFunctionNV");
        Load(vkCmdCudaLaunchKernelNV, "vkCmdCudaLaunchKernelNV");
    end Load_Extension;

    -- CUDA module create/destroy implementations.
    package CUDA_Modules_Common is
        new Objects_Common_Access(NV.CUDA_Module_Create_Info,
                                  C_NV.CUDA_Module_Create_Info_C,
                                  NV.CUDA_Module,
                                  NV.No_CUDA_Module,
                                  C_NV.To_C,
                                  C_NV.Free,
                                  vkCreateCudaModuleNV_Access,
                                  vkDestroyCudaModuleNV_Access,
                                  vkCreateCudaModuleNV,
                                  vkDestroyCudaModuleNV);

    -- CUDA function create/destroy implementations.
    package CUDA_Functions_Common is
        new Objects_Common_Access(NV.CUDA_Function_Create_Info,
                                  C_NV.CUDA_Function_Create_Info_C,
                                  NV.CUDA_Function,
                                  NV.No_CUDA_Function,
                                  C_NV.To_C,
                                  C_NV.Free,
                                  vkCreateCudaFunctionNV_Access,
                                  vkDestroyCudaFunctionNV_Access,
                                  vkCreateCudaFunctionNV,
                                  vkDestroyCudaFunctionNV);

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Module_Create_Info;
                    Allocator: aliased in Allocation_Callbacks;
                    Module: out NV.CUDA_Module) return Result
        renames CUDA_Modules_Common.Create;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Module_Create_Info;
                    Allocator: aliased in Allocation_Callbacks)
        return NV.CUDA_Module renames CUDA_Modules_Common.Create;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Module_Create_Info;
                    Module: out NV.CUDA_Module) return Result
        renames CUDA_Modules_Common.Create;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Module_Create_Info)
        return NV.CUDA_Module renames CUDA_Modules_Common.Create;

    function Get_CUDA_Module_Cache_Size(Device: in Vulkan.Device;
                                        Module: in NV.CUDA_Module)
        return Interfaces.C.size_t is
        Size: Interfaces.C.size_t := 0;
    begin
        Exceptions.Check(vkGetCudaModuleCacheNV(Device,
                                                Module,
                                                Size,
                                                System.Null_Address));

        return Size;
    end Get_CUDA_Module_Cache_Size;

    function Get_CUDA_Module_Cache
        (Device: in Vulkan.Device;
         Module: in NV.CUDA_Module;
         Cache_Size: in out Interfaces.C.size_t;
         Cache_Data: in Interfaces.C.Extensions.void_ptr) return Result is
    begin
        return vkGetCudaModuleCacheNV(Device, Module, Cache_Size, Cache_Data);
    end Get_CUDA_Module_Cache;

    procedure Get_CUDA_Module_Cache
        (Device: in Vulkan.Device;
         Module: in NV.CUDA_Module;
         Cache_Size: in out Interfaces.C.size_t;
         Cache_Data: in Interfaces.C.Extensions.void_ptr) is
    begin
        Exceptions.Check(vkGetCudaModuleCacheNV(Device,
                                                Module,
                                                Cache_Size,
                                                Cache_Data));
    end Get_CUDA_Module_Cache;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Function_Create_Info;
                    Allocator: aliased in Allocation_Callbacks;
                    CUDA_Function: out NV.CUDA_Function) return Result
        renames CUDA_Functions_Common.Create;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Function_Create_Info;
                    Allocator: aliased in Allocation_Callbacks)
        return NV.CUDA_Function renames CUDA_Functions_Common.Create;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Function_Create_Info;
                    CUDA_Function: out NV.CUDA_Function) return Result
        renames CUDA_Functions_Common.Create;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in NV.CUDA_Function_Create_Info)
        return NV.CUDA_Function renames CUDA_Functions_Common.Create;

    procedure Destroy(Device: in Vulkan.Device;
                      Module: in out NV.CUDA_Module;
                      Allocator: aliased in Allocation_Callbacks)
        renames CUDA_Modules_Common.Destroy;

    procedure Destroy(Device: in Vulkan.Device;
                      Module: in out NV.CUDA_Module)
        renames CUDA_Modules_Common.Destroy;

    procedure Destroy(Device: in Vulkan.Device;
                      CUDA_Function: in out NV.CUDA_Function;
                      Allocator: aliased in Allocation_Callbacks)
        renames CUDA_Functions_Common.Destroy;

    procedure Destroy(Device: in Vulkan.Device;
                      CUDA_Function: in out NV.CUDA_Function)
        renames CUDA_Functions_Common.Destroy;

    procedure Launch(Command_Buffer: in Vulkan.Command_Buffer;
                     Launch_Info: in NV.CUDA_Launch_Info) is
        C_Info: C_NV.CUDA_Launch_Info_C := C_NV.To_C(Launch_Info);
    begin
        vkCmdCudaLaunchKernelNV(Command_Buffer, C_Info);
        C_NV.Free(C_Info);
    end Launch;
end Vulkan.Extensions.NV_CUDA_Kernel_Launch;

