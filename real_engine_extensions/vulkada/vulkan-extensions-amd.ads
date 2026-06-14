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

-- AMD extensions root package

package Vulkan.Extensions.AMD is
    -- Enumerations.
    type Rasterization_Order is (Strict,
                                 Relaxed)
        with Convention => C;

    for Rasterization_Order'Size use 32;

    for Rasterization_Order use (Strict => 0,
                                 Relaxed => 1);

    type Shader_Info_Type is (Statistics,
                              Binary,
                              Disassembly)
        with Convention => C;

    for Shader_Info_Type'Size use 32;

    for Shader_Info_Type use (Statistics => 0,
                              Binary => 1,
                              Disassembly => 2);

    type Memory_Overallocation_Behavior is (Default,
                                            Allowed,
                                            Disallowed)
        with Convention => C;

    for Memory_Overallocation_Behavior'Size use 32;

    for Memory_Overallocation_Behavior use (Default => 0,
                                            Allowed => 1,
                                            Disallowed => 2);
    -- Bitfields.
    type Shader_Core_Properties_Flags is new Flags;

    Shader_Core_Properties_No_Bit: constant Shader_Core_Properties_Flags := 0;

    -- Records.
    package Sample_Count_Flags_Vectors is new Ada.Containers.Vectors
        (Positive, Sample_Count_Flags);

    type Attachment_Sample_Count_Info is new In_Structure
        (Attachment_Sample_Count_Info_Type) with
    record
        Color_Attachment_Samples: Sample_Count_Flags_Vectors.Vector;
        Depth_Stencil_Attachment_Samples: Sample_Count_Flags :=
            Sample_Count_No_Bit;
    end record;

    type Pipeline_Rasterization_State_Rasterization_Order is new In_Structure
        (Pipeline_Rasterization_State_Rasterization_Order_Type) with
    record
        Rasterization_Order: AMD.Rasterization_Order;
    end record;

    type Texture_LOD_Gather_Format_Properties is new Out_Structure
        (Texture_LOD_Gather_Format_Properties_Type) with
    record
        Supports_Texture_Gather_LOD_Bias: Boolean;
    end record;

    type Shader_Resource_Usage is
    record
        Num_Used_Vgprs: Interfaces.Unsigned_32;
        Num_Used_Sgprs: Interfaces.Unsigned_32;
        LDS_Size_Per_Local_Work_Group: Interfaces.Unsigned_32;
        LDS_Usage_Size_In_Bytes: Interfaces.C.size_t;
        Scratch_Mem_Usage_In_Bytes: Interfaces.C.size_t;
    end record
        with Convention => C;

    type Compute_Work_Group_Size_Array is
        array (1 .. 3) of Interfaces.Unsigned_32
        with Convention => C;

    type Shader_Statistics_Info is
    record
        Shader_Stage_Mask: Shader_Stage_Flags := Shader_Stage_No_Bit;
        Resource_Usage: Shader_Resource_Usage;
        Num_Physical_Vgprs: Interfaces.Unsigned_32;
        Num_Physical_Sgprs: Interfaces.Unsigned_32;
        Num_Available_Vgprs: Interfaces.Unsigned_32;
        Num_Available_Sgprs: Interfaces.Unsigned_32;
        Compute_Work_Group_Size: Compute_Work_Group_Size_Array;
    end record
        with Convention => C;

    type Physical_Device_Shader_Core_Properties is new Out_Structure
        (Physical_Device_Shader_Core_Properties_Type) with
    record
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
    end record;

    type Device_Memory_Overallocation_Create_Info is new In_Structure
        (Device_Memory_Overallocation_Create_Info_Type) with
    record
        Overallocation_Behavior: Memory_Overallocation_Behavior;
    end record;

    type Display_Native_HDR_Surface_Capabilities is new Out_Structure
        (Display_Native_HDR_Surface_Capabilities_Type) with
    record
        Local_Dimming_Support: Boolean;
    end record;

    type Swapchain_Display_Native_HDR_Create_Info is new In_Structure
        (Swapchain_Display_Native_HDR_Create_Info_Type) with
    record
        Local_Dimming_Enable: Boolean;
    end record;

    type Physical_Device_Shader_Core_Properties_2 is new Out_Structure
        (Physical_Device_Shader_Core_Properties_2_Type) with
    record
        Shader_Core_Features: Shader_Core_Properties_Flags :=
            Shader_Core_Properties_No_Bit;
        Active_Compute_Unit_Count: Interfaces.Unsigned_32;
    end record;

    type Physical_Device_Coherent_Memory_Features is new Out_Structure
        (Physical_Device_Coherent_Memory_Features_Type) with
    record
        Device_Coherent_Memory: Boolean;
    end record;

    type Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features is
        new Out_Structure
            (Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_Type)
        with
    record
        Shader_Early_And_Late_Fragment_Tests: Boolean;
    end record;
end Vulkan.Extensions.AMD;

