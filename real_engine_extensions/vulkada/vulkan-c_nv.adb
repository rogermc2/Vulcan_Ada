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

with Ada.Unchecked_Conversion;
with Ada.Unchecked_Deallocation;
with Vulkan.Extension_Records;
with Vulkan.Utilities;

package body Vulkan.C_NV is
    procedure Free(Struct: in out Shading_Rate_Palette_C);

    function To_C
        (Struct: in Extensions.NV.Dedicated_Allocation_Image_Create_Info)
        return Dedicated_Allocation_Image_Create_Info_C is
        DAICIC: Dedicated_Allocation_Image_Create_Info_C;
    begin
        DAICIC.Next := Extension_Records.To_C(Struct.Next);
        DAICIC.Dedicated_Allocation :=
            Utilities.To_C(Struct.Dedicated_Allocation);

        return DAICIC;
    end To_C;

    procedure Free(Struct: in out Dedicated_Allocation_Image_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C
        (Struct: in Extensions.NV.Dedicated_Allocation_Buffer_Create_Info)
        return Dedicated_Allocation_Buffer_Create_Info_C is
        DABCIC: Dedicated_Allocation_Buffer_Create_Info_C;
    begin
        DABCIC.Next := Extension_Records.To_C(Struct.Next);
        DABCIC.Dedicated_Allocation :=
            Utilities.To_C(Struct.Dedicated_Allocation);

        return DABCIC;
    end To_C;

    procedure Free(Struct: in out Dedicated_Allocation_Buffer_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C
        (Struct: in Extensions.NV.Dedicated_Allocation_Memory_Allocate_Info)
        return Dedicated_Allocation_Memory_Allocate_Info_C is
        DAMAIC: Dedicated_Allocation_Memory_Allocate_Info_C;
    begin
        DAMAIC.Next := Extension_Records.To_C(Struct.Next);
        DAMAIC.Image := Struct.Image;
        DAMAIC.Buffer := Struct.Buffer;

        return DAMAIC;
    end To_C;

    procedure Free
        (Struct: in out Dedicated_Allocation_Memory_Allocate_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.NV.Physical_Device_Corner_Sampled_Image_Features;
         C_Struct: in Physical_Device_Corner_Sampled_Image_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Corner_Sampled_Image :=
            Utilities.To_Ada(C_Struct.Corner_Sampled_Image);
    end To_Ada;

    function To_C
        (Struct: in Extensions.NV.Pipeline_Viewport_W_Scaling_State_Create_Info)
        return Pipeline_Viewport_W_Scaling_State_Create_Info_C is
        procedure To_C_Array is new Utilities.To_C_Array
            (Viewport_W_Scaling_Arrays,
             Extensions.NV.Viewport_W_Scaling_Vectors);

        PVWSSCIC: Pipeline_Viewport_W_Scaling_State_Create_Info_C;
    begin
        PVWSSCIC.Next := Extension_Records.To_C(Struct.Next);
        PVWSSCIC.Viewport_W_Scaling_Enable :=
            Utilities.To_C(Struct.Viewport_W_Scaling_Enable);
        To_C_Array(PVWSSCIC.Viewport_Count,
                   Struct.Viewport_W_Scalings,
                   PVWSSCIC.Viewport_W_Scalings);

        return PVWSSCIC;
    end To_C;

    procedure Free
        (Struct: in out Pipeline_Viewport_W_Scaling_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Viewport_W_Scaling_Arrays.Free(Struct.Viewport_W_Scalings);
    end Free;

    function To_C
        (Struct: in Extensions.NV.Pipeline_Viewport_Swizzle_State_Create_Info)
        return Pipeline_Viewport_Swizzle_State_Create_Info_C is
        procedure To_C_Array is new Utilities.To_C_Array
            (Viewport_Swizzle_Arrays, Extensions.NV.Viewport_Swizzle_Vectors);

        PVSSCIC: Pipeline_Viewport_Swizzle_State_Create_Info_C;
    begin
        PVSSCIC.Next := Extension_Records.To_C(Struct.Next);
        PVSSCIC.Flags := Struct.Flags;
        To_C_Array(PVSSCIC.Viewport_Count,
                   Struct.Viewport_Swizzles,
                   PVSSCIC.Viewport_Swizzles);

        return PVSSCIC;
    end To_C;

    procedure Free
        (Struct: in out Pipeline_Viewport_Swizzle_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Viewport_Swizzle_Arrays.Free(Struct.Viewport_Swizzles);
    end Free;

    function To_C
        (Struct: in Extensions.NV.Pipeline_Coverage_To_Color_State_Create_Info)
        return Pipeline_Coverage_To_Color_State_Create_Info_C is
        PCTCSCIC: Pipeline_Coverage_To_Color_State_Create_Info_C;
    begin
        PCTCSCIC.Next := Extension_Records.To_C(Struct.Next);
        PCTCSCIC.Flags := Struct.Flags;
        PCTCSCIC.Coverage_To_Color_Enable :=
            Utilities.To_C(Struct.Coverage_To_Color_Enable);
        PCTCSCIC.Coverage_To_Color_Location :=
            Struct.Coverage_To_Color_Location;

        return PCTCSCIC;
    end To_C;

    procedure Free
        (Struct: in out Pipeline_Coverage_To_Color_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C
        (Struct:
            in Extensions.NV.Pipeline_Coverage_Modulation_State_Create_Info)
        return Pipeline_Coverage_Modulation_State_Create_Info_C is
        procedure To_C_Array is 
            new Utilities.To_C_Array(C.Float_Arrays,
                                     Extensions.NV.Float_Vectors);

        PCMSCIC: Pipeline_Coverage_Modulation_State_Create_Info_C;
    begin
        PCMSCIC.Next := Extension_Records.To_C(Struct.Next);
        PCMSCIC.Flags := Struct.Flags;
        PCMSCIC.Coverage_Modulation_Mode := Struct.Coverage_Modulation_Mode;
        PCMSCIC.Coverage_Modulation_Table_Enable :=
            Utilities.To_C(Struct.Coverage_Modulation_Table_Enable);
        To_C_Array(PCMSCIC.Coverage_Modulation_Table_Count,
                   Struct.Coverage_Modulation_Table,
                   PCMSCIC.Coverage_Modulation_Table);

        return PCMSCIC;
    end To_C;

    procedure Free
        (Struct: in out Pipeline_Coverage_Modulation_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        C.Float_Arrays.Free(Struct.Coverage_Modulation_Table);
    end Free;

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.NV.Physical_Device_Shader_SM_Builtins_Properties;
         C_Struct: in Physical_Device_Shader_SM_Builtins_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Shader_SM_Count := C_Struct.Shader_SM_Count;
        Ada_Struct.Shader_Warps_Per_SM := C_Struct.Shader_Warps_Per_SM;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.NV.Physical_Device_Shader_SM_Builtins_Features;
         C_Struct: in Physical_Device_Shader_SM_Builtins_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Shader_SM_Builtins :=
            Utilities.To_Ada(C_Struct.Shader_SM_Builtins);
    end To_Ada;

    function To_C
        (Struct: in
           Extensions.NV.Pipeline_Viewport_Shading_Rate_Image_State_Create_Info)
        return Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_C is
        function To_C(Struct: in Extensions.NV.Shading_Rate_Palette)
            return Shading_Rate_Palette_C is
            procedure To_C_Array is new Utilities.To_C_Array
                (Shading_Rate_Palette_Entry_Arrays,
                 Extensions.NV.Shading_Rate_Palette_Entry_Vectors);

            SRPC: Shading_Rate_Palette_C;
        begin
            To_C_Array(SRPC.Shading_Rate_Palette_Entry_Count,
                       Struct.Shading_Rate_Palette_Entries,
                       SRPC.Shading_Rate_Palette_Entries);

            return SRPC;
        end To_C;

        procedure To_C_Array is new Utilities.To_C_Array_Convert
            (Shading_Rate_Palette_C_Arrays,
             Extensions.NV.Shading_Rate_Palette_Vectors);

        PVSRISCIC: Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_C;
        Dummy: Interfaces.Unsigned_32;
    begin
        PVSRISCIC.Next := Extension_Records.To_C(Struct.Next);
        PVSRISCIC.Shading_Rate_Image_Enable :=
            Utilities.To_C(Struct.Shading_Rate_Image_Enable);
        PVSRISCIC.Viewport_Count := Struct.Viewport_Count;
        To_C_Array(Dummy,
                   Struct.Shading_Rate_Palettes,
                   PVSRISCIC.Shading_Rate_Palettes);

        return PVSRISCIC;
    end To_C;

    procedure Free
        (Struct: in out
            Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Shading_Rate_Palette_C_Arrays.Free(Struct.Shading_Rate_Palettes,
                                           Free'Access);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Shading_Rate_Image_Features;
         C_Struct: in Physical_Device_Shading_Rate_Image_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Shading_Rate_Image :=
            Utilities.To_Ada(C_Struct.Shading_Rate_Image);
        Ada_Struct.Shading_Rate_Coarse_Sample_Order :=
            Utilities.To_Ada(C_Struct.Shading_Rate_Coarse_Sample_Order);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Shading_Rate_Image_Properties;
         C_Struct: in Physical_Device_Shading_Rate_Image_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Shading_Rate_Texel_Size := C_Struct.Shading_Rate_Texel_Size;
        Ada_Struct.Shading_Rate_Palette_Size :=
            C_Struct.Shading_Rate_Palette_Size;
        Ada_Struct.Shading_Rate_Max_Coarse_Samples :=
            C_Struct.Shading_Rate_Max_Coarse_Samples;
    end To_Ada;

    function To_C(Struct: in Extensions.NV.Coarse_Sample_Order_Custom)
        return Coarse_Sample_Order_Custom_C is
        procedure To_C_Array is new Utilities.To_C_Array
            (Coarse_Sample_Location_Arrays,
             Extensions.NV.Coarse_Sample_Location_Vectors);

        CSOCC: Coarse_Sample_Order_Custom_C;
    begin
        CSOCC.Shading_Rate := Struct.Shading_Rate;
        CSOCC.Sample_Count := Struct.Sample_Count;
        To_C_Array(CSOCC.Sample_Location_Count,
                   Struct.Sample_Locations,
                   CSOCC.Sample_Locations);

        return CSOCC;
    end To_C;

    procedure Free(Struct: in out Coarse_Sample_Order_Custom_C) is
    begin
        Coarse_Sample_Location_Arrays.Free(Struct.Sample_Locations);
    end Free;

    function To_C
        (Struct: in
          Extensions.NV.Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info)
        return Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_C is
        procedure To_C_Array is new Utilities.To_C_Array_Convert
            (Coarse_Sample_Order_Custom_C_Arrays,
             Extensions.NV.Coarse_Sample_Order_Custom_Vectors);

        PVCSOSCIC: Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_C;
    begin
        PVCSOSCIC.Next := Extension_Records.To_C(Struct.Next);
        PVCSOSCIC.Sample_Order_Type := Struct.Sample_Order_Type;
        To_C_Array(PVCSOSCIC.Custom_Sample_Order_Count,
                   Struct.Custom_Sample_Orders,
                   PVCSOSCIC.Custom_Sample_Orders);

        return PVCSOSCIC;
    end To_C;

    procedure Free
        (Struct: in out
            Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Coarse_Sample_Order_Custom_C_Arrays.Free(Struct.Custom_Sample_Orders,
                                                 Free'Access);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Representative_Fragment_Test_Features;
         C_Struct: in
            Physical_Device_Representative_Fragment_Test_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Representative_Fragment_Test :=
            Utilities.To_Ada(C_Struct.Representative_Fragment_Test);
    end To_Ada;

    function To_C
        (Struct: in
          Extensions.NV.Pipeline_Representative_Fragment_Test_State_Create_Info)
        return Pipeline_Representative_Fragment_Test_State_Create_Info_C is
        PRFTSCIC: Pipeline_Representative_Fragment_Test_State_Create_Info_C;
    begin
        PRFTSCIC.Next := Extension_Records.To_C(Struct.Next);
        PRFTSCIC.Representative_Fragment_Test_Enable := 
            Utilities.To_C(Struct.Representative_Fragment_Test_Enable);

        return PRFTSCIC;
    end To_C;

    procedure Free
        (Struct: in out
            Pipeline_Representative_Fragment_Test_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out Extensions.NV.Physical_Device_Mesh_Shader_Features;
         C_Struct: in Physical_Device_Mesh_Shader_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Task_Shader := Utilities.To_Ada(C_Struct.Task_Shader);
        Ada_Struct.Mesh_Shader := Utilities.To_Ada(C_Struct.Mesh_Shader);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Mesh_Shader_Properties;
         C_Struct: in Physical_Device_Mesh_Shader_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Max_Draw_Mesh_Tasks_Count :=
            C_Struct.Max_Draw_Mesh_Tasks_Count;
        Ada_Struct.Max_Task_Work_Group_Invocations :=
            C_Struct.Max_Task_Work_Group_Invocations;
        Ada_Struct.Max_Task_Work_Group_Size :=
            C_Struct.Max_Task_Work_Group_Size;
        Ada_Struct.Max_Task_Total_Memory_Size :=
            C_Struct.Max_Task_Total_Memory_Size;
        Ada_Struct.Max_Task_Output_Count := C_Struct.Max_Task_Output_Count;
        Ada_Struct.Max_Mesh_Work_Group_Invocations :=
            C_Struct.Max_Mesh_Work_Group_Invocations;
        Ada_Struct.Max_Mesh_Work_Group_Size :=
            C_Struct.Max_Mesh_Work_Group_Size;
        Ada_Struct.Max_Mesh_Total_Memory_Size :=
            C_Struct.Max_Mesh_Total_Memory_Size;
        Ada_Struct.Max_Mesh_Output_Vertices :=
            C_Struct.Max_Mesh_Output_Vertices;
        Ada_Struct.Max_Mesh_Output_Primitives :=
            C_Struct.Max_Mesh_Output_Primitives;
        Ada_Struct.Max_Mesh_Multiview_View_Count :=
            C_Struct.Max_Mesh_Multiview_View_Count;
        Ada_Struct.Mesh_Output_Per_Vertex_Granularity :=
            C_Struct.Mesh_Output_Per_Vertex_Granularity;
        Ada_Struct.Mesh_Output_Per_Primitive_Granularity :=
            C_Struct.Mesh_Output_Per_Primitive_Granularity;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Shader_Image_Footprint_Features;
         C_Struct: in Physical_Device_Shader_Image_Footprint_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Image_Footprint :=
            Utilities.To_Ada(C_Struct.Image_Footprint);
    end To_Ada;

    function To_C
        (Struct: in
            Extensions.NV.Pipeline_Viewport_Exclusive_Scissor_State_Create_Info)
        return Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_C is
        procedure To_C_Array is new Utilities.To_C_Array(C.Rect_2D_Arrays,
                                                         Rect_2D_Vectors);

        PVESSCIC: Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_C;
    begin
        PVESSCIC.Next := Extension_Records.To_C(Struct.Next);
        To_C_Array(PVESSCIC.Exclusive_Scissor_Count,
                   Struct.Exclusive_Scissors,
                   PVESSCIC.Exclusive_Scissors);

        return PVESSCIC;
    end To_C;

    procedure Free
        (Struct: in out 
            Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        C.Rect_2D_Arrays.Free(Struct.Exclusive_Scissors);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Exclusive_Scissor_Features;
         C_Struct: in Physical_Device_Exclusive_Scissor_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Exclusive_Scissor :=
            Utilities.To_Ada(C_Struct.Exclusive_Scissor);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out Extensions.NV.Queue_Family_Checkpoint_Properties;
         C_Struct: in Queue_Family_Checkpoint_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Checkpoint_Execution_Stage_Mask :=
            C_Struct.Checkpoint_Execution_Stage_Mask;
    end To_Ada;

    procedure To_Ada(Ada_Struct: in out Extensions.NV.Checkpoint_Data;
                     C_Struct: in Checkpoint_Data_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Stage := C_Struct.Stage;
        Ada_Struct.Checkpoint_Marker := C_Struct.Checkpoint_Marker;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out Extensions.NV.Queue_Family_Checkpoint_Properties_2;
         C_Struct: in Queue_Family_Checkpoint_Properties_2_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Checkpoint_Execution_Stage_Mask :=
            C_Struct.Checkpoint_Execution_Stage_Mask;
    end To_Ada;

    procedure To_Ada(Ada_Struct: in out Extensions.NV.Checkpoint_Data_2;
                     C_Struct: in Checkpoint_Data_2_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Stage := C_Struct.Stage;
        Ada_Struct.Checkpoint_Marker := C_Struct.Checkpoint_Marker;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
     Extensions.NV.Physical_Device_Dedicated_Allocation_Image_Aliasing_Features;
         C_Struct: in
            Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Dedicated_Allocation_Image_Aliasing :=
            Utilities.To_Ada(C_Struct.Dedicated_Allocation_Image_Aliasing);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out Extensions.NV.Cooperative_Matrix_Properties;
         C_Struct: in Cooperative_Matrix_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.M_Size := C_Struct.M_Size;
        Ada_Struct.N_Size := C_Struct.N_Size;
        Ada_Struct.K_Size := C_Struct.K_Size;
        Ada_Struct.A_Type := C_Struct.A_Type;
        Ada_Struct.B_Type := C_Struct.B_Type;
        Ada_Struct.C_Type := C_Struct.C_Type;
        Ada_Struct.D_Type := C_Struct.D_Type;
        Ada_Struct.Scope := C_Struct.Scope;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Cooperative_Matrix_Features;
         C_Struct: in Physical_Device_Cooperative_Matrix_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Cooperative_Matrix :=
            Utilities.To_Ada(C_Struct.Cooperative_Matrix);
        Ada_Struct.Cooperative_Matrix_Robust_Buffer_Access :=
            Utilities.To_Ada(C_Struct.Cooperative_Matrix_Robust_Buffer_Access);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Cooperative_Matrix_Properties;
         C_Struct: in Physical_Device_Cooperative_Matrix_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Cooperative_Matrix_Supported_Stages :=
            C_Struct.Cooperative_Matrix_Supported_Stages;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Coverage_Reduction_Mode_Features;
         C_Struct: in Physical_Device_Coverage_Reduction_Mode_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Coverage_Reduction_Mode :=
            Utilities.To_Ada(C_Struct.Coverage_Reduction_Mode);
    end To_Ada;

    function To_C
        (Struct: in Extensions.NV.Pipeline_Coverage_Reduction_State_Create_Info)
        return Pipeline_Coverage_Reduction_State_Create_Info_C is
        PCRSCIC: Pipeline_Coverage_Reduction_State_Create_Info_C;
    begin
        PCRSCIC.Next := Extension_Records.To_C(Struct.Next);
        PCRSCIC.Flags := Struct.Flags;
        PCRSCIC.Coverage_Reduction_Mode := Struct.Coverage_Reduction_Mode;

        return PCRSCIC;
    end To_C;

    procedure Free
        (Struct: in out Pipeline_Coverage_Reduction_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out Extensions.NV.Framebuffer_Mixed_Samples_Combination;
         C_Struct: in Framebuffer_Mixed_Samples_Combination_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Coverage_Reduction_Mode := C_Struct.Coverage_Reduction_Mode;
        Ada_Struct.Rasterization_Samples := C_Struct.Rasterization_Samples;
        Ada_Struct.Depth_Stencil_Samples := C_Struct.Depth_Stencil_Samples;
        Ada_Struct.Color_Samples := C_Struct.Color_Samples;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Device_Generated_Commands_Properties;
         C_Struct: in Physical_Device_Device_Generated_Commands_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Max_Graphics_Shader_Group_Count :=
            C_Struct.Max_Graphics_Shader_Group_Count;
        Ada_Struct.Max_Indirect_Sequence_Count :=
            C_Struct.Max_Indirect_Sequence_Count;
        Ada_Struct.Max_Indirect_Commands_Token_Count :=
            C_Struct.Max_Indirect_Commands_Token_Count;
        Ada_Struct.Max_Indirect_Commands_Stream_Count :=
            C_Struct.Max_Indirect_Commands_Stream_Count;
        Ada_Struct.Max_Indirect_Commands_Token_Offset :=
            C_Struct.Max_Indirect_Commands_Token_Offset;
        Ada_Struct.Max_Indirect_Commands_Stream_Stride :=
            C_Struct.Max_Indirect_Commands_Stream_Stride;
        Ada_Struct.Min_Sequences_Count_Buffer_Offset_Alignment :=
            C_Struct.Min_Sequences_Count_Buffer_Offset_Alignment;
        Ada_Struct.Min_Sequences_Index_Buffer_Offset_Alignment :=
            C_Struct.Min_Sequences_Index_Buffer_Offset_Alignment;
        Ada_Struct.Min_Indirect_Commands_Buffer_Offset_Alignment :=
            C_Struct.Min_Indirect_Commands_Buffer_Offset_Alignment;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Device_Generated_Commands_Features;
         C_Struct: in Physical_Device_Device_Generated_Commands_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Device_Generated_Commands :=
            Utilities.To_Ada(C_Struct.Device_Generated_Commands);
    end To_Ada;

    function To_C(Struct: in Extensions.NV.Graphics_Shader_Group_Create_Info)
        return Graphics_Shader_Group_Create_Info_C is
        procedure To_C_Array is new Utilities.To_C_Array_Convert
            (C.Pipeline_Shader_Stage_Create_Info_C_Arrays,
             Pipeline_Shader_Stage_Create_Info_Vectors,
             C.To_C);

        GSGCIC: Graphics_Shader_Group_Create_Info_C;
    begin
        GSGCIC.Next := Extension_Records.To_C(Struct.Next);
        To_C_Array(GSGCIC.Stage_Count,
                   Struct.Stages,
                   GSGCIC.Stages);
        GSGCIC.Vertex_Input_State :=
            new C.Pipeline_Vertex_Input_State_Create_Info_C'
                (C.To_C(Struct.Vertex_Input_State.all));
        GSGCIC.Tessellation_State :=
            new C.Pipeline_Tessellation_State_Create_Info_C'
                (C.To_C(Struct.Tessellation_State.all));

        return GSGCIC;
    end To_C;

    procedure Free(Struct: in out Graphics_Shader_Group_Create_Info_C) is
        procedure Free is new Ada.Unchecked_Deallocation
            (C.Pipeline_Vertex_Input_State_Create_Info_C,
             C.Pipeline_Vertex_Input_State_Create_Info_C_Access);
        procedure Free is new Ada.Unchecked_Deallocation
            (C.Pipeline_Tessellation_State_Create_Info_C,
             C.Pipeline_Tessellation_State_Create_Info_C_Access);
    begin
        Extension_Records.Free(Struct.Next);
        C.Pipeline_Shader_Stage_Create_Info_C_Arrays.Free(Struct.Stages,
                                                          C.Free'Access);
        C.Free(Struct.Vertex_Input_State.all);
        C.Free(Struct.Tessellation_State.all);
        Free(Struct.Vertex_Input_State);
        Free(Struct.Tessellation_State);
    end Free;

    function To_C
        (Struct: in Extensions.NV.Graphics_Pipeline_Shader_Groups_Create_Info)
        return Graphics_Pipeline_Shader_Groups_Create_Info_C is
        procedure To_C_Array is new Utilities.To_C_Array_Convert
            (Graphics_Shader_Group_Create_Info_C_Arrays,
             Extensions.NV.Graphics_Shader_Group_Create_Info_Vectors);
        procedure To_C_Array is
            new Utilities.To_C_Array(C_KHR.Pipeline_Arrays, Pipeline_Vectors);

        GPSGCIC: Graphics_Pipeline_Shader_Groups_Create_Info_C;
    begin
        GPSGCIC.Next := Extension_Records.To_C(Struct.Next);
        To_C_Array(GPSGCIC.Group_Count, Struct.Groups, GPSGCIC.Groups);
        To_C_Array(GPSGCIC.Pipeline_Count, Struct.Pipelines, GPSGCIC.Pipelines);

        return GPSGCIC;
    end To_C;

    procedure Free
        (Struct: in out Graphics_Pipeline_Shader_Groups_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Graphics_Shader_Group_Create_Info_C_Arrays.Free(Struct.Groups,
                                                        Free'Access);
        C_KHR.Pipeline_Arrays.Free(Struct.Pipelines);
    end Free;

    function To_C(Struct: in Extensions.NV.Indirect_Commands_Layout_Token)
        return Indirect_Commands_Layout_Token_C is
        procedure To_C_Array is new Utilities.To_C_Array
            (Index_Type_Arrays, Index_Type_Vectors);
        procedure To_C_Array is new Utilities.To_C_Array
            (C.Uint32_t_Arrays, Unsigned_32_Vectors);

        ICLTC: Indirect_Commands_Layout_Token_C;
    begin
        ICLTC.Next := Extension_Records.To_C(Struct.Next);
        ICLTC.Token_Type := Struct.Token_Type;
        ICLTC.Stream := Struct.Stream;
        ICLTC.Offset := Struct.Offset;
        ICLTC.Vertex_Binding_Unit := Struct.Vertex_Binding_Unit;
        ICLTC.Vertex_Dynamic_Stride :=
            Utilities.To_C(Struct.Vertex_Dynamic_Stride);
        ICLTC.Push_Constant_Pipeline_Layout :=
            Struct.Push_Constant_Pipeline_Layout;
        ICLTC.Push_Constant_Shader_Stage_Flags :=
            Struct.Push_Constant_Shader_Stage_Flags;
        ICLTC.Push_Constant_Offset := Struct.Push_Constant_Offset;
        ICLTC.Push_Constant_Size := Struct.Push_Constant_Size;
        ICLTC.Indirect_State_Flags := Struct.Indirect_State_Flags;
        To_C_Array(ICLTC.Index_Type_Count,
                   Struct.Index_Types,
                   ICLTC.Index_Types);
        To_C_Array(ICLTC.Index_Type_Count,
                   Struct.Index_Type_Values,
                   ICLTC.Index_Type_Values);

        return ICLTC;
    end To_C;
                                                       
    procedure Free(Struct: in out Indirect_Commands_Layout_Token_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Index_Type_Arrays.Free(Struct.Index_Types);
        C.Uint32_t_Arrays.Free(Struct.Index_Type_Values);
    end Free;

    function To_C(Struct: in Extensions.NV.Indirect_Commands_Layout_Create_Info)
        return Indirect_Commands_Layout_Create_Info_C is
        procedure To_C_Array is new Utilities.To_C_Array_Convert
            (Indirect_Commands_Layout_Token_C_Arrays,
             Extensions.NV.Indirect_Commands_Layout_Token_Vectors);
        procedure To_C_Array is new Utilities.To_C_Array
            (C.Uint32_t_Arrays, Unsigned_32_Vectors);

        ICLCIC: Indirect_Commands_Layout_Create_Info_C;
    begin
        ICLCIC.Next := Extension_Records.To_C(Struct.Next);
        ICLCIC.Flags := Struct.Flags;
        ICLCIC.Pipeline_Bind_Point := Struct.Pipeline_Bind_Point;
        To_C_Array(ICLCIC.Token_Count, Struct.Tokens, ICLCIC.Tokens);
        To_C_Array(ICLCIC.Stream_Count,
                   Struct.Stream_Strides,
                   ICLCIC.Stream_Strides);

        return ICLCIC;
    end To_C;

    procedure Free(Struct: in out Indirect_Commands_Layout_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Indirect_Commands_Layout_Token_C_Arrays.Free(Struct.Tokens,
                                                     Free'Access);
        C.UInt32_t_Arrays.Free(Struct.Stream_Strides);
    end Free;

    function To_C(Struct: in Extensions.NV.Generated_Commands_Info)
        return Generated_Commands_Info_C is
        procedure To_C_Array is new Utilities.To_C_Array
            (Indirect_Commands_Stream_Arrays,
             Extensions.NV.Indirect_Commands_Stream_Vectors);

        GCIC: Generated_Commands_Info_C;
    begin
        GCIC.Next := Extension_Records.To_C(Struct.Next);
        GCIC.Pipeline_Bind_Point := Struct.Pipeline_Bind_Point;
        GCIC.Pipeline := Struct.Pipeline;
        GCIC.Indirect_Commands_Layout := Struct.Indirect_Commands_Layout;
        To_C_Array(GCIC.Stream_Count, Struct.Streams, GCIC.Streams);
        GCIC.Sequences_Count := Struct.Sequences_Count;
        GCIC.Preprocess_Buffer := Struct.Preprocess_Buffer;
        GCIC.Preprocess_Offset := Struct.Preprocess_Offset;
        GCIC.Preprocess_Size := Struct.Preprocess_Size;
        GCIC.Sequences_Count_Buffer := Struct.Sequences_Count_Buffer;
        GCIC.Sequences_Count_Offset := Struct.Sequences_Count_Offset;
        GCIC.Sequences_Index_Buffer := Struct.Sequences_Index_Buffer;
        GCIC.Sequences_Index_Offset := Struct.Sequences_Index_Offset;

        return GCIC;
    end To_C;

    procedure Free(Struct: in out Generated_Commands_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Indirect_Commands_Stream_Arrays.Free(Struct.Streams);
    end Free;

    function To_C
        (Struct: in Extensions.NV.Generated_Commands_Memory_Requirements_Info)
        return Generated_Commands_Memory_Requirements_Info_C is
        GCMRIC: Generated_Commands_Memory_Requirements_Info_C;
    begin
        GCMRIC.Next := Extension_Records.To_C(Struct.Next);
        GCMRIC.Pipeline_Bind_Point := Struct.Pipeline_Bind_Point;
        GCMRIC.Pipeline := Struct.Pipeline;
        GCMRIC.Indirect_Commands_Layout := Struct.Indirect_Commands_Layout;
        GCMRIC.Max_Sequences_Count := Struct.Max_Sequences_Count;

        return GCMRIC;
    end To_C;

    procedure Free
        (Struct: in out Generated_Commands_Memory_Requirements_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Inherited_Viewport_Scissor_Features;
         C_Struct: in Physical_Device_Inherited_Viewport_Scissor_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Inherited_Viewport_Scissor_2D :=
            Utilities.To_Ada(C_Struct.Inherited_Viewport_Scissor_2D);
    end To_Ada;

    function To_C
        (Struct: in
            Extensions.NV.Command_Buffer_Inheritance_Viewport_Scissor_Info)
        return Command_Buffer_Inheritance_Viewport_Scissor_Info_C is
        procedure To_C_Array is new Utilities.To_C_Array
            (C.Viewport_Arrays, Viewport_Vectors);

        CBIVSIC: Command_Buffer_Inheritance_Viewport_Scissor_Info_C;
    begin
        CBIVSIC.Next := Extension_Records.To_C(Struct.Next);
        CBIVSIC.Viewport_Scissor_2D :=
            Utilities.To_C(Struct.Viewport_Scissor_2D);
        To_C_Array(CBIVSIC.Viewport_Depth_Count,
                   Struct.Viewport_Depths,
                   CBIVSIC.Viewport_Depths);

        return CBIVSIC;
    end To_C;

    procedure Free
        (Struct: in out Command_Buffer_Inheritance_Viewport_Scissor_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        C.Viewport_Arrays.Free(Struct.Viewport_Depths);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Present_Barrier_Features;
         C_Struct: in Physical_Device_Present_Barrier_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Present_Barrier :=
            Utilities.To_Ada(C_Struct.Present_Barrier);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out Extensions.NV.Surface_Capabilities_Present_Barrier;
         C_Struct: in Surface_Capabilities_Present_Barrier_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Present_Barrier_Supported :=
            Utilities.To_Ada(C_Struct.Present_Barrier_Supported);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out Extensions.NV.Swapchain_Present_Barrier_Create_Info;
         C_Struct: in Swapchain_Present_Barrier_Create_Info_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Present_Barrier_Enable :=
            Utilities.To_Ada(C_Struct.Present_Barrier_Enable);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Diagnostics_Config_Features;
         C_Struct: in Physical_Device_Diagnostics_Config_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Diagnostics_Config :=
            Utilities.To_Ada(C_Struct.Diagnostics_Config);
    end To_Ada;

    function To_C
        (Struct: in Extensions.NV.Device_Diagnostics_Config_Create_Info)
        return Device_Diagnostics_Config_Create_Info_C is
        DDCCIC: Device_Diagnostics_Config_Create_Info_C;
    begin
        DDCCIC.Next := Extension_Records.To_C(Struct.Next);
        DDCCIC.Flags := Struct.Flags;

        return DDCCIC;
    end To_C;

    procedure Free(Struct: in out Device_Diagnostics_Config_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.NV.CUDA_Module_Create_Info)
        return CUDA_Module_Create_Info_C is
        CMCIC: CUDA_Module_Create_Info_C;
    begin
        CMCIC.Next := Extension_Records.To_C(Struct.Next);
        CMCIC.Data_Size := Struct.Data_Size;
        CMCIC.Data := Struct.Data;

        return CMCIC;
    end To_C;

    procedure Free(Struct: in out CUDA_Module_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.NV.CUDA_Function_Create_Info)
        return CUDA_Function_Create_Info_C is
        CFCIC: CUDA_Function_Create_Info_C;
    begin
        CFCIC.Next := Extension_Records.To_C(Struct.Next);
        CFCIC.Module := Struct.Module;
        CFCIC.Name := Interfaces.C.Strings.New_String
            (Ada.Strings.Unbounded.To_String(Struct.Name));

        return CFCIC;
    end To_C;

    procedure Free(Struct: in out CUDA_Function_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Interfaces.C.Strings.Free(Struct.Name);
    end Free;

    function To_C(Struct: in Extensions.NV.CUDA_Launch_Info)
        return CUDA_Launch_Info_C is
        procedure To_C_Array is new Utilities.To_C_Array_Count_Type
            (Interfaces.C.size_t,
             Void_Pointer_Arrays,
             Extensions.NV.Void_Pointer_Vectors);

        CLIC: CUDA_Launch_Info_C;
    begin
        CLIC.Next := Extension_Records.To_C(Struct.Next);
        CLIC.Grid_Dim_X := Struct.Grid_Dim_X;
        CLIC.Grid_Dim_Y := Struct.Grid_Dim_Y;
        CLIC.Grid_Dim_Z := Struct.Grid_Dim_Z;
        CLIC.Block_Dim_X := Struct.Block_Dim_X;
        CLIC.Block_Dim_Y := Struct.Block_Dim_Y;
        CLIC.Block_Dim_Z := Struct.Block_Dim_Z;
        To_C_Array(CLIC.Param_Count, Struct.Params, CLIC.Params);
        To_C_Array(CLIC.Extra_Count, Struct.Extras, CLIC.Extras);

        return CLIC;
    end To_C;

    procedure Free(Struct: in out CUDA_Launch_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Void_Pointer_Arrays.Free(Struct.Params);
        Void_Pointer_Arrays.Free(Struct.Extras);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_CUDA_Kernel_Launch_Features;
         C_Struct: in Physical_Device_CUDA_Kernel_Launch_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.CUDA_Kernel_Launch_Features :=
            Utilities.To_Ada(C_Struct.CUDA_Kernel_Launch_Features);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_CUDA_Kernel_Launch_Properties;
         C_Struct: in Physical_Device_CUDA_Kernel_Launch_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Compute_Capability_Minor :=
            C_Struct.Compute_Capability_Minor;
        Ada_Struct.Compute_Capability_Major :=
            C_Struct.Compute_Capability_Major;
    end To_Ada;

    function To_C(Struct: in Extensions.NV.Query_Low_Latency_Support)
        return Query_Low_Latency_Support_C is
        QLLSC: Query_Low_Latency_Support_C;
    begin
        QLLSC.Next := Extension_Records.To_C(Struct.Next);
        QLLSC.Queried_Low_Latency_Data := Struct.Queried_Low_Latency_Data;

        return QLLSC;
    end To_C;

    procedure Free(Struct: in out Query_Low_Latency_Support_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Fragment_Shading_Rate_Enums_Features;
         C_Struct: in Physical_Device_Fragment_Shading_Rate_Enums_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Fragment_Shading_Rate_Enums :=
            Utilities.To_Ada(C_Struct.Fragment_Shading_Rate_Enums);
        Ada_Struct.Supersample_Fragment_Shading_Rates :=
            Utilities.To_Ada(C_Struct.Supersample_Fragment_Shading_Rates);
        Ada_Struct.No_Invocation_Fragment_Shading_Rates :=
            Utilities.To_Ada(C_Struct.No_Invocation_Fragment_Shading_Rates);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
           Extensions.NV.Physical_Device_Fragment_Shading_Rate_Enums_Properties;
         C_Struct: in Physical_Device_Fragment_Shading_Rate_Enums_Properties_C)
        is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Max_Fragment_Shading_Rate_Invocation_Count :=
            C_Struct.Max_Fragment_Shading_Rate_Invocation_Count;
    end To_Ada;

    function To_C
        (Struct: in
            Extensions.NV.Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info)
        return Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_C is
        PFSRESCIC: Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_C;
    begin
        PFSRESCIC.Next := Extension_Records.To_C(Struct.Next);
        PFSRESCIC.Shading_Rate_Type := Struct.Shading_Rate_Type;
        PFSRESCIC.Shading_Rate := Struct.Shading_Rate;
        PFSRESCIC.Combiner_Ops := Struct.Combiner_Ops;

        return PFSRESCIC;
    end To_C;

    procedure Free
        (Struct: in out
            Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C
        (Struct: in
            Extensions.NV.Acceleration_Structure_Geometry_Motion_Triangles_Data)
        return Acceleration_Structure_Geometry_Motion_Triangles_Data_C is
        ASGMTDC: Acceleration_Structure_Geometry_Motion_Triangles_Data_C;
    begin
        ASGMTDC.Next := Extension_Records.To_C(Struct.Next);

        case Struct.Address_Type is
            when Extensions.KHR.Device =>
                ASGMTDC.Vertex_Data.Device_Address := Struct.Device_Address;
            when Extensions.KHR.Host =>
                ASGMTDC.Vertex_Data.Host_Address := Struct.Host_Address;
        end case;

        return ASGMTDC;
    end To_C;

    procedure Free
        (Struct: in out
            Acceleration_Structure_Geometry_Motion_Triangles_Data_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.NV.Acceleration_Structure_Motion_Info)
        return Acceleration_Structure_Motion_Info_C is
        ASMIC: Acceleration_Structure_Motion_Info_C;
    begin
        ASMIC.Next := Extension_Records.To_C(Struct.Next);
        ASMIC.Max_Instances := Struct.Max_Instances;
        ASMIC.Flags := Struct.Flags;

        return ASMIC;
    end To_C;

    procedure Free(Struct: in out Acceleration_Structure_Motion_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_Ray_Tracing_Motion_Blur_Features;
         C_Struct: in Physical_Device_Ray_Tracing_Motion_Blur_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Ray_Tracing_Motion_Blur :=
            Utilities.To_Ada(C_Struct.Ray_Tracing_Motion_Blur);
        Ada_Struct.Ray_Tracing_Motion_Blur_Pipeline_Trace_Rays_Indirect :=
            Utilities.To_Ada
                (C_Struct.Ray_Tracing_Motion_Blur_Pipeline_Trace_Rays_Indirect);
    end To_Ada;

    function To_C(Struct: in Extensions.NV.Memory_Get_Remote_Address_Info)
        return Memory_Get_Remote_Address_Info_C is
        MGRAIC: Memory_Get_Remote_Address_Info_C;
    begin
        MGRAIC.Next := Extension_Records.To_C(Struct.Next);
        MGRAIC.Memory := Struct.Memory;
        MGRAIC.Handle_Type := Struct.Handle_Type;

        return MGRAIC;
    end To_C;

    procedure Free(Struct: in out Memory_Get_Remote_Address_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.NV.Physical_Device_External_Memory_RDMA_Features;
         C_Struct: in Physical_Device_External_Memory_RDMA_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.External_Memory_RDMA :=
            Utilities.To_Ada(C_Struct.External_Memory_RDMA);
    end To_Ada;

    function To_C(Next: in In_Structure_Access)
        return C.In_Structure_C_Access is
    begin
        if Next = null then
            return null;
        end if;

        case In_Structure(Next.Record_Type) is
            when Dedicated_Allocation_Image_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.NV.Dedicated_Allocation_Image_Create_Info,
                         Dedicated_Allocation_Image_Create_Info_C,
                         Dedicated_Allocation_Image_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Dedicated_Allocation_Buffer_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.NV.Dedicated_Allocation_Buffer_Create_Info,
                         Dedicated_Allocation_Buffer_Create_Info_C,
                         Dedicated_Allocation_Buffer_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Dedicated_Allocation_Memory_Allocate_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                       (Extensions.NV.Dedicated_Allocation_Memory_Allocate_Info,
                        Dedicated_Allocation_Memory_Allocate_Info_C,
                        Dedicated_Allocation_Memory_Allocate_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Viewport_W_Scaling_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                   (Extensions.NV.Pipeline_Viewport_W_Scaling_State_Create_Info,
                    Pipeline_Viewport_W_Scaling_State_Create_Info_C,
                    Pipeline_Viewport_W_Scaling_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Viewport_Swizzle_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                     (Extensions.NV.Pipeline_Viewport_Swizzle_State_Create_Info,
                      Pipeline_Viewport_Swizzle_State_Create_Info_C,
                      Pipeline_Viewport_Swizzle_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Coverage_To_Color_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                    (Extensions.NV.Pipeline_Coverage_To_Color_State_Create_Info,
                     Pipeline_Coverage_To_Color_State_Create_Info_C,
                     Pipeline_Coverage_To_Color_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Coverage_Modulation_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                  (Extensions.NV.Pipeline_Coverage_Modulation_State_Create_Info,
                   Pipeline_Coverage_Modulation_State_Create_Info_C,
                   Pipeline_Coverage_Modulation_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
          (Extensions.NV.Pipeline_Viewport_Shading_Rate_Image_State_Create_Info,
           Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_C,
           Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
         (Extensions.NV.Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info,
          Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_C,
          Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Representative_Fragment_Test_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
         (Extensions.NV.Pipeline_Representative_Fragment_Test_State_Create_Info,
          Pipeline_Representative_Fragment_Test_State_Create_Info_C,
          Pipeline_Representative_Fragment_Test_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
           (Extensions.NV.Pipeline_Viewport_Exclusive_Scissor_State_Create_Info,
            Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_C,
            Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Coverage_Reduction_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                   (Extensions.NV.Pipeline_Coverage_Reduction_State_Create_Info,
                    Pipeline_Coverage_Reduction_State_Create_Info_C,
                    Pipeline_Coverage_Reduction_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Graphics_Shader_Group_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                   (Extensions.NV.Graphics_Shader_Group_Create_Info,
                    Graphics_Shader_Group_Create_Info_C,
                    Graphics_Shader_Group_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Graphics_Pipeline_Shader_Groups_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                     (Extensions.NV.Graphics_Pipeline_Shader_Groups_Create_Info,
                      Graphics_Pipeline_Shader_Groups_Create_Info_C,
                      Graphics_Pipeline_Shader_Groups_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Indirect_Commands_Layout_Token_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.NV.Indirect_Commands_Layout_Token,
                         Indirect_Commands_Layout_Token_C,
                         Indirect_Commands_Layout_Token_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Indirect_Commands_Layout_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.NV.Indirect_Commands_Layout_Create_Info,
                         Indirect_Commands_Layout_Create_Info_C,
                         Indirect_Commands_Layout_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Generated_Commands_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.NV.Generated_Commands_Info,
                         Generated_Commands_Info_C,
                         Generated_Commands_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Generated_Commands_Memory_Requirements_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                     (Extensions.NV.Generated_Commands_Memory_Requirements_Info,
                      Generated_Commands_Memory_Requirements_Info_C,
                      Generated_Commands_Memory_Requirements_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Command_Buffer_Inheritance_Viewport_Scissor_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                (Extensions.NV.Command_Buffer_Inheritance_Viewport_Scissor_Info,
                 Command_Buffer_Inheritance_Viewport_Scissor_Info_C,
                 Command_Buffer_Inheritance_Viewport_Scissor_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Device_Diagnostics_Config_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.NV.Device_Diagnostics_Config_Create_Info,
                         Device_Diagnostics_Config_Create_Info_C,
                         Device_Diagnostics_Config_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when CUDA_Module_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.NV.CUDA_Module_Create_Info,
                         CUDA_Module_Create_Info_C,
                         CUDA_Module_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when CUDA_Function_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.NV.CUDA_Function_Create_Info,
                         CUDA_Function_Create_Info_C,
                         CUDA_Function_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when CUDA_Launch_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.NV.CUDA_Launch_Info,
                         CUDA_Launch_Info_C,
                         CUDA_Launch_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Query_Low_Latency_Support_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.NV.Query_Low_Latency_Support,
                         Query_Low_Latency_Support_C,
                         Query_Low_Latency_Support_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
           (Extensions.NV.Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info,
            Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_C,
            Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Acceleration_Structure_Geometry_Motion_Triangles_Data_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
           (Extensions.NV.Acceleration_Structure_Geometry_Motion_Triangles_Data,
            Acceleration_Structure_Geometry_Motion_Triangles_Data_C,
            Acceleration_Structure_Geometry_Motion_Triangles_Data_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Acceleration_Structure_Motion_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.NV.Acceleration_Structure_Motion_Info,
                         Acceleration_Structure_Motion_Info_C,
                         Acceleration_Structure_Motion_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Memory_Get_Remote_Address_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.NV.Memory_Get_Remote_Address_Info,
                         Memory_Get_Remote_Address_Info_C,
                         Memory_Get_Remote_Address_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
        end case;
    end To_C;

    function To_C(Next: in Out_Structure_Access)
        return C.Out_Structure_C_Access is
    begin
        if Next = null then
            return null;
        end if;

        case Out_Structure(Next.Record_Type) is
            when Physical_Device_Corner_Sampled_Image_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                   (Extensions.NV.Physical_Device_Corner_Sampled_Image_Features,
                    Physical_Device_Corner_Sampled_Image_Features_C,
                    Physical_Device_Corner_Sampled_Image_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Shader_SM_Builtins_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                   (Extensions.NV.Physical_Device_Shader_SM_Builtins_Properties,
                    Physical_Device_Shader_SM_Builtins_Properties_C,
                    Physical_Device_Shader_SM_Builtins_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Shader_SM_Builtins_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                     (Extensions.NV.Physical_Device_Shader_SM_Builtins_Features,
                      Physical_Device_Shader_SM_Builtins_Features_C,
                      Physical_Device_Shader_SM_Builtins_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Shading_Rate_Image_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                     (Extensions.NV.Physical_Device_Shading_Rate_Image_Features,
                      Physical_Device_Shading_Rate_Image_Features_C,
                      Physical_Device_Shading_Rate_Image_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Shading_Rate_Image_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                   (Extensions.NV.Physical_Device_Shading_Rate_Image_Properties,
                    Physical_Device_Shading_Rate_Image_Properties_C,
                    Physical_Device_Shading_Rate_Image_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Representative_Fragment_Test_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
           (Extensions.NV.Physical_Device_Representative_Fragment_Test_Features,
            Physical_Device_Representative_Fragment_Test_Features_C,
            Physical_Device_Representative_Fragment_Test_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Mesh_Shader_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.NV.Physical_Device_Mesh_Shader_Features,
                         Physical_Device_Mesh_Shader_Features_C,
                         Physical_Device_Mesh_Shader_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Mesh_Shader_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.NV.Physical_Device_Mesh_Shader_Properties,
                         Physical_Device_Mesh_Shader_Properties_C,
                         Physical_Device_Mesh_Shader_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Shader_Image_Footprint_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                 (Extensions.NV.Physical_Device_Shader_Image_Footprint_Features,
                  Physical_Device_Shader_Image_Footprint_Features_C,
                  Physical_Device_Shader_Image_Footprint_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Exclusive_Scissor_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                      (Extensions.NV.Physical_Device_Exclusive_Scissor_Features,
                       Physical_Device_Exclusive_Scissor_Features_C,
                       Physical_Device_Exclusive_Scissor_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Queue_Family_Checkpoint_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.NV.Queue_Family_Checkpoint_Properties,
                         Queue_Family_Checkpoint_Properties_C,
                         Queue_Family_Checkpoint_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Checkpoint_Data_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.NV.Checkpoint_Data,
                         Checkpoint_Data_C,
                         Checkpoint_Data_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Queue_Family_Checkpoint_Properties_2_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.NV.Queue_Family_Checkpoint_Properties_2,
                         Queue_Family_Checkpoint_Properties_2_C,
                         Queue_Family_Checkpoint_Properties_2_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Checkpoint_Data_2_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.NV.Checkpoint_Data_2,
                         Checkpoint_Data_2_C,
                         Checkpoint_Data_2_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
    (Extensions.NV.Physical_Device_Dedicated_Allocation_Image_Aliasing_Features,
     Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_C,
     Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Cooperative_Matrix_Properties_NV_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.NV.Cooperative_Matrix_Properties,
                         Cooperative_Matrix_Properties_C,
                         Cooperative_Matrix_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Cooperative_Matrix_Features_NV_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                     (Extensions.NV.Physical_Device_Cooperative_Matrix_Features,
                      Physical_Device_Cooperative_Matrix_Features_C,
                      Physical_Device_Cooperative_Matrix_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Cooperative_Matrix_Properties_NV_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                   (Extensions.NV.Physical_Device_Cooperative_Matrix_Properties,
                    Physical_Device_Cooperative_Matrix_Properties_C,
                    Physical_Device_Cooperative_Matrix_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Coverage_Reduction_Mode_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                (Extensions.NV.Physical_Device_Coverage_Reduction_Mode_Features,
                 Physical_Device_Coverage_Reduction_Mode_Features_C,
                 Physical_Device_Coverage_Reduction_Mode_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Framebuffer_Mixed_Samples_Combination_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.NV.Framebuffer_Mixed_Samples_Combination,
                         Framebuffer_Mixed_Samples_Combination_C,
                         Framebuffer_Mixed_Samples_Combination_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Device_Generated_Commands_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
            (Extensions.NV.Physical_Device_Device_Generated_Commands_Properties,
             Physical_Device_Device_Generated_Commands_Properties_C,
             Physical_Device_Device_Generated_Commands_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Device_Generated_Commands_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
              (Extensions.NV.Physical_Device_Device_Generated_Commands_Features,
               Physical_Device_Device_Generated_Commands_Features_C,
               Physical_Device_Device_Generated_Commands_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Inherited_Viewport_Scissor_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
             (Extensions.NV.Physical_Device_Inherited_Viewport_Scissor_Features,
              Physical_Device_Inherited_Viewport_Scissor_Features_C,
              Physical_Device_Inherited_Viewport_Scissor_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Present_Barrier_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.NV.Physical_Device_Present_Barrier_Features,
                         Physical_Device_Present_Barrier_Features_C,
                         Physical_Device_Present_Barrier_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Surface_Capabilities_Present_Barrier_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.NV.Surface_Capabilities_Present_Barrier,
                         Surface_Capabilities_Present_Barrier_C,
                         Surface_Capabilities_Present_Barrier_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Swapchain_Present_Barrier_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.NV.Swapchain_Present_Barrier_Create_Info,
                         Swapchain_Present_Barrier_Create_Info_C,
                         Swapchain_Present_Barrier_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Diagnostics_Config_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                     (Extensions.NV.Physical_Device_Diagnostics_Config_Features,
                      Physical_Device_Diagnostics_Config_Features_C,
                      Physical_Device_Diagnostics_Config_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_CUDA_Kernel_Launch_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                     (Extensions.NV.Physical_Device_CUDA_Kernel_Launch_Features,
                      Physical_Device_CUDA_Kernel_Launch_Features_C,
                      Physical_Device_CUDA_Kernel_Launch_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_CUDA_Kernel_Launch_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                   (Extensions.NV.Physical_Device_CUDA_Kernel_Launch_Properties,
                    Physical_Device_CUDA_Kernel_Launch_Properties_C,
                    Physical_Device_CUDA_Kernel_Launch_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Fragment_Shading_Rate_Enums_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
            (Extensions.NV.Physical_Device_Fragment_Shading_Rate_Enums_Features,
             Physical_Device_Fragment_Shading_Rate_Enums_Features_C,
             Physical_Device_Fragment_Shading_Rate_Enums_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Fragment_Shading_Rate_Enums_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
          (Extensions.NV.Physical_Device_Fragment_Shading_Rate_Enums_Properties,
           Physical_Device_Fragment_Shading_Rate_Enums_Properties_C,
           Physical_Device_Fragment_Shading_Rate_Enums_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Ray_Tracing_Motion_Blur_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                (Extensions.NV.Physical_Device_Ray_Tracing_Motion_Blur_Features,
                 Physical_Device_Ray_Tracing_Motion_Blur_Features_C,
                 Physical_Device_Ray_Tracing_Motion_Blur_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_External_Memory_RDMA_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                   (Extensions.NV.Physical_Device_External_Memory_RDMA_Features,
                    Physical_Device_External_Memory_RDMA_Features_C,
                    Physical_Device_External_Memory_RDMA_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
        end case;
    end To_C;

    procedure To_Ada(Ada_Struct: in out Vulkan.Out_Structure'Class;
                     Next: in C.Out_Structure_C_Access) is
    begin
        case Out_Structure(Ada_Struct.Record_Type) is
            when Physical_Device_Corner_Sampled_Image_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                       (C.Out_Structure_C_Access,
                        Physical_Device_Corner_Sampled_Image_Features_C_Access);
                begin
                   To_Ada
                    (Extensions.NV.Physical_Device_Corner_Sampled_Image_Features
                        (Ada_Struct),
                     To_Access(Next).all);
                end;
            when Physical_Device_Shader_SM_Builtins_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                       (C.Out_Structure_C_Access,
                        Physical_Device_Shader_SM_Builtins_Properties_C_Access);
                begin
                   To_Ada
                    (Extensions.NV.Physical_Device_Shader_SM_Builtins_Properties
                        (Ada_Struct),
                     To_Access(Next).all);
                end;
            when Physical_Device_Shader_SM_Builtins_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                       (C.Out_Structure_C_Access,
                        Physical_Device_Shader_SM_Builtins_Features_C_Access);
                begin
                   To_Ada
                      (Extensions.NV.Physical_Device_Shader_SM_Builtins_Features
                          (Ada_Struct),
                       To_Access(Next).all);
                end;
            when Physical_Device_Shading_Rate_Image_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                       (C.Out_Structure_C_Access,
                        Physical_Device_Shading_Rate_Image_Features_C_Access);
                begin
                   To_Ada
                      (Extensions.NV.Physical_Device_Shading_Rate_Image_Features
                          (Ada_Struct),
                       To_Access(Next).all);
                end;
            when Physical_Device_Shading_Rate_Image_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                       (C.Out_Structure_C_Access,
                        Physical_Device_Shading_Rate_Image_Properties_C_Access);
                begin
                   To_Ada
                    (Extensions.NV.Physical_Device_Shading_Rate_Image_Properties
                        (Ada_Struct),
                     To_Access(Next).all);
                end;
            when Physical_Device_Representative_Fragment_Test_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
               (C.Out_Structure_C_Access,
                Physical_Device_Representative_Fragment_Test_Features_C_Access);
                begin
                   To_Ada
            (Extensions.NV.Physical_Device_Representative_Fragment_Test_Features
                (Ada_Struct),
             To_Access(Next).all);
                end;
            when Physical_Device_Mesh_Shader_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Mesh_Shader_Features_C_Access);
                begin
                   To_Ada(Extensions.NV.Physical_Device_Mesh_Shader_Features
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Physical_Device_Mesh_Shader_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Mesh_Shader_Properties_C_Access);
                begin
                   To_Ada(Extensions.NV.Physical_Device_Mesh_Shader_Properties
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Physical_Device_Shader_Image_Footprint_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                     (C.Out_Structure_C_Access,
                      Physical_Device_Shader_Image_Footprint_Features_C_Access);
                begin
            To_Ada(Extensions.NV.Physical_Device_Shader_Image_Footprint_Features
                   (Ada_Struct),
                   To_Access(Next).all);
                end;
            when Physical_Device_Exclusive_Scissor_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Exclusive_Scissor_Features_C_Access);
                begin
                 To_Ada(Extensions.NV.Physical_Device_Exclusive_Scissor_Features
                        (Ada_Struct),
                        To_Access(Next).all);
                end;
            when Queue_Family_Checkpoint_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Queue_Family_Checkpoint_Properties_C_Access);
                begin
                    To_Ada(Extensions.NV.Queue_Family_Checkpoint_Properties
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Checkpoint_Data_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access, Checkpoint_Data_C_Access);
                begin
                    To_Ada(Extensions.NV.Checkpoint_Data(Ada_Struct),
                           To_Access(Next).all);
                end;
            when Queue_Family_Checkpoint_Properties_2_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Queue_Family_Checkpoint_Properties_2_C_Access);
                begin
                    To_Ada(Extensions.NV.Queue_Family_Checkpoint_Properties_2
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Checkpoint_Data_2_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Checkpoint_Data_2_C_Access);
                begin
                    To_Ada(Extensions.NV.Checkpoint_Data_2(Ada_Struct),
                           To_Access(Next).all);
                end;
            when Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
        (C.Out_Structure_C_Access,
         Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_C_Access);
                begin
                    To_Ada
     (Extensions.NV.Physical_Device_Dedicated_Allocation_Image_Aliasing_Features
         (Ada_Struct),
      To_Access(Next).all);
                end;
            when Cooperative_Matrix_Properties_NV_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Cooperative_Matrix_Properties_C_Access);
                begin
                    To_Ada(Extensions.NV.Cooperative_Matrix_Properties
                             (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Physical_Device_Cooperative_Matrix_Features_NV_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Cooperative_Matrix_Features_C_Access);
                begin
                To_Ada(Extensions.NV.Physical_Device_Cooperative_Matrix_Features
                         (Ada_Struct),
                       To_Access(Next).all);
                end;
            when Physical_Device_Cooperative_Matrix_Properties_NV_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                       (C.Out_Structure_C_Access,
                        Physical_Device_Cooperative_Matrix_Properties_C_Access);
                begin
              To_Ada(Extensions.NV.Physical_Device_Cooperative_Matrix_Properties
                       (Ada_Struct),
                     To_Access(Next).all);
                end;
            when Physical_Device_Coverage_Reduction_Mode_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                    (C.Out_Structure_C_Access,
                     Physical_Device_Coverage_Reduction_Mode_Features_C_Access);
                begin
           To_Ada(Extensions.NV.Physical_Device_Coverage_Reduction_Mode_Features
                    (Ada_Struct),
                  To_Access(Next).all);
                end;
            when Framebuffer_Mixed_Samples_Combination_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Framebuffer_Mixed_Samples_Combination_C_Access);
                begin
                    To_Ada(Extensions.NV.Framebuffer_Mixed_Samples_Combination
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Physical_Device_Device_Generated_Commands_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                (C.Out_Structure_C_Access,
                 Physical_Device_Device_Generated_Commands_Properties_C_Access);
                begin
                    To_Ada
             (Extensions.NV.Physical_Device_Device_Generated_Commands_Properties
                 (Ada_Struct),
              To_Access(Next).all);
                end;
            when Physical_Device_Device_Generated_Commands_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                (C.Out_Structure_C_Access,
                 Physical_Device_Device_Generated_Commands_Features_C_Access);
                begin
                    To_Ada
               (Extensions.NV.Physical_Device_Device_Generated_Commands_Features
                   (Ada_Struct),
                To_Access(Next).all);
                end;
            when Physical_Device_Inherited_Viewport_Scissor_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                (C.Out_Structure_C_Access,
                 Physical_Device_Inherited_Viewport_Scissor_Features_C_Access);
                begin
                    To_Ada
              (Extensions.NV.Physical_Device_Inherited_Viewport_Scissor_Features
                  (Ada_Struct),
               To_Access(Next).all);
                end;
            when Physical_Device_Present_Barrier_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Present_Barrier_Features_C_Access);
                begin
                    To_Ada
                      (Extensions.NV.Physical_Device_Present_Barrier_Features
                          (Ada_Struct),
                       To_Access(Next).all);
                end;
            when Surface_Capabilities_Present_Barrier_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Surface_Capabilities_Present_Barrier_C_Access);
                begin
                    To_Ada(Extensions.NV.Surface_Capabilities_Present_Barrier
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Swapchain_Present_Barrier_Create_Info_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Swapchain_Present_Barrier_Create_Info_C_Access);
                begin
                    To_Ada(Extensions.NV.Swapchain_Present_Barrier_Create_Info
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Physical_Device_Diagnostics_Config_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                  (C.Out_Structure_C_Access,
                   Physical_Device_Diagnostics_Config_Features_C_Access);
                begin
                    To_Ada
                      (Extensions.NV.Physical_Device_Diagnostics_Config_Features
                       (Ada_Struct),
                      To_Access(Next).all);
                end;
            when Physical_Device_CUDA_Kernel_Launch_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                  (C.Out_Structure_C_Access,
                   Physical_Device_CUDA_Kernel_Launch_Features_C_Access);
                begin
                    To_Ada
                      (Extensions.NV.Physical_Device_CUDA_Kernel_Launch_Features
                       (Ada_Struct),
                      To_Access(Next).all);
                end;
            when Physical_Device_CUDA_Kernel_Launch_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                  (C.Out_Structure_C_Access,
                   Physical_Device_CUDA_Kernel_Launch_Properties_C_Access);
                begin
                    To_Ada
                    (Extensions.NV.Physical_Device_CUDA_Kernel_Launch_Properties
                     (Ada_Struct),
                    To_Access(Next).all);
                end;
            when Physical_Device_Fragment_Shading_Rate_Enums_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                (C.Out_Structure_C_Access,
                 Physical_Device_Fragment_Shading_Rate_Enums_Features_C_Access);
                begin
                    To_Ada
             (Extensions.NV.Physical_Device_Fragment_Shading_Rate_Enums_Features
                (Ada_Struct),
              To_Access(Next).all);
                end;
            when Physical_Device_Fragment_Shading_Rate_Enums_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
              (C.Out_Structure_C_Access,
               Physical_Device_Fragment_Shading_Rate_Enums_Properties_C_Access);
                begin
                    To_Ada
           (Extensions.NV.Physical_Device_Fragment_Shading_Rate_Enums_Properties
              (Ada_Struct),
            To_Access(Next).all);
                end;
            when Physical_Device_Ray_Tracing_Motion_Blur_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                    (C.Out_Structure_C_Access,
                     Physical_Device_Ray_Tracing_Motion_Blur_Features_C_Access);
                begin
                    To_Ada
                 (Extensions.NV.Physical_Device_Ray_Tracing_Motion_Blur_Features
                     (Ada_Struct),
                  To_Access(Next).all);
                end;
            when Physical_Device_External_Memory_RDMA_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                    (   C.Out_Structure_C_Access,
                        Physical_Device_External_Memory_RDMA_Features_C_Access);
                begin
                    To_Ada
                    (Extensions.NV.Physical_Device_External_Memory_RDMA_Features
                        (Ada_Struct),
                     To_Access(Next).all);
                end;
        end case;
    end To_Ada;

    procedure Free(Next: in out C.In_Structure_C_Access) is
        use type C.In_Structure_C_Access;
    begin
        if Next = null then
            return;
        end if;

        case In_Structure(Next.Record_Type) is
            when Dedicated_Allocation_Image_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Dedicated_Allocation_Image_Create_Info_C,
                         Dedicated_Allocation_Image_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Dedicated_Allocation_Buffer_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Dedicated_Allocation_Buffer_Create_Info_C,
                         Dedicated_Allocation_Buffer_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Dedicated_Allocation_Memory_Allocate_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Dedicated_Allocation_Memory_Allocate_Info_C,
                         Dedicated_Allocation_Memory_Allocate_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Viewport_W_Scaling_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                       (Pipeline_Viewport_W_Scaling_State_Create_Info_C,
                        Pipeline_Viewport_W_Scaling_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Viewport_Swizzle_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Pipeline_Viewport_Swizzle_State_Create_Info_C,
                         Pipeline_Viewport_Swizzle_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Coverage_To_Color_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Pipeline_Coverage_To_Color_State_Create_Info_C,
                         Pipeline_Coverage_To_Color_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Coverage_Modulation_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                      (Pipeline_Coverage_Modulation_State_Create_Info_C,
                       Pipeline_Coverage_Modulation_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
              (Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_C,
               Pipeline_Viewport_Shading_Rate_Image_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
             (Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_C,
              Pipeline_Viewport_Coarse_Sample_Order_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Representative_Fragment_Test_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
             (Pipeline_Representative_Fragment_Test_State_Create_Info_C,
              Pipeline_Representative_Fragment_Test_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
               (Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_C,
                Pipeline_Viewport_Exclusive_Scissor_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Coverage_Reduction_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                       (Pipeline_Coverage_Reduction_State_Create_Info_C,
                        Pipeline_Coverage_Reduction_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Graphics_Shader_Group_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                       (Graphics_Shader_Group_Create_Info_C,
                        Graphics_Shader_Group_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Graphics_Pipeline_Shader_Groups_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                       (Graphics_Pipeline_Shader_Groups_Create_Info_C,
                        Graphics_Pipeline_Shader_Groups_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Indirect_Commands_Layout_Token_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Indirect_Commands_Layout_Token_C,
                         Indirect_Commands_Layout_Token_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Indirect_Commands_Layout_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Indirect_Commands_Layout_Create_Info_C,
                         Indirect_Commands_Layout_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Generated_Commands_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Generated_Commands_Info_C,
                         Generated_Commands_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Generated_Commands_Memory_Requirements_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Generated_Commands_Memory_Requirements_Info_C,
                         Generated_Commands_Memory_Requirements_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Command_Buffer_Inheritance_Viewport_Scissor_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                    (Command_Buffer_Inheritance_Viewport_Scissor_Info_C,
                     Command_Buffer_Inheritance_Viewport_Scissor_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Device_Diagnostics_Config_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Device_Diagnostics_Config_Create_Info_C,
                         Device_Diagnostics_Config_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when CUDA_Module_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (CUDA_Module_Create_Info_C,
                         CUDA_Module_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when CUDA_Function_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (CUDA_Function_Create_Info_C,
                         CUDA_Function_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when CUDA_Launch_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (CUDA_Launch_Info_C,
                         CUDA_Launch_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Query_Low_Latency_Support_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Query_Low_Latency_Support_C,
                         Query_Low_Latency_Support_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
               (Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_C,
                Pipeline_Fragment_Shading_Rate_Enum_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Acceleration_Structure_Geometry_Motion_Triangles_Data_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
               (Acceleration_Structure_Geometry_Motion_Triangles_Data_C,
                Acceleration_Structure_Geometry_Motion_Triangles_Data_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Acceleration_Structure_Motion_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Acceleration_Structure_Motion_Info_C,
                         Acceleration_Structure_Motion_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Memory_Get_Remote_Address_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Memory_Get_Remote_Address_Info_C,
                         Memory_Get_Remote_Address_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
        end case;
    end Free;

    procedure Free(Next: in out C.Out_Structure_C_Access) is
        use type C.Out_Structure_C_Access;
    begin
        if Next = null then
            return;
        end if;

        case Out_Structure(Next.Record_Type) is
            when Physical_Device_Corner_Sampled_Image_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                       (Physical_Device_Corner_Sampled_Image_Features_C,
                        Physical_Device_Corner_Sampled_Image_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Shader_SM_Builtins_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                       (Physical_Device_Shader_SM_Builtins_Properties_C,
                        Physical_Device_Shader_SM_Builtins_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Shader_SM_Builtins_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                       (Physical_Device_Shader_SM_Builtins_Features_C,
                        Physical_Device_Shader_SM_Builtins_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Shading_Rate_Image_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Shading_Rate_Image_Features_C,
                         Physical_Device_Shading_Rate_Image_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Shading_Rate_Image_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                       (Physical_Device_Shading_Rate_Image_Properties_C,
                        Physical_Device_Shading_Rate_Image_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Representative_Fragment_Test_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
               (Physical_Device_Representative_Fragment_Test_Features_C,
                Physical_Device_Representative_Fragment_Test_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Mesh_Shader_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Mesh_Shader_Features_C,
                         Physical_Device_Mesh_Shader_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Mesh_Shader_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Mesh_Shader_Properties_C,
                         Physical_Device_Mesh_Shader_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Shader_Image_Footprint_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                     (Physical_Device_Shader_Image_Footprint_Features_C,
                      Physical_Device_Shader_Image_Footprint_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Exclusive_Scissor_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Exclusive_Scissor_Features_C,
                         Physical_Device_Exclusive_Scissor_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Queue_Family_Checkpoint_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Queue_Family_Checkpoint_Properties_C,
                         Queue_Family_Checkpoint_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Checkpoint_Data_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Checkpoint_Data_C, Checkpoint_Data_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Queue_Family_Checkpoint_Properties_2_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Queue_Family_Checkpoint_Properties_2_C,
                         Queue_Family_Checkpoint_Properties_2_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Checkpoint_Data_2_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Checkpoint_Data_2_C,
                         Checkpoint_Data_2_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
        (Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_C,
         Physical_Device_Dedicated_Allocation_Image_Aliasing_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Cooperative_Matrix_Properties_NV_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Cooperative_Matrix_Properties_C,
                         Cooperative_Matrix_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Cooperative_Matrix_Features_NV_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Cooperative_Matrix_Features_C,
                         Physical_Device_Cooperative_Matrix_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Cooperative_Matrix_Properties_NV_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                       (Physical_Device_Cooperative_Matrix_Properties_C,
                        Physical_Device_Cooperative_Matrix_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Coverage_Reduction_Mode_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                    (Physical_Device_Coverage_Reduction_Mode_Features_C,
                     Physical_Device_Coverage_Reduction_Mode_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Framebuffer_Mixed_Samples_Combination_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Framebuffer_Mixed_Samples_Combination_C,
                         Framebuffer_Mixed_Samples_Combination_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Device_Generated_Commands_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                (Physical_Device_Device_Generated_Commands_Properties_C,
                 Physical_Device_Device_Generated_Commands_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Device_Generated_Commands_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                  (Physical_Device_Device_Generated_Commands_Features_C,
                   Physical_Device_Device_Generated_Commands_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Inherited_Viewport_Scissor_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                 (Physical_Device_Inherited_Viewport_Scissor_Features_C,
                  Physical_Device_Inherited_Viewport_Scissor_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Present_Barrier_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Present_Barrier_Features_C,
                         Physical_Device_Present_Barrier_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Surface_Capabilities_Present_Barrier_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Surface_Capabilities_Present_Barrier_C,
                         Surface_Capabilities_Present_Barrier_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Swapchain_Present_Barrier_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Swapchain_Present_Barrier_Create_Info_C,
                         Swapchain_Present_Barrier_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Diagnostics_Config_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Diagnostics_Config_Features_C,
                         Physical_Device_Diagnostics_Config_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_CUDA_Kernel_Launch_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_CUDA_Kernel_Launch_Features_C,
                         Physical_Device_CUDA_Kernel_Launch_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_CUDA_Kernel_Launch_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                       (Physical_Device_CUDA_Kernel_Launch_Properties_C,
                        Physical_Device_CUDA_Kernel_Launch_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Fragment_Shading_Rate_Enums_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                (Physical_Device_Fragment_Shading_Rate_Enums_Features_C,
                 Physical_Device_Fragment_Shading_Rate_Enums_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Fragment_Shading_Rate_Enums_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
              (Physical_Device_Fragment_Shading_Rate_Enums_Properties_C,
               Physical_Device_Fragment_Shading_Rate_Enums_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Ray_Tracing_Motion_Blur_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                    (Physical_Device_Ray_Tracing_Motion_Blur_Features_C,
                     Physical_Device_Ray_Tracing_Motion_Blur_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_External_Memory_RDMA_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                       (Physical_Device_External_Memory_RDMA_Features_C,
                        Physical_Device_External_Memory_RDMA_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
        end case;
    end Free;

    procedure Free(Struct: in out Shading_Rate_Palette_C) is
    begin
        Shading_Rate_Palette_Entry_Arrays.Free
            (Struct.Shading_Rate_Palette_Entries);
    end Free;
end Vulkan.C_NV;

