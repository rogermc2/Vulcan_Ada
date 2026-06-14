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

-- C interface for AMD records

with Vulkan.C;
with Vulkan.C_Arrays;
with Vulkan.Extensions.AMD;

private package Vulkan.C_AMD is
    -- Extension record identifiers.
    subtype Structure is Structure_Type
        with Static_Predicate => Structure in
            Attachment_Sample_Count_Info_Type |
            Pipeline_Rasterization_State_Rasterization_Order_Type |
            Texture_LOD_Gather_Format_Properties_Type |
            Physical_Device_Shader_Core_Properties_Type |
            Device_Memory_Overallocation_Create_Info_Type |
            Display_Native_HDR_Surface_Capabilities_Type |
            Swapchain_Display_Native_HDR_Create_Info_Type |
            Physical_Device_Shader_Core_Properties_2_Type |
            Physical_Device_Coherent_Memory_Features_Type |
            Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_Type;

    subtype Out_Structure is Structure
        with Static_Predicate => Out_Structure in Out_Structure_Type;

    subtype In_Structure is Structure
        with Static_Predicate => In_Structure not in Out_Structure;

    -- C interface records.
    package Sample_Count_Flags_Arrays is new C_Arrays(Sample_Count_Flags);

    type Attachment_Sample_Count_Info_C is
    record
        Record_Type: In_Structure_Type := Attachment_Sample_Count_Info_Type;
        Next: C.In_Structure_C_Access;
        Color_Attachment_Count: Interfaces.Unsigned_32;
        Color_Attachment_Samples: Sample_Count_Flags_Arrays.Pointer;
        Depth_Stencil_Attachment_Samples: Sample_Count_Flags;
    end record
        with Convention => C;

    type Attachment_Sample_Count_Info_C_Access is
        access Attachment_Sample_Count_Info_C
        with Convention => C;

    type Pipeline_Rasterization_State_Rasterization_Order_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Rasterization_State_Rasterization_Order_Type;
        Next: C.In_Structure_C_Access;
        Rasterization_Order: Extensions.AMD.Rasterization_Order;
    end record
        with Convention => C;

    type Pipeline_Rasterization_State_Rasterization_Order_C_Access is
        access Pipeline_Rasterization_State_Rasterization_Order_C
        with Convention => C;

    type Texture_LOD_Gather_Format_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Texture_LOD_Gather_Format_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Supports_Texture_Gather_LOD_Bias: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Texture_LOD_Gather_Format_Properties_C_Access is
        access Texture_LOD_Gather_Format_Properties_C
        with Convention => C;

    type Swapchain_Display_Native_HDR_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Swapchain_Display_Native_HDR_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Local_Dimming_Enable: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Swapchain_Display_Native_HDR_Create_Info_C_Access is
        access Swapchain_Display_Native_HDR_Create_Info_C
        with Convention => C;

    type Physical_Device_Shader_Core_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Shader_Core_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Shader_Engine_Count: Interfaces.Unsigned_32;
        Shader_Arrays_Per_Engine_Count: Interfaces.Unsigned_32;
        Compute_Units_Per_Shader_Array: Interfaces.Unsigned_32;
        SIMD_Per_Compute_Unit: Interfaces.Unsigned_32;
        Wave_Fronts_Per_SIMD: Interfaces.Unsigned_32;
        Wave_Front_Size: Interfaces.Unsigned_32;
        SGPRs_Per_SIMD: Interfaces.Unsigned_32;
        Min_SGPR_Allocation: Interfaces.Unsigned_32;
        Max_SGPR_Allocation: Interfaces.Unsigned_32;
        SGPR_Allocation_Granularity: Interfaces.Unsigned_32;
        VGPRs_Per_SIMD: Interfaces.Unsigned_32;
        Min_VGPR_Allocation: Interfaces.Unsigned_32;
        Max_VGPR_Allocation: Interfaces.Unsigned_32;
        VGPR_Allocation_Granularity: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Shader_Core_Properties_C_Access is
        access Physical_Device_Shader_Core_Properties_C
        with Convention => C;

    type Device_Memory_Overallocation_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Device_Memory_Overallocation_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Overallocation_Behavior: Extensions.AMD.Memory_Overallocation_Behavior;
    end record
        with Convention => C;

    type Device_Memory_Overallocation_Create_Info_C_Access is
        access Device_Memory_Overallocation_Create_Info_C
        with Convention => C;

    type Display_Native_HDR_Surface_Capabilities_C is
    record
        Record_Type: Out_Structure_Type :=
            Display_Native_HDR_Surface_Capabilities_Type;
        Next: C.Out_Structure_C_Access;
        Local_Dimming_Support: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Display_Native_HDR_Surface_Capabilities_C_Access is
        access Display_Native_HDR_Surface_Capabilities_C
        with Convention => C;

    type Physical_Device_Shader_Core_Properties_2_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Shader_Core_Properties_2_Type;
        Next: C.Out_Structure_C_Access;
        Shader_Core_Features: Extensions.AMD.Shader_Core_Properties_Flags;
        Active_Compute_Unit_Count: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Shader_Core_Properties_2_C_Access is
        access Physical_Device_Shader_Core_Properties_2_C
        with Convention => C;

    type Physical_Device_Coherent_Memory_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Coherent_Memory_Features_Type;
        Next: C.Out_Structure_C_Access;
        Device_Coherent_Memory: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Coherent_Memory_Features_C_Access is
        access Physical_Device_Coherent_Memory_Features_C
        with Convention => C;

    type Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_Type;
        Next: C.Out_Structure_C_Access;
        Shader_Early_And_Late_Fragment_Tests: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_C_Access
       is access Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_C
        with Convention => C;

    -- Conversion subprograms.
    function To_C(Struct: in Extensions.AMD.Attachment_Sample_Count_Info)
        return Attachment_Sample_Count_Info_C;
    procedure Free(Struct: in out Attachment_Sample_Count_Info_C);

    function To_C
        (Struct:
            in Extensions.AMD.Pipeline_Rasterization_State_Rasterization_Order)
        return Pipeline_Rasterization_State_Rasterization_Order_C;
    procedure Free
        (Struct: in out Pipeline_Rasterization_State_Rasterization_Order_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.AMD.Texture_LOD_Gather_Format_Properties;
         C_Struct: in Texture_LOD_Gather_Format_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.AMD.Physical_Device_Shader_Core_Properties;
         C_Struct: in Physical_Device_Shader_Core_Properties_C);

    function To_C
        (Struct: in Extensions.AMD.Device_Memory_Overallocation_Create_Info)
        return Device_Memory_Overallocation_Create_Info_C;
    procedure Free(Struct: in out Device_Memory_Overallocation_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.AMD.Display_Native_HDR_Surface_Capabilities;
         C_Struct: in Display_Native_HDR_Surface_Capabilities_C);

    function To_C
        (Struct: in Extensions.AMD.Swapchain_Display_Native_HDR_Create_Info)
        return Swapchain_Display_Native_HDR_Create_Info_C;
    procedure Free(Struct: in out Swapchain_Display_Native_HDR_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.AMD.Physical_Device_Shader_Core_Properties_2;
         C_Struct: in Physical_Device_Shader_Core_Properties_2_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.AMD.Physical_Device_Coherent_Memory_Features;
         C_Struct: in Physical_Device_Coherent_Memory_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
   Extensions.AMD.Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features;
         C_Struct: in
            Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_C);

    -- Extension record conversion.
    function To_C(Next: in In_Structure_Access) return C.In_Structure_C_Access;
    function To_C(Next: in Out_Structure_Access)
        return C.Out_Structure_C_Access;
    procedure To_Ada(Ada_Struct: in out Vulkan.Out_Structure'Class;
                     Next: in C.Out_Structure_C_Access);
    procedure Free(Next: in out C.In_Structure_C_Access);
    procedure Free(Next: in out C.Out_Structure_C_Access);
end Vulkan.C_AMD;

