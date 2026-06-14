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

-- Operations for the coverage reduction mode extension

with Vulkan.Core;
with Vulkan.C_NV;
with Vulkan.Extension_Records;
with Vulkan.Exceptions;

package body Vulkan.Extensions.NV_Coverage_Reduction_Mode is
    -- Loaded extension functions.
   type vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV_Access
        is access function
            (Physical_Device: in Vulkan.Physical_Device;
             Combination_Count: in out Interfaces.Unsigned_32;
             Combinations: access C_NV.Framebuffer_Mixed_Samples_Combination_C)
        return Result
        with Convention => C;

    vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV:
       vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV_Access;        
    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer
     (vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV_Access);
    begin
        Load
           (vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV,
           "vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV");
    end Load_Extension;

    function Combinations_Count(Physical_Device: in Vulkan.Physical_Device)
        return Interfaces.Unsigned_32 is
        Count: Interfaces.Unsigned_32 := 0;
    begin
        Exceptions.Check
            (vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV
                (Physical_Device, Count, null));
        
        return Count;
    end Combinations_Count;

    function
        Get_Physical_Device_Supported_Framebuffer_Mixed_Samples_Combinations
        (Physical_Device: in Vulkan.Physical_Device;
         Combinations: in out
            NV.Framebuffer_Mixed_Samples_Combination_Vectors.Vector)
        return Result is
        C_Combinations: array (1 .. Positive(Combinations.Length)) of
            aliased C_NV.Framebuffer_Mixed_Samples_Combination_C;
        Count: Interfaces.Unsigned_32 := C_Combinations'Length;
        Result: Vulkan.Result;
    begin
        for X in C_Combinations'Range loop
            C_Combinations(X).Next :=
                Extension_Records.To_C(Combinations(X).Next);
        end loop;

        Result :=
            vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV
                    (Physical_Device, Count, C_Combinations(1)'Access);

        for X in C_Combinations'Range loop
            C_NV.To_Ada(Combinations(X), C_Combinations(X));
            Extension_Records.Free(C_Combinations(X).Next);
        end loop;

        return Result;
    end Get_Physical_Device_Supported_Framebuffer_Mixed_Samples_Combinations;

    function
        Get_Physical_Device_Supported_Framebuffer_Mixed_Samples_Combinations
        (Physical_Device: in Vulkan.Physical_Device)
        return NV.Framebuffer_Mixed_Samples_Combination_Vectors.Vector is
        Combinations: NV.Framebuffer_Mixed_Samples_Combination_Vectors.Vector;
        Combination: NV.Framebuffer_Mixed_Samples_Combination;
    begin
        Combinations :=
            NV.Framebuffer_Mixed_Samples_Combination_Vectors.To_Vector
                (Combination, Ada.Containers.Count_Type
                    (Combinations_Count(Physical_Device)));
        Exceptions.Check
           (Get_Physical_Device_Supported_Framebuffer_Mixed_Samples_Combinations
            (Physical_Device, Combinations));

        return Combinations;
    end Get_Physical_Device_Supported_Framebuffer_Mixed_Samples_Combinations;
end Vulkan.Extensions.NV_Coverage_Reduction_Mode;

