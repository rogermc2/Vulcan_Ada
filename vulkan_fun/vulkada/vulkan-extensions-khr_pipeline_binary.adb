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

with Ada.Unchecked_Deallocation;
with Vulkan.Core;
with Vulkan.C_KHR;
with Vulkan.Exceptions;
with Vulkan.Extension_Records;

package body Vulkan.Extensions.KHR_Pipeline_Binary is
    -- Loaded extension functions.
    type vkCreatePipelineBinariesKHR_Access is
        access function(Device: in Vulkan.Device;
                        Create_Info: in C_KHR.Pipeline_Binary_Create_Info_C;
                        Allocator: access constant Allocation_Callbacks;
                        Binaries: out C_KHR.Pipeline_Binary_Handles_Info_C)
        return Result
        with Convention => C;

    vkCreatePipelineBinariesKHR: vkCreatePipelineBinariesKHR_Access;

    type vkDestroyPipelineBinaryKHR_Access is
        access procedure(Device: in Vulkan.Device;
                         Pipeline_Binary: in KHR.Pipeline_Binary;
                         Allocator: access constant Allocation_Callbacks)
        with Convention => C;

    vkDestroyPipelineBinaryKHR: vkDestroyPipelineBinaryKHR_Access;

    type vkGetPipelineKeyKHR_Access is
        access function
            (Device: in Vulkan.Device;
             Pipeline_Create_Info: access constant C_KHR.Pipeline_Create_Info_C;
             Pipeline_Key: out C_KHR.Pipeline_Binary_Key_C)
        return Result
        with Convention => C;

    vkGetPipelineKeyKHR: vkGetPipelineKeyKHR_Access;

    type vkGetPipelineBinaryDataKHR_Access is
        access function
            (Device: in Vulkan.Device;
             Info: in C_KHR.Pipeline_Binary_Data_Info_C;
             Pipeline_Binary_Key: out C_KHR.Pipeline_Binary_Key_C;
             Pipeline_Binary_Data_Size: in out Interfaces.C.size_t;
             Pipeline_Binary_Data: in Interfaces.C.Extensions.void_ptr)
        return Result
        with Convention => C;

    vkGetPipelineBinaryDataKHR: vkGetPipelineBinaryDataKHR_Access;

    type vkReleaseCapturedPipelineDataKHR_Access is
        access function(Device: in Vulkan.Device;
                        Info: in C_KHR.Release_Captured_Pipeline_Data_Info_C;
                        Allocator: access constant Allocation_Callbacks)
        return Result
        with Convention => C;

    vkReleaseCapturedPipelineDataKHR: vkReleaseCapturedPipelineDataKHR_Access;

    -- General Create implementation.
    function Create(Device: in Vulkan.Device;
                    Create_Info: in Extensions.KHR.Pipeline_Binary_Create_Info;
                    Allocator: access constant Allocation_Callbacks;
                    Binaries: out Extensions.KHR.Pipeline_Binary_Handles_Info)
        return Result;

    -- General Release_Captured_Pipeline_Data implementation.
    function Release_Captured_Pipeline_Data
        (Device: in Vulkan.Device;
         Info: in out KHR.Release_Captured_Pipeline_Data_Info;
         Allocation: access constant Allocation_Callbacks) return Result;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkCreatePipelineBinariesKHR_Access);
        procedure Load is new Load_Pointer(vkDestroyPipelineBinaryKHR_Access);
        procedure Load is new Load_Pointer(vkGetPipelineKeyKHR_Access);
        procedure Load is new Load_Pointer(vkGetPipelineBinaryDataKHR_Access);
        procedure Load is
            new Load_Pointer(vkReleaseCapturedPipelineDataKHR_Access);
    begin
        Load(vkCreatePipelineBinariesKHR, "vkCreatePipelineBinariesKHR");
        Load(vkDestroyPipelineBinaryKHR, "vkDestroyPipelineBinaryKHR");
        Load(vkGetPipelineKeyKHR, "vkGetPipelineKeyKHR");
        Load(vkGetPipelineBinaryDataKHR, "vkGetPipelineBinaryDataKHR");
        Load(vkReleaseCapturedPipelineDataKHR,
             "vkReleaseCapturedPipelineDataKHR");
    end Load_Extension;

    function Create_Pipeline_Binaries
        (Device: in Vulkan.Device;
         Create_Info: in Extensions.KHR.Pipeline_Binary_Create_Info;
         Allocator: aliased in Allocation_Callbacks;
         Binaries: out Extensions.KHR.Pipeline_Binary_Handles_Info)
        return Result is
    begin
        return Create(Device, Create_Info, Allocator'Access, Binaries);
    end Create_Pipeline_Binaries;

    function Create_Pipeline_Binaries
        (Device: in Vulkan.Device;
         Create_Info: in Extensions.KHR.Pipeline_Binary_Create_Info;
         Binaries: out Extensions.KHR.Pipeline_Binary_Handles_Info)
        return Result is
    begin
        return Create(Device, Create_Info, null, Binaries);
    end Create_Pipeline_Binaries;

    procedure Destroy_Pipeline_Binary
        (Device: in Vulkan.Device;
         Pipeline_Binary: in out KHR.Pipeline_Binary;
         Allocator: aliased in Allocation_Callbacks) is
    begin
        vkDestroyPipelineBinaryKHR(Device, Pipeline_Binary, Allocator'Access);
        Pipeline_Binary := KHR.No_Pipeline_Binary;
    end Destroy_Pipeline_Binary;

    procedure Destroy_Pipeline_Binary
        (Device: in Vulkan.Device;
         Pipeline_Binary: in out KHR.Pipeline_Binary) is
    begin
        vkDestroyPipelineBinaryKHR(Device, Pipeline_Binary, null);
        Pipeline_Binary := KHR.No_Pipeline_Binary;
    end Destroy_Pipeline_Binary;

    function Get_Pipeline_Key(Device: in Vulkan.Device;
                              Pipeline_Create_Info: in KHR.Pipeline_Create_Info;
                              Pipeline_Key: in out KHR.Pipeline_Binary_Key)
        return Result is
        Info_C: aliased C_KHR.Pipeline_Create_Info_C :=
            C_KHR.To_C(Pipeline_Create_Info);
        Key_C: C_KHR.Pipeline_Binary_Key_C;
        Result: Vulkan.Result;
    begin
        Key_C.Next := Extension_Records.To_C(Pipeline_Key.Next);
        Result := vkGetPipelineKeyKHR(Device, Info_C'Access, Key_C);
        C_KHR.Free(Info_C);
        C_KHR.To_Ada(Pipeline_Key, Key_C);
        Extension_Records.Free(Key_C.Next);

        return Result;
    end Get_Pipeline_Key;

    function Get_Pipeline_Key(Device: in Vulkan.Device;
                              Pipeline_Create_Info: in KHR.Pipeline_Create_Info)
        return KHR.Pipeline_Binary_Key is
        Pipeline_Key: KHR.Pipeline_Binary_Key;
    begin
        Exceptions.Check(Get_Pipeline_Key(Device,
                                          Pipeline_Create_Info,
                                          Pipeline_Key));

        return Pipeline_Key;
    end Get_Pipeline_Key;

    function Get_Pipeline_Key(Device: in Vulkan.Device;
                              Pipeline_Key: in out KHR.Pipeline_Binary_Key)
        return Result is
        Key_C: C_KHR.Pipeline_Binary_Key_C;
        Result: Vulkan.Result;
    begin
        Key_C.Next := Extension_Records.To_C(Pipeline_Key.Next);
        Result := vkGetPipelineKeyKHR(Device, null, Key_C);

        if Result = Success then
            C_KHR.To_Ada(Pipeline_Key, Key_C);
        end if;

        Extension_Records.Free(Key_C.Next);

        return Result;
    end Get_Pipeline_Key;

    function Get_Pipeline_Key(Device: in Vulkan.Device)
        return KHR.Pipeline_Binary_Key is
        Pipeline_Key: KHR.Pipeline_Binary_Key;
    begin
        Exceptions.Check(Get_Pipeline_Key(Device, Pipeline_Key));
        
        return Pipeline_Key;
    end Get_Pipeline_Key;

    function Get_Pipeline_Binary_Data_Size
        (Device: in Vulkan.Device;
         Info: in KHR.Pipeline_Binary_Data_Info;
         Pipeline_Binary_Key: in out KHR.Pipeline_Binary_Key)
        return Interfaces.C.size_t is
        Info_C: C_KHR.Pipeline_Binary_Data_Info_C;
        Key_C: C_KHR.Pipeline_Binary_Key_C;
        Size: Interfaces.C.size_t := 0;
        Result: Vulkan.Result;
    begin
        Info_C.Next := Extension_Records.To_C(Info.Next);
        Info_C.Pipeline_Binary := Info.Pipeline_Binary;
        Key_C.Next := Extension_Records.To_C(Pipeline_Binary_Key.Next);
        Result := vkGetPipelineBinaryDataKHR(Device,
                                             Info_C,
                                             Key_C,
                                             Size,
                                             System.Null_Address);
        Extension_Records.Free(Info_C.Next);

        if Result = Success then
            C_KHR.To_Ada(Pipeline_Binary_Key, Key_C);
        end if;

        Extension_Records.Free(Key_C.Next);
        Exceptions.Check(Result);

        return Size;
    end Get_Pipeline_Binary_Data_Size;

    function Get_Pipeline_Binary_Data
        (Device: in Vulkan.Device;
         Info: in KHR.Pipeline_Binary_Data_Info;
         Pipeline_Binary_Key: in out KHR.Pipeline_Binary_Key;
         Pipeline_Binary_Data: in out Byte_Vectors.Vector) return Result is
        use type Interfaces.C.size_t;

        type Byte_Array is array (Positive range <>) of aliased Byte;
        type Byte_Array_Access is access all Byte_Array;

        procedure Free is new Ada.Unchecked_Deallocation(Byte_Array,
                                                         Byte_Array_Access);

        Info_C: C_KHR.Pipeline_Binary_Data_Info_C;
        Key_C: C_KHR.Pipeline_Binary_Key_C;
        Result: Vulkan.Result;
        Size: Interfaces.C.size_t := Get_Pipeline_Binary_Data_Size
            (Device, Info, Pipeline_Binary_Key);
        Bytes_C: Byte_Array_Access;
    begin
        Pipeline_Binary_Data.Clear;

        if Size = 0 then
            return Success;
        end if;

        Pipeline_Binary_Data.Reserve_Capacity(Ada.Containers.Count_Type(Size));
        Info_C.Next := Extension_Records.To_C(Info.Next);
        Info_C.Pipeline_Binary := Info.Pipeline_Binary;
        Key_C.Next := Extension_Records.To_C(Pipeline_Binary_Key.Next);
        Bytes_C := new Byte_Array(1 .. Positive(Size));

        Result := vkGetPipelineBinaryDataKHR(Device,
                                             Info_C,
                                             Key_C,
                                             Size,
                                             Bytes_C(1)'Address);

        if Result = Success then
            for B of Bytes_C.all loop
                Pipeline_Binary_Data.Append(B);
            end loop;
        end if;

        Extension_Records.Free(Info_C.Next);
        Extension_Records.Free(Key_C.Next);
        Free(Bytes_C);

        return Result;
    end Get_Pipeline_Binary_Data;

    function Get_Pipeline_Binary_Data
        (Device: in Vulkan.Device;
         Info: in KHR.Pipeline_Binary_Data_Info;
         Pipeline_Binary_Key: in out KHR.Pipeline_Binary_Key)
        return Byte_Vectors.Vector is
        Data: Byte_Vectors.Vector;
    begin
        Exceptions.Check(Get_Pipeline_Binary_Data(Device,
                                                  Info,
                                                  Pipeline_Binary_Key,
                                                  Data));

        return Data;
    end Get_Pipeline_Binary_Data;

    function Release_Captured_Pipeline_Data
        (Device: in Vulkan.Device;
         Info: in out KHR.Release_Captured_Pipeline_Data_Info;
         Allocator: aliased in Allocation_Callbacks) return Result is
    begin
        return Release_Captured_Pipeline_Data(Device, Info, Allocator'Access);
    end Release_Captured_Pipeline_Data;
    
    procedure Release_Captured_Pipeline_Data
        (Device: in Vulkan.Device;
         Info: in out KHR.Release_Captured_Pipeline_Data_Info;
         Allocator: aliased in Allocation_Callbacks) is
    begin
        Exceptions.Check(Release_Captured_Pipeline_Data(Device,
                                                        Info,
                                                        Allocator'Access));
    end Release_Captured_Pipeline_Data;

    function Release_Captured_Pipeline_Data
        (Device: in Vulkan.Device;
         Info: in out KHR.Release_Captured_Pipeline_Data_Info) return Result is
    begin
        return Release_Captured_Pipeline_Data(Device, Info, null);
    end Release_Captured_Pipeline_Data;
    
    procedure Release_Captured_Pipeline_Data
        (Device: in Vulkan.Device;
         Info: in out KHR.Release_Captured_Pipeline_Data_Info) is
    begin
        Exceptions.Check(Release_Captured_Pipeline_Data(Device, Info, null));
    end Release_Captured_Pipeline_Data;

    function Create(Device: in Vulkan.Device;
                    Create_Info: in Extensions.KHR.Pipeline_Binary_Create_Info;
                    Allocator: access constant Allocation_Callbacks;
                    Binaries: out Extensions.KHR.Pipeline_Binary_Handles_Info)
        return Result is
        Info_C: C_KHR.Pipeline_Binary_Create_Info_C := C_KHR.To_C(Create_Info);
        Binaries_C: C_KHR.Pipeline_Binary_Handles_Info_C;
        Result: Vulkan.Result;
    begin
        Result := vkCreatePipelineBinariesKHR(Device,
                                              Info_C,
                                              Allocator,
                                              Binaries_C);

        if Result /= Success then
            C_KHR.Free(Info_C);

            return Result;
        end if;

        declare
            Binaries_Array: array (1 .. Binaries_C.Pipeline_Binary_Count) of
                aliased KHR.Pipeline_Binary
                with Convention => C;
        begin
            Binaries_C.Pipeline_Binaries := Binaries_Array(1)'Unchecked_Access;
            Result := vkCreatePipelineBinariesKHR(Device,
                                                  Info_C,
                                                  Allocator,
                                                  Binaries_C);

            if Result not in Error_Result then
                Binaries.Pipeline_Binaries.Clear;

                for Binary of Binaries_Array loop
                    Binaries.Pipeline_Binaries.Append(Binary);
                end loop;
            end if;
        end;

        C_KHR.Free(Info_C);

        return Result;
    end Create;
    
    function Release_Captured_Pipeline_Data
        (Device: in Vulkan.Device;
         Info: in out KHR.Release_Captured_Pipeline_Data_Info;
         Allocation: access constant Allocation_Callbacks) return Result is
        Info_C: C_KHR.Release_Captured_Pipeline_Data_Info_C;
        Result: Vulkan.Result;
    begin
        Info_C.Next := Extension_Records.To_C(Info.Next);
        Info_C.Pipeline := Info.Pipeline;
        Result := vkReleaseCapturedPipelineDataKHR(Device, Info_C, Allocation);
        Extension_Records.Free(Info_C.Next);

        return Result;
    end Release_Captured_Pipeline_Data;
end Vulkan.Extensions.KHR_Pipeline_Binary;

