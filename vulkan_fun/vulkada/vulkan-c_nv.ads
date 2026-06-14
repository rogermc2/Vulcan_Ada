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

-- C interface for NV records

with Interfaces.C.Strings;
with Vulkan.C;
with Vulkan.C_KHR;
with Vulkan.C_Arrays;
with Vulkan.Extensions.NV;
with Vulkan.Extensions.KHR;

private package Vulkan.C_NV is
    -- Extension record identifiers.
    subtype Structure is Structure_Type
        with Static_Predicate => Structure in
            Dedicated_Allocation_Image_Create_Info_Type |
            Dedicated_Allocation_Buffer_Create_Info_Type |
            Dedicated_Allocation_Memory_Allocate_Info_Type |
            Physical_Device_Corner_Sampled_Image_Features_Type |
            Pipeline_Viewport_W_Scaling_State_Create_Info_Type |
            Pipeline_Viewport_Swizzle_State_Create_Info_Type |
            Pipeline_Coverage_To_Color_State_Create_Info_Type |
            Pipeline_Coverage_Modulation_State_Create_Info_Type |
            Physical_Device_Shader_SM_Builtins_Properties_Type |
            Physical_Device_Shader_SM_Builtins_Features_Type |
            Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_Type |
            Physical_Device_Shading_Rate_Image_Features_Type |
            Physical_Device_Shading_Rate_Image_Properties_Type |
            Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_Type |
            Physical_Device_Representative_Fragment_Test_Features_Type |
            Pipeline_Representative_Fragment_Test_State_Create_Info_Type |
            Physical_Device_Mesh_Shader_Features_Type |
            Physical_Device_Mesh_Shader_Properties_Type |
            Physical_Device_Shader_Image_Footprint_Features_Type |
            Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_Type |
            Physical_Device_Exclusive_Scissor_Features_Type |
            Queue_Family_Checkpoint_Properties_Type |
            Checkpoint_Data_Type |
            Queue_Family_Checkpoint_Properties_2_Type |
            Checkpoint_Data_2_Type |
            Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_Type |
            Cooperative_Matrix_Properties_NV_Type |
            Physical_Device_Cooperative_Matrix_Features_NV_Type |
            Physical_Device_Cooperative_Matrix_Properties_NV_Type |
            Physical_Device_Coverage_Reduction_Mode_Features_Type |
            Pipeline_Coverage_Reduction_State_Create_Info_Type |
            Framebuffer_Mixed_Samples_Combination_Type |
            Physical_Device_Device_Generated_Commands_Properties_Type |
            Physical_Device_Device_Generated_Commands_Features_Type |
            Graphics_Shader_Group_Create_Info_Type |
            Graphics_Pipeline_Shader_Groups_Create_Info_Type |
            Indirect_Commands_Layout_Token_Type |
            Indirect_Commands_Layout_Create_Info_Type |
            Generated_Commands_Info_Type |
            Generated_Commands_Memory_Requirements_Info_Type |
            Physical_Device_Inherited_Viewport_Scissor_Features_Type |
            Command_Buffer_Inheritance_Viewport_Scissor_Info_Type |
            Physical_Device_Present_Barrier_Features_Type |
            Surface_Capabilities_Present_Barrier_Type |
            Swapchain_Present_Barrier_Create_Info_Type |
            Physical_Device_Diagnostics_Config_Features_Type |
            Device_Diagnostics_Config_Create_Info_Type |
            CUDA_Module_Create_Info_Type |
            CUDA_Function_Create_Info_Type |
            CUDA_Launch_Info_Type |
            Physical_Device_CUDA_Kernel_Launch_Features_Type |
            Physical_Device_CUDA_Kernel_Launch_Properties_Type |
            Query_Low_Latency_Support_Type |
            Physical_Device_Fragment_Shading_Rate_Enums_Features_Type |
            Physical_Device_Fragment_Shading_Rate_Enums_Properties_Type |
            Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_Type |
            Acceleration_Structure_Geometry_Motion_Triangles_Data_Type |
            Acceleration_Structure_Motion_Info_Type |
            Physical_Device_Ray_Tracing_Motion_Blur_Features_Type |
            Memory_Get_Remote_Address_Info_Type |
            Physical_Device_External_Memory_RDMA_Features_Type;

    subtype Out_Structure is Structure
        with Static_Predicate => Out_Structure in Out_Structure_Type;

    subtype In_Structure is Structure
        with Static_Predicate => In_Structure not in Out_Structure;

    -- C interface records.
    type Dedicated_Allocation_Image_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Dedicated_Allocation_Image_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Dedicated_Allocation: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Dedicated_Allocation_Image_Create_Info_C_Access is
        access Dedicated_Allocation_Image_Create_Info_C
        with Convention => C;

    type Dedicated_Allocation_Buffer_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Dedicated_Allocation_Buffer_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Dedicated_Allocation: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Dedicated_Allocation_Buffer_Create_Info_C_Access is
        access Dedicated_Allocation_Buffer_Create_Info_C
        with Convention => C;

    type Dedicated_Allocation_Memory_Allocate_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Dedicated_Allocation_Memory_Allocate_Info_Type;
        Next: C.In_Structure_C_Access;
        Image: Vulkan.Image;
        Buffer: Vulkan.Buffer;
    end record
        with Convention => C;

    type Dedicated_Allocation_Memory_Allocate_Info_C_Access is
        access Dedicated_Allocation_Memory_Allocate_Info_C
        with Convention => C;

    type Physical_Device_Corner_Sampled_Image_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Corner_Sampled_Image_Features_Type;
        Next: C.Out_Structure_C_Access;
        Corner_Sampled_Image: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Corner_Sampled_Image_Features_C_Access is
        access Physical_Device_Corner_Sampled_Image_Features_C
        with Convention => C;

    package Viewport_W_Scaling_Arrays is
        new C_Arrays(Extensions.NV.Viewport_W_Scaling);

    type Pipeline_Viewport_W_Scaling_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Viewport_W_Scaling_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Viewport_W_Scaling_Enable: Interfaces.Unsigned_32;
        Viewport_Count: Interfaces.Unsigned_32;
        Viewport_W_Scalings: Viewport_W_Scaling_Arrays.Pointer;
    end record
        with Convention => C;

    type Pipeline_Viewport_W_Scaling_State_Create_Info_C_Access is
        access Pipeline_Viewport_W_Scaling_State_Create_Info_C
        with Convention => C;

    package Viewport_Swizzle_Arrays is
        new C_Arrays(Extensions.NV.Viewport_Swizzle);

    type Pipeline_Viewport_Swizzle_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Viewport_Swizzle_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.NV.Pipeline_Viewport_Swizzle_State_Create_Flags;
        Viewport_Count: Interfaces.Unsigned_32;
        Viewport_Swizzles: Viewport_Swizzle_Arrays.Pointer;
    end record
        with Convention => C;

    type Pipeline_Viewport_Swizzle_State_Create_Info_C_Access is
        access Pipeline_Viewport_Swizzle_State_Create_Info_C
        with Convention => C;

    type Pipeline_Coverage_To_Color_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Coverage_To_Color_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.NV.Pipeline_Coverage_To_Color_State_Create_Flags;
        Coverage_To_Color_Enable: Interfaces.Unsigned_32;
        COverage_To_Color_Location: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Pipeline_Coverage_To_Color_State_Create_Info_C_Access is
        access Pipeline_Coverage_To_Color_State_Create_Info_C
        with Convention => C;

    type Pipeline_Coverage_Modulation_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Coverage_Modulation_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.NV.Pipeline_Coverage_Modulation_State_Create_Flags;
        Coverage_Modulation_Mode: Extensions.NV.Coverage_Modulation_Mode;
        Coverage_Modulation_Table_Enable: Interfaces.Unsigned_32;
        Coverage_Modulation_Table_Count: Interfaces.Unsigned_32;
        Coverage_Modulation_Table: C.Float_Arrays.Pointer;
    end record
        with Convention => C;

    type Pipeline_Coverage_Modulation_State_Create_Info_C_Access is
        access Pipeline_Coverage_Modulation_State_Create_Info_C
        with Convention => C;

    type Physical_Device_Shader_SM_Builtins_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Shader_SM_Builtins_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Shader_SM_Count: Interfaces.Unsigned_32;
        Shader_Warps_Per_SM: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Shader_SM_Builtins_Properties_C_Access is
        access Physical_Device_Shader_SM_Builtins_Properties_C
        with Convention => C;

    type Physical_Device_Shader_SM_Builtins_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Shader_SM_Builtins_Features_Type;
        Next: C.Out_Structure_C_Access;
        Shader_SM_Builtins: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Shader_SM_Builtins_Features_C_Access is
        access Physical_Device_Shader_SM_Builtins_Features_C
        with Convention => C;

    package Shading_Rate_Palette_Entry_Arrays is
        new C_Arrays(Extensions.NV.Shading_Rate_Palette_Entry);

    type Shading_Rate_Palette_C is
    record
        Shading_Rate_Palette_Entry_Count: Interfaces.Unsigned_32;
        Shading_Rate_Palette_Entries: Shading_Rate_Palette_Entry_Arrays.Pointer;
    end record
        with Convention => C;

    package Shading_Rate_Palette_C_Arrays is
        new C_Arrays(Shading_Rate_Palette_C);

    type Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Shading_Rate_Image_Enable: Interfaces.Unsigned_32;
        Viewport_Count: Interfaces.Unsigned_32;
        Shading_Rate_Palettes: Shading_Rate_Palette_C_Arrays.Pointer;
    end record
        with Convention => C;

    type Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_C_Access is
        access Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_C
        with Convention => C;

    type Physical_Device_Shading_Rate_Image_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Shading_Rate_Image_Features_Type;
        Next: C.Out_Structure_C_Access;
        Shading_Rate_Image: Interfaces.Unsigned_32;
        Shading_Rate_Coarse_Sample_Order: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Shading_Rate_Image_Features_C_Access is
        access Physical_Device_Shading_Rate_Image_Features_C
        with Convention => C;

    type Physical_Device_Shading_Rate_Image_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Shading_Rate_Image_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Shading_Rate_Texel_Size: Extent_2D;
        Shading_Rate_Palette_Size: Interfaces.Unsigned_32;
        Shading_Rate_Max_Coarse_Samples: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Shading_Rate_Image_Properties_C_Access is
        access Physical_Device_Shading_Rate_Image_Properties_C
        with Convention => C;

    package Coarse_Sample_Location_Arrays is
        new C_Arrays(Extensions.NV.Coarse_Sample_Location);

    type Coarse_Sample_Order_Custom_C is
    record
        Shading_Rate: Extensions.NV.Shading_Rate_Palette_Entry;
        Sample_Count: Interfaces.Unsigned_32;
        Sample_Location_Count: Interfaces.Unsigned_32;
        Sample_Locations: Coarse_Sample_Location_Arrays.Pointer;
    end record
        with Convention => C;

    package Coarse_Sample_Order_Custom_C_Arrays is
        new C_Arrays(Coarse_Sample_Order_Custom_C);

    type Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Sample_Order_Type: Extensions.NV.Coarse_Sample_Order_Type;
        Custom_Sample_Order_Count: Interfaces.Unsigned_32;
        Custom_Sample_Orders: Coarse_Sample_Order_Custom_C_Arrays.Pointer;
    end record
        with Convention => C;

    type Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_C_Access is
        access Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_C
        with Convention => C;

    type Physical_Device_Representative_Fragment_Test_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Representative_Fragment_Test_Features_Type;
        Next: C.Out_Structure_C_Access;
        Representative_Fragment_Test: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Representative_Fragment_Test_Features_C_Access is
        access Physical_Device_Representative_Fragment_Test_Features_C
        with Convention => C;

    type Pipeline_Representative_Fragment_Test_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Representative_Fragment_Test_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Representative_Fragment_Test_Enable: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Pipeline_Representative_Fragment_Test_State_Create_Info_C_Access is
        access Pipeline_Representative_Fragment_Test_State_Create_Info_C
        with Convention => C;

    type Physical_Device_Mesh_Shader_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Mesh_Shader_Features_Type;
        Next: C.Out_Structure_C_Access;
        Task_Shader: Interfaces.Unsigned_32;
        Mesh_Shader: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Mesh_Shader_Features_C_Access is
        access Physical_Device_Mesh_Shader_Features_C
        with Convention => C;

    type Physical_Device_Mesh_Shader_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Mesh_Shader_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Max_Draw_Mesh_Tasks_Count: Interfaces.Unsigned_32;
        Max_Task_Work_Group_Invocations: Interfaces.Unsigned_32;
        Max_Task_Work_Group_Size: Extensions.NV.Work_Group_Size_Array;
        Max_Task_Total_Memory_Size: Interfaces.Unsigned_32;
        Max_Task_Output_Count: Interfaces.Unsigned_32;
        Max_Mesh_Work_Group_Invocations: Interfaces.Unsigned_32;
        Max_Mesh_Work_Group_Size: Extensions.NV.Work_Group_Size_Array;
        Max_Mesh_Total_Memory_Size: Interfaces.Unsigned_32;
        Max_Mesh_Output_Vertices: Interfaces.Unsigned_32;
        Max_Mesh_Output_Primitives: Interfaces.Unsigned_32;
        Max_Mesh_Multiview_View_Count: Interfaces.Unsigned_32;
        Mesh_Output_Per_Vertex_Granularity: Interfaces.Unsigned_32;
        Mesh_Output_Per_Primitive_Granularity: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Mesh_Shader_Properties_C_Access is
        access Physical_Device_Mesh_Shader_Properties_C
        with Convention => C;

    type Physical_Device_Shader_Image_Footprint_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Shader_Image_Footprint_Features_Type;
        Next: C.Out_Structure_C_Access;
        Image_Footprint: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Shader_Image_Footprint_Features_C_Access is
        access Physical_Device_Shader_Image_Footprint_Features_C
        with Convention => C;

    type Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Exclusive_Scissor_Count: Interfaces.Unsigned_32;
        Exclusive_Scissors: C.Rect_2D_Arrays.Pointer;
    end record
        with Convention => C;

    type Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_C_Access is
        access Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_C
        with Convention => C;

    type Physical_Device_Exclusive_Scissor_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Exclusive_Scissor_Features_Type;
        Next: C.Out_Structure_C_Access;
        Exclusive_Scissor: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Exclusive_Scissor_Features_C_Access is
        access Physical_Device_Exclusive_Scissor_Features_C
        with Convention => C;

    type Queue_Family_Checkpoint_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Queue_Family_Checkpoint_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Checkpoint_Execution_Stage_Mask: Pipeline_Stage_Flags;
    end record
        with Convention => C;

    type Queue_Family_Checkpoint_Properties_C_Access is
        access Queue_Family_Checkpoint_Properties_C
        with Convention => C;

    type Checkpoint_Data_C is
    record
        Record_Type: Out_Structure_Type := Checkpoint_Data_Type;
        Next: C.Out_Structure_C_Access;
        Stage: Pipeline_Stage_Flags;
        Checkpoint_Marker: Interfaces.C.Extensions.void_ptr;
    end record
        with Convention => C;

    type Checkpoint_Data_C_Access is access Checkpoint_Data_C
        with Convention => C;

    type Queue_Family_Checkpoint_Properties_2_C is
    record
        Record_Type: Out_Structure_Type :=
            Queue_Family_Checkpoint_Properties_2_Type;
        Next: C.Out_Structure_C_Access;
        Checkpoint_Execution_Stage_Mask: Pipeline_Stage_Flags_2;
    end record
        with Convention => C;

    type Queue_Family_Checkpoint_Properties_2_C_Access is
        access Queue_Family_Checkpoint_Properties_2_C
    with Convention => C;

    type Checkpoint_Data_2_C is
    record
        Record_Type: Out_Structure_Type := Checkpoint_Data_2_Type;
        Next: C.Out_Structure_C_Access;
        Stage: Pipeline_Stage_Flags_2;
        Checkpoint_Marker: Interfaces.C.Extensions.void_ptr;
    end record
        with Convention => C;

    type Checkpoint_Data_2_C_Access is access Checkpoint_Data_2_C
        with Convention => C;

    type Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_Type;
        Next: C.Out_Structure_C_Access;
        Dedicated_Allocation_Image_Aliasing: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type
        Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_C_Access is
        access Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_C
        with Convention => C;

    type Cooperative_Matrix_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Cooperative_Matrix_Properties_NV_Type;
        Next: C.Out_Structure_C_Access;
        M_Size: Interfaces.Unsigned_32;
        N_Size: Interfaces.Unsigned_32;
        K_Size: Interfaces.Unsigned_32;
        A_Type: Extensions.KHR.Component_Type;
        B_Type: Extensions.KHR.Component_Type;
        C_Type: Extensions.KHR.Component_Type;
        D_Type: Extensions.KHR.Component_Type;
        Scope: Extensions.KHR.Scope;
    end record
        with Convention => C;

    type Cooperative_Matrix_Properties_C_Access is
        access Cooperative_Matrix_Properties_C
        with Convention => C;

    type Physical_Device_Cooperative_Matrix_Features_C is
    record
        Record_Type: Out_Structure_Type := 
            Physical_Device_Cooperative_Matrix_Features_NV_Type;
        Next: C.Out_Structure_C_Access;
        Cooperative_Matrix: Interfaces.Unsigned_32;
        Cooperative_Matrix_Robust_Buffer_Access: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Cooperative_Matrix_Features_C_Access is
        access Physical_Device_Cooperative_Matrix_Features_C
        with Convention => C;

    type Physical_Device_Cooperative_Matrix_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Cooperative_Matrix_Properties_NV_Type;
        Next: C.Out_Structure_C_Access;
        Cooperative_Matrix_Supported_Stages: Shader_Stage_Flags;
    end record
        with Convention => C;

    type Physical_Device_Cooperative_Matrix_Properties_C_Access is
        access Physical_Device_Cooperative_Matrix_Properties_C
        with Convention => C;

    type Physical_Device_Coverage_Reduction_Mode_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Coverage_Reduction_Mode_Features_Type;
        Next: C.Out_Structure_C_Access;
        Coverage_Reduction_Mode: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Coverage_Reduction_Mode_Features_C_Access is
        access Physical_Device_Coverage_Reduction_Mode_Features_C
        with Convention => C;

    type Pipeline_Coverage_Reduction_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Coverage_Reduction_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.NV.Pipeline_Coverage_Reduction_State_Create_Flags;
        Coverage_Reduction_Mode: Extensions.NV.Coverage_Reduction_Mode;
    end record
        with Convention => C;

    type Pipeline_Coverage_Reduction_State_Create_Info_C_Access is
        access Pipeline_Coverage_Reduction_State_Create_Info_C
        with Convention => C;

    type Framebuffer_Mixed_Samples_Combination_C is
    record
        Record_Type: Out_Structure_Type :=
            Framebuffer_Mixed_Samples_Combination_Type;
        Next: C.Out_Structure_C_Access;
        Coverage_Reduction_Mode: Extensions.NV.Coverage_Reduction_Mode;
        Rasterization_Samples: Sample_Count_Flags;
        Depth_Stencil_Samples: Sample_Count_Flags;
        Color_Samples: Sample_Count_Flags;
    end record
        with Convention => C;

    type Framebuffer_Mixed_Samples_Combination_C_Access is
        access Framebuffer_Mixed_Samples_Combination_C
        with Convention => C;

    type Physical_Device_Device_Generated_Commands_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Device_Generated_Commands_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Max_Graphics_Shader_Group_Count: Interfaces.Unsigned_32;
        Max_Indirect_Sequence_Count: Interfaces.Unsigned_32;
        Max_Indirect_Commands_Token_Count: Interfaces.Unsigned_32;
        Max_Indirect_Commands_Stream_Count: Interfaces.Unsigned_32;
        Max_Indirect_Commands_Token_Offset: Interfaces.Unsigned_32;
        Max_Indirect_Commands_Stream_Stride: Interfaces.Unsigned_32;
        Min_Sequences_Count_Buffer_Offset_Alignment: Interfaces.Unsigned_32;
        Min_Sequences_Index_Buffer_Offset_Alignment: Interfaces.Unsigned_32;
        Min_Indirect_Commands_Buffer_Offset_Alignment: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Device_Generated_Commands_Properties_C_Access is
        access Physical_Device_Device_Generated_Commands_Properties_C
        with Convention => C;

    type Physical_Device_Device_Generated_Commands_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Device_Generated_Commands_Features_Type;
        Next: C.Out_Structure_C_Access;
        Device_Generated_Commands: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Device_Generated_Commands_Features_C_Access is
        access Physical_Device_Device_Generated_Commands_Features_C
        with Convention => C;

    type Graphics_Shader_Group_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Graphics_Shader_Group_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Stage_Count: Interfaces.Unsigned_32;
        Stages: C.Pipeline_Shader_Stage_Create_Info_C_Arrays.Pointer;
        Vertex_Input_State: C.Pipeline_Vertex_Input_State_Create_Info_C_Access;
        Tessellation_State: C.Pipeline_Tessellation_State_Create_Info_C_Access;
    end record
        with Convention => C;

    type Graphics_Shader_Group_Create_Info_C_Access is
        access Graphics_Shader_Group_Create_Info_C
        with Convention => C;

    package Graphics_Shader_Group_Create_Info_C_Arrays is
        new C_Arrays(Graphics_Shader_Group_Create_Info_C);

    type Graphics_Pipeline_Shader_Groups_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Graphics_Pipeline_Shader_Groups_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Group_Count: Interfaces.Unsigned_32;
        Groups: Graphics_Shader_Group_Create_Info_C_Arrays.Pointer;
        Pipeline_Count: Interfaces.Unsigned_32;
        Pipelines: C_KHR.Pipeline_Arrays.Pointer;
    end record
        with Convention => C;

    type Graphics_Pipeline_Shader_Groups_Create_Info_C_Access is
        access Graphics_Pipeline_Shader_Groups_Create_Info_C
        with Convention => C;

    package Index_Type_Arrays is new C_Arrays(Index_Type);

    type Indirect_Commands_Layout_Token_C is
    record
        Record_Type: In_Structure_Type := Indirect_Commands_Layout_Token_Type;
        Next: C.In_Structure_C_Access;
        Token_Type: Extensions.NV.Indirect_Commands_Token_Type;
        Stream: Interfaces.Unsigned_32;
        Offset: Interfaces.Unsigned_32;
        Vertex_Binding_Unit: Interfaces.Unsigned_32;
        Vertex_Dynamic_Stride: Interfaces.Unsigned_32;
        Push_Constant_Pipeline_Layout: Pipeline_Layout;
        Push_Constant_Shader_Stage_Flags: Shader_Stage_Flags;
        Push_Constant_Offset: Interfaces.Unsigned_32;
        Push_Constant_Size: Interfaces.Unsigned_32;
        Indirect_State_Flags: Extensions.NV.Indirect_State_Flags;
        Index_Type_Count: Interfaces.Unsigned_32;
        Index_Types: Index_Type_Arrays.Pointer;
        Index_Type_Values: C.Uint32_t_Arrays.Pointer;
    end record
        with Convention => C;

    type Indirect_Commands_Layout_Token_C_Access is
        access Indirect_Commands_Layout_Token_C
        with Convention => C;

    package Indirect_Commands_Layout_Token_C_Arrays is
        new C_Arrays(Indirect_Commands_Layout_Token_C);

    type Indirect_Commands_Layout_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Indirect_Commands_Layout_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.NV.Indirect_Commands_Layout_Usage_Flags;
        Pipeline_Bind_Point: Vulkan.Pipeline_Bind_Point;
        Token_Count: Interfaces.Unsigned_32;
        Tokens: Indirect_Commands_Layout_Token_C_Arrays.Pointer;
        Stream_Count: Interfaces.Unsigned_32;
        Stream_Strides: C.UInt32_t_Arrays.Pointer;
    end record
        with Convention => C;

    type Indirect_Commands_Layout_Create_Info_C_Access is
        access Indirect_Commands_Layout_Create_Info_C
        with Convention => C;

    package Indirect_Commands_Stream_Arrays is
        new C_Arrays(Extensions.NV.Indirect_Commands_Stream);

    type Generated_Commands_Info_C is
    record
        Record_Type: In_Structure_Type := Generated_Commands_Info_Type;
        Next: C.In_Structure_C_Access;
        Pipeline_Bind_Point: Vulkan.Pipeline_Bind_Point;
        Pipeline: Vulkan.Pipeline;
        Indirect_Commands_Layout: Extensions.NV.Indirect_Commands_Layout;
        Stream_Count: Interfaces.Unsigned_32;
        Streams: Indirect_Commands_Stream_Arrays.Pointer;
        Sequences_Count: Interfaces.Unsigned_32;
        Preprocess_Buffer: Buffer;
        Preprocess_Offset: Device_Size;
        Preprocess_Size: Device_Size;
        Sequences_Count_Buffer: Buffer;
        Sequences_Count_Offset: Device_Size;
        Sequences_Index_Buffer: Buffer;
        Sequences_Index_Offset: Device_Size;
    end record
        with Convention => C;

    type Generated_Commands_Info_C_Access is access Generated_Commands_Info_C
        with Convention => C;

    type Generated_Commands_Memory_Requirements_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Generated_Commands_Memory_Requirements_Info_Type;
        Next: C.In_Structure_C_Access;
        Pipeline_Bind_Point: Vulkan.Pipeline_Bind_Point;
        Pipeline: Vulkan.Pipeline;
        Indirect_Commands_Layout: Extensions.NV.Indirect_Commands_Layout;
        Max_Sequences_Count: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Generated_Commands_Memory_Requirements_Info_C_Access is
        access Generated_Commands_Memory_Requirements_Info_C
        with Convention => C;

    type Physical_Device_Inherited_Viewport_Scissor_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Inherited_Viewport_Scissor_Features_Type;
        Next: C.Out_Structure_C_Access;
        Inherited_Viewport_Scissor_2D: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Inherited_Viewport_Scissor_Features_C_Access is
        access Physical_Device_Inherited_Viewport_Scissor_Features_C
        with Convention => C;

    type Command_Buffer_Inheritance_Viewport_Scissor_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Command_Buffer_Inheritance_Viewport_Scissor_Info_Type;
        Next: C.In_Structure_C_Access;
        Viewport_Scissor_2D: Interfaces.Unsigned_32;
        Viewport_Depth_Count: Interfaces.Unsigned_32;
        Viewport_Depths: C.Viewport_Arrays.Pointer;
    end record
        with Convention => C;

    type Command_Buffer_Inheritance_Viewport_Scissor_Info_C_Access is
        access Command_Buffer_Inheritance_Viewport_Scissor_Info_C
        with Convention => C;

    type Physical_Device_Present_Barrier_Features_C is
    record
        Record_Type: Out_Structure_Type := 
            Physical_Device_Present_Barrier_Features_Type;
        Next: C.Out_Structure_C_Access;
        Present_Barrier: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Present_Barrier_Features_C_Access is
        access Physical_Device_Present_Barrier_Features_C
        with Convention => C;

    type Surface_Capabilities_Present_Barrier_C is
    record
        Record_Type: Out_Structure_Type :=
            Surface_Capabilities_Present_Barrier_Type;
        Next: C.Out_Structure_C_Access;
        Present_Barrier_Supported: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Surface_Capabilities_Present_Barrier_C_Access is
        access Surface_Capabilities_Present_Barrier_C
        with Convention => C;

    type Swapchain_Present_Barrier_Create_Info_C is
    record
        Record_Type: Out_Structure_Type :=
            Swapchain_Present_Barrier_Create_Info_Type;
        Next: C.Out_Structure_C_Access;
        Present_Barrier_Enable: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Swapchain_Present_Barrier_Create_Info_C_Access is
        access Swapchain_Present_Barrier_Create_Info_C
        with Convention => C;

    type Physical_Device_Diagnostics_Config_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Diagnostics_Config_Features_Type;
        Next: C.Out_Structure_C_Access;
        Diagnostics_Config: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Diagnostics_Config_Features_C_Access is
        access Physical_Device_Diagnostics_Config_Features_C
        with Convention => C;

    type Device_Diagnostics_Config_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Device_Diagnostics_Config_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.NV.Device_Diagnostics_Config_Flags;
    end record
        with Convention => C;

    type Device_Diagnostics_Config_Create_Info_C_Access is
        access Device_Diagnostics_Config_Create_Info_C
        with Convention => C;

    type CUDA_Module_Create_Info_C is
    record
        Record_Type: In_Structure_Type := CUDA_Module_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Data_Size: Interfaces.C.size_t;
        Data: Interfaces.C.Extensions.void_ptr;
    end record
        with Convention => C;

    type CUDA_Module_Create_Info_C_Access is access CUDA_Module_Create_Info_C
        with Convention => C;

    type CUDA_Function_Create_Info_C is
    record
        Record_Type: In_Structure_Type := CUDA_Function_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Module: Extensions.NV.CUDA_Module;
        Name: Interfaces.C.Strings.chars_ptr;
    end record
        with Convention => C;

    type CUDA_Function_Create_Info_C_Access is
        access CUDA_Function_Create_Info_C
        with Convention => C;

    package Void_Pointer_Arrays is
        new C_Arrays(Interfaces.C.Extensions.void_ptr);

    type CUDA_Launch_Info_C is
    record
        Record_Type: In_Structure_Type := CUDA_Launch_Info_Type;
        Next: C.In_Structure_C_Access;
        CUDA_Function: Extensions.NV.CUDA_Function;
        Grid_Dim_X: Interfaces.Unsigned_32;
        Grid_Dim_Y: Interfaces.Unsigned_32;
        Grid_Dim_Z: Interfaces.Unsigned_32;
        Block_Dim_X: Interfaces.Unsigned_32;
        Block_Dim_Y: Interfaces.Unsigned_32;
        Block_Dim_Z: Interfaces.Unsigned_32;
        Param_Count: Interfaces.C.size_t;
        Params: Void_Pointer_Arrays.Pointer;
        Extra_Count: Interfaces.C.size_t;
        Extras: Void_Pointer_Arrays.Pointer;
    end record
        with Convention => C;

    type CUDA_Launch_Info_C_Access is access CUDA_Launch_Info_C
        with Convention => C;

    type Physical_Device_CUDA_Kernel_Launch_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_CUDA_Kernel_Launch_Features_Type;
        Next: C.Out_Structure_C_Access;
        CUDA_Kernel_Launch_Features: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_CUDA_Kernel_Launch_Features_C_Access is
        access Physical_Device_CUDA_Kernel_Launch_Features_C
        with Convention => C;

    type Physical_Device_CUDA_Kernel_Launch_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_CUDA_Kernel_Launch_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Compute_Capability_Minor: Interfaces.Unsigned_32;
        Compute_Capability_Major: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_CUDA_Kernel_Launch_Properties_C_Access is
        access Physical_Device_CUDA_Kernel_Launch_Properties_C
        with Convention => C;

    type Query_Low_Latency_Support_C is
    record
        Record_Type: In_Structure_Type := Query_Low_Latency_Support_Type;
        Next: C.In_Structure_C_Access;
        Queried_Low_Latency_Data: Interfaces.C.Extensions.void_ptr;
    end record
        with Convention => C;

    type Query_Low_Latency_Support_C_Access is
        access Query_Low_Latency_Support_C
        with Convention => C;

    type Physical_Device_Fragment_Shading_Rate_Enums_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Fragment_Shading_Rate_Enums_Features_Type;
        Next: C.Out_Structure_C_Access;
        Fragment_Shading_Rate_Enums: Interfaces.Unsigned_32;
        Supersample_Fragment_Shading_Rates: Interfaces.Unsigned_32;
        No_Invocation_Fragment_Shading_Rates: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Fragment_Shading_Rate_Enums_Features_C_Access is
        access Physical_Device_Fragment_Shading_Rate_Enums_Features_C
        with Convention => C;

    type Physical_Device_Fragment_Shading_Rate_Enums_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Fragment_Shading_Rate_Enums_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Max_Fragment_Shading_Rate_Invocation_Count: Sample_Count_Flags;
    end record
        with Convention => C;

    type Physical_Device_Fragment_Shading_Rate_Enums_Properties_C_Access is
        access Physical_Device_Fragment_Shading_Rate_Enums_Properties_C
        with Convention => C;

    type Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Shading_Rate_Type: Extensions.NV.Fragment_Shading_Rate_Type;
        Shading_Rate: Extensions.NV.Fragment_Shading_Rate;
        Combiner_Ops: Extensions.KHR.Fragment_Shading_Rate_Combiner_Op_Array;
    end record
        with Convention => C;

    type Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_C_Access is
        access Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_C
        with Convention => C;

    type Acceleration_Structure_Geometry_Motion_Triangles_Data_C is
    record
        Record_Type: In_Structure_Type :=
            Acceleration_Structure_Geometry_Motion_Triangles_Data_Type;
        Next: C.In_Structure_C_Access;
        Vertex_Data: C_KHR.Device_Or_Host_Address_C;
    end record
        with Convention => C;

    type Acceleration_Structure_Geometry_Motion_Triangles_Data_C_Access is
        access Acceleration_Structure_Geometry_Motion_Triangles_Data_C
        with Convention => C;

    type Acceleration_Structure_Motion_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Acceleration_Structure_Motion_Info_Type;
        Next: C.In_Structure_C_Access;
        Max_Instances: Interfaces.Unsigned_32;
        Flags: Extensions.NV.Acceleration_Structure_Motion_Info_Flags;
    end record
        with Convention => C;

    type Acceleration_Structure_Motion_Info_C_Access is
        access Acceleration_Structure_Motion_Info_C
        with Convention => C;

    type Physical_Device_Ray_Tracing_Motion_Blur_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Ray_Tracing_Motion_Blur_Features_Type;
        Next: C.Out_Structure_C_Access;
        Ray_Tracing_Motion_Blur: Interfaces.Unsigned_32;
        Ray_Tracing_Motion_Blur_Pipeline_Trace_Rays_Indirect:
            Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Ray_Tracing_Motion_Blur_Features_C_Access is
        access Physical_Device_Ray_Tracing_Motion_Blur_Features_C
        with Convention => C;

    type Memory_Get_Remote_Address_Info_C is
    record
        Record_Type: In_Structure_Type := Memory_Get_Remote_Address_Info_Type;
        Next: C.In_Structure_C_Access;
        Memory: Device_Memory;
        Handle_Type: External_Memory_Handle_Type_Flags;
    end record
        with Convention => C;

    type Memory_Get_Remote_Address_Info_C_Access is
        access Memory_Get_Remote_Address_Info_C
        with Convention => C;

    type Physical_Device_External_Memory_RDMA_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_External_Memory_RDMA_Features_Type;
        Next: C.Out_Structure_C_Access;
        External_Memory_RDMA: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_External_Memory_RDMA_Features_C_Access is
        access Physical_Device_External_Memory_RDMA_Features_C
        with Convention => C;

    -- Conversion subprograms.
    function To_C
        (Struct: in Extensions.NV.Dedicated_Allocation_Image_Create_Info)
        return Dedicated_Allocation_Image_Create_Info_C;
    procedure Free(Struct: in out Dedicated_Allocation_Image_Create_Info_C);

    function To_C
        (Struct: in Extensions.NV.Dedicated_Allocation_Buffer_Create_Info)
        return Dedicated_Allocation_Buffer_Create_Info_C;
    procedure Free(Struct: in out Dedicated_Allocation_Buffer_Create_Info_C);

    function To_C
        (Struct: in Extensions.NV.Dedicated_Allocation_Memory_Allocate_Info)
        return Dedicated_Allocation_Memory_Allocate_Info_C;
    procedure Free(Struct: in out Dedicated_Allocation_Memory_Allocate_Info_C);

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.NV.Physical_Device_Corner_Sampled_Image_Features;
         C_Struct: in Physical_Device_Corner_Sampled_Image_Features_C);

    function To_C
        (Struct: in Extensions.NV.Pipeline_Viewport_W_Scaling_State_Create_Info)
        return Pipeline_Viewport_W_Scaling_State_Create_Info_C;
    procedure Free
        (Struct: in out Pipeline_Viewport_W_Scaling_State_Create_Info_C);

    function To_C
        (Struct: in Extensions.NV.Pipeline_Viewport_Swizzle_State_Create_Info)
        return Pipeline_Viewport_Swizzle_State_Create_Info_C;
    procedure Free
        (Struct: in out Pipeline_Viewport_Swizzle_State_Create_Info_C);

    function To_C
        (Struct: in Extensions.NV.Pipeline_Coverage_To_Color_State_Create_Info)
        return Pipeline_Coverage_To_Color_State_Create_Info_C;
    procedure Free
        (Struct: in out Pipeline_Coverage_To_Color_State_Create_Info_C);

    function To_C
        (Struct:
            in Extensions.NV.Pipeline_Coverage_Modulation_State_Create_Info)
        return Pipeline_Coverage_Modulation_State_Create_Info_C;
    procedure Free
        (Struct: in out Pipeline_Coverage_Modulation_State_Create_Info_C);

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.NV.Physical_Device_Shader_SM_Builtins_Properties;
         C_Struct: in Physical_Device_Shader_SM_Builtins_Properties_C);

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.NV.Physical_Device_Shader_SM_Builtins_Features;
         C_Struct: in Physical_Device_Shader_SM_Builtins_Features_C);

    function To_C
        (Struct: in
           Extensions.NV.Pipeline_Viewport_Shading_Rate_Image_State_Create_Info)
        return Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_C;
    procedure Free
        (Struct: in out
            Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Shading_Rate_Image_Features;
         C_Struct: in Physical_Device_Shading_Rate_Image_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Shading_Rate_Image_Properties;
         C_Struct: in Physical_Device_Shading_Rate_Image_Properties_C);

    function To_C(Struct: in Extensions.NV.Coarse_Sample_Order_Custom)
        return Coarse_Sample_Order_Custom_C;
    procedure Free(Struct: in out Coarse_Sample_Order_Custom_C);

    function To_C
        (Struct: in
          Extensions.NV.Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info)
        return Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_C;
    procedure Free
        (Struct: in out
            Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Representative_Fragment_Test_Features;
         C_Struct: in Physical_Device_Representative_Fragment_Test_Features_C);

    function To_C
        (Struct: in
          Extensions.NV.Pipeline_Representative_Fragment_Test_State_Create_Info)
        return Pipeline_Representative_Fragment_Test_State_Create_Info_C;
    procedure Free
        (Struct: in out
            Pipeline_Representative_Fragment_Test_State_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.NV.Physical_Device_Mesh_Shader_Features;
         C_Struct: in Physical_Device_Mesh_Shader_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Mesh_Shader_Properties;
         C_Struct: in Physical_Device_Mesh_Shader_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Shader_Image_Footprint_Features;
         C_Struct: in Physical_Device_Shader_Image_Footprint_Features_C);

    function To_C
        (Struct: in
            Extensions.NV.Pipeline_Viewport_Exclusive_Scissor_State_Create_Info)
        return Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_C;
    procedure Free
        (Struct: in out 
            Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Exclusive_Scissor_Features;
         C_Struct: in Physical_Device_Exclusive_Scissor_Features_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.NV.Queue_Family_Checkpoint_Properties;
         C_Struct: in Queue_Family_Checkpoint_Properties_C);

    procedure To_Ada(Ada_Struct: in out Extensions.NV.Checkpoint_Data;
                     C_Struct: in Checkpoint_Data_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.NV.Queue_Family_Checkpoint_Properties_2;
         C_Struct: in Queue_Family_Checkpoint_Properties_2_C);

    procedure To_Ada(Ada_Struct: in out Extensions.NV.Checkpoint_Data_2;
                     C_Struct: in Checkpoint_Data_2_C);

    procedure To_Ada
        (Ada_Struct: in out
     Extensions.NV.Physical_Device_Dedicated_Allocation_Image_Aliasing_Features;
         C_Struct: in
            Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.NV.Cooperative_Matrix_Properties;
         C_Struct: in Cooperative_Matrix_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Cooperative_Matrix_Features;
         C_Struct: in Physical_Device_Cooperative_Matrix_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Cooperative_Matrix_Properties;
         C_Struct: in Physical_Device_Cooperative_Matrix_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Coverage_Reduction_Mode_Features;
         C_Struct: in Physical_Device_Coverage_Reduction_Mode_Features_C);

    function To_C
        (Struct: in Extensions.NV.Pipeline_Coverage_Reduction_State_Create_Info)
        return Pipeline_Coverage_Reduction_State_Create_Info_C;
    procedure Free
        (Struct: in out Pipeline_Coverage_Reduction_State_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.NV.Framebuffer_Mixed_Samples_Combination;
         C_Struct: in Framebuffer_Mixed_Samples_Combination_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Device_Generated_Commands_Properties;
         C_Struct: in Physical_Device_Device_Generated_Commands_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Device_Generated_Commands_Features;
         C_Struct: in Physical_Device_Device_Generated_Commands_Features_C);

    function To_C(Struct: in Extensions.NV.Graphics_Shader_Group_Create_Info)
        return Graphics_Shader_Group_Create_Info_C;
    procedure Free(Struct: in out Graphics_Shader_Group_Create_Info_C);

    function To_C
        (Struct: in Extensions.NV.Graphics_Pipeline_Shader_Groups_Create_Info)
        return Graphics_Pipeline_Shader_Groups_Create_Info_C;
    procedure Free
        (Struct: in out Graphics_Pipeline_Shader_Groups_Create_Info_C);

    function To_C(Struct: in Extensions.NV.Indirect_Commands_Layout_Token)
        return Indirect_Commands_Layout_Token_C;
    procedure Free(Struct: in out Indirect_Commands_Layout_Token_C);

    function To_C(Struct: in Extensions.NV.Indirect_Commands_Layout_Create_Info)
        return Indirect_Commands_Layout_Create_Info_C;
    procedure Free(Struct: in out Indirect_Commands_Layout_Create_Info_C);

    function To_C(Struct: in Extensions.NV.Generated_Commands_Info)
        return Generated_Commands_Info_C;
    procedure Free(Struct: in out Generated_Commands_Info_C);

    function To_C
        (Struct: in Extensions.NV.Generated_Commands_Memory_Requirements_Info)
        return Generated_Commands_Memory_Requirements_Info_C;
    procedure Free
        (Struct: in out Generated_Commands_Memory_Requirements_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Inherited_Viewport_Scissor_Features;
         C_Struct: in Physical_Device_Inherited_Viewport_Scissor_Features_C);

    function To_C
        (Struct: in
            Extensions.NV.Command_Buffer_Inheritance_Viewport_Scissor_Info)
        return Command_Buffer_Inheritance_Viewport_Scissor_Info_C;
    procedure Free
        (Struct: in out Command_Buffer_Inheritance_Viewport_Scissor_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Present_Barrier_Features;
         C_Struct: in Physical_Device_Present_Barrier_Features_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.NV.Surface_Capabilities_Present_Barrier;
         C_Struct: in Surface_Capabilities_Present_Barrier_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.NV.Swapchain_Present_Barrier_Create_Info;
         C_Struct: in Swapchain_Present_Barrier_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Diagnostics_Config_Features;
         C_Struct: in Physical_Device_Diagnostics_Config_Features_C);

    function To_C
        (Struct: in Extensions.NV.Device_Diagnostics_Config_Create_Info)
        return Device_Diagnostics_Config_Create_Info_C;
    procedure Free(Struct: in out Device_Diagnostics_Config_Create_Info_C);

    function To_C(Struct: in Extensions.NV.CUDA_Module_Create_Info)
        return CUDA_Module_Create_Info_C;
    procedure Free(Struct: in out CUDA_Module_Create_Info_C);

    function To_C(Struct: in Extensions.NV.CUDA_Function_Create_Info)
        return CUDA_Function_Create_Info_C;
    procedure Free(Struct: in out CUDA_Function_Create_Info_C);

    function To_C(Struct: in Extensions.NV.CUDA_Launch_Info)
        return CUDA_Launch_Info_C;
    procedure Free(Struct: in out CUDA_Launch_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_CUDA_Kernel_Launch_Features;
         C_Struct: in Physical_Device_CUDA_Kernel_Launch_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_CUDA_Kernel_Launch_Properties;
         C_Struct: in Physical_Device_CUDA_Kernel_Launch_Properties_C);

    function To_C(Struct: in Extensions.NV.Query_Low_Latency_Support)
        return Query_Low_Latency_Support_C;
    procedure Free(Struct: in out Query_Low_Latency_Support_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Fragment_Shading_Rate_Enums_Features;
         C_Struct: in Physical_Device_Fragment_Shading_Rate_Enums_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
           Extensions.NV.Physical_Device_Fragment_Shading_Rate_Enums_Properties;
         C_Struct: in Physical_Device_Fragment_Shading_Rate_Enums_Properties_C);

    function To_C
        (Struct: in
            Extensions.NV.Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info)
        return Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_C;
    procedure Free
        (Struct: in out
            Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_C);

    function To_C
        (Struct: in
            Extensions.NV.Acceleration_Structure_Geometry_Motion_Triangles_Data)
        return Acceleration_Structure_Geometry_Motion_Triangles_Data_C;
    procedure Free
        (Struct: in out
            Acceleration_Structure_Geometry_Motion_Triangles_Data_C);

    function To_C(Struct: in Extensions.NV.Acceleration_Structure_Motion_Info)
        return Acceleration_Structure_Motion_Info_C;
    procedure Free(Struct: in out Acceleration_Structure_Motion_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Ray_Tracing_Motion_Blur_Features;
         C_Struct: in Physical_Device_Ray_Tracing_Motion_Blur_Features_C);

    function To_C(Struct: in Extensions.NV.Memory_Get_Remote_Address_Info)
        return Memory_Get_Remote_Address_Info_C;
    procedure Free(Struct: in out Memory_Get_Remote_Address_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_External_Memory_RDMA_Features;
         C_Struct: in Physical_Device_External_Memory_RDMA_Features_C);

    -- Extension record conversion.
    function To_C(Next: in In_Structure_Access) return C.In_Structure_C_Access;
    function To_C(Next: in Out_Structure_Access)
        return C.Out_Structure_C_Access;
    procedure To_Ada(Ada_Struct: in out Vulkan.Out_Structure'Class;
                     Next: in C.Out_Structure_C_Access);
    procedure Free(Next: in out C.In_Structure_C_Access);
    procedure Free(Next: in out C.Out_Structure_C_Access);
end Vulkan.C_NV;

