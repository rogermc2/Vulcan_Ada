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

-- Nvidia extensions root package

with Vulkan.Extensions.KHR;

package Vulkan.Extensions.NV is
    -- Handle types.
    -- Acceleration_Structure is deprecated, but required for the
    -- VK_EXT_descriptor_buffer extension.
    type Acceleration_Structure is new Object_Handle;
    type Indirect_Commands_Layout is new Object_Handle;
    type CUDA_Module is new Object_Handle;
    type CUDA_Function is new Object_Handle;

    No_Acceleration_Structure: constant Acceleration_Structure :=
        Acceleration_Structure(System.Null_Address);
    No_Indirect_Commands_Layout: constant Indirect_Commands_Layout :=
        Indirect_Commands_Layout(System.Null_Address);
    No_CUDA_Module: constant CUDA_Module := CUDA_Module(System.Null_Address);
    No_CUDA_Function: constant CUDA_Function :=
        CUDA_Function(System.Null_Address);

    -- Other types.
    type Remote_Address is new Interfaces.C.Extensions.void_ptr;

    No_Remote_Address: constant Remote_Address :=
        Remote_Address(System.Null_Address);

    -- Enumerations.
    type Viewport_Coordinate_Swizzle is (Positive_X,
                                         Negative_X,
                                         Positive_Y,
                                         Negative_Y,
                                         Positive_Z,
                                         Negative_Z,
                                         Positive_W,
                                         Negative_W)
        with Convention => C;

    for Viewport_Coordinate_Swizzle'Size use 32;

    for Viewport_Coordinate_Swizzle use (Positive_X => 0,
                                         Negative_X => 1,
                                         Positive_Y => 2,
                                         Negative_Y => 3,
                                         Positive_Z => 4,
                                         Negative_Z => 5,
                                         Positive_W => 6,
                                         Negative_W => 7);

    type Coverage_Modulation_Mode is (None,
                                      RGB,
                                      Alpha,
                                      RGBA)
        with Convention => C;

    for Coverage_Modulation_Mode'Size use 32;

    for Coverage_Modulation_Mode use (None => 0,
                                      RGB => 1,
                                      Alpha => 2,
                                      RGBA => 3);

    type Shading_Rate_Palette_Entry is
        (No_Invocations,
         Palatte_Entry_16_Invocations_Per_Pixel,
         Palatte_Entry_8_Invocations_Per_Pixel,
         Palatte_Entry_4_Invocations_Per_Pixel,
         Palatte_Entry_2_Invocations_Per_Pixel,
         Palatte_Entry_1_Invocation_Per_Pixel,
         Palette_Entry_1_Invocation_Per_2x1_Pixels,
         Palette_Entry_1_Invocation_Per_1x2_Pixels,
         Palette_Entry_1_Invocation_Per_2x2_Pixels,
         Palette_Entry_1_Invocation_Per_4x2_Pixels,
         Palette_Entry_1_Invocation_Per_2x4_Pixels,
         Palette_Entry_1_Invocation_Per_4x4_Pixels)
        with Convention => C;

    for Shading_Rate_Palette_Entry'Size use 32;

    for Shading_Rate_Palette_Entry use
        (No_Invocations => 0,
         Palatte_Entry_16_Invocations_Per_Pixel => 1,
         Palatte_Entry_8_Invocations_Per_Pixel => 2,
         Palatte_Entry_4_Invocations_Per_Pixel => 3,
         Palatte_Entry_2_Invocations_Per_Pixel => 4,
         Palatte_Entry_1_Invocation_Per_Pixel => 5,
         Palette_Entry_1_Invocation_Per_2x1_Pixels => 6,
         Palette_Entry_1_Invocation_Per_1x2_Pixels => 7,
         Palette_Entry_1_Invocation_Per_2x2_Pixels => 8,
         Palette_Entry_1_Invocation_Per_4x2_Pixels => 9,
         Palette_Entry_1_Invocation_Per_2x4_Pixels => 10,
         Palette_Entry_1_Invocation_Per_4x4_Pixels => 11);

    type Coarse_Sample_Order_Type is (Default,
                                      Custom,
                                      Pixel_Major,
                                      Sample_Major)
        with Convention => C;

    for Coarse_Sample_Order_Type'Size use 32;

    for Coarse_Sample_Order_Type use (Default => 0,
                                      Custom => 1,
                                      Pixel_Major => 2,
                                      Sample_Major => 3);

    type Coverage_Reduction_Mode is (Merge,
                                     Truncate)
        with Convention => C;

    for Coverage_Reduction_Mode'Size use 32;

    for Coverage_Reduction_Mode use (Merge => 0,
                                     Truncate => 1);
    
    type Indirect_Commands_Token_Type is (Shader_Group,
                                          State_Flags,
                                          Index_Buffer,
                                          Vertex_Buffer,
                                          Push_Constant,
                                          Draw_Indexed,
                                          Draw,
                                          Draw_Tasks,
                                          Draw_Mesh_Tasks,
                                          Pipeline,
                                          Dispatch)
        with Convention => C;

    for Indirect_Commands_Token_Type'Size use 32;

    for Indirect_Commands_Token_Type use (Shader_Group => 0,
                                          State_Flags => 1,
                                          Index_Buffer => 2,
                                          Vertex_Buffer => 3,
                                          Push_Constant => 4,
                                          Draw_Indexed => 5,
                                          Draw => 6,
                                          Draw_Tasks => 7,
                                          Draw_Mesh_Tasks => 1_000_328_000,
                                          Pipeline => 1_000_428_003,
                                          Dispatch => 1_000_428_004);

    type Fragment_Shading_Rate_Type is (Fragment_Size,
                                        Enums)
        with Convention => C;

    for Fragment_Shading_Rate_Type'Size use 32;

    for Fragment_Shading_Rate_Type use (Fragment_Size => 0,
                                        Enums => 1);

    type Fragment_Shading_Rate is (Rate_1_Invocation_Per_Pixel,
                                   Rate_1_Invocation_Per_1x2_Pixels,
                                   Rate_1_Invocation_Per_2x1_Pixels,
                                   Rate_1_Invocation_Per_2x2_Pixels,
                                   Rate_1_Invocation_Per_2x4_Pixels,
                                   Rate_1_Invocation_Per_4x2_Pixels,
                                   Rate_1_Invocation_Per_4x4_Pixels,
                                   Rate_2_Invocations_Per_Pixel,
                                   Rate_4_Invocations_Per_Pixel,
                                   Rate_8_Invocations_Per_Pixel,
                                   Rate_16_Invocations_Per_Pixel,
                                   No_Invocations)
        with Convention => C;

    for Fragment_Shading_Rate'Size use 32;

    for Fragment_Shading_Rate use (Rate_1_Invocation_Per_Pixel => 0,
                                   Rate_1_Invocation_Per_1x2_Pixels => 1,
                                   Rate_1_Invocation_Per_2x1_Pixels => 4,
                                   Rate_1_Invocation_Per_2x2_Pixels => 5,
                                   Rate_1_Invocation_Per_2x4_Pixels => 6,
                                   Rate_1_Invocation_Per_4x2_Pixels => 9,
                                   Rate_1_Invocation_Per_4x4_Pixels => 10,
                                   Rate_2_Invocations_Per_Pixel => 11,
                                   Rate_4_Invocations_Per_Pixel => 12,
                                   Rate_8_Invocations_Per_Pixel => 13,
                                   Rate_16_Invocations_Per_Pixel => 14,
                                   No_Invocations => 15);

    type Acceleration_Structure_Motion_Instance_Type is (Static,
                                                         Matrix_Motion,
                                                         SRT_Motion)
        with Convention => C;

    for Acceleration_Structure_Motion_Instance_Type'Size use 32;

    for Acceleration_Structure_Motion_Instance_Type use (Static => 0,
                                                         Matrix_Motion => 1,
                                                         SRT_Motion => 2);

    -- Bitfields.
    type Pipeline_Viewport_Swizzle_State_Create_Flags is new Flags;

    Pipeline_Viewport_Swizzle_State_Create_No_Bit:
        constant Pipeline_Viewport_Swizzle_State_Create_Flags := 0;

    type Pipeline_Coverage_To_Color_State_Create_Flags is new Flags;

    Pipeline_Coverage_To_Color_State_Create_No_Bit:
        constant Pipeline_Coverage_To_Color_State_Create_Flags := 0;

    type Pipeline_Coverage_Modulation_State_Create_Flags is new Flags;

    Pipeline_Coverage_Modulation_State_Create_No_Bit:
        constant Pipeline_Coverage_Modulation_State_Create_Flags := 0;

    type Pipeline_Coverage_Reduction_State_Create_Flags is new Flags;

    Pipeline_Coverage_Reduction_State_Create_No_Bit:
        constant Pipeline_Coverage_Reduction_State_Create_Flags := 0;

    type Indirect_State_Flags is new Flags;

    Indirect_State_No_Bit: constant Indirect_State_Flags := 0;
    Indirect_State_Frontface_Bit: constant Indirect_State_Flags := 16#00000001#;

    type Indirect_Commands_Layout_Usage_Flags is new Flags;

    Indirect_Commands_Layout_Usage_No_Bit:
        constant Indirect_Commands_Layout_Usage_Flags := 0;
    Indirect_Commands_Layout_Usage_Explicit_Preprocess_Bit:
        constant Indirect_Commands_Layout_Usage_Flags := 16#00000001#;
    Indirect_Commands_Layout_Usage_Indexed_Sequences_Bit:
        constant Indirect_Commands_Layout_Usage_Flags := 16#00000002#;
    Indirect_Commands_Layout_Usage_Unordered_Sequences_Bit:
        constant Indirect_Commands_Layout_Usage_Flags := 16#00000004#;

    type Device_Diagnostics_Config_Flags is new Flags;

    Device_Diagnostics_Config_No_Bit:
        constant Device_Diagnostics_Config_Flags := 0;
    Device_Diagnostics_Config_Enable_Shader_Debug_Info_Bit:
        constant Device_Diagnostics_Config_Flags := 16#00000001#;
    Device_Diagnostics_Config_Enable_Resource_Tracking_Bit:
        constant Device_Diagnostics_Config_Flags := 16#00000002#;
    Device_Diagnostics_Config_Enable_Automatic_Checkpoints_Bit:
        constant Device_Diagnostics_Config_Flags := 16#00000004#;
    Device_Diagnostics_Config_Enable_Shader_Error_Reporting_Bit:
        constant Device_Diagnostics_Config_Flags := 16#00000008#;

    type Acceleration_Structure_Motion_Info_Flags is new Flags;

    Acceleration_Structure_Motion_Info_No_Bit:
        constant Acceleration_Structure_Motion_Info_Flags := 0;

    type Acceleration_Structure_Motion_Instance_Flags is new Flags;

    Acceleration_Structure_Motion_Instance_No_Bit:
        constant Acceleration_Structure_Motion_Instance_Flags := 0;

    -- Records.
    type Dedicated_Allocation_Image_Create_Info is new In_Structure
        (Dedicated_Allocation_Image_Create_Info_Type) with
    record
        Dedicated_Allocation: Boolean;
    end record;

    type Dedicated_Allocation_Buffer_Create_Info is new In_Structure
        (Dedicated_Allocation_Buffer_Create_Info_Type) with
    record
        Dedicated_Allocation: Boolean;
    end record;

    type Dedicated_Allocation_Memory_Allocate_Info is new In_Structure
        (Dedicated_Allocation_Memory_Allocate_Info_Type) with
    record
        Image: Vulkan.Image;
        Buffer: Vulkan.Buffer;
    end record;

    type Physical_Device_Corner_Sampled_Image_Features is new Out_Structure
        (Physical_Device_Corner_Sampled_Image_Features_Type) with
    record
        Corner_Sampled_Image: Boolean;
    end record;

    type Viewport_W_Scaling is
    record
        X_Coeff: Float;
        Y_Coeff: Float;
    end record
        with Convention => C;

    package Viewport_W_Scaling_Vectors is new Ada.Containers.Vectors
        (Positive, Viewport_W_Scaling);

    type Pipeline_Viewport_W_Scaling_State_Create_Info is new In_Structure
        (Pipeline_Viewport_W_Scaling_State_Create_Info_Type) with
    record
        Viewport_W_Scaling_Enable: Boolean;
        Viewport_W_Scalings: Viewport_W_Scaling_Vectors.Vector;
    end record;

    type Viewport_Swizzle is
    record
        X: Viewport_Coordinate_Swizzle;
        Y: Viewport_Coordinate_Swizzle;
        Z: Viewport_Coordinate_Swizzle;
        W: Viewport_Coordinate_Swizzle;
    end record
        with Convention => C;

    package Viewport_Swizzle_Vectors is new Ada.Containers.Vectors
        (Positive, Viewport_Swizzle);

    type Pipeline_Viewport_Swizzle_State_Create_Info is new In_Structure
        (Pipeline_Viewport_Swizzle_State_Create_Info_Type) with
    record
        Flags: NV.Pipeline_Viewport_Swizzle_State_Create_Flags :=
            NV.Pipeline_Viewport_Swizzle_State_Create_No_Bit;
        Viewport_Swizzles: Viewport_Swizzle_Vectors.Vector;
    end record;

    type Pipeline_Coverage_To_Color_State_Create_Info is new In_Structure
        (Pipeline_Coverage_To_Color_State_Create_Info_Type) with
    record
        Flags: Pipeline_Coverage_To_Color_State_Create_Flags :=
            Pipeline_Coverage_To_Color_State_Create_No_Bit;
        Coverage_To_Color_Enable: Boolean;
        Coverage_To_Color_Location: Interfaces.Unsigned_32;
    end record;

    package Float_Vectors is new Ada.Containers.Vectors(Positive,
                                                        Interfaces.C.C_float,
                                                        Interfaces.C."=");

    type Pipeline_Coverage_Modulation_State_Create_Info is new In_Structure
        (Pipeline_Coverage_Modulation_State_Create_Info_Type) with
    record
        Flags: Pipeline_Coverage_Modulation_State_Create_Flags :=
            Pipeline_Coverage_Modulation_State_Create_No_Bit;
        Coverage_Modulation_Mode: NV.Coverage_Modulation_Mode;
        Coverage_Modulation_Table_Enable: Boolean;
        Coverage_Modulation_Table: Float_Vectors.Vector;
    end record;

    type Physical_Device_Shader_SM_Builtins_Properties is new Out_Structure
        (Physical_Device_Shader_SM_Builtins_Properties_Type) with
    record
        Shader_SM_Count: Interfaces.Unsigned_32;
        Shader_Warps_Per_SM: Interfaces.Unsigned_32;
    end record;

    type Physical_Device_Shader_SM_Builtins_Features is new Out_Structure
        (Physical_Device_Shader_SM_Builtins_Features_Type) with
    record
        Shader_SM_Builtins: Boolean;
    end record;

    package Shading_Rate_Palette_Entry_Vectors is
        new Ada.Containers.Vectors(Positive, Shading_Rate_Palette_Entry);

    type Shading_Rate_Palette is
    record
        Shading_Rate_Palette_Entries:
            Shading_Rate_Palette_Entry_Vectors.Vector;
    end record;

    package Shading_Rate_Palette_Vectors is
        new Ada.Containers.Vectors(Positive, Shading_Rate_Palette);

    type Pipeline_Viewport_Shading_Rate_Image_State_Create_Info is
        new In_Structure
            (Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_Type) with
    record
        Shading_Rate_Image_Enable: Boolean;
        Viewport_Count: Interfaces.Unsigned_32;
        Shading_Rate_Palettes: Shading_Rate_Palette_Vectors.Vector;
    end record;

    type Physical_Device_Shading_Rate_Image_Features is new Out_Structure
        (Physical_Device_Shading_Rate_Image_Features_Type) with
    record
        Shading_Rate_Image: Boolean;
        Shading_Rate_Coarse_Sample_Order: Boolean;
    end record;

    type Physical_Device_Shading_Rate_Image_Properties is new Out_Structure
        (Physical_Device_Shading_Rate_Image_Properties_Type) with
    record
        Shading_Rate_Texel_Size: Extent_2D;
        Shading_Rate_Palette_Size: Interfaces.Unsigned_32;
        Shading_Rate_Max_Coarse_Samples: Interfaces.Unsigned_32;
    end record;

    type Coarse_Sample_Location is
    record
        Pixel_X: Interfaces.Unsigned_32;
        Pixel_Y: Interfaces.Unsigned_32;
        Sample: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    package Coarse_Sample_Location_Vectors is
        new Ada.Containers.Vectors(Positive, Coarse_Sample_Location);

    type Coarse_Sample_Order_Custom is
    record
        Shading_Rate: Shading_Rate_Palette_Entry;
        Sample_Count: Interfaces.Unsigned_32;
        Sample_Locations: Coarse_Sample_Location_Vectors.Vector;
    end record;

    package Coarse_Sample_Order_Custom_Vectors is
        new Ada.Containers.Vectors(Positive, Coarse_Sample_Order_Custom);

    type Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info is
        new In_Structure
            (Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_Type) with
    record
        Sample_Order_Type: Coarse_Sample_Order_Type;
        Custom_Sample_Orders: Coarse_Sample_Order_Custom_Vectors.Vector;
    end record;

    type Physical_Device_Representative_Fragment_Test_Features is
        new Out_Structure
            (Physical_Device_Representative_Fragment_Test_Features_Type) with
    record
        Representative_Fragment_Test: Boolean;
    end record;

    type Pipeline_Representative_Fragment_Test_State_Create_Info is
        new In_Structure
            (Pipeline_Representative_Fragment_Test_State_Create_Info_Type) with
    record
        Representative_Fragment_Test_Enable: Boolean;
    end record;

    type Physical_Device_Mesh_Shader_Features is new Out_Structure
        (Physical_Device_Mesh_Shader_Features_Type) with
    record
        Task_Shader: Boolean;
        Mesh_Shader: Boolean;
    end record;

    type Work_Group_Size_Array is array (1 .. 3) of Interfaces.Unsigned_32
        with Convention => C;

    type Physical_Device_Mesh_Shader_Properties is new Out_Structure
        (Physical_Device_Mesh_Shader_Properties_Type) with
    record
        Max_Draw_Mesh_Tasks_Count: Interfaces.Unsigned_32;
        Max_Task_Work_Group_Invocations: Interfaces.Unsigned_32;
        Max_Task_Work_Group_Size: Work_Group_Size_Array;
        Max_Task_Total_Memory_Size: Interfaces.Unsigned_32;
        Max_Task_Output_Count: Interfaces.Unsigned_32;
        Max_Mesh_Work_Group_Invocations: Interfaces.Unsigned_32;
        Max_Mesh_Work_Group_Size: Work_Group_Size_Array;
        Max_Mesh_Total_Memory_Size: Interfaces.Unsigned_32;
        Max_Mesh_Output_Vertices: Interfaces.Unsigned_32;
        Max_Mesh_Output_Primitives: Interfaces.Unsigned_32;
        Max_Mesh_Multiview_View_Count: Interfaces.Unsigned_32;
        Mesh_Output_Per_Vertex_Granularity: Interfaces.Unsigned_32;
        Mesh_Output_Per_Primitive_Granularity: Interfaces.Unsigned_32;
    end record;

    type Draw_Mesh_Tasks_Indirect_Command is
    record
        Task_Count: Interfaces.Unsigned_32;
        First_Task: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Shader_Image_Footprint_Features is new Out_Structure
        (Physical_Device_Shader_Image_Footprint_Features_Type) with
    record
        Image_Footprint: Boolean;
    end record;

    type Pipeline_Viewport_Exclusive_Scissor_State_Create_Info is
        new In_Structure
            (Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_Type) with
    record
        Exclusive_Scissors: Rect_2D_Vectors.Vector;
    end record;

    type Physical_Device_Exclusive_Scissor_Features is new Out_Structure
        (Physical_Device_Exclusive_Scissor_Features_Type) with
    record
        Exclusive_Scissor: Boolean;
    end record;

    type Queue_Family_Checkpoint_Properties is new Out_Structure
        (Queue_Family_Checkpoint_Properties_Type) with
    record
        Checkpoint_Execution_Stage_Mask: Pipeline_Stage_Flags :=
            Pipeline_Stage_No_Bit;
    end record;

    type Checkpoint_Data is new Out_Structure(Checkpoint_Data_Type) with
    record
        Stage: Pipeline_Stage_Flags := Pipeline_Stage_No_Bit;
        Checkpoint_Marker: Interfaces.C.Extensions.void_ptr;
    end record;

    package Checkpoint_Data_Vectors is new Ada.Containers.Vectors
        (Positive, Checkpoint_Data);

    type Queue_Family_Checkpoint_Properties_2 is new Out_Structure
        (Queue_Family_Checkpoint_Properties_2_Type) with
    record
        Checkpoint_Execution_Stage_Mask: Pipeline_Stage_Flags_2 :=
            Pipeline_Stage_2_None;
    end record;

    type Checkpoint_Data_2 is new Out_Structure(Checkpoint_Data_2_Type) with
    record
        Stage: Pipeline_Stage_Flags_2 := Pipeline_Stage_2_None;
        Checkpoint_Marker: Interfaces.C.Extensions.void_ptr;
    end record;

    package Checkpoint_Data_2_Vectors is new Ada.Containers.Vectors
        (Positive, Checkpoint_Data_2);

    type Physical_Device_Dedicated_Allocation_Image_Aliasing_Features is
        new Out_Structure
            (Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_Type)
                with
    record
        Dedicated_Allocation_Image_Aliasing: Boolean;
    end record;

    type Cooperative_Matrix_Properties is new Out_Structure
        (Cooperative_Matrix_Properties_NV_Type) with
    record
        M_Size: Interfaces.Unsigned_32;
        N_Size: Interfaces.Unsigned_32;
        K_Size: Interfaces.Unsigned_32;
        A_Type: KHR.Component_Type;
        B_Type: KHR.Component_Type;
        C_Type: KHR.Component_Type;
        D_Type: KHR.Component_Type;
        Scope: KHR.Scope;
    end record;

    package Cooperative_Matrix_Properties_Vectors is
        new Ada.Containers.Vectors(Positive, Cooperative_Matrix_Properties);

    type Physical_Device_Cooperative_Matrix_Features is new Out_Structure
        (Physical_Device_Cooperative_Matrix_Features_NV_Type) with
    record
        Cooperative_Matrix: Boolean;
        Cooperative_Matrix_Robust_Buffer_Access: Boolean;
    end record;

    type Physical_Device_Cooperative_Matrix_Properties is new Out_Structure
        (Physical_Device_Cooperative_Matrix_Properties_NV_Type) with
    record
        Cooperative_Matrix_Supported_Stages: Shader_Stage_Flags :=
            Shader_Stage_No_Bit;
    end record;

    type Physical_Device_Coverage_Reduction_Mode_Features is new Out_Structure
        (Physical_Device_Coverage_Reduction_Mode_Features_Type) with
    record
        Coverage_Reduction_Mode: Boolean;
    end record;

    type Pipeline_Coverage_Reduction_State_Create_Info is new In_Structure
        (Pipeline_Coverage_Reduction_State_Create_Info_Type) with
    record
        Flags: Pipeline_Coverage_Reduction_State_Create_Flags :=
            Pipeline_Coverage_Reduction_State_Create_No_Bit;
        Coverage_Reduction_Mode: NV.Coverage_Reduction_Mode;
    end record;

    type Framebuffer_Mixed_Samples_Combination is new Out_Structure
        (Framebuffer_Mixed_Samples_Combination_Type) with
    record
        Coverage_Reduction_Mode: NV.Coverage_Reduction_Mode;
        Rasterization_Samples: Sample_Count_Flags := Sample_Count_No_Bit;
        Depth_Stencil_Samples: Sample_Count_Flags := Sample_Count_No_Bit;
        Color_Samples: Sample_Count_Flags := Sample_Count_No_Bit;
    end record;
    
    package Framebuffer_Mixed_Samples_Combination_Vectors is
        new Ada.Containers.Vectors(Positive,
                                   Framebuffer_Mixed_Samples_Combination);

    type Physical_Device_Device_Generated_Commands_Properties is
        new Out_Structure
            (Physical_Device_Device_Generated_Commands_Properties_Type) with
    record
        Max_Graphics_Shader_Group_Count: Interfaces.Unsigned_32;
        Max_Indirect_Sequence_Count: Interfaces.Unsigned_32;
        Max_Indirect_Commands_Token_Count: Interfaces.Unsigned_32;
        Max_Indirect_Commands_Stream_Count: Interfaces.Unsigned_32;
        Max_Indirect_Commands_Token_Offset: Interfaces.Unsigned_32;
        Max_Indirect_Commands_Stream_Stride: Interfaces.Unsigned_32;
        Min_Sequences_Count_Buffer_Offset_Alignment: Interfaces.Unsigned_32;
        Min_Sequences_Index_Buffer_Offset_Alignment: Interfaces.Unsigned_32;
        Min_Indirect_Commands_Buffer_Offset_Alignment: Interfaces.Unsigned_32;
    end record;

    type Physical_Device_Device_Generated_Commands_Features is new Out_Structure
        (Physical_Device_Device_Generated_Commands_Features_Type) with
    record
        Device_Generated_Commands: Boolean;
    end record;

    type Graphics_Shader_Group_Create_Info is new In_Structure
        (Graphics_Shader_Group_Create_Info_Type) with
    record
        Stages: Pipeline_Shader_Stage_Create_Info_Vectors.Vector;
        Vertex_Input_State: Pipeline_Vertex_Input_State_Create_Info_Access;
        Tessellation_State: Pipeline_Tessellation_State_Create_Info_Access;
    end record;

    package Graphics_Shader_Group_Create_Info_Vectors is
        new Ada.Containers.Vectors(Positive,
                                   Graphics_Shader_Group_Create_Info);

    type Graphics_Pipeline_Shader_Groups_Create_Info is new In_Structure
        (Graphics_Pipeline_Shader_Groups_Create_Info_Type) with
    record
        Groups: Graphics_Shader_Group_Create_Info_Vectors.Vector;
        Pipelines: Pipeline_Vectors.Vector;
    end record;

    type Bind_Shader_Group_Indirect_Command is
    record
        Group_Index: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Bind_Index_Buffer_Indirect_Command is
    record
        Buffer_Address: Device_Address;
        Size: Interfaces.Unsigned_32;
        Index_Type: Vulkan.Index_Type;
    end record
        with Convention => C;

    type Bind_Vertex_Buffer_Indirect_Command is
    record
        Buffer_Address: Device_Address;
        Size: Interfaces.Unsigned_32;
        Stride: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Set_State_Flags_Indirect_Command is
    record
        Data: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Indirect_Commands_Stream is
    record
        Buffer: Vulkan.Buffer;
        Offset: Device_Size;
    end record
        with Convention => C;

    package Indirect_Commands_Stream_Vectors is
        new Ada.Containers.Vectors(Positive, Indirect_Commands_Stream);

    type Indirect_Commands_Layout_Token is new In_Structure
        (Indirect_Commands_Layout_Token_Type) with
    record
        Token_Type: Indirect_Commands_Token_Type;
        Stream: Interfaces.Unsigned_32;
        Offset: Interfaces.Unsigned_32;
        Vertex_Binding_Unit: Interfaces.Unsigned_32;
        Vertex_Dynamic_Stride: Boolean;
        Push_Constant_Pipeline_Layout: Pipeline_Layout;
        Push_Constant_Shader_STage_Flags: Shader_Stage_Flags :=
            Shader_Stage_No_Bit;
        Push_Constant_Offset: Interfaces.Unsigned_32;
        Push_Constant_Size: Interfaces.Unsigned_32;
        Indirect_State_Flags: NV.Indirect_State_Flags := Indirect_State_No_Bit;
        Index_Types: Index_Type_Vectors.Vector;
        Index_Type_Values: Unsigned_32_Vectors.Vector;
    end record;

    package Indirect_Commands_Layout_Token_Vectors is
        new Ada.Containers.Vectors(Positive, Indirect_Commands_Layout_Token);

    type Indirect_Commands_Layout_Create_Info is new In_Structure
        (Indirect_Commands_Layout_Create_Info_Type) with
    record
        Flags: Indirect_Commands_Layout_Usage_Flags :=
            Indirect_Commands_Layout_Usage_No_Bit;
        Pipeline_Bind_Point: Vulkan.Pipeline_Bind_Point;
        Tokens: Indirect_Commands_Layout_Token_Vectors.Vector;
        Stream_Strides: Unsigned_32_Vectors.Vector;
    end record;

    type Generated_Commands_Info is new In_Structure
        (Generated_Commands_Info_Type) with
    record
        Pipeline_Bind_Point: Vulkan.Pipeline_Bind_Point;
        Pipeline: Vulkan.Pipeline;
        Indirect_Commands_Layout: NV.Indirect_Commands_Layout;
        Streams: Indirect_Commands_Stream_Vectors.Vector;
        Sequences_Count: Interfaces.Unsigned_32;
        Preprocess_Buffer: Buffer;
        Preprocess_Offset: Device_Size;
        Preprocess_Size: Device_Size;
        Sequences_Count_Buffer: Buffer;
        Sequences_Count_Offset: Device_Size;
        Sequences_Index_Buffer: Buffer;
        Sequences_Index_Offset: Device_Size;
    end record;

    type Generated_Commands_Memory_Requirements_Info is new In_Structure
        (Generated_Commands_Memory_Requirements_Info_Type) with
    record
        Pipeline_Bind_Point: Vulkan.Pipeline_Bind_Point;
        Pipeline: Vulkan.Pipeline;
        Indirect_Commands_Layout: NV.Indirect_Commands_Layout;
        Max_Sequences_Count: Interfaces.Unsigned_32;
    end record;

    type Physical_Device_Inherited_Viewport_Scissor_Features is
        new Out_Structure
            (Physical_Device_Inherited_Viewport_Scissor_Features_Type) with
    record
        Inherited_Viewport_Scissor_2D: Boolean;
    end record;

    type Command_Buffer_Inheritance_Viewport_Scissor_Info is new In_Structure
        (Command_Buffer_Inheritance_Viewport_Scissor_Info_Type) with
    record
        Viewport_Scissor_2D: Boolean;
        Viewport_Depths: Viewport_Vectors.Vector;
    end record;

    type Physical_Device_Present_Barrier_Features is new Out_Structure
        (Physical_Device_Present_Barrier_Features_Type) with
    record
        Present_Barrier: Boolean;
    end record;

    type Surface_Capabilities_Present_Barrier is new Out_Structure
        (Surface_Capabilities_Present_Barrier_Type) with
    record
        Present_Barrier_Supported: Boolean;
    end record;

    type Swapchain_Present_Barrier_Create_Info is new Out_Structure
        (Swapchain_Present_Barrier_Create_Info_Type) with
    record
        Present_Barrier_Enable: Boolean;
    end record;

    type Physical_Device_Diagnostics_Config_Features is new Out_Structure
        (Physical_Device_Diagnostics_Config_Features_Type) with
    record
        Diagnostics_Config: Boolean;
    end record;

    type Device_Diagnostics_Config_Create_Info is new In_Structure
        (Device_Diagnostics_Config_Create_Info_Type) with
    record
        Flags: Device_Diagnostics_Config_Flags :=
            Device_Diagnostics_Config_No_Bit;
    end record;

    type CUDA_Module_Create_Info is new In_Structure
        (CUDA_Module_Create_Info_Type) with
    record
        Data_Size: Interfaces.C.size_t;
        Data: Interfaces.C.Extensions.void_ptr;
    end record;

    type CUDA_Function_Create_Info is new In_Structure
        (CUDA_Function_Create_Info_Type) with
    record
        Module: CUDA_Module;
        Name: Ada.Strings.Unbounded.Unbounded_String;
    end record;

    package Void_Pointer_Vectors is
        new Ada.Containers.Vectors(Positive,
                                   Interfaces.C.Extensions.void_ptr,
                                   System."=");

    type CUDA_Launch_Info is new In_Structure(CUDA_Launch_Info_Type) with
    record
        CUDA_Function: NV.CUDA_Function;
        Grid_Dim_X: Interfaces.Unsigned_32;
        Grid_Dim_Y: Interfaces.Unsigned_32;
        Grid_Dim_Z: Interfaces.Unsigned_32;
        Block_Dim_X: Interfaces.Unsigned_32;
        Block_Dim_Y: Interfaces.Unsigned_32;
        Block_Dim_Z: Interfaces.Unsigned_32;
        Shared_Mem_Bytes: Interfaces.Unsigned_32;
        Params: Void_Pointer_Vectors.Vector;
        Extras: Void_Pointer_Vectors.Vector;
    end record;

    type Physical_Device_CUDA_Kernel_Launch_Features is new Out_Structure
        (Physical_Device_CUDA_Kernel_Launch_Features_Type) with
    record
        CUDA_Kernel_Launch_Features: Boolean;
    end record;

    type Physical_Device_CUDA_Kernel_Launch_Properties is new Out_Structure
        (Physical_Device_CUDA_Kernel_Launch_Properties_Type) with
    record
        Compute_Capability_Minor: Interfaces.Unsigned_32;
        Compute_Capability_Major: Interfaces.Unsigned_32;
    end record;

    type Query_Low_Latency_Support is new In_Structure
        (Query_Low_Latency_Support_Type) with
    record
        Queried_Low_Latency_Data: Interfaces.C.Extensions.void_ptr;
    end record;

    type Physical_Device_Fragment_Shading_Rate_Enums_Features is
        new Out_Structure
            (Physical_Device_Fragment_Shading_Rate_Enums_Features_Type) with
    record
        Fragment_Shading_Rate_Enums: Boolean;
        Supersample_Fragment_Shading_Rates: Boolean;
        No_Invocation_Fragment_Shading_Rates: Boolean;
    end record;

    type Physical_Device_Fragment_Shading_Rate_Enums_Properties is
        new Out_Structure
            (Physical_Device_Fragment_Shading_Rate_Enums_Properties_Type) with
    record
        Max_Fragment_Shading_Rate_Invocation_Count: Sample_Count_Flags :=
            Sample_Count_No_Bit;
    end record;

    type Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info is
        new In_Structure
            (Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_Type) with
    record
        Shading_Rate_Type: Fragment_Shading_Rate_Type;
        Shading_Rate: Fragment_Shading_Rate;
        Combiner_Ops: KHR.Fragment_Shading_Rate_Combiner_Op_Array;
    end record;

    type Acceleration_Structure_Geometry_Motion_Triangles_Data
        (Address_Type: KHR.Address_Type) is new In_Structure
            (Acceleration_Structure_Geometry_Motion_Triangles_Data_Type) with
    record
        case Address_Type is
            when KHR.Device =>
                Device_Address: Vulkan.Device_Address;
            when KHR.Host =>
                Host_Address: Interfaces.C.Extensions.void_ptr;
        end case;
    end record;

    type Acceleration_Structure_Motion_Info is new In_Structure
        (Acceleration_Structure_Motion_Info_Type) with
    record
        Max_Instances: Interfaces.Unsigned_32;
        Flags: Acceleration_Structure_Motion_Info_Flags :=
            Acceleration_Structure_Motion_Info_No_Bit;
    end record;
 
    type Acceleration_Structure_Matrix_Motion_Instance is
    record
        Transform_T0: KHR.Transform_Matrix;
        Transform_T1: KHR.Transform_Matrix;
        Instance_Custom_Index: KHR.Custom_Index;
        Instance_Shader_Binding_Table_Record_Offset: KHR.Table_Record_Offset;
        Acceleration_Structure_Reference: Interfaces.Unsigned_64;
    end record
        with Convention => C;

    type SRT_Data is
    record
        SX: Interfaces.C.C_float;
        A: Interfaces.C.C_float;
        B: Interfaces.C.C_float;
        PVX: Interfaces.C.C_float;
        SY: Interfaces.C.C_float;
        C: Interfaces.C.C_float;
        PVY: Interfaces.C.C_float;
        SZ: Interfaces.C.C_float;
        PVZ: Interfaces.C.C_float;
        QX: Interfaces.C.C_float;
        QY: Interfaces.C.C_float;
        QZ: Interfaces.C.C_float;
        QW: Interfaces.C.C_float;
        TX: Interfaces.C.C_float;
        TY: Interfaces.C.C_float;
        TZ: Interfaces.C.C_float;
    end record
        with Convention => C;

    type Acceleration_Structure_SRT_Motion_Instance is
    record
        Transform_T0: SRT_Data;
        Transform_T1: SRT_Data;
        Instance_Custom_Index: KHR.Custom_Index;
        Instance_Shader_Binding_Table_Record_Offset: KHR.Table_Record_Offset;
        Acceleration_Structure_Reference: Interfaces.Unsigned_64;
    end record
        with Convention => C;

    -- Unchecked union, use with caution.
    type Acceleration_Structure_Motion_Instance_Data
        (Data_Type: Acceleration_Structure_Motion_Instance_Type := Static) is
    record
        case Data_Type is
            when Static =>
                Static_Instance: KHR.Acceleration_Structure_Instance;
            when Matrix_Motion =>
                Matrix_Motion_Instance:
                    Acceleration_Structure_Matrix_Motion_Instance;
            when SRT_Motion =>
                SRT_Motion_Instance: Acceleration_Structure_SRT_Motion_Instance;
        end case;
    end record
        with Convention => C,
             Unchecked_Union;

    type Acceleration_Structure_Motion_Instance is
    record
        Structure_Type: Acceleration_Structure_Motion_Instance_Type;
        Flags: Acceleration_Structure_Motion_Instance_Flags :=
            Acceleration_Structure_Motion_Instance_No_Bit;
        Data: Acceleration_Structure_Motion_Instance_Data;
    end record
        with Convention => C;

    type Physical_Device_Ray_Tracing_Motion_Blur_Features is new Out_Structure
        (Physical_Device_Ray_Tracing_Motion_Blur_Features_Type) with
    record
        Ray_Tracing_Motion_Blur: Boolean;
        Ray_Tracing_Motion_Blur_Pipeline_Trace_Rays_Indirect: Boolean;
    end record;

    type Memory_Get_Remote_Address_Info is new In_Structure
        (Memory_Get_Remote_Address_Info_Type) with
    record
        Memory: Device_Memory;
        Handle_Type: External_Memory_Handle_Type_Flags :=
            External_Memory_Handle_Type_No_Bit;
    end record;

    type Physical_Device_External_Memory_RDMA_Features is new Out_Structure
        (Physical_Device_External_Memory_RDMA_Features_Type) with
    record
        External_Memory_RDMA: Boolean;
    end record;
end Vulkan.Extensions.NV;

