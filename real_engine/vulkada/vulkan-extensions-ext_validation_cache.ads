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

with Vulkan.Extensions.EXT;

package Vulkan.Extensions.EXT_Validation_Cache is
    use type EXT.Validation_Cache;

    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkCreateValidationCacheEXT
    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Validation_Cache_Create_Info;
                    Allocator: aliased in Allocation_Callbacks;
                    Validation_Cache: out EXT.Validation_Cache) return Result
        with Pre => Device /= No_Device,
             Post => Create'Result in Success |
                                      Out_Of_Host_Memory |
                                      Unknown |
                                      Validation_Failed and
                     (if Create'Result = Success then
                        Validation_Cache /= EXT.No_Validation_Cache);

    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Validation_Cache_Create_Info;
                    Allocator: aliased in Allocation_Callbacks)
        return EXT.Validation_Cache
        with Pre => Device /= No_Device,
             Post => Create'Result /= EXT.No_Validation_Cache;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Validation_Cache_Create_Info;
                    Validation_Cache: out EXT.Validation_Cache) return Result
        with Pre => Device /= No_Device,
             Post => Create'Result in Success |
                                      Out_Of_Host_Memory |
                                      Unknown |
                                      Validation_Failed and
                     (if Create'Result = Success then
                        Validation_Cache /= EXT.No_Validation_Cache);

    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Validation_Cache_Create_Info)
        return EXT.Validation_Cache
        with Pre => Device /= No_Device,
             Post => Create'Result /= EXT.No_Validation_Cache;

    -- vkDestroyValidationCacheEXT
    procedure Destroy(Device: in Vulkan.Device;
                      Validation_Cache: in out EXT.Validation_Cache;
                      Allocator: aliased in Allocation_Callbacks)
        with Inline,
             Pre => Device /= No_Device,
             Post => Validation_Cache = EXT.No_Validation_Cache;

    procedure Destroy(Device: in Vulkan.Device;
                      Validation_Cache: in out EXT.Validation_Cache)
        with Inline,
             Pre => Device /= No_Device,
             Post => Validation_Cache = EXT.No_Validation_Cache;

    -- vkMergeValidationCachesEXT
    function Merge_Validation_Caches
        (Device: in Vulkan.Device;
         Dst_Cache: in EXT.Validation_Cache;
         Src_Caches: in EXT.Validation_Cache_Vectors.Vector) return Result
        with Pre => Device /= No_Device and
                    Dst_Cache /= EXT.No_Validation_Cache and
                    not Src_Caches.Is_Empty and
                    (for all Cache of Src_Caches =>
                        Cache /= EXT.No_Validation_Cache and
                                 Cache /= Dst_Cache),
             Post => Merge_Validation_Caches'Result in Success |
                                                       Out_Of_Device_Memory |
                                                       Out_Of_Host_Memory |
                                                       Unknown |
                                                       Validation_Failed;

    procedure Merge_Validation_Caches
        (Device: in Vulkan.Device;
         Dst_Cache: in EXT.Validation_Cache;
         Src_Caches: in EXT.Validation_Cache_Vectors.Vector)
        with Pre => Device /= No_Device and
                    Dst_Cache /= EXT.No_Validation_Cache and
                    not Src_Caches.Is_Empty and
                    (for all Cache of Src_Caches =>
                        Cache /= EXT.No_Validation_Cache and
                                 Cache /= Dst_Cache);

    -- vkGetValidationCacheDataEXT
    function Validation_Cache_Data_Size
        (Device: in Vulkan.Device;
         Validation_Cache: in EXT.Validation_Cache) return Interfaces.C.size_t
        with Pre => Device /= No_Device and
                    Validation_Cache /= EXT.No_Validation_Cache;

    function Get_Validation_Cache_Data
        (Device: in Vulkan.Device;
         Validation_Cache: in EXT.Validation_Cache;
         Data_Size: in Interfaces.C.size_t;
         Data: in Interfaces.C.Extensions.void_ptr) return Result
    with Inline,
         Pre => Device /= No_Device and
                Validation_Cache /= EXT.No_Validation_Cache,
         Post => Get_Validation_Cache_Data'Result in Success |
                                                     Incomplete |
                                                     Out_Of_Device_Memory |
                                                     Out_Of_Host_Memory |
                                                     Unknown |
                                                     Validation_Failed;

    procedure Get_Validation_Cache_Data
        (Device: in Vulkan.Device;
         Validation_Cache: in EXT.Validation_Cache;
         Data_Size: in Interfaces.C.size_t;
         Data: in Interfaces.C.Extensions.void_ptr)
    with Pre => Device /= No_Device and
                Validation_Cache /= EXT.No_Validation_Cache;
end Vulkan.Extensions.EXT_Validation_Cache;

