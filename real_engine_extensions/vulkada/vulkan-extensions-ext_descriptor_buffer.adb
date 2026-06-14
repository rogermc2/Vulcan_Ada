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

-- Operations for the descriptor buffer extension

with Vulkan.Core;
with Vulkan.C_EXT;
with Vulkan.Exceptions;

package body Vulkan.Extensions.EXT_Descriptor_Buffer is
    -- Loaded extension functions.
    type vkGetDescriptorSetLayoutSizeEXT_Access is
        access procedure(Device: in Vulkan.Device;
                         Layout: in Descriptor_Set_Layout;
                         Layout_Size_In_Bytes: out Device_Size)
        with Convention => C;

    vkGetDescriptorSetLayoutSizeEXT: vkGetDescriptorSetLayoutSizeEXT_Access;

    type vkGetDescriptorSetLayoutBindingOffsetEXT_Access is
        access procedure(Device: in Vulkan.Device;
                         Layout: in Descriptor_Set_Layout;
                         Binding: in Interfaces.Unsigned_32;
                         Offset: out Device_Size)
        with Convention => C;

    vkGetDescriptorSetLayoutBindingOffsetEXT:
        vkGetDescriptorSetLayoutBindingOffsetEXT_Access;

    type vkGetDescriptorEXT_Access is
        access procedure(Device: in Vulkan.Device;
                         Descriptor_Info: in C_EXT.Descriptor_Get_Info_C;
                         Data_Size: in Interfaces.C.size_t;
                         Descriptor: in Interfaces.C.Extensions.void_ptr)
        with Convention => C;

    vkGetDescriptorEXT: vkGetDescriptorEXT_Access;

    type vkCmdBindDescriptorBuffersEXT_Access is
        access procedure
            (Command_Buffer: in Vulkan.Command_Buffer;
             Buffer_Count: in Interfaces.Unsigned_32;
             Binding_Infos:
                access constant C_EXT.Descriptor_Buffer_Binding_Info_C)
        with Convention => C;

    vkCmdBindDescriptorBuffersEXT: vkCmdBindDescriptorBuffersEXT_Access;

    type vkCmdSetDescriptorBufferOffsetsEXT_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Pipeline_Bind_Point: in Vulkan.Pipeline_Bind_Point;
                         Layout: in Pipeline_Layout;
                         First_Set, Set_Count: in Interfaces.Unsigned_32;
                         Buffer_Indices: access constant Interfaces.Unsigned_32;
                         Offsets: access constant Device_Size)
        with Convention => C;

    vkCmdSetDescriptorBufferOffsetsEXT:
        vkCmdSetDescriptorBufferOffsetsEXT_Access;

    type vkCmdBindDescriptorBufferEmbeddedSamplersEXT_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Pipeline_Bind_Point: in Vulkan.Pipeline_Bind_Point;
                         Layout: in Pipeline_Layout;
                         Set: in Interfaces.Unsigned_32)
        with Convention => C;

    vkCmdBindDescriptorBufferEmbeddedSamplersEXT:
        vkCmdBindDescriptorBufferEmbeddedSamplersEXT_Access;

    type vkGetBufferOpaqueCaptureDescriptorDataEXT_Access is
        access function(Device: in Vulkan.Device;
                        Info: in C_EXT.Buffer_Capture_Descriptor_Data_Info_C;
                        Data: in Interfaces.C.Extensions.void_ptr) return Result
        with Convention => C;

    vkGetBufferOpaqueCaptureDescriptorDataEXT:
        vkGetBufferOpaqueCaptureDescriptorDataEXT_Access;

    type vkGetImageOpaqueCaptureDescriptorDataEXT_Access is
        access function(Device: in Vulkan.Device;
                        Info: in C_EXT.Image_Capture_Descriptor_Data_Info_C;
                        Data: in Interfaces.C.Extensions.void_ptr) return Result
        with Convention => C;

    vkGetImageOpaqueCaptureDescriptorDataEXT:
        vkGetImageOpaqueCaptureDescriptorDataEXT_Access;

    type vkGetImageViewOpaqueCaptureDescriptorDataEXT_Access is
        access function
            (Device: in Vulkan.Device;
             Info: in C_EXT.Image_View_Capture_Descriptor_Data_Info_C;
             Data: in Interfaces.C.Extensions.void_ptr) return Result
        with Convention => C;

    vkGetImageViewOpaqueCaptureDescriptorDataEXT:
        vkGetImageViewOpaqueCaptureDescriptorDataEXT_Access;

    type vkGetSamplerOpaqueCaptureDescriptorDataEXT_Access is
        access function(Device: in Vulkan.Device;
                        Info: in C_EXT.Sampler_Capture_Descriptor_Data_Info_C;
                        Data: in Interfaces.C.Extensions.void_ptr) return Result
        with Convention => C;

    vkGetSamplerOpaqueCaptureDescriptorDataEXT:
        vkGetSamplerOpaqueCaptureDescriptorDataEXT_Access;

    type vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT_Access is
        access function
            (Device: in Vulkan.Device;
             Info: in
                C_EXT.Acceleration_Structure_Capture_Descriptor_Data_Info_C;
             Data: in Interfaces.C.Extensions.void_ptr) return Result
        with Convention => C;

    vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT:
        vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT_Access;

    -- Common implementations for the GetDescriptorData functions.
    generic
        type Info_Type(<>) is limited private;
        type C_Info_Type(<>) is limited private;
        with function To_C(Info: in Info_Type) return C_Info_Type;
        with procedure Free(C_Info: in out C_Info_Type);
        type Get_Access_Type is
            access function(Device: in Vulkan.Device;
                            Info: in C_Info_Type;
                            Data: in Interfaces.C.Extensions.void_ptr)
                return Result;
        Get: in out Get_Access_Type;
    package Get_Descriptor_Data_Common is
        function Get_Data(Device: in Vulkan.Device;
                          Info: in Info_Type;
                          Data: in Interfaces.C.Extensions.void_ptr)
            return Result;

        procedure Get_Data(Device: in Vulkan.Device;
                           Info: in Info_Type;
                           Data: in Interfaces.C.Extensions.void_ptr);
    end Get_Descriptor_Data_Common;

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
            new Load_Pointer(vkGetDescriptorSetLayoutSizeEXT_Access);
        procedure Load is
            new Load_Pointer(vkGetDescriptorSetLayoutBindingOffsetEXT_Access);
        procedure Load is new Load_Pointer(vkGetDescriptorEXT_Access);
        procedure Load is
            new Load_Pointer(vkCmdBindDescriptorBuffersEXT_Access);
        procedure Load is
            new Load_Pointer(vkCmdSetDescriptorBufferOffsetsEXT_Access);
        procedure Load is
            new Load_Pointer
                (vkCmdBindDescriptorBufferEmbeddedSamplersEXT_Access);
        procedure Load is
            new Load_Pointer(vkGetBufferOpaqueCaptureDescriptorDataEXT_Access);
        procedure Load is
            new Load_Pointer(vkGetImageOpaqueCaptureDescriptorDataEXT_Access);
        procedure Load is
            new Load_Pointer
                (vkGetImageViewOpaqueCaptureDescriptorDataEXT_Access);
        procedure Load is
            new Load_Pointer(vkGetSamplerOpaqueCaptureDescriptorDataEXT_Access);
        procedure Load is
            new Load_Pointer
              (vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT_Access);
    begin
        Load(vkGetDescriptorSetLayoutSizeEXT,
             "vkGetDescriptorSetLayoutSizeEXT");
        Load(vkGetDescriptorSetLayoutBindingOffsetEXT,
             "vkGetDescriptoeSetLayoutBindingOffsetEXT");
        Load(vkGetDescriptorEXT, "vkGetDescriptorEXT");
        Load(vkCmdBindDescriptorBuffersEXT,
             "vkCmdBindDescriptorBuffersEXT");
        Load(vkCmdSetDescriptorBufferOffsetsEXT,
             "vkCmdSetDescriptorBufferOffsetsEXT");
        Load(vkCmdBindDescriptorBufferEmbeddedSamplersEXT,
             "vkCmdBindDescriptorBufferEmbeddedSamplersEXT");
        Load(vkGetBufferOpaqueCaptureDescriptorDataEXT,
             "vkGetBufferOpaqueCaptureDescriptorDataEXT");
        Load(vkGetImageOpaqueCaptureDescriptorDataEXT,
             "vkGetImageOpaqueCaptureDescriptorDataEXT");
        Load(vkGetImageViewOpaqueCaptureDescriptorDataEXT,
             "vkGetImageViewOpaqueCaptureDescriptorDataEXT");
        Load(vkGetSamplerOpaqueCaptureDescriptorDataEXT,
             "vkGetSamplerOpaqueCaptureDescriptorDataEXT");
        Load(vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT,
             "vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT");
    end Load_Extension;

    function Get_Descriptor_Set_Layout_Size(Device: in Vulkan.Device;
                                            Layout: in Descriptor_Set_Layout)
        return Device_Size is
        Size: Device_Size;
    begin
        vkGetDescriptorSetLayoutSizeEXT(Device, Layout, Size);
        
        return Size;
    end Get_Descriptor_Set_Layout_Size;

    function Get_Descriptor_Set_Layout_Binding_Offset
        (Device: in Vulkan.Device;
         Layout: in Descriptor_Set_Layout;
         Binding: in Interfaces.Unsigned_32) return Device_Size is
        Offset: Device_Size;
    begin
        vkGetDescriptorSetLayoutBindingOffsetEXT(Device,
                                                 Layout,
                                                 Binding,
                                                 Offset);

        return Offset;
    end Get_Descriptor_Set_Layout_Binding_Offset;

    procedure Get_Descriptor(Device: in Vulkan.Device;
                             Descriptor_Info: in EXT.Descriptor_Get_Info;
                             Data_Size: in Interfaces.C.size_t;
                             Descriptor: in Interfaces.C.Extensions.void_ptr) is
        C_Info: C_EXT.Descriptor_Get_Info_C := C_EXT.To_C(Descriptor_Info);
    begin
        vkGetDescriptorEXT(Device, C_Info, Data_Size, Descriptor);
        C_EXT.Free(C_Info);
    end Get_Descriptor;

    procedure Bind_Descriptor_Buffers
        (Command_Buffer: in Vulkan.Command_Buffer;
         Binding_Infos: in EXT.Descriptor_Buffer_Binding_Info_Vectors.Vector) is
        C_Infos: array (1 .. Positive(Binding_Infos.Length)) of aliased
            C_EXT.Descriptor_Buffer_Binding_Info_C
            with Convention => C;
    begin
        for X in C_Infos'Range loop
            C_Infos(X) := C_EXT.To_C(Binding_Infos(X));
        end loop;

        vkCmdBindDescriptorBuffersEXT(Command_Buffer,
                                      C_Infos'Length,
                                      C_Infos(1)'Access);

        for Info of C_Infos loop
            C_EXT.Free(Info);
        end loop;
    end Bind_Descriptor_Buffers;

    procedure Bind_Descriptor_Buffers
        (Command_Buffer: in Vulkan.Command_Buffer;
         Binding_Info: in EXT.Descriptor_Buffer_Binding_Info) is
    begin
        Bind_Descriptor_Buffers
            (Command_Buffer,
             EXT.Descriptor_Buffer_Binding_Info_Vectors.To_Vector
                 (Binding_Info, 1));
    end Bind_Descriptor_Buffers;

    procedure Set_Descriptor_Buffer_Offsets
        (Command_Buffer: in Vulkan.Command_Buffer;
         Pipeline_Bind_Point: in Vulkan.Pipeline_Bind_Point;
         Layout: in Pipeline_Layout;
         First_Set: in Interfaces.Unsigned_32;
         Buffer_Indices: in Unsigned_32_Vectors.Vector;
         Offsets: in Device_Size_Vectors.Vector) is
        C_Indices: array (1 .. Positive(Buffer_Indices.Length)) of
            aliased Interfaces.Unsigned_32;
        C_Offsets: array (1 .. Positive(Offsets.Length)) of
            aliased Device_Size;
    begin
        for X in C_Indices'Range loop
            C_Indices(X) := Buffer_Indices(X);
            C_Offsets(X) := Offsets(X);
        end loop;

        vkCmdSetDescriptorBufferOffsetsEXT(Command_Buffer,
                                           Pipeline_Bind_Point,
                                           Layout,
                                           First_Set,
                                           C_Indices'Length,
                                           C_Indices(1)'Access,
                                           C_Offsets(1)'Access);
    end Set_Descriptor_Buffer_Offsets;

    procedure Set_Descriptor_Buffer_Offsets
        (Command_Buffer: in Vulkan.Command_Buffer;
         Pipeline_Bind_Point: in Vulkan.Pipeline_Bind_Point;
         Layout: in Pipeline_Layout;
         First_Set, Buffer_Index: in Interfaces.Unsigned_32;
         Offset: in Device_Size) is
    begin
        Set_Descriptor_Buffer_Offsets(Command_Buffer,
                                      Pipeline_Bind_Point,
                                      Layout,
                                      First_Set,
                                      Unsigned_32_Vectors.To_Vector
                                          (Buffer_Index, 1),
                                      Device_Size_Vectors.To_Vector(Offset, 1));
    end Set_Descriptor_Buffer_Offsets;

    procedure Bind_Descriptor_Buffer_Embedded_Samplers
        (Command_Buffer: in Vulkan.Command_Buffer;
         Pipeline_Bind_Point: in Vulkan.Pipeline_Bind_Point;
         Layout: in Pipeline_Layout;
         Set: in Interfaces.Unsigned_32) is
    begin
        vkCmdBindDescriptorBufferEmbeddedSamplersEXT(Command_Buffer,
                                                     Pipeline_Bind_Point,
                                                     Layout,
                                                     Set);
    end Bind_Descriptor_Buffer_Embedded_Samplers;

    package body Get_Descriptor_Data_Common is
        function Get_Data(Device: in Vulkan.Device;
                          Info: in Info_Type;
                          Data: in Interfaces.C.Extensions.void_ptr)
            return Result is
            C_Info: C_Info_Type := To_C(Info);
            Result: Vulkan.Result;
        begin
            Result := Get(Device, C_Info, Data);
            Free(C_Info);

            return Result;
        end Get_Data;

        procedure Get_Data(Device: in Vulkan.Device;
                           Info: in Info_Type;
                           Data: in Interfaces.C.Extensions.void_ptr) is
        begin
            Exceptions.Check(Get_Data(Device, Info, Data));
        end Get_Data;
    end Get_Descriptor_Data_Common;

    package Get_Buffer_Descriptor_Data is
        new Get_Descriptor_Data_Common
            (EXT.Buffer_Capture_Descriptor_Data_Info,
             C_EXT.Buffer_Capture_Descriptor_Data_Info_C,
             C_EXT.To_C,
             C_EXT.Free,
             vkGetBufferOpaqueCaptureDescriptorDataEXT_Access,
             vkGetBufferOpaqueCaptureDescriptorDataEXT);

    package Get_Image_Descriptor_Data is
        new Get_Descriptor_Data_Common
            (EXT.Image_Capture_Descriptor_Data_Info,
             C_EXT.Image_Capture_Descriptor_Data_Info_C,
             C_EXT.To_C,
             C_EXT.Free,
             vkGetImageOpaqueCaptureDescriptorDataEXT_Access,
             vkGetImageOpaqueCaptureDescriptorDataEXT);

    package Get_Image_View_Descriptor_Data is
        new Get_Descriptor_Data_Common
            (EXT.Image_View_Capture_Descriptor_Data_Info,
             C_EXT.Image_View_Capture_Descriptor_Data_Info_C,
             C_EXT.To_C,
             C_EXT.Free,
             vkGetImageViewOpaqueCaptureDescriptorDataEXT_Access,
             vkGetImageViewOpaqueCaptureDescriptorDataEXT);

    package Get_Sampler_Descriptor_Data is
        new Get_Descriptor_Data_Common
            (EXT.Sampler_Capture_Descriptor_Data_Info,
             C_EXT.Sampler_Capture_Descriptor_Data_Info_C,
             C_EXT.To_C,
             C_EXT.Free,
             vkGetSamplerOpaqueCaptureDescriptorDataEXT_Access,
             vkGetSamplerOpaqueCaptureDescriptorDataEXT);

    package Get_Acceleration_Structure_Descriptor_Data is
        new Get_Descriptor_Data_Common
            (EXT.Acceleration_Structure_Capture_Descriptor_Data_Info,
             C_EXT.Acceleration_Structure_Capture_Descriptor_Data_Info_C,
             C_EXT.To_C,
             C_EXT.Free,
             vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT_Access,
             vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT);

    function Get_Buffer_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Buffer_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr) return Result
        renames Get_Buffer_Descriptor_Data.Get_Data;

    procedure Get_Buffer_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Buffer_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr)
        renames Get_Buffer_Descriptor_Data.Get_Data;

    function Get_Image_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Image_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr) return Result
        renames Get_Image_Descriptor_Data.Get_Data;

    procedure Get_Image_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Image_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr)
        renames Get_Image_Descriptor_Data.Get_Data;

    function Get_Image_View_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Image_View_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr) return Result
        renames Get_Image_View_Descriptor_Data.Get_Data;

    procedure Get_Image_View_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Image_View_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr)
        renames Get_Image_View_Descriptor_Data.Get_Data;

    function Get_Sampler_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Sampler_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr) return Result
        renames Get_Sampler_Descriptor_Data.Get_Data;

    procedure Get_Sampler_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Sampler_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr)
        renames Get_Sampler_Descriptor_Data.Get_Data;

    function Get_Acceleration_Structure_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Acceleration_Structure_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr) return Result
        renames Get_Acceleration_Structure_Descriptor_Data.Get_Data;

    procedure Get_Acceleration_Structure_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Acceleration_Structure_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr)
        renames Get_Acceleration_Structure_Descriptor_Data.Get_Data;
end Vulkan.Extensions.EXT_Descriptor_Buffer;

