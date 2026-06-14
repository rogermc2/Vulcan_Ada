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

-- Operations for the validation cache extension

with Vulkan.Core;
with Vulkan.C_EXT;
with Vulkan.Objects_Common_Access;
with Vulkan.Exceptions;

package body Vulkan.Extensions.EXT_Validation_Cache is
    -- Loaded extension functions.
    type vkCreateValidationCacheEXT_Access is
        access function(Device: in Vulkan.Device;
                        Create_Info: in C_EXT.Validation_Cache_Create_Info_C;
                        Allocator: access constant Allocation_Callbacks;
                        Validation_Cache: out EXT.Validation_Cache)
        return Result
        with Convention => C;

    vkCreateValidationCacheEXT: vkCreateValidationCacheEXT_Access;

    type vkDestroyValidationCacheEXT_Access is
        access procedure(Device: in Vulkan.Device;
                         Validation_Cache: in EXT.Validation_Cache;
                         Allocator: access constant Allocation_Callbacks)
        with Convention => C;

    vkDestroyValidationCacheEXT: vkDestroyValidationCacheEXT_Access;

    type vkMergeValidationCachesEXT_Access is
        access function(Device: in Vulkan.Device;
                        Dst_Cache: in EXT.Validation_Cache;
                        Src_Cache_Count: in Interfaces.Unsigned_32;
                        Src_Caches: access constant EXT.Validation_Cache)
        return Result
        with Convention => C;

    vkMergeValidationCachesEXT: vkMergeValidationCachesEXT_Access;

    type vkGetValidationCacheDataEXT_Access is
        access function(Device: in Vulkan.Device;
                        Validation_Cache: in EXT.Validation_Cache;
                        Data_Size: out Interfaces.C.size_t;
                        Data: in Interfaces.C.Extensions.void_ptr)
        return Result
        with Convention => C;

    vkGetValidationCacheDataEXT: vkGetValidationCacheDataEXT_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkCreateValidationCacheEXT_Access);
        procedure Load is new Load_Pointer(vkDestroyValidationCacheEXT_Access);
        procedure Load is new Load_Pointer(vkMergeValidationCachesEXT_Access);
        procedure Load is new Load_Pointer(vkGetValidationCacheDataEXT_Access);
    begin
        Load(vkCreateValidationCacheEXT, "vkCreateValidationCacheEXT");
        Load(vkDestroyValidationCacheEXT, "vkDestroyValidationCacheEXT");
        Load(vkMergeValidationCachesEXT, "vkMergeValidationCachesEXT");
        Load(vkGetValidationCacheDataEXT, "vkGetValidationCacheDataEXT");
    end Load_Extension;

    package Validation_Caches_Common is new Objects_Common_Access
        (EXT.Validation_Cache_Create_Info,
         C_EXT.Validation_Cache_Create_Info_C,
         EXT.Validation_Cache,
         EXT.No_Validation_Cache,
         C_EXT.To_C,
         C_EXT.Free,
         vkCreateValidationCacheEXT_Access,
         vkDestroyValidationCacheEXT_Access,
         vkCreateValidationCacheEXT,
         vkDestroyValidationCacheEXT);

    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Validation_Cache_Create_Info;
                    Allocator: aliased in Allocation_Callbacks;
                    Validation_Cache: out EXT.Validation_Cache) return Result
        renames Validation_Caches_Common.Create;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Validation_Cache_Create_Info;
                    Allocator: aliased in Allocation_Callbacks)
        return EXT.Validation_Cache
        renames Validation_Caches_Common.Create;


    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Validation_Cache_Create_Info;
                    Validation_Cache: out EXT.Validation_Cache) return Result
        renames Validation_Caches_Common.Create;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Validation_Cache_Create_Info)
        return EXT.Validation_Cache
        renames Validation_Caches_Common.Create;

    procedure Destroy(Device: in Vulkan.Device;
                      Validation_Cache: in out EXT.Validation_Cache;
                      Allocator: aliased in Allocation_Callbacks)
        renames Validation_Caches_Common.Destroy;

    procedure Destroy(Device: in Vulkan.Device;
                      Validation_Cache: in out EXT.Validation_Cache)
        renames Validation_Caches_Common.Destroy;

    function Merge_Validation_Caches
        (Device: in Vulkan.Device;
         Dst_Cache: in EXT.Validation_Cache;
         Src_Caches: in EXT.Validation_Cache_Vectors.Vector) return Result is
        C_Caches: array (1 .. Positive(Src_Caches.Length)) of
            aliased EXT.Validation_Cache;
    begin
        for X in C_Caches'Range loop
            C_Caches(X) := Src_Caches(X);
        end loop;

        return vkMergeValidationCachesEXT
            (Device,
             Dst_Cache,
             Interfaces.Unsigned_32(C_Caches'Length),
             C_Caches(1)'Access);
    end Merge_Validation_Caches;

    procedure Merge_Validation_Caches
        (Device: in Vulkan.Device;
         Dst_Cache: in EXT.Validation_Cache;
         Src_Caches: in EXT.Validation_Cache_Vectors.Vector) is
    begin
        Exceptions.Check(Merge_Validation_Caches(Device, 
                                                 Dst_Cache,
                                                 Src_Caches));
    end Merge_Validation_Caches;

    function Validation_Cache_Data_Size
        (Device: in Vulkan.Device;
         Validation_Cache: in EXT.Validation_Cache)
        return Interfaces.C.size_t is
        Size: Interfaces.C.size_t := 0;
        Result: Vulkan.Result;
    begin
        Result := vkGetValidationCacheDataEXT(Device,
                                              Validation_Cache,
                                              Size,
                                              System.Null_Address);

        return Size;
    end Validation_Cache_Data_Size;

    function Get_Validation_Cache_Data
        (Device: in Vulkan.Device;
         Validation_Cache: in EXT.Validation_Cache;
         Data_Size: in Interfaces.C.size_t;
         Data: in Interfaces.C.Extensions.void_ptr) return Result is
         Size: Interfaces.C.size_t := Data_Size;
    begin
        return vkGetValidationCacheDataEXT(Device,
                                           Validation_Cache,
                                           Size,
                                           Data);
    end Get_Validation_Cache_Data;

    procedure Get_Validation_Cache_Data
        (Device: in Vulkan.Device;
         Validation_Cache: in EXT.Validation_Cache;
         Data_Size: in Interfaces.C.size_t;
         Data: in Interfaces.C.Extensions.void_ptr) is
    begin
        Exceptions.Check(Get_Validation_Cache_Data(Device,
                                                   Validation_Cache,
                                                   Data_Size,
                                                   Data));
    end Get_Validation_Cache_Data;
end Vulkan.Extensions.EXT_Validation_Cache;

