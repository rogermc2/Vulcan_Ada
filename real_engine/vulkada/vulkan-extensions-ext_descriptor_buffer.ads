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

with Vulkan.Extensions.EXT;
with Vulkan.Extensions.KHR;
with Vulkan.Extensions.NV;

package Vulkan.Extensions.EXT_Descriptor_Buffer is
    use type Ada.Containers.Count_Type;
    use type System.Address;
    use type Interfaces.C.size_t;
    use type KHR.Acceleration_Structure;
    use type NV.Acceleration_Structure;

    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkGetDescriptorSetLayoutSizeEXT
    function Get_Descriptor_Set_Layout_Size(Device: in Vulkan.Device;
                                            Layout: in Descriptor_Set_Layout)
        return Device_Size
        with Inline,
             Pre => Device /= No_Device and
                    Layout /= No_Descriptor_Set_Layout;

    -- vkGetDescriptorSetLayoutBindingOffsetEXT
    function Get_Descriptor_Set_Layout_Binding_Offset
        (Device: in Vulkan.Device;
         Layout: in Descriptor_Set_Layout;
         Binding: in Interfaces.Unsigned_32) return Device_Size
        with Inline,
             Pre => Device /= No_Device and
                    Layout /= No_Descriptor_Set_Layout;

    -- vkGetDescriptorEXT
    procedure Get_Descriptor(Device: in Vulkan.Device;
                             Descriptor_Info: in EXT.Descriptor_Get_Info;
                             Data_Size: in Interfaces.C.size_t;
                             Descriptor: in Interfaces.C.Extensions.void_ptr)
        with Pre => Device /= No_Device and
                    Data_Size > 0;

    -- vkCmdBindDescriptorBuffersEXT
    procedure Bind_Descriptor_Buffers
        (Command_Buffer: in Vulkan.Command_Buffer;
         Binding_Infos: in EXT.Descriptor_Buffer_Binding_Info_Vectors.Vector)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    not Binding_Infos.Is_Empty;

    procedure Bind_Descriptor_Buffers
        (Command_Buffer: in Vulkan.Command_Buffer;
         Binding_Info: in EXT.Descriptor_Buffer_Binding_Info)
        with Pre => Command_Buffer /= No_Command_Buffer;

    -- vkCmdSetDescriptorBufferOffsetsEXT
    procedure Set_Descriptor_Buffer_Offsets
        (Command_Buffer: in Vulkan.Command_Buffer;
         Pipeline_Bind_Point: in Vulkan.Pipeline_Bind_Point;
         Layout: in Pipeline_Layout;
         First_Set: in Interfaces.Unsigned_32;
         Buffer_Indices: in Unsigned_32_Vectors.Vector;
         Offsets: in Device_Size_Vectors.Vector)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    Layout /= No_Pipeline_Layout and
                    not Buffer_Indices.Is_Empty and
                    Buffer_Indices.Length = Offsets.Length;

    procedure Set_Descriptor_Buffer_Offsets
        (Command_Buffer: in Vulkan.Command_Buffer;
         Pipeline_Bind_Point: in Vulkan.Pipeline_Bind_Point;
         Layout: in Pipeline_Layout;
         First_Set, Buffer_Index: in Interfaces.Unsigned_32;
         Offset: in Device_Size)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    Layout /= No_Pipeline_Layout;

    -- vkCmdBindDescriptorBufferEmbeddedSamplersEXT
    procedure Bind_Descriptor_Buffer_Embedded_Samplers
        (Command_Buffer: in Vulkan.Command_Buffer;
         Pipeline_Bind_Point: in Vulkan.Pipeline_Bind_Point;
         Layout: in Pipeline_Layout;
         Set: in Interfaces.Unsigned_32)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer and
                    Layout /= No_Pipeline_Layout;

    -- vkGetBufferOpaqueCaptureDescriptorDataEXT
    function Get_Buffer_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Buffer_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr) return Result
        with Pre => Device /= No_Device and
                    Info.Buffer /= No_Buffer and
                    Data /= System.Null_Address,
             Post => Get_Buffer_Opaque_Capture_Descriptor_Data'Result in
                Success |
                Out_Of_Device_Memory |
                Out_Of_Host_Memory |
                Unknown |
                Validation_Failed;

    procedure Get_Buffer_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Buffer_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr)
        with Pre => Device /= No_Device and
                    Info.Buffer /= No_Buffer and
                    Data /= System.Null_Address;

    -- vkGetImageOpaqueCaptureDescriptorDataEXT
    function Get_Image_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Image_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr) return Result
        with Pre => Device /= No_Device and
                    Info.Image /= No_Image and
                    Data /= System.Null_Address,
             Post => Get_Image_Opaque_Capture_Descriptor_Data'Result in
                Success |
                Out_Of_Device_Memory |
                Out_Of_Host_Memory |
                Unknown |
                Validation_Failed;

    procedure Get_Image_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Image_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr)
        with Pre => Device /= No_Device and
                    Info.Image /= No_Image and
                    Data /= System.Null_Address;

    -- vkGetImageViewOpaqueCaptureDescriptorDataEXT
    function Get_Image_View_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Image_View_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr) return Result
        with Pre => Device /= No_Device and
                    Info.Image_View /= No_Image_View and
                    Data /= System.Null_Address,
             Post => Get_Image_View_Opaque_Capture_Descriptor_Data'Result in
                Success |
                Out_Of_Device_Memory |
                Out_Of_Host_Memory |
                Unknown |
                Validation_Failed;

    procedure Get_Image_View_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Image_View_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr)
        with Pre => Device /= No_Device and
                    Info.Image_View /= No_Image_View and
                    Data /= System.Null_Address;

    -- vkGetSamplerOpaqueCaptureDescriptorDataEXT
    function Get_Sampler_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Sampler_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr) return Result
        with Pre => Device /= No_Device and
                    Info.Sampler /= No_Sampler and
                    Data /= System.Null_Address,
             Post => Get_Sampler_Opaque_Capture_Descriptor_Data'Result in
                Success |
                Out_Of_Device_Memory |
                Out_Of_Host_Memory |
                Unknown |
                Validation_Failed;

    procedure Get_Sampler_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Sampler_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr)
        with Pre => Device /= No_Device and
                    Info.Sampler /= No_Sampler and
                    Data /= System.Null_Address;

    -- vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT
    function Get_Acceleration_Structure_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Acceleration_Structure_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr) return Result
        with Pre => Device /= No_Device and
                    (Info.Acceleration_Structure /=
                        KHR.No_Acceleration_Structure xor
                     Info.Acceleration_Structure_NV /=
                        NV.No_Acceleration_Structure) and
                    Data /= System.Null_Address,
             Post =>
             Get_Acceleration_Structure_Opaque_Capture_Descriptor_Data'Result in
                Success |
                Out_Of_Device_Memory |
                Out_Of_Host_Memory |
                Unknown |
                Validation_Failed;

    procedure Get_Acceleration_Structure_Opaque_Capture_Descriptor_Data
        (Device: in Vulkan.Device;
         Info: in EXT.Acceleration_Structure_Capture_Descriptor_Data_Info;
         Data: in Interfaces.C.Extensions.void_ptr)
        with Pre => Device /= No_Device and
                    (Info.Acceleration_Structure /=
                        KHR.No_Acceleration_Structure xor
                     Info.Acceleration_Structure_NV /=
                        NV.No_Acceleration_Structure) and
                    Data /= System.Null_Address;
end Vulkan.Extensions.EXT_Descriptor_Buffer;

