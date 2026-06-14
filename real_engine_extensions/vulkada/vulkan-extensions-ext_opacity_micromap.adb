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

with Vulkan.Core;
with Vulkan.C_EXT;
with Vulkan.Objects_Common_Access;
with Vulkan.Exceptions;
with Vulkan.Utilities;

package body Vulkan.Extensions.EXT_Opacity_Micromap is
    -- Loaded extension functions.
    type vkCreateMicromapEXT_Access is
        access function(Device: in Vulkan.Device;
                        Create_Info: in C_EXT.Micromap_Create_Info_C;
                        Allocator: access constant Allocation_Callbacks;
                        Micromap: out EXT.Micromap) return Result
        with Convention => C;

    vkCreateMicromapEXT: vkCreateMicromapEXT_Access;

    type vkDestroyMicromapEXT_Access is
        access procedure(Device: in Vulkan.Device;
                         Micromap: in EXT.Micromap;
                         Allocator: access constant Allocation_Callbacks)
        with Convention => C;

    vkDestroyMicromapEXT: vkDestroyMicromapEXT_Access;

    type vkCmdBuildMicromapsEXT_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Info_Count: in Interfaces.Unsigned_32;
                         Infos: access constant C_EXT.Micromap_Build_Info_C)
        with Convention => C;

    vkCmdBuildMicromapsEXT: vkCmdBuildMicromapsEXT_Access;

    type vkBuildMicromapsEXT_Access is
        access function(Device: in Vulkan.Device;
                        Deferred_Operation: in KHR.Deferred_Operation;
                        Info_Count: in Interfaces.Unsigned_32;
                        Infos: access constant C_EXT.Micromap_Build_Info_C)
        return Result
        with Convention => C;

    vkBuildMicromapsEXT: vkBuildMicromapsEXT_Access;

    type vkCopyMicromapEXT_Access is
        access function(Device: in Vulkan.Device;
                        Deferred_Operation: in KHR.Deferred_Operation;
                        Info: in C_EXT.Copy_Micromap_Info_C) return Result
        with Convention => C;

    vkCopyMicromapEXT: vkCopyMicromapEXT_Access;

    type vkCopyMicromapToMemoryEXT_Access is
        access function(Device: in Vulkan.Device;
                        Deferred_Operation: in KHR.Deferred_Operation;
                        Info: in C_EXT.Copy_Micromap_To_Memory_Info_C)
        return Result
        with Convention => C;

    vkCopyMicromapToMemoryEXT: vkCopyMicromapToMemoryEXT_Access;

    type vkCopyMemoryToMicromapEXT_Access is
        access function(Device: in Vulkan.Device;
                        Deferred_Operation: in KHR.Deferred_Operation;
                        Info: in C_EXT.Copy_Memory_To_Micromap_Info_C)
        return Result
        with Convention => C;

    vkCopyMemoryToMicromapEXT: vkCopyMemoryToMicromapEXT_Access;

    type vkWriteMicromapsPropertiesEXT_Access is
        access function(Device: in Vulkan.Device;
                        Micromap_Count: in Interfaces.Unsigned_32;
                        Micromaps: access constant EXT.Micromap;
                        Query_Type: in Vulkan.Query_Type;
                        Data_Size: in Interfaces.C.size_t;
                        Data: in Interfaces.C.Extensions.void_ptr;
                        Stride: in Interfaces.C.size_t) return Result
        with Convention => C;

    vkWriteMicromapsPropertiesEXT: vkWriteMicromapsPropertiesEXT_Access;

    type vkCmdCopyMicromapEXT_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Info: in C_EXT.Copy_Micromap_Info_C)
        with Convention => C;

    vkCmdCopyMicromapEXT: vkCmdCopyMicromapEXT_Access;

    type vkCmdCopyMicromapToMemoryEXT_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Info: in C_EXT.Copy_Micromap_To_Memory_Info_C)
        with Convention => C;

    vkCmdCopyMicromapToMemoryEXT: vkCmdCopyMicromapToMemoryEXT_Access;

    type vkCmdCopyMemoryToMicromapEXT_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Info: in C_EXT.Copy_Memory_To_Micromap_Info_C)
        with Convention => C;

    vkCmdCopyMemoryToMicromapEXT: vkCmdCopyMemoryToMicromapEXT_Access;

    type vkCmdWriteMicromapsPropertiesEXT_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Micromap_Count: in Interfaces.Unsigned_32;
                         Micromaps: access constant EXT.Micromap;
                         Query_Type: in Vulkan.Query_Type;
                         Query_Pool: in Vulkan.Query_Pool;
                         First_Query: in Interfaces.Unsigned_32)
        with Convention => C;

    vkCmdWriteMicromapsPropertiesEXT: vkCmdWriteMicromapsPropertiesEXT_Access;

    type vkGetDeviceMicromapCompatibilityEXT_Access is
        access procedure
            (Device: in Vulkan.Device;
             Version_Info: in C_EXT.Micromap_Version_Info_C;
             Compatibility: out KHR.Acceleration_Structure_Compatibility)
        with Convention => C;

    vkGetDeviceMicromapCompatibilityEXT:
        vkGetDeviceMicromapCompatibilityEXT_Access;

    type vkGetMicromapBuildSizesEXT_Access is
        access procedure(Device: in Vulkan.Device;
                         Build_Type: in KHR.Acceleration_Structure_Build_Type;
                         Build_Info: in C_EXT.Micromap_Build_Info_C;
                         Size_Info: out C_EXT.Micromap_Build_Sizes_Info_C)
        with Convention => C;

    vkGetMicromapBuildSizesEXT: vkGetMicromapBuildSizesEXT_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkCreateMicromapEXT_Access);
        procedure Load is new Load_Pointer(vkDestroyMicromapEXT_Access);
        procedure Load is new Load_Pointer(vkCmdBuildMicromapsEXT_Access);
        procedure Load is new Load_Pointer(vkBuildMicromapsEXT_Access);
        procedure Load is new Load_Pointer(vkCopyMicromapEXT_Access);
        procedure Load is new Load_Pointer(vkCopyMicromapToMemoryEXT_Access);
        procedure Load is new Load_Pointer(vkCopyMemoryToMicromapEXT_Access);
        procedure Load is
            new Load_Pointer(vkWriteMicromapsPropertiesEXT_Access);
        procedure Load is new Load_Pointer(vkCmdCopyMicromapEXT_Access);
        procedure Load is new Load_Pointer(vkCmdCopyMicromapToMemoryEXT_Access);
        procedure Load is new Load_Pointer(vkCmdCopyMemoryToMicromapEXT_Access);
        procedure Load is
            new Load_Pointer(vkCmdWriteMicromapsPropertiesEXT_Access);
        procedure Load is
            new Load_Pointer(vkGetDeviceMicromapCompatibilityEXT_Access);
        procedure Load is new Load_Pointer(vkGetMicromapBuildSizesEXT_Access);
    begin
        Load(vkCreateMicromapEXT, "vkCreateMicromapEXT");
        Load(vkDestroyMicromapEXT, "vkDestroyMicromapEXT");
        Load(vkCmdBuildMicromapsEXT, "vkCmdBuildMicromapsEXT");
        Load(vkBuildMicromapsEXT, "vkBuildMicromapsEXT");
        Load(vkCopyMicromapEXT, "vkCopyMicromapEXT");
        Load(vkCopyMicromapToMemoryEXT, "vkCopyMicromapToMemoryEXT");
        Load(vkCopyMemoryToMicromapEXT, "vkCopyMemoryToMicromapEXT");
        Load(vkWriteMicromapsPropertiesEXT, "vkWriteMicromapsPropertiesEXT");
        Load(vkCmdCopyMicromapEXT, "vkCmdCopyMicromapEXT");
        Load(vkCmdCopyMicromapToMemoryEXT, "vkCmdCopyMicromapToMemoryEXT");
        Load(vkCmdCopyMemoryToMicromapEXT, "vkCmdCopyMemoryToMicromapEXT");
        Load(vkCmdWriteMicromapsPropertiesEXT,
             "vkCmdWriteMicromapsPropertiesEXT");
        Load(vkGetDeviceMicromapCompatibilityEXT,
             "vkGetDeviceMicromapCompatibilityEXT");
        Load(vkGetMicromapBuildSizesEXT, "vkGetMicromapBuildSizesEXT");
    end Load_Extension;

    package Micromaps_Common is new Objects_Common_Access
        (EXT.Micromap_Create_Info,
         C_EXT.Micromap_Create_Info_C,
         EXT.Micromap,
         EXT.No_Micromap,
         C_EXT.To_C,
         C_EXT.Free,
         vkCreateMicromapEXT_Access,
         vkDestroyMicromapEXT_Access,
         vkCreateMicromapEXT,
         vkDestroyMicromapEXT);

    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Micromap_Create_Info;
                    Allocator: aliased in Allocation_Callbacks;
                    Micromap: out EXT.Micromap) return Result
        renames Micromaps_Common.Create;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Micromap_Create_Info;
                    Allocator: aliased in Allocation_Callbacks)
        return EXT.Micromap renames Micromaps_Common.Create;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Micromap_Create_Info;
                    Micromap: out EXT.Micromap) return Result
        renames Micromaps_Common.Create;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in EXT.Micromap_Create_Info)
        return EXT.Micromap renames Micromaps_Common.Create;

    procedure Destroy(Device: in Vulkan.Device;
                      Micromap: in out EXT.Micromap;
                      Allocator: aliased in Allocation_Callbacks)
        renames Micromaps_Common.Destroy;

    procedure Destroy(Device: in Vulkan.Device;
                      Micromap: in out EXT.Micromap)
        renames Micromaps_Common.Destroy;

    procedure Build_Micromaps
        (Command_Buffer: in Vulkan.Command_Buffer;
         Infos: in EXT.Micromap_Build_Info_Vectors.Vector) is
        C_Infos: array (1 .. Positive(Infos.Length)) of
                    aliased C_EXT.Micromap_Build_Info_C
            with Convention => C;
    begin
        for X in C_Infos'Range loop
            C_Infos(X) := C_EXT.To_C(Infos(X));
        end loop;

        vkCmdBuildMicromapsEXT(Command_Buffer,
                               C_Infos'Length,
                               C_Infos(1)'Access);

        for Info of C_Infos loop
            C_EXT.Free(Info);
        end loop;
    end Build_Micromaps;

    procedure Build_Micromaps(Command_Buffer: in Vulkan.Command_Buffer;
                              Info: in EXT.Micromap_Build_Info) is
        C_Info: aliased C_EXT.Micromap_Build_Info_C := C_EXT.To_C(Info);
    begin
        vkCmdBuildMicromapsEXT(Command_Buffer, 1, C_Info'Access);
        C_EXT.Free(C_Info);
    end Build_Micromaps;

    function Build_Micromaps(Device: in Vulkan.Device;
                             Deferred_Operation: in KHR.Deferred_Operation;
                             Infos: in EXT.Micromap_Build_Info_Vectors.Vector)
        return Result is
        Result: Vulkan.Result;
        C_Infos: array (1 .. Positive(Infos.Length)) of
                    aliased C_EXT.Micromap_Build_Info_C
            with Convention => C;
    begin
        for X in C_Infos'Range loop
            C_Infos(X) := C_EXT.To_C(Infos(X));
        end loop;

        Result := vkBuildMicromapsEXT(Device,
                                      Deferred_Operation,
                                      C_Infos'Length,
                                      C_Infos(1)'Access);

        for Info of C_Infos loop
            C_EXT.Free(Info);
        end loop;

        return Result;
    end Build_Micromaps;

    procedure Build_Micromaps
        (Device: in Vulkan.Device;
         Deferred_Operation: in KHR.Deferred_Operation;
         Infos: in EXT.Micromap_Build_Info_Vectors.Vector) is
    begin
        Exceptions.Check(Build_Micromaps(Device, Deferred_Operation, Infos));
    end Build_Micromaps;

    function Build_Micromaps(Device: in Vulkan.Device;
                             Deferred_Operation: in KHR.Deferred_Operation;
                             Info: in EXT.Micromap_Build_Info) return Result is
        Result: Vulkan.Result;
        C_Info: aliased C_EXT.Micromap_Build_Info_C := C_EXT.To_C(Info);
    begin
        Result := vkBuildMicromapsEXT(Device,
                                      Deferred_Operation,
                                      1,
                                      C_Info'Access);
        C_EXT.Free(C_Info);

        return Result;
    end Build_Micromaps;

    procedure Build_Micromaps(Device: in Vulkan.Device;
                              Deferred_Operation: in KHR.Deferred_Operation;
                              Info: in EXT.Micromap_Build_Info) is
    begin
        Exceptions.Check(Build_Micromaps(Device, Deferred_Operation, Info));
    end Build_Micromaps;

    function Copy_Micromap(Device: in Vulkan.Device;
                           Deferred_Operation: in KHR.Deferred_Operation;
                           Info: in EXT.Copy_Micromap_Info) return Result is
        Result: Vulkan.Result;
        C_Info: C_EXT.Copy_Micromap_Info_C := C_EXT.To_C(Info);
    begin
        Result := vkCopyMicromapEXT(Device, Deferred_Operation, C_Info);
        C_EXT.Free(C_Info);

        return Result;
    end Copy_Micromap;

    procedure Copy_Micromap(Device: in Vulkan.Device;
                            Deferred_Operation: in KHR.Deferred_Operation;
                            Info: in EXT.Copy_Micromap_Info) is
    begin
        Exceptions.Check(Copy_Micromap(Device, Deferred_Operation, Info));
    end Copy_Micromap;

    function Copy_Micromap_To_Memory
        (Device: in Vulkan.Device;
         Deferred_Operation: in KHR.Deferred_Operation;
         Info: in EXT.Copy_Micromap_To_Memory_Info) return Result is
        Result: Vulkan.Result;
        C_Info: C_EXT.Copy_Micromap_To_Memory_Info_C := C_EXT.To_C(Info);
    begin
        Result := vkCopyMicromapToMemoryEXT(Device, Deferred_Operation, C_Info);
        C_EXT.Free(C_Info);

        return Result;
    end Copy_Micromap_To_Memory;

    procedure Copy_Micromap_To_Memory
        (Device: in Vulkan.Device;
         Deferred_Operation: in KHR.Deferred_Operation;
         Info: in EXT.Copy_Micromap_To_Memory_Info) is
    begin
        Exceptions.Check(Copy_Micromap_To_Memory(Device,
                                                 Deferred_Operation,
                                                 Info));
    end Copy_Micromap_To_Memory;
    
    function Copy_Memory_To_Micromap
        (Device: in Vulkan.Device;
         Deferred_Operation: in KHR.Deferred_Operation;
         Info: in EXT.Copy_Memory_To_Micromap_Info) return Result is
        Result: Vulkan.Result;
        C_Info: C_EXT.Copy_Memory_To_Micromap_Info_C := C_EXT.To_C(Info);
    begin
        Result := vkCopyMemoryToMicromapEXT(Device, Deferred_Operation, C_Info);
        C_EXT.Free(C_Info);

        return Result;
    end Copy_Memory_To_Micromap;

    procedure Copy_Memory_To_Micromap
        (Device: in Vulkan.Device;
         Deferred_Operation: in KHR.Deferred_Operation;
         Info: in EXT.Copy_Memory_To_Micromap_Info) is
    begin
        Exceptions.Check(Copy_Memory_To_Micromap(Device,
                                                 Deferred_Operation,
                                                 Info));
    end Copy_Memory_To_Micromap;

    function Write_Micromaps_Properties
        (Device: in Vulkan.Device;
         Micromaps: in EXT.Micromap_Vectors.Vector;
         Query_Type: in Vulkan.Query_Type;
         Data_Size: in Interfaces.C.size_t;
         Data: in Interfaces.C.Extensions.void_ptr;
         Stride: in Interfaces.C.size_t) return Result is
        C_Micromaps: array (1 .. Positive(Micromaps.Length)) of
                        aliased EXT.Micromap
            with Convention => C;
    begin
        for X in C_Micromaps'Range loop
            C_Micromaps(X) := Micromaps(X);
        end loop;

        return vkWriteMicromapsPropertiesEXT(Device,
                                             C_Micromaps'Length,
                                             C_Micromaps(1)'Access,
                                             Query_Type,
                                             Data_Size,
                                             Data,
                                             Stride);
    end Write_Micromaps_Properties;

    procedure Write_Micromaps_Properties
        (Device: in Vulkan.Device;
         Micromaps: in EXT.Micromap_Vectors.Vector;
         Query_Type: in Vulkan.Query_Type;
         Data_Size: in Interfaces.C.size_t;
         Data: in Interfaces.C.Extensions.void_ptr;
         Stride: in Interfaces.C.size_t) is
    begin
        Exceptions.Check
            (Write_Micromaps_Properties(Device,
                                        Micromaps,
                                        Query_Type,
                                        Data_Size,
                                        Data,
                                        Stride));
    end Write_Micromaps_Properties;

    function Write_Micromaps_Properties
        (Device: in Vulkan.Device;
         Micromap: in EXT.Micromap;
         Query_Type: in Vulkan.Query_Type;
         Data_Size: in Interfaces.C.size_t;
         Data: in Interfaces.C.Extensions.void_ptr;
         Stride: in Interfaces.C.size_t) return Result is
    begin
        return Write_Micromaps_Properties(Device,
                                          EXT.Micromap_Vectors.To_Vector
                                              (Micromap, 1),
                                          Query_Type,
                                          Data_Size,
                                          Data,
                                          Stride);
    end Write_Micromaps_Properties;

    procedure Write_Micromaps_Properties
        (Device: in Vulkan.Device;
         Micromap: in EXT.Micromap;
         Query_Type: in Vulkan.Query_Type;
         Data_Size: in Interfaces.C.size_t;
         Data: in Interfaces.C.Extensions.void_ptr;
         Stride: in Interfaces.C.size_t) is
    begin
        Exceptions.Check(Write_Micromaps_Properties(Device,
                                                    Micromap,
                                                    Query_Type,
                                                    Data_Size,
                                                    Data,
                                                    Stride));
    end Write_Micromaps_Properties;

    procedure Copy_Micromap(Command_Buffer: in Vulkan.Command_Buffer;
                            Info: in EXT.Copy_Micromap_Info) is
        C_Info: C_EXT.Copy_Micromap_Info_C := C_EXT.To_C(Info);
    begin
        vkCmdCopyMicromapEXT(Command_Buffer, C_Info);
        C_EXT.Free(C_Info);
    end Copy_Micromap;

    procedure Copy_Micromap_To_Memory
        (Command_Buffer: in Vulkan.Command_Buffer;
         Info: in EXT.Copy_Micromap_To_Memory_Info) is
        C_Info: C_EXT.Copy_Micromap_To_Memory_Info_C := C_EXT.To_C(Info);
    begin
        vkCmdCopyMicromapToMemoryEXT(Command_Buffer, C_Info);
        C_EXT.Free(C_Info);
    end Copy_Micromap_To_Memory;

    procedure Copy_Memory_To_Micromap
        (Command_Buffer: in Vulkan.Command_Buffer;
         Info: in EXT.Copy_Memory_To_Micromap_Info) is
        C_Info: C_EXT.Copy_Memory_To_Micromap_Info_C := C_EXT.To_C(Info);
    begin
        vkCmdCopyMemoryToMicromapEXT(Command_Buffer, C_Info);
        C_EXT.Free(C_Info);
    end Copy_Memory_To_Micromap;

    procedure Write_Micromaps_Properties
        (Command_Buffer: in Vulkan.Command_Buffer;
         Micromaps: in EXT.Micromap_Vectors.Vector;
         Query_Type: in Vulkan.Query_Type;
         Query_Pool: in Vulkan.Query_Pool;
         First_Query: in Interfaces.Unsigned_32) is
        C_Maps: array (1 .. Positive(Micromaps.Length)) of
                aliased EXT.Micromap
            with Convention => C;
    begin
        for X in C_Maps'Range loop
            C_Maps(X) := Micromaps(X);
        end loop;

        vkCmdWriteMicromapsPropertiesEXT(Command_Buffer,
                                         C_Maps'Length,
                                         C_Maps(1)'Access,
                                         Query_Type,
                                         Query_Pool,
                                         First_Query);
    end Write_Micromaps_Properties;

    procedure Write_Micromaps_Properties
        (Command_Buffer: in Vulkan.Command_Buffer;
         Micromap: in EXT.Micromap;
         Query_Type: in Vulkan.Query_Type;
         Query_Pool: in Vulkan.Query_Pool;
         First_Query: in Interfaces.Unsigned_32) is
    begin
        Write_Micromaps_Properties(Command_Buffer,
                                   EXT.Micromap_Vectors.To_Vector(Micromap, 1),
                                   Query_Type,
                                   Query_Pool,
                                   First_Query);
    end Write_Micromaps_Properties;

    function Get_Device_Micromap_Compatibility
        (Device: in Vulkan.Device;
         Version_Info: in EXT.Micromap_Version_Info)
        return KHR.Acceleration_Structure_Compatibility is
        C_Info: C_EXT.Micromap_Version_Info_C := C_EXT.To_C(Version_Info);
        Compatibility: KHR.Acceleration_Structure_Compatibility;
    begin
        vkGetDeviceMicromapCompatibilityEXT(Device, C_Info, Compatibility);
        C_EXT.Free(C_Info);

        return Compatibility;
    end Get_Device_Micromap_Compatibility;

    procedure Get_Micromap_Build_Sizes
        (Device: in Vulkan.Device;
         Build_Type: in KHR.Acceleration_Structure_Build_Type;
         Build_Info: in EXT.Micromap_Build_Info;
         Size_Info: in out EXT.Micromap_Build_Sizes_Info) is
        C_Info: C_EXT.Micromap_Build_Info_C := C_EXT.To_C(Build_Info);
        C_Size: C_EXT.Micromap_Build_Sizes_Info_C;
    begin
        vkGetMicromapBuildSizesEXT(Device, Build_Type, C_Info, C_Size);
        C_EXT.Free(C_Info);
        Size_Info.Micromap_Size := C_Size.Micromap_Size;
        Size_Info.Build_Scratch_Size := C_Size.Build_Scratch_Size;
        Size_Info.Discardable := Utilities.To_Ada(C_Size.Discardable);
    end Get_Micromap_Build_Sizes;

    function Get_Micromap_Build_Sizes
        (Device: in Vulkan.Device;
         Build_Type: in KHR.Acceleration_Structure_Build_Type;
         Build_Info: in EXT.Micromap_Build_Info)
        return EXT.Micromap_Build_Sizes_Info is
        Info: EXT.Micromap_Build_Sizes_Info;
    begin
        Get_Micromap_Build_Sizes(Device, Build_Type, Build_Info, Info);

        return Info;
    end Get_Micromap_Build_Sizes;
end Vulkan.Extensions.EXT_Opacity_Micromap;

