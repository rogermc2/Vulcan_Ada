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

-- Operations for the opacity micromap extension

with Vulkan.Extensions.EXT;
with Vulkan.Extensions.KHR;

package Vulkan.Extensions.EXT_Opacity_Micromap is
    use type Interfaces.C.size_t;
    use type EXT.Micromap;
    use type EXT.Version_Data_Array_Access;

    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkCreateMicromapEXT
    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Micromap_Create_Info;
                    Allocator: aliased in Allocation_Callbacks;
                    Micromap: out EXT.Micromap) return Result
        with Pre => Device /= No_Device and
                    Create_Info.Buffer /= No_Buffer and
                    Create_Info.Offset rem 256 = 0,
             Post => Create'Result in Success |
                                      Invalid_Opaque_Capture_Address |
                                      Out_Of_Host_Memory |
                                      Unknown |
                                      Validation_Failed and
                     (if Create'Result = Success then
                        Micromap /= EXT.No_Micromap);

    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Micromap_Create_Info;
                    Allocator: aliased in Allocation_Callbacks)
        return EXT.Micromap
        with Pre => Device /= No_Device and
                    Create_Info.Buffer /= No_Buffer and
                    Create_Info.Offset rem 256 = 0,
             Post => Create'Result /= EXT.No_Micromap;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Micromap_Create_Info;
                    Micromap: out EXT.Micromap) return Result
        with Pre => Device /= No_Device and
                    Create_Info.Buffer /= No_Buffer and
                    Create_Info.Offset rem 256 = 0,
             Post => Create'Result in Success |
                                      Invalid_Opaque_Capture_Address |
                                      Out_Of_Host_Memory |
                                      Unknown |
                                      Validation_Failed and
                     (if Create'Result = Success then
                        Micromap /= EXT.No_Micromap);

    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Micromap_Create_Info)
        return EXT.Micromap
        with Pre => Device /= No_Device and
                    Create_Info.Buffer /= No_Buffer and
                    Create_Info.Offset rem 256 = 0,
             Post => Create'Result /= EXT.No_Micromap;

    -- vkDestroyMicromapEXT
    procedure Destroy(Device: in Vulkan.Device;
                      Micromap: in out EXT.Micromap;
                      Allocator: aliased in Allocation_Callbacks)
        with Inline,
             Pre => Device /= No_Device,
             Post => Micromap = EXT.No_Micromap;

    procedure Destroy(Device: in Vulkan.Device;
                      Micromap: in out EXT.Micromap)
        with Inline,
             Pre => Device /= No_Device,
             Post => Micromap = EXT.No_Micromap;

    -- vkCmdBuildMicromapsEXT
    procedure Build_Micromaps(Command_Buffer: in Vulkan.Command_Buffer;
                              Infos: in EXT.Micromap_Build_Info_Vectors.Vector)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    not Infos.Is_Empty and
                    (for all Info of Infos =>
                        Info.Dst_Micromap /= EXT.No_Micromap and
                        (Info.Usage_Counts.Is_Empty or
                            Info.Usage_Counts_Access.Is_Empty));

    procedure Build_Micromaps(Command_Buffer: in Vulkan.Command_Buffer;
                              Info: in EXT.Micromap_Build_Info)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    Info.Dst_Micromap /= EXT.No_Micromap and
                        (Info.Usage_Counts.Is_Empty or
                            Info.Usage_Counts_Access.Is_Empty);

    -- vkBuildMicromapsEXT
    function Build_Micromaps(Device: in Vulkan.Device;
                             Deferred_Operation: in KHR.Deferred_Operation;
                             Infos: in EXT.Micromap_Build_Info_Vectors.Vector)
        return Result
        with Pre => Device /= No_Device and
                    not Infos.Is_Empty and
                    (for all Info of Infos =>
                        Info.Dst_Micromap /= EXT.No_Micromap and
                        (Info.Usage_Counts.Is_Empty or
                            Info.Usage_Counts_Access.Is_Empty)),
             Post => Build_Micromaps'Result in Success |
                                               Operation_Deferred |
                                               Operation_Not_Deferred |
                                               Out_Of_Device_Memory |
                                               Out_Of_Host_Memory |
                                               Unknown |
                                               Validation_Failed;

    procedure Build_Micromaps(Device: in Vulkan.Device;
                              Deferred_Operation: in KHR.Deferred_Operation;
                              Infos: in EXT.Micromap_Build_Info_Vectors.Vector)
        with Pre => Device /= No_Device and
                    not Infos.Is_Empty and
                    (for all Info of Infos =>
                        Info.Dst_Micromap /= EXT.No_Micromap and
                        (Info.Usage_Counts.Is_Empty or
                            Info.Usage_Counts_Access.Is_Empty));

    function Build_Micromaps(Device: in Vulkan.Device;
                             Deferred_Operation: in KHR.Deferred_Operation;
                             Info: in EXT.Micromap_Build_Info) return Result
        with Pre => Device /= No_Device and
                    Info.Dst_Micromap /= EXT.No_Micromap and
                        (Info.Usage_Counts.Is_Empty or
                            Info.Usage_Counts_Access.Is_Empty),
             Post => Build_Micromaps'Result in Success |
                                               Operation_Deferred |
                                               Operation_Not_Deferred |
                                               Out_Of_Device_Memory |
                                               Out_Of_Host_Memory |
                                               Unknown |
                                               Validation_Failed;

    procedure Build_Micromaps(Device: in Vulkan.Device;
                              Deferred_Operation: in KHR.Deferred_Operation;
                              Info: in EXT.Micromap_Build_Info)
        with Pre => Device /= No_Device and
                    Info.Dst_Micromap /= EXT.No_Micromap and
                        (Info.Usage_Counts.Is_Empty or
                            Info.Usage_Counts_Access.Is_Empty);

    -- vkCopyMicromapEXT
    function Copy_Micromap(Device: in Vulkan.Device;
                           Deferred_Operation: in KHR.Deferred_Operation;
                           Info: in EXT.Copy_Micromap_Info) return Result
        with Pre => Device /= No_Device and
                    Info.Src /= EXT.No_Micromap and
                    Info.Dst /= EXT.No_Micromap,
             Post => Copy_Micromap'Result in Success |
                                             Operation_Deferred |
                                             Operation_Not_Deferred |
                                             Out_Of_Device_Memory |
                                             Out_Of_Host_Memory |
                                             Unknown |
                                             Validation_Failed;

    procedure Copy_Micromap(Device: in Vulkan.Device;
                            Deferred_Operation: in KHR.Deferred_Operation;
                            Info: in EXT.Copy_Micromap_Info)
        with Pre => Device /= No_Device and
                    Info.Src /= EXT.No_Micromap and
                    Info.Dst /= EXT.No_Micromap;

    -- vkCopyMicromapToMemoryEXT
    function Copy_Micromap_To_Memory
        (Device: in Vulkan.Device;
         Deferred_Operation: in KHR.Deferred_Operation;
         Info: in EXT.Copy_Micromap_To_Memory_Info) return Result
        with Pre => Device /= No_Device and
                    Info.Src /= EXT.No_Micromap,
             Post => Copy_Micromap_To_Memory'Result in Success |
                                                       Operation_Deferred |
                                                       Operation_Not_Deferred |
                                                       Out_Of_Device_Memory |
                                                       Out_Of_Host_Memory |
                                                       Unknown |
                                                       Validation_Failed;

    procedure Copy_Micromap_To_Memory
        (Device: in Vulkan.Device;
         Deferred_Operation: in KHR.Deferred_Operation;
         Info: in EXT.Copy_Micromap_To_Memory_Info)
        with Pre => Device /= No_Device and
                    Info.Src /= EXT.No_Micromap;

    -- vkCopyMicromapToMemoryEXT
    function Copy_Memory_To_Micromap
        (Device: in Vulkan.Device;
         Deferred_Operation: in KHR.Deferred_Operation;
         Info: in EXT.Copy_Memory_To_Micromap_Info) return Result
        with Pre => Device /= No_Device and
                    Info.Dst /= EXT.No_Micromap,
             Post => Copy_Memory_To_Micromap'Result in Success |
                                                       Operation_Deferred |
                                                       Operation_Not_Deferred |
                                                       Out_Of_Device_Memory |
                                                       Out_Of_Host_Memory |
                                                       Unknown |
                                                       Validation_Failed;

    procedure Copy_Memory_To_Micromap
        (Device: in Vulkan.Device;
         Deferred_Operation: in KHR.Deferred_Operation;
         Info: in EXT.Copy_Memory_To_Micromap_Info)
        with Pre => Device /= No_Device and
                    Info.Dst /= EXT.No_Micromap;

    -- vkWriteMicromapsPropertiesEXT
    function Write_Micromaps_Properties
        (Device: in Vulkan.Device;
         Micromaps: in EXT.Micromap_Vectors.Vector;
         Query_Type: in Vulkan.Query_Type;
         Data_Size: in Interfaces.C.size_t;
         Data: in Interfaces.C.Extensions.void_ptr;
         Stride: in Interfaces.C.size_t) return Result
        with Pre => Device /= No_Device and
                    (for all Micromap of Micromaps =>
                        Micromap /= EXT.No_Micromap) and
                    Data_Size >= Interfaces.C.size_t(Micromaps.Length) * Stride,
             Post => Write_Micromaps_Properties'Result in Success |
                                                          Out_Of_Device_Memory |
                                                          Out_Of_Host_Memory |
                                                          Unknown |
                                                          Validation_Failed;

    procedure Write_Micromaps_Properties
        (Device: in Vulkan.Device;
         Micromaps: in EXT.Micromap_Vectors.Vector;
         Query_Type: in Vulkan.Query_Type;
         Data_Size: in Interfaces.C.size_t;
         Data: in Interfaces.C.Extensions.void_ptr;
         Stride: in Interfaces.C.size_t)
        with Pre => Device /= No_Device and
                    (for all Micromap of Micromaps =>
                        Micromap /= EXT.No_Micromap) and
                    Data_Size >= Interfaces.C.size_t(Micromaps.Length) * Stride;

    function Write_Micromaps_Properties
        (Device: in Vulkan.Device;
         Micromap: in EXT.Micromap;
         Query_Type: in Vulkan.Query_Type;
         Data_Size: in Interfaces.C.size_t;
         Data: in Interfaces.C.Extensions.void_ptr;
         Stride: in Interfaces.C.size_t) return Result
        with Pre => Device /= No_Device and
                    Micromap /= EXT.No_Micromap and
                    Data_Size >= Stride,
             Post => Write_Micromaps_Properties'Result in Success |
                                                          Out_Of_Device_Memory |
                                                          Out_Of_Host_Memory |
                                                          Unknown |
                                                          Validation_Failed;

    procedure Write_Micromaps_Properties
        (Device: in Vulkan.Device;
         Micromap: in EXT.Micromap;
         Query_Type: in Vulkan.Query_Type;
         Data_Size: in Interfaces.C.size_t;
         Data: in Interfaces.C.Extensions.void_ptr;
         Stride: in Interfaces.C.size_t)
        with Pre => Device /= No_Device and
                    Micromap /= EXT.No_Micromap and
                    Data_Size >= Stride;

    -- vkCmdCopyMicromapEXT
    procedure Copy_Micromap(Command_Buffer: in Vulkan.Command_Buffer;
                            Info: in EXT.Copy_Micromap_Info)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    Info.Src /= EXT.No_Micromap and
                    Info.Dst /= EXT.No_Micromap;

    -- vkCmdCopyMicromapToMemoryEXT
    procedure Copy_Micromap_To_Memory(Command_Buffer: in Vulkan.Command_Buffer;
                                      Info: in EXT.Copy_Micromap_To_Memory_Info)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    Info.Src /= EXT.No_Micromap;

    -- vkCmdCopyMemoryToMicromapEXT
    procedure Copy_Memory_To_Micromap(Command_Buffer: in Vulkan.Command_Buffer;
                                      Info: in EXT.Copy_Memory_To_Micromap_Info)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    Info.Dst /= EXT.No_Micromap;

    -- vkCmdWriteMicromapsPropertiesEXT
    procedure Write_Micromaps_Properties
        (Command_Buffer: in Vulkan.Command_Buffer;
         Micromaps: in EXT.Micromap_Vectors.Vector;
         Query_Type: in Vulkan.Query_Type;
         Query_Pool: in Vulkan.Query_Pool;
         First_Query: in Interfaces.Unsigned_32)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    not Micromaps.Is_Empty and
                    (for all Micromap of Micromaps =>
                        Micromap /= EXT.No_Micromap) and
                    Query_Pool /= No_Query_Pool;

    procedure Write_Micromaps_Properties
        (Command_Buffer: in Vulkan.Command_Buffer;
         Micromap: in EXT.Micromap;
         Query_Type: in Vulkan.Query_Type;
         Query_Pool: in Vulkan.Query_Pool;
         First_Query: in Interfaces.Unsigned_32)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    Micromap /= EXT.No_Micromap and
                    Query_Pool /= No_Query_Pool;

    -- vkGetDeviceMicromapCompatibilityEXT
    function Get_Device_Micromap_Compatibility
        (Device: in Vulkan.Device;
         Version_Info: in EXT.Micromap_Version_Info)
        return KHR.Acceleration_Structure_Compatibility
        with Pre => Device /= No_Device and
             Version_Info.Version_Data /= null;

    -- vkGetMicromapBuildSizesEXT
    procedure Get_Micromap_Build_Sizes
        (Device: in Vulkan.Device;
         Build_Type: in KHR.Acceleration_Structure_Build_Type;
         Build_Info: in EXT.Micromap_Build_Info;
         Size_Info: in out EXT.Micromap_Build_Sizes_Info)
        with Pre => Device /= No_Device and
                    Build_Info.Dst_Micromap /= EXT.No_Micromap and
                    (Build_Info.Usage_Counts.Is_Empty or
                        Build_Info.Usage_Counts_Access.Is_Empty);

    function Get_Micromap_Build_Sizes
        (Device: in Vulkan.Device;
         Build_Type: in KHR.Acceleration_Structure_Build_Type;
         Build_Info: in EXT.Micromap_Build_Info)
        return EXT.Micromap_Build_Sizes_Info
        with Pre => Device /= No_Device and
                    Build_Info.Dst_Micromap /= EXT.No_Micromap and
                    (Build_Info.Usage_Counts.Is_Empty or
                        Build_Info.Usage_Counts_Access.Is_Empty);
end Vulkan.Extensions.EXT_Opacity_Micromap;

