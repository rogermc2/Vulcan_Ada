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

-- C interface for EXT records

with Interfaces.C.Strings;
with Vulkan.C;
with Vulkan.C_KHR;
with Vulkan.C_Arrays;
with Vulkan.Extensions.EXT;
with Vulkan.Extensions.KHR;
with Vulkan.Extensions.NV;
with Vulkan.Metal;

private package Vulkan.C_EXT is
    -- Extension record identifiers.
    subtype Structure is Structure_Type
        with Static_Predicate => Structure in
            Physical_Device_Transform_Feedback_Features_Type |
            Physical_Device_Transform_Feedback_Properties_Type |
            Pipeline_Rasterization_State_Stream_Create_Info_Type |
            Image_View_ASTC_Decode_Mode_Type |
            Physical_Device_ASTC_Decode_Features_Type |
            Conditional_Rendering_Begin_Info_Type |
            Physical_Device_Conditional_Rendering_Features_Type |
            Command_Buffer_Inheritance_Conditional_Rendering_Info_Type |
            Surface_Capabilities_2_EXT_Type |
            Display_Power_Info_Type |
            Device_Event_Info_Type |
            Display_Event_Info_Type |
            Swapchain_Counter_Create_Info_Type |
            Physical_Device_Discard_Rectangle_Properties_Type |
            Pipeline_Discard_Rectangle_State_Create_Info_Type |
            Physical_Device_Conservative_Rasterization_Properties_Type |
            Pipeline_Rasterization_Conservative_State_Create_Info_Type |
            Physical_Device_Depth_Clip_Enable_Features_Type |
            Pipeline_Rasterization_Depth_Clip_State_Create_Info_Type |
            HDR_Metadata_Type |
            Debug_Utils_Label_Type |
            Debug_Utils_Object_Name_Info_Type |
            Debug_Utils_Messenger_Callback_Data_Type |
            Debug_Utils_Messenger_Create_Info_Type |
            Debug_Utils_Object_Tag_Info_Type |
            Sample_Locations_Info_Type |
            Render_Pass_Sample_Locations_Begin_Info_Type |
            Pipeline_Sample_Locations_State_Create_Info_Type |
            Physical_Device_Sample_Locations_Properties_Type |
            Multisample_Properties_Type |
            Physical_Device_Blend_Operation_Advanced_Features_Type |
            Physical_Device_Blend_Operation_Advanced_Properties_Type |
            Pipeline_Color_Blend_Advanced_State_Create_Info_Type |
            DRM_Format_Modifier_Properties_List_Type |
            Physical_Device_Image_DRM_Format_Modifier_Info_Type |
            Image_DRM_Format_Modifier_List_Create_Info_Type |
            Image_DRM_Format_Modifier_Explicit_Create_Info_Type |
            Image_DRM_Format_Modifier_Properties_Type |
            DRM_Format_Modifier_Properties_List_2_Type |
            Validation_Cache_Create_Info_Type |
            Shader_Module_Validation_Cache_Create_Info_Type |
            Physical_Device_Image_View_Image_Format_Info_Type |
            Filter_Cubic_Image_View_Image_Format_Properties_Type |
            Import_Memory_Host_Pointer_Info_Type |
            Memory_Host_Pointer_Properties_Type |
            Physical_Device_External_Memory_Host_Properties_Type |
            Physical_Device_PCI_Bus_Info_Properties_Type |
            Physical_Device_Fragment_Density_Map_Features_Type |
            Physical_Device_Fragment_Density_Map_Properties_Type |
            Render_Pass_Fragment_Density_Map_Create_Info_Type |
            Rendering_Fragment_Density_Map_Attachment_Info_Type |
            Physical_Device_Shader_Image_Atomic_Int64_Features_Type |
            Physical_Device_Memory_Budget_Properties_Type |
            Physical_Device_Memory_Priority_Features_Type |
            Memory_Priority_Allocate_Info_Type |
            Physical_Device_Fragment_Shader_Interlock_Features_Type |
            Physical_Device_YCbCr_Image_Arrays_Features_Type |
            Physical_Device_Provoking_Vertex_Features_Type |
            Physical_Device_Provoking_Vertex_Properties_Type |
            Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_Type |
            Headless_Surface_Create_Info_Type |
            Physical_Device_Shader_Atomic_Float_Features_Type |
            Physical_Device_Map_Memory_Placed_Features_Type |
            Physical_Device_Map_Memory_Placed_Properties_Type |
            Memory_Map_Placed_Info_Type |
            Physical_Device_Shader_Atomic_Float_2_Features_Type |
            Physical_Device_Depth_Bias_Control_Features_Type |
            Depth_Bias_Info_Type |
            Depth_Bias_Representation_Info_Type |
            Physical_Device_Device_Memory_Report_Features_Type |
            Device_Memory_Report_Callback_Data_Type |
            Device_Device_Memory_Report_Create_Info_Type |
            Sampler_Custom_Border_Color_Create_Info_Type |
            Physical_Device_Custom_Border_Color_Properties_Type |
            Physical_Device_Custom_Border_Color_Features_Type |
            Physical_Device_Descriptor_Buffer_Properties_Type |
            Physical_Device_Descriptor_Buffer_Density_Map_Properties_Type |
            Physical_Device_Descriptor_Buffer_Features_Type |
            Descriptor_Address_Info_Type |
            Descriptor_Buffer_Binding_Info_Type |
            Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_Type |
            Descriptor_Get_Info_Type |
            Buffer_Capture_Descriptor_Data_Info_Type |
            Image_Capture_Descriptor_Data_Info_Type |
            Image_View_Capture_Descriptor_Data_Info_Type |
            Sampler_Capture_Descriptor_Data_Info_Type |
            Opaque_Capture_Descriptor_Data_Create_Info_Type |
            Acceleration_Structure_Capture_Descriptor_Data_Info_Type |
            Physical_Device_Graphics_Pipeline_Library_Features_Type |
            Physical_Device_Graphics_Pipeline_Library_Properties_Type |
            Graphics_Pipeline_Library_Create_Info_Type |
            Physical_Device_Fragment_Density_Map_2_Features_Type |
            Physical_Device_Fragment_Density_Map_2_Properties_Type |
            Physical_Device_Image_Compression_Control_Features_Type |
            Image_Compression_Control_Type |
            Image_Compression_Properties_Type |
            Physical_Device_Attachment_Feedback_Loop_Layout_Features_Type |
            Physical_Device_Fault_Features_Type |
            Device_Fault_Counts_Type |
            Device_Fault_Info_Type |
            Physical_Device_RGBA10x6_Formats_Features_Type |
            Physical_Device_Vertex_Input_Dynamic_State_Features_Type |
            Vertex_Input_Binding_Description_2_Type |
            Vertex_Input_Attribute_Description_2_Type |
            Physical_Device_DRM_Properties_Type |
            Physical_Device_Address_Binding_Report_Features_Type |
            Device_Address_Binding_Callback_Data_Type |
            Physical_Device_Depth_Clip_Control_Features_Type |
            Pipeline_Viewport_Depth_Clip_Control_Create_Info_Type |
            Physical_Device_Primitive_Topology_List_Restart_Features_Type |
            Pipeline_Properties_Identifier_Type |
            Physical_Device_Pipeline_Properties_Features_Type |
            Physical_Device_Frame_Boundary_Features_Type |
            Frame_Boundary_Type |
            Physical_Device_Multisampled_Render_To_Single_Sampled_Features_Type |
            Subpass_Resolve_Performance_Query_Type |
            Multisampled_Render_To_Single_Sampled_Info_Type |
            Physical_Device_Color_Write_Enable_Features_Type |
            Pipeline_Color_Write_Create_Info_Type |
            Physical_Device_Primitives_Generated_Query_Features_Type |
            Physical_Device_Image_View_Min_LOD_Features_Type |
            Image_View_Min_LOD_Create_Info_Type |
            Physical_Device_Multi_Draw_Features_Type |
            Physical_Device_Multi_Draw_Properties_Type |
            Physical_Device_Image_2D_View_Of_3D_Features_Type |
            Physical_Device_Shader_Tile_Image_Features_Type |
            Physical_Device_Shader_Tile_Image_Properties_Type |
            Micromap_Build_Info_Type |
            Micromap_Create_Info_Type |
            Physical_Device_Opacity_Micromap_Features_Type |
            Physical_Device_Opacity_Micromap_Properties_Type |
            Micromap_Version_Info_Type |
            Copy_Micromap_To_Memory_Info_Type |
            Copy_Memory_To_Micromap_Info_Type |
            Copy_Micromap_Info_Type |
            Micromap_Build_Sizes_Info_Type |
            Acceleration_Structure_Triangles_Opacity_Micromap_Type |
            Metal_Surface_Create_Info_Type;

    subtype Out_Structure is Structure
        with Static_Predicate => Out_Structure in Out_Structure_Type;

    subtype In_Structure is Structure
        with Static_Predicate => In_Structure not in Out_Structure;

    -- C interface records.
    type Physical_Device_Transform_Feedback_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Transform_Feedback_Features_Type;
        Next: C.Out_Structure_C_Access;
        Transform_Feedback: Interfaces.Unsigned_32;
        Geometry_Streams: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Transform_Feedback_Features_C_Access is
        access Physical_Device_Transform_Feedback_Features_C
        with Convention => C;

    type Physical_Device_Transform_Feedback_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Transform_Feedback_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Max_Transform_Feedback_Streams: Interfaces.Unsigned_32;
        Max_Transform_Feedback_Buffers: Interfaces.Unsigned_32;
        Max_Transform_Feedback_Buffer_Size: Device_Size;
        Max_Transform_Feedback_Stream_Data_Size: Interfaces.Unsigned_32;
        Max_Transform_Feedback_Buffer_Data_Size: Interfaces.Unsigned_32;
        Max_Transform_Feedback_Buffer_Data_Stride: Interfaces.Unsigned_32;
        Transform_Feedback_Queries: Interfaces.Unsigned_32;
        Transform_Feedback_Streams_Lines_Triangles: Interfaces.Unsigned_32;
        Transform_Feedback_Rasterization_Stream_Select: Interfaces.Unsigned_32;
        Transform_Feedback_Draw: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Transform_Feedback_Properties_C_Access is
        access Physical_Device_Transform_Feedback_Properties_C
        with Convention => C;

    type Pipeline_Rasterization_State_Stream_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Rasterization_State_Stream_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.EXT.Pipeline_Rasterization_State_Stream_Create_Flags;
        Rasterization_Stream: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Pipeline_Rasterization_State_Stream_Create_Info_C_Access is
        access Pipeline_Rasterization_State_Stream_Create_Info_C
        with Convention => C;

    type Image_View_ASTC_Decode_Mode_C is
    record
        Record_Type: In_Structure_Type := Image_View_ASTC_Decode_Mode_Type;
        Next: C.In_Structure_C_Access;
        Decode_Mode: Format;
    end record
        with Convention => C;

    type Image_View_ASTC_Decode_Mode_C_Access is
        access Image_View_ASTC_Decode_Mode_C
        with Convention => C;

    type Physical_Device_ASTC_Decode_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_ASTC_Decode_Features_Type;
        Next: C.Out_Structure_C_Access;
        Decode_Mode_Shared_Exponent: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_ASTC_Decode_Features_C_Access is
        access Physical_Device_ASTC_Decode_Features_C
        with Convention => C;

    type Conditional_Rendering_Begin_Info_C is
    record
        Record_Type: In_Structure_Type := Conditional_Rendering_Begin_Info_Type;
        Next: C.In_Structure_C_Access;
        Buffer: Vulkan.Buffer;
        Offset: Device_Size;
        Flags: Extensions.EXT.Conditional_Rendering_Flags;
    end record
        with Convention => C;

    type Conditional_Rendering_Begin_Info_C_Access is
        access Conditional_Rendering_Begin_Info_C
        with Convention => C;

    type Physical_Device_Conditional_Rendering_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Conditional_Rendering_Features_Type;
        Next: C.Out_Structure_C_Access;
        Conditional_Rendering: Interfaces.Unsigned_32;
        Inherited_Conditional_Rendering: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Conditional_Rendering_Features_C_Access is
        access Physical_Device_Conditional_Rendering_Features_C
        with Convention => C;

    type Command_Buffer_Inheritance_Conditional_Rendering_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Command_Buffer_Inheritance_Conditional_Rendering_Info_Type;
        Next: C.In_Structure_C_Access;
        Conditional_Rendering_Enable: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Command_Buffer_Inheritance_Conditional_Rendering_Info_C_Access is
        access Command_Buffer_Inheritance_Conditional_Rendering_Info_C
        with Convention => C;

    type Surface_Capabilities_2_C is
    record
        Record_Type: Out_Structure_Type := Surface_Capabilities_2_EXT_Type;
        Next: C.Out_Structure_C_Access;
        Min_Image_Count: Interfaces.Unsigned_32;
        Max_Image_Count: Interfaces.Unsigned_32;
        Current_Extent: Extent_2D;
        Min_Image_Extent: Extent_2D;
        Max_Image_Extent: Extent_2D;
        Max_Image_Array_Layers: Interfaces.Unsigned_32;
        Supported_Transforms: Extensions.KHR.Surface_Transform_Flags;
        Current_Transform: Extensions.KHR.Surface_Transform_Flags;
        Supported_Composite_Alpha: Extensions.KHR.Composite_Alpha_Flags;
        Supported_Usage_Flags: Image_Usage_Flags;
        Supported_Surface_Counters: Extensions.EXT.Surface_Counter_Flags;
    end record
        with Convention => C;

    type Surface_Capabilities_2_C_Access is
        access Surface_Capabilities_2_C
        with Convention => C;

    type Display_Power_Info_C is
    record
        Record_Type: In_Structure_Type := Display_Power_Info_Type;
        Next: C.In_Structure_C_Access;
        Power_State: Extensions.EXT.Display_Power_State;
    end record
        with Convention => C;

    type Display_Power_Info_C_Access is access Display_Power_Info_C
        with Convention => C;

    type Device_Event_Info_C is
    record
        Record_Type: In_Structure_Type := Device_Event_Info_Type;
        Next: C.In_Structure_C_Access;
        Device_Event: Extensions.EXT.Device_Event_Type;
    end record
        with Convention => C;

    type Device_Event_Info_C_Access is access Device_Event_Info_C
        with Convention => C;

    type Display_Event_Info_C is
    record
        Record_Type: In_Structure_Type := Display_Event_Info_Type;
        Next: C.In_Structure_C_Access;
        Display_Event: Extensions.EXT.Display_Event_Type;
    end record
        with Convention => C;

    type Display_Event_Info_C_Access is access Display_Event_Info_C
        with Convention => C;

    type Swapchain_Counter_Create_Info_C is
    record
        Record_Type: In_Structure_Type := Swapchain_Counter_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Surface_Counters: Extensions.EXT.Surface_Counter_Flags;
    end record
        with Convention => C;

    type Swapchain_Counter_Create_Info_C_Access is
        access Swapchain_Counter_Create_Info_C
        with Convention => C;

    type Physical_Device_Discard_Rectangle_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Discard_Rectangle_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Max_Discard_Rectangles: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Discard_Rectangle_Properties_C_Access is
        access Physical_Device_Discard_Rectangle_Properties_C
        with Convention => C;

    type Pipeline_Discard_Rectangle_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Discard_Rectangle_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.EXT.Pipeline_Discard_Rectangle_State_Create_Flags;
        Discard_Rectangle_Mode: Extensions.EXT.Discard_Rectangle_Mode;
        Discard_Rectangle_Count: Interfaces.Unsigned_32;
        Discard_Rectangles: C.Rect_2D_Arrays.Pointer;
    end record
        with Convention => C;

    type Pipeline_Discard_Rectangle_State_Create_Info_C_Access is
        access Pipeline_Discard_Rectangle_State_Create_Info_C
        with Convention => C;

    type Physical_Device_Conservative_Rasterization_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Conservative_Rasterization_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Primitive_Overestimation_Size: Interfaces.C.C_Float;
        Max_Extra_Primitive_Overestimation_Size: Interfaces.C.C_Float;
        Extra_Primitive_Overestimation_Size_Granularity: Interfaces.C.C_Float;
        Primitive_Underestimation: Interfaces.Unsigned_32;
        Conservative_Point_And_Line_Rasterization: Interfaces.Unsigned_32;
        Degenerate_Triangles_Rasterized: Interfaces.Unsigned_32;
        Degenerate_Lines_Rasterized: Interfaces.Unsigned_32;
        Fully_Covered_Fragment_Shader_Input_Variable: Interfaces.Unsigned_32;
        Conservative_Rasterization_Post_Depth_Coverage: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Conservative_Rasterization_Properties_C_Access is
        access Physical_Device_Conservative_Rasterization_Properties_C
        with Convention => C;

    type Pipeline_Rasterization_Conservative_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Rasterization_Conservative_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags:
          Extensions.EXT.Pipeline_Rasterization_Conservative_State_Create_Flags;
        Conservative_Rasterization_Mode:
            Extensions.EXT.Conservative_Rasterization_Mode;
        Extra_Primitive_Overestimation_Size: Interfaces.C.C_Float;
    end record
        with Convention => C;

    type Pipeline_Rasterization_Conservative_State_Create_Info_C_Access is
        access Pipeline_Rasterization_Conservative_State_Create_Info_C
        with Convention => C;

    type Physical_Device_Depth_Clip_Enable_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Depth_Clip_Enable_Features_Type;
        Next: C.Out_Structure_C_Access;
        Depth_Clip_Enable: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Depth_Clip_Enable_Features_C_Access is
        access Physical_Device_Depth_Clip_Enable_Features_C
        with Convention => C;

    type Pipeline_Rasterization_Depth_Clip_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Rasterization_Depth_Clip_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags:
            Extensions.EXT.Pipeline_Rasterization_Depth_Clip_State_Create_Flags;
        Depth_Clip_Enable: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Pipeline_Rasterization_Depth_Clip_State_Create_Info_C_Access is
        access Pipeline_Rasterization_Depth_Clip_State_Create_Info_C
        with Convention => C;

    type HDR_Metadata_C is
    record
        Record_Type: In_Structure_Type := HDR_Metadata_Type;
        Next: C.In_Structure_C_Access;
        Display_Primary_Red: Extensions.EXT.XY_Color;
        Display_Primary_Green: Extensions.EXT.XY_Color;
        Display_Primary_Blue: Extensions.EXT.XY_Color;
        White_Point: Extensions.EXT.XY_Color;
        Max_Luminance: Interfaces.C.C_float;
        Min_Luminance: Interfaces.C.C_float;
        Max_Content_Light_Level: Interfaces.C.C_float;
        Max_Frame_Average_Light_Level: Interfaces.C.C_float;
    end record
        with Convention => C;

    type HDR_Metadata_C_Access is access HDR_Metadata_C
        with Convention => C;

    type Debug_Utils_Label_C is
    record
        Record_Type: In_Structure_Type := Debug_Utils_Label_Type;
        Next: C.In_Structure_C_Access;
        Label_Name: Interfaces.C.Strings.chars_ptr;
        Color: Extensions.EXT.Debug_Color;
    end record
        with Convention => C;

    type Debug_Utils_Label_C_Access is access Debug_Utils_Label_C
        with Convention => C;

    type Debug_Utils_Object_Name_Info_C is
    record
        Record_Type: In_Structure_Type := Debug_Utils_Object_Name_Info_Type;
        Next: C.In_Structure_C_Access;
        Object_Type: Vulkan.Object_Type;
        Object_Handle: Vulkan.Object_Handle;
        Object_Name: Interfaces.C.Strings.chars_ptr;
    end record
        with Convention => C;

    type Debug_Utils_Object_Name_Info_C_Access is
        access Debug_Utils_Object_Name_Info_C
        with Convention => C;

    package Debug_Utils_Label_C_Arrays is new C_Arrays(Debug_Utils_Label_C);

    package Debug_Utils_Object_Name_Info_C_Arrays is
        new C_Arrays(Debug_Utils_Object_Name_Info_C);

    type Debug_Utils_Messenger_Callback_Data_C is
    record
        Record_Type: In_Structure_Type :=
            Debug_Utils_Messenger_Callback_Data_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.EXT.Debug_Utils_Messenger_Callback_Data_Flags;
        Message_ID_Name: Interfaces.C.Strings.chars_ptr;
        Message_ID_Number: Interfaces.Integer_32;
        Message: Interfaces.C.Strings.chars_ptr;
        Queue_Label_Count: Interfaces.Unsigned_32;
        Queue_Labels: Debug_Utils_Label_C_Arrays.Pointer;
        Cmd_Buf_Label_Count: Interfaces.Unsigned_32;
        Cmd_Buf_Labels: Debug_Utils_Label_C_Arrays.Pointer;
        Object_Count: Interfaces.Unsigned_32;
        Objects: Debug_Utils_Object_Name_Info_C_Arrays.Pointer;
    end record
        with Convention => C;

    type Debug_Utils_Messenger_Callback_Data_C_Access is
        access Debug_Utils_Messenger_Callback_Data_C
        with Convention => C;

    type Messenger_Callback_C is
        access function
            (Message_Severity:
                in Extensions.EXT.Debug_Utils_Message_Severity_Flags;
             Message_Types: in Extensions.EXT.Debug_Utils_Message_Type_Flags;
             Callback_Data: in Debug_Utils_Messenger_Callback_Data_C;
             User_Data: in Interfaces.C.Extensions.void_ptr)
        return Interfaces.Unsigned_32
        with Convention => C;

    type Debug_Utils_Messenger_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Debug_Utils_Messenger_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.EXT.Debug_Utils_Messenger_Create_Flags;
        Message_Severity: Extensions.EXT.Debug_Utils_Message_Severity_Flags;
        Message_Type: Extensions.EXT.Debug_Utils_Message_Type_Flags;
        User_Callback: Messenger_Callback_C;
        User_Data: Interfaces.C.Extensions.void_ptr;
    end record
        with Convention => C;

    type Debug_Utils_Messenger_Create_Info_C_Access is
        access all Debug_Utils_Messenger_Create_Info_C
        with Convention => C;

    type Debug_Utils_Object_Tag_Info_C is
    record
        Record_Type: In_Structure_Type := Debug_Utils_Object_Tag_Info_Type;
        Next: C.In_Structure_C_Access;
        Object_Type: Vulkan.Object_Type;
        Object_Handle: Vulkan.Object_Handle;
        Tag_Name: Interfaces.Unsigned_64;
        Tag_Size: Interfaces.C.size_t;
        Tag: Interfaces.C.Extensions.void_ptr;
    end record
        with Convention => C;

    type Debug_Utils_Object_Tag_Info_C_Access is
        access all Debug_Utils_Object_Tag_Info_C
        with Convention => C;

    package Sample_Location_Arrays is
        new C_Arrays(Extensions.EXT.Sample_Location);

    type Sample_Locations_Info_C is
    record
        Record_Type: In_Structure_Type := Sample_Locations_Info_Type;
        Next: C.In_Structure_C_Access;
        Sample_Locations_Per_Pixel: Sample_Count_Flags;
        Sample_Location_Grid_Size: Extent_2D;
        Sample_Locations_Count: Interfaces.Unsigned_32;
        Sample_Locations: Sample_Location_Arrays.Pointer;
    end record
        with Convention => C;

    type Sample_Locations_Info_C_Access is access Sample_Locations_Info_C
        with Convention => C;

    type Attachment_Sample_Locations_C is
    record
        Attachment_Index: Interfaces.Unsigned_32;
        Sample_Locations_Info: Sample_Locations_Info_C;
    end record
        with Convention => C;

    type Subpass_Sample_Locations_C is
    record
        Subpass_Index: Interfaces.Unsigned_32;
        Sample_Locations_Info: Sample_Locations_Info_C;
    end record
        with Convention => C;

    package Attachment_Sample_Locations_C_Arrays is
        new C_Arrays(Attachment_Sample_Locations_C);

    package Subpass_Sample_Locations_C_Arrays is
        new C_Arrays(Subpass_Sample_Locations_C);

    type Render_Pass_Sample_Locations_Begin_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Render_Pass_Sample_Locations_Begin_Info_Type;
        Next: C.In_Structure_C_Access;
        Attachment_Initial_Sample_Locations_Count: Interfaces.Unsigned_32;
        Attachment_Initial_Sample_Locations:
            Attachment_Sample_Locations_C_Arrays.Pointer;
        Post_Subpass_Sample_Locations_Count: Interfaces.Unsigned_32;
        Post_Subpass_Sample_Locations:
            Subpass_Sample_Locations_C_Arrays.Pointer;
    end record
        with Convention => C;

    type Render_Pass_Sample_Locations_Begin_Info_C_Access is
        access Render_Pass_Sample_Locations_Begin_Info_C
        with Convention => C;

    type Pipeline_Sample_Locations_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Sample_Locations_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Sample_Locations_Enable: Interfaces.Unsigned_32;
        Sample_Locations_Info: Sample_Locations_Info_C;
    end record
        with Convention => C;

    type Pipeline_Sample_Locations_State_Create_Info_C_Access is
        access Pipeline_Sample_Locations_State_Create_Info_C
        with Convention => C;

    type Physical_Device_Sample_Locations_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Sample_Locations_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Sample_Location_Sample_Counts: Sample_Count_Flags;
        Max_Sample_Location_Grid_Size: Extent_2D;
        Sample_Location_Coordinate_Range:
            Extensions.EXT.Sample_Location_Coordinate_Range_Array;
        Sample_Location_Sub_Pixel_Bits: Interfaces.Unsigned_32;
        Variable_Sample_Locations: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Sample_Locations_Properties_C_Access is
        access Physical_Device_Sample_Locations_Properties_C
        with Convention => C;

    type Multisample_Properties_C is
    record
        Record_Type: Out_Structure_Type := Multisample_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Max_Sample_Location_Grid_Size: Extent_2D;
    end record
        with Convention => C;

    type Multisample_Properties_C_Access is access Multisample_Properties_C
        with Convention => C;

    type Physical_Device_Blend_Operation_Advanced_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Blend_Operation_Advanced_Features_Type;
        Next: C.Out_Structure_C_Access;
        Advanced_Blend_Coherent_Operations: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Blend_Operation_Advanced_Features_C_Access is
        access Physical_Device_Blend_Operation_Advanced_Features_C
        with Convention => C;

    type Physical_Device_Blend_Operation_Advanced_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Blend_Operation_Advanced_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Advanced_Blend_Max_Color_Attachments: Interfaces.Unsigned_32;
        Advanced_Blend_Independent_Blend: Interfaces.Unsigned_32;
        Advanced_Blend_Non_Premultiplied_Src_Color: Interfaces.Unsigned_32;
        Advanced_Blend_Non_Premultiplied_Dst_Color: Interfaces.Unsigned_32;
        Advanced_Blend_Correlated_Overlap: Interfaces.Unsigned_32;
        Advanced_Blend_All_Operations: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Blend_Operation_Advanced_Properties_C_Access is
        access Physical_Device_Blend_Operation_Advanced_Properties_C
        with Convention => C;

    type Pipeline_Color_Blend_Advanced_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Color_Blend_Advanced_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Src_Premultiplied: Interfaces.Unsigned_32;
        Dst_Premultiplied: Interfaces.Unsigned_32;
        Blend_Overlap: Extensions.EXT.Blend_Overlap;
    end record
        with Convention => C;

    type Pipeline_Color_Blend_Advanced_State_Create_Info_C_Access is
        access Pipeline_Color_Blend_Advanced_State_Create_Info_C
        with Convention => C;

    package DRM_Format_Modifier_Properties_Arrays is
        new C_Arrays(Extensions.EXT.DRM_Format_Modifier_Properties);

    type DRM_Format_Modifier_Properties_List_C is
    record
        Record_Type: Out_Structure_Type :=
            DRM_Format_Modifier_Properties_List_Type;
        Next: C.Out_Structure_C_Access;
        DRM_Format_Modifier_Count: Interfaces.Unsigned_32;
        DRM_Format_Modifier_Properties:
            DRM_Format_Modifier_Properties_Arrays.Pointer;
    end record
        with Convention => C;

    type DRM_Format_Modifier_Properties_List_C_Access is
        access DRM_Format_Modifier_Properties_List_C
        with Convention => C;

    type Physical_Device_Image_DRM_Format_Modifier_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Physical_Device_Image_DRM_Format_Modifier_Info_Type;
        Next: C.In_Structure_C_Access;
        DRM_Format_Modifier: Interfaces.Unsigned_64;
        Sharing_Mode: Vulkan.Sharing_Mode;
        Queue_Family_Index_Count: Interfaces.Unsigned_32;
        Queue_Family_Indices: C.Queue_Family_Index_Arrays.Pointer;
    end record
        with Convention => C;

    type Physical_Device_Image_DRM_Format_Modifier_Info_C_Access is
        access Physical_Device_Image_DRM_Format_Modifier_Info_C
        with Convention => C;

    type Image_DRM_Format_Modifier_List_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Image_DRM_Format_Modifier_List_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        DRM_Format_Modifier_Count: Interfaces.Unsigned_32;
        DRM_Format_Modifiers: C.Uint64_t_Arrays.Pointer;
    end record
        with Convention => C;

    type Image_DRM_Format_Modifier_List_Create_Info_C_Access is
        access Image_DRM_Format_Modifier_List_Create_Info_C
        with Convention => C;

    package Subresource_Layout_Arrays is new C_Arrays(Subresource_Layout);

    type Image_DRM_Format_Modifier_Explicit_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Image_DRM_Format_Modifier_Explicit_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        DRM_Format_Modifier: Interfaces.Unsigned_64;
        DRM_Format_Modifier_Plane_Count: Interfaces.Unsigned_32;
        Plane_Layouts: Subresource_Layout_Arrays.Pointer;
    end record
        with Convention => C;

    type Image_DRM_Format_Modifier_Explicit_Create_Info_C_Access is
        access Image_DRM_Format_Modifier_Explicit_Create_Info_C
        with Convention => C;

    type Image_DRM_Format_Modifier_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Image_DRM_Format_Modifier_Properties_Type;
        Next: C.Out_Structure_C_Access;
        DRM_Format_Modifier: Interfaces.Unsigned_64;
    end record
        with Convention => C;

    type Image_DRM_Format_Modifier_Properties_C_Access is
        access Image_DRM_Format_Modifier_Properties_C
        with Convention => C;

    package DRM_Format_Modifier_Properties_2_Arrays is
        new C_Arrays(Extensions.EXT.DRM_Format_Modifier_Properties_2);

    type DRM_Format_Modifier_Properties_List_2_C is
    record
        Record_Type: Out_Structure_Type :=
            DRM_Format_Modifier_Properties_List_2_Type;
        Next: C.Out_Structure_C_Access;
        DRM_Format_Modifier_Count: Interfaces.Unsigned_32;
        DRM_Format_Modifier_Properties:
            DRM_Format_Modifier_Properties_2_Arrays.Pointer;
    end record
        with Convention => C;

    type DRM_Format_Modifier_Properties_List_2_C_Access is
        access DRM_Format_Modifier_Properties_List_2_C
        with Convention => C;

    type Validation_Cache_Create_Info_C is
    record
        Record_Type: In_Structure_Type := Validation_Cache_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.EXT.Validation_Cache_Create_Flags;
        Initial_Data_Size: Interfaces.C.size_t;
        Initial_Data: Interfaces.C.Extensions.void_ptr;
    end record
        with Convention => C;

    type Validation_Cache_Create_Info_C_Access is
        access Validation_Cache_Create_Info_C
        with Convention => C;

    type Shader_Module_Validation_Cache_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Shader_Module_Validation_Cache_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Validation_Cache: Extensions.EXT.Validation_Cache;
    end record
        with Convention => C;

    type Shader_Module_Validation_Cache_Create_Info_C_Access is
        access Shader_Module_Validation_Cache_Create_Info_C
        with Convention => C;

    type Physical_Device_Image_View_Image_Format_Info_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Image_View_Image_Format_Info_Type;
        Next: C.Out_Structure_C_Access;
        Image_View_Type: Vulkan.Image_View_Type;
    end record
        with Convention => C;

    type Physical_Device_Image_View_Image_Format_Info_C_Access is
        access Physical_Device_Image_View_Image_Format_Info_C
        with Convention => C;

    type Filter_Cubic_Image_View_Image_Format_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Filter_Cubic_Image_View_Image_Format_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Filter_Cubic: Interfaces.Unsigned_32;
        Filter_Cubic_Minmax: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Filter_Cubic_Image_View_Image_Format_Properties_C_Access is
        access Filter_Cubic_Image_View_Image_Format_Properties_C
        with Convention => C;

    type Import_Memory_Host_Pointer_Info_C is
    record
        Record_Type: In_Structure_Type := Import_Memory_Host_Pointer_Info_Type;
        Next: C.In_Structure_C_Access;
        Handle_Type: External_Memory_Handle_Type_Flags;
        Host_Pointer: Interfaces.C.Extensions.void_ptr;
    end record
        with Convention => C;

    type Import_Memory_Host_Pointer_Info_C_Access is
        access Import_Memory_Host_Pointer_Info_C
        with Convention => C;

    type Memory_Host_Pointer_Properties_C is
    record
        Record_Type: Out_Structure_Type := Memory_Host_Pointer_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Memory_Type_Bits: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Memory_Host_Pointer_Properties_C_Access is
        access Memory_Host_Pointer_Properties_C
        with Convention => C;

    type Physical_Device_External_Memory_Host_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_External_Memory_Host_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Min_Imported_Host_Pointer_Alignment: Device_Size;
    end record
        with Convention => C;

    type Physical_Device_External_Memory_Host_Properties_C_Access is
        access Physical_Device_External_Memory_Host_Properties_C
        with Convention => C;

    type Physical_Device_PCI_Bus_Info_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_PCI_Bus_Info_Properties_Type;
        Next: C.Out_Structure_C_Access;
        PCI_Domain: Interfaces.Unsigned_32;
        PCI_Bus: Interfaces.Unsigned_32;
        PCI_Device: Interfaces.Unsigned_32;
        PCI_Function: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_PCI_Bus_Info_Properties_C_Access is
        access Physical_Device_PCI_Bus_Info_Properties_C
        with Convention => C;

    type Physical_Device_Fragment_Density_Map_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Fragment_Density_Map_Features_Type;
        Next: C.Out_Structure_C_Access;
        Fragment_Density_Map: Interfaces.Unsigned_32;
        Fragment_Density_Map_Dynamic: Interfaces.Unsigned_32;
        Fragment_Density_Map_Non_Subsampled_Images: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Fragment_Density_Map_Features_C_Access is
        access Physical_Device_Fragment_Density_Map_Features_C
        with Convention => C;

    type Physical_Device_Fragment_Density_Map_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Fragment_Density_Map_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Min_Fragment_Density_Texel_Size: Extent_2D;
        Max_Fragment_Density_Texel_size: Extent_2D;
        Fragment_Density_Invocations: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Fragment_Density_Map_Properties_C_Access is
        access Physical_Device_Fragment_Density_Map_Properties_C
        with Convention => C;

    type Render_Pass_Fragment_Density_Map_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Render_Pass_Fragment_Density_Map_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Fragment_Density_Map_Attachment: Attachment_Reference;
    end record
        with Convention => C;

    type Render_Pass_Fragment_Density_Map_Create_Info_C_Access is
        access Render_Pass_Fragment_Density_Map_Create_Info_C
        with Convention => C;

    type Rendering_Fragment_Density_Map_Attachment_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Rendering_Fragment_Density_Map_Attachment_Info_Type;
        Next: C.In_Structure_C_Access;
        Image_View: Vulkan.Image_View;
        Image_Layout: Vulkan.Image_Layout;
    end record
        with Convention => C;

    type Rendering_Fragment_Density_Map_Attachment_Info_C_Access is
        access Rendering_Fragment_Density_Map_Attachment_Info_C
        with Convention => C;

    type Physical_Device_Shader_Image_Atomic_Int64_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Shader_Image_Atomic_Int64_Features_Type;
        Next: C.Out_Structure_C_Access;
        Shader_Image_Int64_Atomics: Interfaces.Unsigned_32;
        Sparse_Image_Int64_Atomics: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Shader_Image_Atomic_Int64_Features_C_Access is
        access Physical_Device_Shader_Image_Atomic_Int64_Features_C
        with Convention => C;

    type Physical_Device_Memory_Budget_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Memory_Budget_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Heap_Budget: Extensions.EXT.Budget_Size_Array;
        Heap_Usage: Extensions.EXT.Budget_Size_Array;
    end record
        with Convention => C;

    type Physical_Device_Memory_Budget_Properties_C_Access is
        access Physical_Device_Memory_Budget_Properties_C
        with Convention => C;

    type Physical_Device_Memory_Priority_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Memory_Priority_Features_Type;
        Next: C.Out_Structure_C_Access;
        Memory_Priority: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Memory_Priority_Features_C_Access is
        access Physical_Device_Memory_Priority_Features_C
        with Convention => C;

    type Memory_Priority_Allocate_Info_C is
    record
        Record_Type: In_Structure_Type := Memory_Priority_Allocate_Info_Type;
        Next: C.In_Structure_C_Access;
        Priority: Interfaces.C.C_float;
    end record
        with Convention => C;

    type Memory_Priority_Allocate_Info_C_Access is
        access Memory_Priority_Allocate_Info_C
        with Convention => C;

    type Physical_Device_Fragment_Shader_Interlock_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Fragment_Shader_Interlock_Features_Type;
        Next: C.Out_Structure_C_Access;
        Fragment_Shader_Sample_Interlock: Interfaces.Unsigned_32;
        Fragment_Shader_Pixel_Interlock: Interfaces.Unsigned_32;
        Fragment_Shader_Shading_Rate_Interlock: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Fragment_Shader_Interlock_Features_C_Access is
        access Physical_Device_Fragment_Shader_Interlock_Features_C
        with Convention => C;

    type Physical_Device_YCbCr_Image_Arrays_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_YCbCr_Image_Arrays_Features_Type;
        Next: C.Out_Structure_C_Access;
        YCbCr_Image_Arrays: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_YCbCr_Image_Arrays_Features_C_Access is
        access Physical_Device_YCbCr_Image_Arrays_Features_C
        with Convention => C;

    type Physical_Device_Provoking_Vertex_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Provoking_Vertex_Features_Type;
        Next: C.Out_Structure_C_Access;
        Provoking_Vertex_Last: Interfaces.Unsigned_32;
        Transform_Feedback_Preserves_Provoking_Vertex: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Provoking_Vertex_Features_C_Access is
        access Physical_Device_Provoking_Vertex_Features_C
        with Convention => C;

    type Physical_Device_Provoking_Vertex_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Provoking_Vertex_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Provoking_Vertex_Mode_Per_Pipeline: Interfaces.Unsigned_32;
        Transform_Feedback_Preserves_Triangle_Fan_Provoking_Vertex:
            Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Provoking_Vertex_Properties_C_Access is
        access Physical_Device_Provoking_Vertex_Properties_C
        with Convention => C;

    type Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Provoking_Vertex_Mode: Extensions.EXT.Provoking_Vertex_Mode;
    end record
        with Convention => C;

    type Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_C_Access is
        access Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_C
        with Convention => C;

    type Headless_Surface_Create_Info_C is
    record
        Record_Type: In_Structure_Type := Headless_Surface_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.EXT.Headless_Surface_Create_Flags;
    end record
        with Convention => C;

    type Headless_Surface_Create_Info_C_Access is
        access Headless_Surface_Create_Info_C
        with Convention => C;

    type Physical_Device_Shader_Atomic_Float_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Shader_Atomic_Float_Features_Type;
        Next: C.Out_Structure_C_Access;
        Shader_Buffer_Float_32_Atomics: Interfaces.Unsigned_32;
        Shader_Buffer_Float_32_Atomic_Add: Interfaces.Unsigned_32;
        Shader_Buffer_Float_64_Atomics: Interfaces.Unsigned_32;
        Shader_Buffer_Float_64_Atomic_Add: Interfaces.Unsigned_32;
        Shader_Shared_Float_32_Atomics: Interfaces.Unsigned_32;
        Shader_Shared_Float_32_Atomic_Add: Interfaces.Unsigned_32;
        Shader_Shared_Float_64_Atomics: Interfaces.Unsigned_32;
        Shader_Shared_Float_64_Atomic_Add: Interfaces.Unsigned_32;
        Sparse_Image_Float_32_Atomics: Interfaces.Unsigned_32;
        Sparse_Image_Float_32_Atomic_Add: Interfaces.Unsigned_32;
        Sparse_Image_Float_64_Atomics: Interfaces.Unsigned_32;
        Sparse_Image_Float_64_Atomic_Add: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Shader_Atomic_Float_Features_C_Access is
        access Physical_Device_Shader_Atomic_Float_Features_C
        with Convention => C;

    type Physical_Device_Map_Memory_Placed_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Map_Memory_Placed_Features_Type;
        Next: C.Out_Structure_C_Access;
        Memory_Map_Placed: Interfaces.Unsigned_32;
        Memory_Map_Range_Placed: Interfaces.Unsigned_32;
        Memory_Unmap_Reserve: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Map_Memory_Placed_Features_C_Access is
        access Physical_Device_Map_Memory_Placed_Features_C
        with Convention => C;

    type Physical_Device_Map_Memory_Placed_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Map_Memory_Placed_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Min_Placed_Memory_Map_Alignment: Device_Size;
    end record
        with Convention => C;

    type Physical_Device_Map_Memory_Placed_Properties_C_Access is
        access Physical_Device_Map_Memory_Placed_Properties_C
        with Convention => C;

    type Memory_Map_Placed_Info_C is
    record
        Record_Type: In_Structure_Type := Memory_Map_Placed_Info_Type;
        Next: C.In_Structure_C_Access;
        Placed_Address: Interfaces.C.Extensions.void_ptr;
    end record
        with Convention => C;

    type Memory_Map_Placed_Info_C_Access is access Memory_Map_Placed_Info_C
        with Convention => C;

    type Physical_Device_Shader_Atomic_Float_2_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Shader_Atomic_Float_2_Features_Type;
        Next: C.Out_Structure_C_Access;
        Shader_Buffer_Float_16_Atomics: Interfaces.Unsigned_32;
        Shader_Buffer_Float_16_Atomic_Add: Interfaces.Unsigned_32;
        Shader_Buffer_Float_16_Atomic_Min_Max: Interfaces.Unsigned_32;
        Shader_Buffer_Float_32_Atomic_Min_Max: Interfaces.Unsigned_32;
        Shader_Buffer_Float_64_Atomic_Min_Max: Interfaces.Unsigned_32;
        Shader_Shared_Float_16_Atomics: Interfaces.Unsigned_32;
        Shader_Shared_Float_16_Atomic_Add: Interfaces.Unsigned_32;
        Shader_Shared_Float_16_Atomic_Min_Max: Interfaces.Unsigned_32;
        Shader_Shared_Float_32_Atomic_Min_Max: Interfaces.Unsigned_32;
        Shader_Shared_Float_64_Atomic_Min_Max: Interfaces.Unsigned_32;
        Shader_Image_Float_32_Atomic_Min_Max: Interfaces.Unsigned_32;
        Sparse_Image_Float_32_Atomic_Min_Max: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Shader_Atomic_Float_2_Features_C_Access is
        access Physical_Device_Shader_Atomic_Float_2_Features_C
        with Convention => C;

    type Physical_Device_Depth_Bias_Control_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Depth_Bias_Control_Features_Type;
        Next: C.Out_Structure_C_Access;
        Depth_Bias_Control: Interfaces.Unsigned_32;
        Least_Representable_Value_Force_Unorm_Representation:
            Interfaces.Unsigned_32;
        Float_Representation: Interfaces.Unsigned_32;
        Depth_Bias_Exact: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Depth_Bias_Control_Features_C_Access is
        access Physical_Device_Depth_Bias_Control_Features_C
        with Convention => C;

    type Depth_Bias_Info_C is
    record
        Record_Type: In_Structure_Type := Depth_Bias_Info_Type;
        Next: C.In_Structure_C_Access;
        Depth_Bias_Constant_Factor: Interfaces.C.C_float;
        Depth_Bias_Clamp: Interfaces.C.C_float;
        Depth_Bias_Slope_Factor: Interfaces.C.C_float;
    end record
        with Convention => C;

    type Depth_Bias_Info_C_Access is access Depth_Bias_Info_C
        with Convention => C;

    type Depth_Bias_Representation_Info_C is
    record
        Record_Type: In_Structure_Type := Depth_Bias_Representation_Info_Type;
        Next: C.In_Structure_C_Access;
        Depth_Bias_Representation: Extensions.EXT.Depth_Bias_Representation;
        Depth_Bias_Exact: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Depth_Bias_Representation_Info_C_Access is
        access Depth_Bias_Representation_Info_C
        with Convention => C;

    type Physical_Device_Device_Memory_Report_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Device_Memory_Report_Features_Type;
        Next: C.Out_Structure_C_Access;
        Device_Memory_Report: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Device_Memory_Report_Features_C_Access is
        access Physical_Device_Device_Memory_Report_Features_C
        with Convention => C;

    type Device_Memory_Report_Callback_Data_C is
    record
        Record_Type: Out_Structure_Type :=
            Device_Memory_Report_Callback_Data_Type;
        Next: C.Out_Structure_C_Access;
        Flags: Extensions.EXT.Device_Memory_Report_Flags;
        Event_Type: Extensions.EXT.Device_Memory_Report_Event_Type;
        Memory_Object_ID: Interfaces.Unsigned_64;
        Size: Device_Size;
        Object_Type: Vulkan.Object_Type;
        Object_Handle: Vulkan.Object_Handle;
        Heap_Index: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Device_Memory_Report_Callback_Data_C_Access is
        access Device_Memory_Report_Callback_Data_C
        with Convention => C;

    type Device_Memory_Report_Callback_C is
        access procedure(Callback_Data: in Device_Memory_Report_Callback_Data_C;
                         User_Data: in Interfaces.C.Extensions.void_ptr)
        with Convention => C;

    type Device_Device_Memory_Report_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Device_Device_Memory_Report_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.EXT.Device_Memory_Report_Flags;
        User_Callback: Device_Memory_Report_Callback_C;
        User_Data: Interfaces.C.Extensions.void_ptr;
    end record
        with Convention => C;

    type Device_Device_Memory_Report_Create_Info_C_Access is
        access Device_Device_Memory_Report_Create_Info_C
        with Convention => C;

    type Sampler_Custom_Border_Color_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Sampler_Custom_Border_Color_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Custom_Border_Color: C.Clear_Color_Value_C;
        Format: Vulkan.Format;
    end record
        with Convention => C;

    type Sampler_Custom_Border_Color_Create_Info_C_Access is
        access Sampler_Custom_Border_Color_Create_Info_C
        with Convention => C;

    type Physical_Device_Custom_Border_Color_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Custom_Border_Color_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Max_Custom_Border_Color_Samplers: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Custom_Border_Color_Properties_C_Access is
        access Physical_Device_Custom_Border_Color_Properties_C
        with Convention => C;

    type Physical_Device_Custom_Border_Color_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Custom_Border_Color_Features_Type;
        Next: C.Out_Structure_C_Access;
        Custom_Border_Colors: Interfaces.Unsigned_32;
        Custom_Border_Color_Without_Format: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Custom_Border_Color_Features_C_Access is
        access Physical_Device_Custom_Border_Color_Features_C
        with Convention => C;

    type Physical_Device_Descriptor_Buffer_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Descriptor_Buffer_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Combined_Image_Sampler_Descriptor_Single_Array: Interfaces.Unsigned_32;
        Bufferless_Push_Descriptors: Interfaces.Unsigned_32;
        Allow_Sampler_Image_View_Post_Submit_Creation: Interfaces.Unsigned_32;
        Descriptor_Buffer_Offset_Alignment: Device_Size;
        Max_Descriptor_Buffer_Bindings: Interfaces.Unsigned_32;
        Max_Resource_Descriptor_Buffer_Bindings: Interfaces.Unsigned_32;
        Max_Sampler_Descriptor_Buffer_Bindings: Interfaces.Unsigned_32;
        Max_Embedded_Immutable_Sampler_Bindings: Interfaces.Unsigned_32;
        Max_Embedded_Immutable_Samplers: Interfaces.Unsigned_32;
        Buffer_Capture_Replay_Descriptor_Data_Size: Interfaces.C.size_t;
        Image_Capture_Replay_Descriptor_Data_Size: Interfaces.C.size_t;
        Image_View_Capture_Replay_Descriptor_Data_Size: Interfaces.C.size_t;
        Sampler_Capture_Replay_Descriptor_Data_Size: Interfaces.C.size_t;
        Acceleration_Structure_Capture_Replay_Descriptor_Data_Size:
            Interfaces.C.size_t;
        Sampler_Descriptor_Size: Interfaces.C.size_t;
        Combined_Image_Sampler_Descriptor_Size: Interfaces.C.size_t;
        Sampled_Image_Descriptor_Size: Interfaces.C.size_t;
        Storage_Image_Descriptor_Size: Interfaces.C.size_t;
        Uniform_Texel_Buffer_Descriptor_Size: Interfaces.C.size_t;
        Robust_Uniform_Texel_Buffer_Descriptor_Size: Interfaces.C.size_t;
        Storage_Texel_Buffer_Descriptor_Size: Interfaces.C.size_t;
        Robust_Storage_Texel_Buffer_Descriptor_Size: Interfaces.C.size_t;
        Uniform_Buffer_Descriptor_Size: Interfaces.C.size_t;
        Robust_Uniform_Buffer_Descriptor_Size: Interfaces.C.size_t;
        Storage_Buffer_Descriptor_Size: Interfaces.C.size_t;
        Robust_Storage_Buffer_Descriptor_Size: Interfaces.C.size_t;
        Input_Attachment_Descriptor_Size: Interfaces.C.size_t;
        Acceleration_Structure_Descriptor_Size: Interfaces.C.size_t;
        Max_Sampler_Descriptor_Buffer_Range: Device_Size;
        Max_Resource_Descriptor_Buffer_Range: Device_Size;
        Sampler_Descriptor_Buffer_Address_Space_Size: Device_Size;
        Resource_Descriptor_Buffer_Address_Space_Size: Device_Size;
        Descriptor_Buffer_Address_Space_Size: Device_Size;
    end record
        with Convention => C;

    type Physical_Device_Descriptor_Buffer_Properties_C_Access is
        access Physical_Device_Descriptor_Buffer_Properties_C
        with Convention => C;

    type Physical_Device_Descriptor_Buffer_Density_Map_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Descriptor_Buffer_Density_Map_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Combined_Image_Sampler_Density_Map_Descriptor_Size: Interfaces.C.size_t;
    end record
        with Convention => C;

    type Physical_Device_Descriptor_Buffer_Density_Map_Properties_C_Access is
        access Physical_Device_Descriptor_Buffer_Density_Map_Properties_C
        with Convention => C;

    type Physical_Device_Descriptor_Buffer_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Descriptor_Buffer_Features_Type;
        Next: C.Out_Structure_C_Access;
        Descriptor_Buffer: Interfaces.Unsigned_32;
        Descriptor_Buffer_Capture_Replay: Interfaces.Unsigned_32;
        Descriptor_Buffer_Image_Layout_Ignored: Interfaces.Unsigned_32;
        Descriptor_Buffer_Push_Descriptors: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Descriptor_Buffer_Features_C_Access is
        access Physical_Device_Descriptor_Buffer_Features_C
        with Convention => C;

    type Descriptor_Address_Info_C is
    record
        Record_Type: Out_Structure_Type := Descriptor_Address_Info_Type;
        Next: C.Out_Structure_C_Access;
        Address: Device_Address;
        Address_Range: Device_Size;
        Format: Vulkan.Format;
    end record
        with Convention => C;

    type Descriptor_Address_Info_C_Access is access Descriptor_Address_Info_C
        with Convention => C;

    type Descriptor_Buffer_Binding_Info_C is
    record
        Record_Type: In_Structure_Type := Descriptor_Buffer_Binding_Info_Type;
        Next: C.In_Structure_C_Access;
        Address: Device_Address;
        Usage: Buffer_Usage_Flags;
    end record
        with Convention => C;

    type Descriptor_Buffer_Binding_Info_C_Access is
        access Descriptor_Buffer_Binding_Info_C
        with Convention => C;

    type Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_C is
    record
        Record_Type: In_Structure_Type :=
            Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_Type;
        Next: C.In_Structure_C_Access;
        Buffer: Vulkan.Buffer;
    end record
        with Convention => C;

    type Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_C_Access is
        access Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_C
        with Convention => C;

    type Descriptor_Data_C
        (Descriptor_Type: Extensions.EXT.Descriptor_Data_Type :=
            Type_Sampler) is
    record
        case Descriptor_Type is
            when Type_Sampler =>
                Sampler: Sampler_Access;
            when Combined_Image_Sampler =>
                Combined_Image_Sampler: Descriptor_Image_Info_Access;
            when Input_Attachment =>
                Input_Attachment_Image: Descriptor_Image_Info_Access;
            when Sampled_Image =>
                Sampled_Image: Descriptor_Image_Info_Access;
            when Storage_Image =>
                Storage_Image: Descriptor_Image_Info_Access;
            when Uniform_Texel_Buffer =>
                Uniform_Texel_Buffer: Descriptor_Address_Info_C_Access;
            when Storage_Texel_Buffer =>
                Storage_Texel_Buffer: Descriptor_Address_Info_C_Access;
            when Uniform_Buffer =>
                Uniform_Buffer: Descriptor_Address_Info_C_Access;
            when Storage_Buffer =>
                Storage_Buffer: Descriptor_Address_Info_C_Access;
            when Acceleration_Structure_KHR =>
                Acceleration_Structure: Device_Address;
        end case;
    end record
        with Unchecked_Union,
             Convention => C;

    type Descriptor_Get_Info_C is
    record
        Record_Type: In_Structure_Type := Descriptor_Get_Info_Type;
        Next: C.In_Structure_C_Access;
        Descriptor_Type: Vulkan.Descriptor_Type;
        Data: Descriptor_Data_C;
    end record
        with Convention => C;

    type Descriptor_Get_Info_C_Access is access Descriptor_Get_Info_C
        with Convention => C;

    type Buffer_Capture_Descriptor_Data_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Buffer_Capture_Descriptor_Data_Info_Type;
        Next: C.In_Structure_C_Access;
        Buffer: Vulkan.Buffer;
    end record
        with Convention => C;

    type Buffer_Capture_Descriptor_Data_Info_C_Access is
        access Buffer_Capture_Descriptor_Data_Info_C
        with Convention => C;

    type Image_Capture_Descriptor_Data_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Image_Capture_Descriptor_Data_Info_Type;
        Next: C.In_Structure_C_Access;
        Image: Vulkan.Image;
    end record
        with Convention => C;

    type Image_Capture_Descriptor_Data_Info_C_Access is
        access Image_Capture_Descriptor_Data_Info_C
        with Convention => C;

    type Image_View_Capture_Descriptor_Data_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Image_View_Capture_Descriptor_Data_Info_Type;
        Next: C.In_Structure_C_Access;
        Image_View: Vulkan.Image_View;
    end record
        with Convention => C;

    type Image_View_Capture_Descriptor_Data_Info_C_Access is
        access Image_View_Capture_Descriptor_Data_Info_C
        with Convention => C;

    type Sampler_Capture_Descriptor_Data_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Sampler_Capture_Descriptor_Data_Info_Type;
        Next: C.In_Structure_C_Access;
        Sampler: Vulkan.Sampler;
    end record
        with Convention => C;

    type Sampler_Capture_Descriptor_Data_Info_C_Access is
        access Sampler_Capture_Descriptor_Data_Info_C
        with Convention => C;

    type Opaque_Capture_Descriptor_Data_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Opaque_Capture_Descriptor_Data_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Opaque_Capture_Descriptor_Data: Interfaces.C.Extensions.void_ptr;
    end record
        with Convention => C;

    type Opaque_Capture_Descriptor_Data_Create_Info_C_Access is
        access Opaque_Capture_Descriptor_Data_Create_Info_C
        with Convention => C;

    type Acceleration_Structure_Capture_Descriptor_Data_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Acceleration_Structure_Capture_Descriptor_Data_Info_Type;
        Next: C.In_Structure_C_Access;
        Acceleration_Structure: Extensions.KHR.Acceleration_Structure;
        Acceleration_Structure_NV: Extensions.NV.Acceleration_Structure;
    end record
        with Convention => C;

    type Acceleration_Structure_Capture_Descriptor_Data_Info_C_Access is
        access Acceleration_Structure_Capture_Descriptor_Data_Info_C
        with Convention => C;

    type Physical_Device_Graphics_Pipeline_Library_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Graphics_Pipeline_Library_Features_Type;
        Next: C.Out_Structure_C_Access;
        Graphics_Pipeline_Library: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Graphics_Pipeline_Library_Features_C_Access is
        access Physical_Device_Graphics_Pipeline_Library_Features_C
        with Convention => C;

    type Physical_Device_Graphics_Pipeline_Library_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Graphics_Pipeline_Library_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Graphics_Pipeline_Library_Fast_Linking: Interfaces.Unsigned_32;
        Graphics_Pipeline_Library_Independent_Interpolation_Decoration:
            Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Graphics_Pipeline_Library_Properties_C_Access is
        access Physical_Device_Graphics_Pipeline_Library_Properties_C
        with Convention => C;

    type Graphics_Pipeline_Library_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Graphics_Pipeline_Library_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.EXT.Graphics_Pipeline_Library_Flags;
    end record
        with Convention => C;

    type Graphics_Pipeline_Library_Create_Info_C_Access is
        access Graphics_Pipeline_Library_Create_Info_C
        with Convention => C;

    type Physical_Device_Fragment_Density_Map_2_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Fragment_Density_Map_2_Features_Type;
        Next: C.Out_Structure_C_Access;
        Fragment_Density_Map_Deferred: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Fragment_Density_Map_2_Features_C_Access is
        access Physical_Device_Fragment_Density_Map_2_Features_C
        with Convention => C;

    type Physical_Device_Fragment_Density_Map_2_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Fragment_Density_Map_2_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Subsampled_Loads: Interfaces.Unsigned_32;
        Subsampled_Coarse_Reconstruction_Early_Access: Interfaces.Unsigned_32;
        Max_Subsampled_Array_Layers: Interfaces.Unsigned_32;
        Max_Descriptor_Set_Subsampled_Samplers: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Fragment_Density_Map_2_Properties_C_Access is
        access Physical_Device_Fragment_Density_Map_2_Properties_C
        with Convention => C;

    type Physical_Device_Image_Compression_Control_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Image_Compression_Control_Features_Type;
        Next: C.Out_Structure_C_Access;
        Image_Compression_Control: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Image_Compression_Control_Features_C_Access is
        access Physical_Device_Image_Compression_Control_Features_C
        with Convention => C;

    package Image_Compression_Fixed_Rate_Flags_Arrays is
        new C_Arrays(Extensions.EXT.Image_Compression_Fixed_Rate_Flags);

    type Image_Compression_Control_C is
    record
        Record_Type: In_Structure_Type := Image_Compression_Control_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.EXT.Image_Compression_Flags;
        Compression_Control_Plane_Count: Interfaces.Unsigned_32;
        Fixed_Rate_Flags: Image_Compression_Fixed_Rate_Flags_Arrays.Pointer;
    end record
        with Convention => C;

    type Image_Compression_Control_C_Access is
        access Image_Compression_Control_C
        with Convention => C;

    type Image_Compression_Properties_C is
    record
        Record_Type: Out_Structure_Type := Image_Compression_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Image_Compression_Flags: Extensions.EXT.Image_Compression_Flags;
        Image_Compression_Fixed_Rate_Flags:
            Extensions.EXT.Image_Compression_Fixed_Rate_Flags;
    end record
        with Convention => C;

    type Image_Compression_Properties_C_Access is
        access Image_Compression_Properties_C
        with Convention => C;

    type Physical_Device_Attachment_Feedback_Loop_Layout_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Attachment_Feedback_Loop_Layout_Features_Type;
        Next: C.Out_Structure_C_Access;
        Attachment_Feedback_Loop_Layout: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Attachment_Feedback_Loop_Layout_Features_C_Access is
        access Physical_Device_Attachment_Feedback_Loop_Layout_Features_C
        with Convention => C;

    type Physical_Device_Fault_Features_C is
    record
        Record_Type: Out_Structure_Type := Physical_Device_Fault_Features_Type;
        Next: C.Out_Structure_C_Access;
        Device_Fault: Interfaces.Unsigned_32;
        Device_Fault_Vendor_Binary: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Fault_Features_C_Access is
        access Physical_Device_Fault_Features_C
        with Convention => C;

    type Device_Fault_Counts_C is
    record
        Record_Type: Out_Structure_Type := Device_Fault_Counts_Type;
        Next: C.Out_Structure_C_Access;
        Address_Info_Count: Interfaces.Unsigned_32;
        Vendor_Info_Count: Interfaces.Unsigned_32;
        Vendor_Binary_Size: Device_Size;
    end record
        with Convention => C;

    type Device_Fault_Counts_C_Access is access Device_Fault_Counts_C
        with Convention => C;

    type Device_Fault_Vendor_Info_C is
    record
        Description: Interfaces.C.char_array(1 .. Max_Description_Size);
        Vendor_Fault_Code: Interfaces.Unsigned_64;
        Vendor_Fault_Data: Interfaces.Unsigned_64;
    end record
        with Convention => C;

    type Device_Fault_Vendor_Info_C_Access is
        access all Device_Fault_Vendor_Info_C
        with Storage_Size => 0,
             Convention => C;

    type Device_Fault_Address_Info_Access is
        access all Extensions.EXT.Device_Fault_Address_Info
        with Storage_Size => 0,
             Convention => C;

    type Device_Fault_Info_C is
    record
        Record_Type: Out_Structure_Type := Device_Fault_Info_Type;
        Next: C.Out_Structure_C_Access;
        Description: Interfaces.C.char_array(1 .. Max_Description_Size);
        Address_Infos: Device_Fault_Address_Info_Access;
        Vendor_Infos: Device_Fault_Vendor_Info_C_Access;
        Vendor_Binary_Data: Interfaces.C.Extensions.void_ptr;
    end record
        with Convention => C;

    type Device_Fault_Info_C_Access is access Device_Fault_Info_C
        with Convention => C;

    type Physical_Device_RGBA10x6_Formats_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_RGBA10x6_Formats_Features_Type;
        Next: C.Out_Structure_C_Access;
        Format_RGBA10x6_Without_YCbCr_Sampler: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_RGBA10x6_Formats_Features_C_Access is
        access Physical_Device_RGBA10x6_Formats_Features_C
        with Convention => C;

    type Physical_Device_Vertex_Input_Dynamic_State_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Vertex_Input_Dynamic_State_Features_Type;
        Next: C.Out_Structure_C_Access;
        Vertex_Input_Dynamic_State: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Vertex_Input_Dynamic_State_Features_C_Access is
        access Physical_Device_Vertex_Input_Dynamic_State_Features_C
        with Convention => C;

    type Vertex_Input_Binding_Description_2_C is
    record
        Record_Type: Out_Structure_Type :=
            Vertex_Input_Binding_Description_2_Type;
        Next: C.Out_Structure_C_Access;
        Binding: Interfaces.Unsigned_32;
        Stride: Interfaces.Unsigned_32;
        Input_Rate: Vertex_Input_Rate;
        Divisor: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Vertex_Input_Binding_Description_2_C_Access is
        access Vertex_Input_Binding_Description_2_C
        with Convention => C;

    type Vertex_Input_Attribute_Description_2_C is
    record
        Record_Type: Out_Structure_Type :=
            Vertex_Input_Attribute_Description_2_Type;
        Next: C.Out_Structure_C_Access;
        Location: Interfaces.Unsigned_32;
        Binding: Interfaces.Unsigned_32;
        Format: Vulkan.Format;
        Offset: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Vertex_Input_Attribute_Description_2_C_Access is
        access Vertex_Input_Attribute_Description_2_C
        with Convention => C;

    type Physical_Device_DRM_Properties_C is
    record
        Record_Type: Out_Structure_Type := Physical_Device_DRM_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Has_Primary: Interfaces.Unsigned_32;
        Has_Render: Interfaces.Unsigned_32;
        Primary_Major: Interfaces.Integer_64;
        Primary_Minor: Interfaces.Integer_64;
        Render_Major: Interfaces.Integer_64;
        Render_Minor: Interfaces.Integer_64;
    end record
        with Convention => C;

    type Physical_Device_DRM_Properties_C_Access is
        access Physical_Device_DRM_Properties_C
        with Convention => C;

    type Physical_Device_Address_Binding_Report_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Address_Binding_Report_Features_Type;
        Next: C.Out_Structure_C_Access;
        Report_Address_Binding: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Address_Binding_Report_Features_C_Access is
        access Physical_Device_Address_Binding_Report_Features_C
        with Convention => C;

    type Device_Address_Binding_Callback_Data_C is
    record
        Record_Type: Out_Structure_Type :=
            Device_Address_Binding_Callback_Data_Type;
        Next: C.Out_Structure_C_Access;
        Flags: Extensions.EXT.Device_Address_Binding_Flags;
        Base_Address: Device_Address;
        Size: Device_Size;
        Binding_Type: Extensions.EXT.Device_Address_Binding_Type;
    end record
        with Convention => C;

    type Device_Address_Binding_Callback_Data_C_Access is
        access Device_Address_Binding_Callback_Data_C
        with Convention => C;

    type Physical_Device_Depth_Clip_Control_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Depth_Clip_Control_Features_Type;
        Next: C.Out_Structure_C_Access;
        Depth_Clip_Control: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Depth_Clip_Control_Features_C_Access is
        access Physical_Device_Depth_Clip_Control_Features_C
        with Convention => C;

    type Pipeline_Viewport_Depth_Clip_Control_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Pipeline_Viewport_Depth_Clip_Control_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Negative_One_to_One: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Pipeline_Viewport_Depth_Clip_Control_Create_Info_C_Access is
        access Pipeline_Viewport_Depth_Clip_Control_Create_Info_C
        with Convention => C;

    type Physical_Device_Primitive_Topology_List_Restart_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Primitive_Topology_List_Restart_Features_Type;
        Next: C.Out_Structure_C_Access;
        Primitive_Topology_List_Restart: Interfaces.Unsigned_32;
        Primitive_Topology_Patch_List_Restart: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Primitive_Topology_List_Restart_Features_C_Access is
        access Physical_Device_Primitive_Topology_List_Restart_Features_C
        with Convention => C;

    type Pipeline_Properties_Identifier_C is
    record
        Record_Type: Out_Structure_Type := Pipeline_Properties_Identifier_Type;
        Next: C.Out_Structure_C_Access;
        Pipeline_Identifier: UUID;
    end record
        with Convention => C;

    type Pipeline_Properties_Identifier_C_Access is
        access Pipeline_Properties_Identifier_C
        with Convention => C;

    type Physical_Device_Pipeline_Properties_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Pipeline_Properties_Features_Type;
        Next: C.Out_Structure_C_Access;
        Pipeline_Properties_Identifier: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Pipeline_Properties_Features_C_Access is
        access Physical_Device_Pipeline_Properties_Features_C
        with Convention => C;

    type Physical_Device_Frame_Boundary_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Frame_Boundary_Features_Type;
        Next: C.Out_Structure_C_Access;
        Frame_Boundary: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Frame_Boundary_Features_C_Access is
        access Physical_Device_Frame_Boundary_Features_C
        with Convention => C;

    package Image_Arrays is new C_Arrays(Image);
    package Buffer_Arrays is new C_Arrays(Buffer);

    type Frame_Boundary_C is
    record
        Record_Type: In_Structure_Type := Frame_Boundary_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.EXT.Frame_Boundary_Flags;
        Frame_ID: Interfaces.Unsigned_64;
        Image_Count: Interfaces.Unsigned_32;
        Images: Image_Arrays.Pointer;
        Buffer_Count: Interfaces.Unsigned_32;
        Buffers: Buffer_Arrays.Pointer;
        Tag_Name: Interfaces.Unsigned_64;
        Tag_Size: Interfaces.C.size_t;
        Tag: Interfaces.C.Extensions.void_ptr;
    end record
        with Convention => C;

    type Frame_Boundary_C_Access is access Frame_Boundary_C
        with Convention => C;

    type Physical_Device_Multisampled_Render_To_Single_Sampled_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Multisampled_Render_To_Single_Sampled_Features_Type;
        Next: C.Out_Structure_C_Access;
        Multisampled_Render_To_Single_Sampled: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Multisampled_Render_To_Single_Sampled_Features_C_Access
        is access
            Physical_Device_Multisampled_Render_To_Single_Sampled_Features_C
        with Convention => C;

    type Subpass_Resolve_Performance_Query_C is
    record
        Record_Type: Out_Structure_Type :=
            Subpass_Resolve_Performance_Query_Type;
        Next: C.Out_Structure_C_Access;
        Optimal: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Subpass_Resolve_Performance_Query_C_Access is
        access Subpass_Resolve_Performance_Query_C
        with Convention => C;

    type Multisampled_Render_To_Single_Sampled_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Multisampled_Render_To_Single_Sampled_Info_Type;
        Next: C.In_Structure_C_Access;
        Multisampled_Render_To_Single_Sampled_Enable: Interfaces.Unsigned_32;
        Rasterization_Samples: Sample_Count_Flags;
    end record
        with Convention => C;

    type Multisampled_Render_To_Single_Sampled_Info_C_Access is
        access Multisampled_Render_To_Single_Sampled_Info_C
        with Convention => C;

    type Physical_Device_Color_Write_Enable_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Color_Write_Enable_Features_Type;
        Next: C.Out_Structure_C_Access;
        Color_Write_Enable: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Color_Write_Enable_Features_C_Access is
        access Physical_Device_Color_Write_Enable_Features_C
        with Convention => C;

    type Pipeline_Color_Write_Create_Info_C is
    record
        Record_Type: In_Structure_Type := Pipeline_Color_Write_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Attachment_Count: Interfaces.Unsigned_32;
        Color_Write_Enables: C.Uint32_t_Arrays.Pointer;
    end record
        with Convention => C;

    type Pipeline_Color_Write_Create_Info_C_Access is
        access Pipeline_Color_Write_Create_Info_C
        with Convention => C;

    type Physical_Device_Primitives_Generated_Query_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Primitives_Generated_Query_Features_Type;
        Next: C.Out_Structure_C_Access;
        Primitives_Generated_Query: Interfaces.Unsigned_32;
        Primitives_Generated_Query_With_Rasterizer_Discard:
            Interfaces.Unsigned_32;
        Primitives_Generated_Query_With_Non_Zero_Streams:
            Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Primitives_Generated_Query_Features_C_Access is
        access Physical_Device_Primitives_Generated_Query_Features_C
        with Convention => C;

    type Physical_Device_Image_View_Min_LOD_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Image_View_Min_LOD_Features_Type;
        Next: C.Out_Structure_C_Access;
        Min_LOD: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Image_View_Min_LOD_Features_C_Access is
        access Physical_Device_Image_View_Min_LOD_Features_C
        with Convention => C;

    type Image_View_Min_LOD_Create_Info_C is
    record
        Record_Type: In_Structure_Type := Image_View_Min_LOD_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Min_LOD: Interfaces.C.C_float;
    end record
        with Convention => C;

    type Image_View_Min_LOD_Create_Info_C_Access is
        access Image_View_Min_LOD_Create_Info_C
        with Convention => C;

    type Physical_Device_Multi_Draw_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Multi_Draw_Features_Type;
        Next: C.Out_Structure_C_Access;
        Multi_Draw: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Multi_Draw_Features_C_Access is
        access Physical_Device_Multi_Draw_Features_C
        with Convention => C;

    type Physical_Device_Multi_Draw_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Multi_Draw_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Max_Multi_Draw_Count: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Multi_Draw_Properties_C_Access is
        access Physical_Device_Multi_Draw_Properties_C
        with Convention => C;

    type Physical_Device_Image_2D_View_Of_3D_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Image_2D_View_Of_3D_Features_Type;
        Next: C.Out_Structure_C_Access;
        Image_2D_View_Of_3D: Interfaces.Unsigned_32;
        Sampler_2D_View_Of_3D: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Image_2D_View_Of_3D_Features_C_Access is
        access Physical_Device_Image_2D_View_Of_3D_Features_C
        with Convention => C;

    type Physical_Device_Shader_Tile_Image_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Shader_Tile_Image_Features_Type;
        Next: C.Out_Structure_C_Access;
        Shader_Tile_Image_Color_Read_Access: Interfaces.Unsigned_32;
        Shader_Tile_Image_Depth_Read_Access: Interfaces.Unsigned_32;
        Shader_Tile_Image_Stencil_Read_Access: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Shader_Tile_Image_Features_C_Access is
        access Physical_Device_Shader_Tile_Image_Features_C
        with Convention => C;

    type Physical_Device_Shader_Tile_Image_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Shader_Tile_Image_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Shader_Tile_Image_Coherent_Read_Accelerated: Interfaces.Unsigned_32;
        Shader_Tile_Image_Read_Sample_From_Pixel_Rate_Invocation:
            Interfaces.Unsigned_32;
        Shader_Tile_Image_Read_From_Helper_Invocation: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Shader_Tile_Image_Properties_C_Access is
        access Physical_Device_Shader_Tile_Image_Properties_C
        with Convention => C;

    package Micromap_Usage_Arrays is
        new C_Arrays(Extensions.EXT.Micromap_Usage);

    package Micromap_Usage_Access_Arrays is
        new C_Arrays(Extensions.EXT.Micromap_Usage_Access);

    type Micromap_Build_Info_C is
    record
        Record_Type: In_Structure_Type := Micromap_Build_Info_Type;
        Next: C.In_Structure_C_Access;
        Micromap_Type: Extensions.EXT.Micromap_Type;
        Flags: Extensions.EXT.Build_Micromap_Flags;
        Mode: Extensions.EXT.Build_Micromap_Mode;
        Dst_Micromap: Extensions.EXT.Micromap;
        Usage_Counts_Count: Interfaces.Unsigned_32;
        Usage_Counts: Micromap_Usage_Arrays.Pointer;
        Usage_Counts_Access: Micromap_Usage_Access_Arrays.Pointer;
        Data: C_KHR.Device_Or_Host_Address_C;
        Scratch_Data: C_KHR.Device_Or_Host_Address_C;
        Triangle_Array: C_KHR.Device_Or_Host_Address_C;
        Triangle_Array_Stride: Device_Size;
    end record
        with Convention => C;

    type Micromap_Build_Info_C_Access is access Micromap_Build_Info_C
        with Convention => C;

    type Micromap_Create_Info_C is
    record
        Record_Type: In_Structure_Type := Micromap_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Create_Flags: Extensions.EXT.Micromap_Create_Flags;
        Buffer: Vulkan.Buffer;
        Offset: Device_Size;
        Size: Device_Size;
        Micromap_Type: Extensions.EXT.Micromap_Type;
        Device_Address: Vulkan.Device_Address;
    end record
        with Convention => C;

    type Micromap_Create_Info_C_Access is access Micromap_Create_Info_C
        with Convention => C;

    type Physical_Device_Opacity_Micromap_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Opacity_Micromap_Features_Type;
        Next: C.Out_Structure_C_Access;
        Micromap: Interfaces.Unsigned_32;
        Micromap_Capture_Replay: Interfaces.Unsigned_32;
        Micromap_Host_Commands: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Opacity_Micromap_Features_C_Access is
        access Physical_Device_Opacity_Micromap_Features_C
        with Convention => C;

    type Physical_Device_Opacity_Micromap_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Opacity_Micromap_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Max_Opacity_2_State_Subdivision_Level: Interfaces.Unsigned_32;
        Max_Opacity_4_State_Subdivision_Level: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Opacity_Micromap_Properties_C_Access is
        access Physical_Device_Opacity_Micromap_Properties_C
        with Convention => C;
    
    type Micromap_Version_Info_C is
    record
        Record_Type: In_Structure_Type := Micromap_Version_Info_Type;
        Next: C.In_Structure_C_Access;
        Version_Data: Extensions.EXT.Version_Data_Array_Access;
    end record
        with Convention => C;

    type Micromap_Version_Info_C_Access is access Micromap_Version_Info_C
        with Convention => C;

    type Copy_Micromap_To_Memory_Info_C is
    record
        Record_Type: In_Structure_Type := Copy_Micromap_To_Memory_Info_Type;
        Next: C.In_Structure_C_Access;
        Src: Extensions.EXT.Micromap;
        Dst: C_KHR.Device_Or_Host_Address_C;
        Mode: Extensions.EXT.Copy_Micromap_Mode;
    end record
        with Convention => C;

    type Copy_Micromap_To_Memory_Info_C_Access is
        access Copy_Micromap_To_Memory_Info_C
        with Convention => C;

    type Copy_Memory_To_Micromap_Info_C is
    record
        Record_Type: In_Structure_Type := Copy_Memory_To_Micromap_Info_Type;
        Next: C.In_Structure_C_Access;
        Src: C_KHR.Device_Or_Host_Address_C;
        Dst: Extensions.EXT.Micromap;
        Mode: Extensions.EXT.Copy_Micromap_Mode;
    end record
        with Convention => C;

    type Copy_Memory_To_Micromap_Info_C_Access is
        access Copy_Memory_To_Micromap_Info_C
        with Convention => C;

    type Copy_Micromap_Info_C is
    record
        Record_Type: In_Structure_Type := Copy_Micromap_Info_Type;
        Next: C.In_Structure_C_Access;
        Src: Extensions.EXT.Micromap;
        Dst: Extensions.EXT.Micromap;
        Mode: Extensions.EXT.Copy_Micromap_Mode;
    end record
        with Convention => C;

    type Copy_Micromap_Info_C_Access is access Copy_Micromap_Info_C
        with Convention => C;

    type Micromap_Build_Sizes_Info_C is
    record
        Record_Type: In_Structure_Type := Micromap_Build_Sizes_Info_Type;
        Next: C.In_Structure_C_Access;
        Micromap_Size: Device_Size;
        Build_Scratch_Size: Device_Size;
        Discardable: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Micromap_Build_Sizes_Info_C_Access is access Micromap_Build_Sizes_Info_C
        with Convention => C;

    type Metal_Surface_Create_Info_C is
    record
        Record_Type: In_Structure_Type := Metal_Surface_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.EXT.Metal_Surface_Create_Flags;
        Layer: Metal.Layer;
    end record
        with Convention => C;

    type Acceleration_Structure_Triangles_Opacity_Micromap_C is
    record
        Record_Type: Out_Structure_Type :=
            Acceleration_Structure_Triangles_Opacity_Micromap_Type;
        Next: C.Out_Structure_C_Access;
        Index_Type: Vulkan.Index_Type;
        Index_Buffer: C_KHR.Device_Or_Host_Address_C;
        Index_Stride: Device_Size;
        Base_Triangle: Interfaces.Unsigned_32;
        Usage_Counts_Count: Interfaces.Unsigned_32;
        Usage_Counts: Extensions.EXT.Micromap_Usage_Access;
        Usage_Counts_Access: Extensions.EXT.Micromap_Usage_Access_Access;
        Micromap: Extensions.EXT.Micromap;
    end record
        with Convention => C;

    type Acceleration_Structure_Triangles_Opacity_Micromap_C_Access is
        access Acceleration_Structure_Triangles_Opacity_Micromap_C
        with Convention => C;

    type Metal_Surface_Create_Info_C_Access is
        access Metal_Surface_Create_Info_C
        with Convention => C;

    -- Conversion subprograms.
    procedure To_Ada
        (Ada_Struct:
            in out Extensions.EXT.Physical_Device_Transform_Feedback_Features;
         C_Struct: in Physical_Device_Transform_Feedback_Features_C);

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.EXT.Physical_Device_Transform_Feedback_Properties;
         C_Struct: in Physical_Device_Transform_Feedback_Properties_C);

    function To_C
        (Struct:
            in Extensions.EXT.Pipeline_Rasterization_State_Stream_Create_Info)
        return Pipeline_Rasterization_State_Stream_Create_Info_C;
    procedure Free
        (Struct: in out Pipeline_Rasterization_State_Stream_Create_Info_C);

    function To_C(Struct: in Extensions.EXT.Image_View_ASTC_Decode_Mode)
        return Image_View_ASTC_Decode_Mode_C;
    procedure Free(Struct: in out Image_View_ASTC_Decode_Mode_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Physical_Device_ASTC_Decode_Features;
         C_Struct: in Physical_Device_ASTC_Decode_Features_C);

    function To_C(Struct: in Extensions.EXT.Conditional_Rendering_Begin_Info)
        return Conditional_Rendering_Begin_Info_C;
    procedure Free(Struct: in out Conditional_Rendering_Begin_Info_C);

    procedure To_Ada
        (Ada_Struct:
            in out
                Extensions.EXT.Physical_Device_Conditional_Rendering_Features;
         C_Struct: in Physical_Device_Conditional_Rendering_Features_C);

    function To_C
        (Struct:
        in Extensions.EXT.Command_Buffer_Inheritance_Conditional_Rendering_Info)
        return Command_Buffer_Inheritance_Conditional_Rendering_Info_C;
    procedure Free
        (Struct:
            in out Command_Buffer_Inheritance_Conditional_Rendering_Info_C);

    procedure To_Ada(Ada_Struct: in out Extensions.EXT.Surface_Capabilities_2;
                     C_Struct: in Surface_Capabilities_2_C);

    function To_C(Struct: in Extensions.EXT.Display_Power_Info)
        return Display_Power_Info_C;
    procedure Free(Struct: in out Display_Power_Info_C);
    
    function To_C(Struct: in Extensions.EXT.Device_Event_Info)
        return Device_Event_Info_C;
    procedure Free(Struct: in out Device_Event_Info_C);

    function To_C(Struct: in Extensions.EXT.Display_Event_Info)
        return Display_Event_Info_C;
    procedure Free(Struct: in out Display_Event_Info_C);

    function To_C(Struct: in Extensions.EXT.Swapchain_Counter_Create_Info)
        return Swapchain_Counter_Create_Info_C;
    procedure Free(Struct: in out Swapchain_Counter_Create_Info_C);

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.EXT.Physical_Device_Discard_Rectangle_Properties;
         C_Struct: in Physical_Device_Discard_Rectangle_Properties_C);

    function To_C
        (Struct: in Extensions.EXT.Pipeline_Discard_Rectangle_State_Create_Info)
        return Pipeline_Discard_Rectangle_State_Create_Info_C;
    procedure Free
        (Struct: in out Pipeline_Discard_Rectangle_State_Create_Info_C);

    procedure To_Ada
        (Ada_Struct:
            in out
           Extensions.EXT.Physical_Device_Conservative_Rasterization_Properties;
         C_Struct: in Physical_Device_Conservative_Rasterization_Properties_C);

    function To_C
        (Struct:
        in Extensions.EXT.Pipeline_Rasterization_Conservative_State_Create_Info)
        return Pipeline_Rasterization_Conservative_State_Create_Info_C;
    procedure Free
        (Struct:
            in out Pipeline_Rasterization_Conservative_State_Create_Info_C);

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.EXT.Physical_Device_Depth_Clip_Enable_Features;
         C_Struct: in Physical_Device_Depth_Clip_Enable_Features_C);

    function To_C
        (Struct:
          in Extensions.EXT.Pipeline_Rasterization_Depth_Clip_State_Create_Info)
        return Pipeline_Rasterization_Depth_Clip_State_Create_Info_C;
    procedure Free
        (Struct: in out Pipeline_Rasterization_Depth_Clip_State_Create_Info_C);

    function To_C(Struct: in Extensions.EXT.HDR_Metadata) return HDR_Metadata_C;
    procedure Free(Struct: in out HDR_Metadata_C);

    function To_C(Struct: in Extensions.EXT.Debug_Utils_Label)
        return Debug_Utils_Label_C;
    procedure Free(Struct: in out Debug_Utils_Label_C);

    function To_C(Struct: in Extensions.EXT.Debug_Utils_Object_Name_Info)
        return Debug_Utils_Object_Name_Info_C;
    procedure Free(Struct: in out Debug_Utils_Object_Name_Info_C);

    function To_C(Struct: in Extensions.EXT.Debug_Utils_Messenger_Callback_Data)
        return Debug_Utils_Messenger_Callback_Data_C;
    procedure Free(Struct: in out Debug_Utils_Messenger_Callback_Data_C);

    function To_C(Struct: in Extensions.EXT.Debug_Utils_Messenger_Create_Info)
        return Debug_Utils_Messenger_Create_Info_C;
    procedure Free(Struct: in out Debug_Utils_Messenger_Create_Info_C);

    function To_C(Struct: in Extensions.EXT.Debug_Utils_Object_Tag_Info)
        return Debug_Utils_Object_Tag_Info_C;
    procedure Free(Struct: in out Debug_Utils_Object_Tag_Info_C);

    function To_C(Struct: in Extensions.EXT.Sample_Locations_Info)
        return Sample_Locations_Info_C;
    procedure Free(Struct: in out Sample_Locations_Info_C);

    function To_C
            (Struct: in Extensions.EXT.Render_Pass_Sample_Locations_Begin_Info)
        return Render_Pass_Sample_Locations_Begin_Info_C;
    procedure Free(Struct: in out Render_Pass_Sample_Locations_Begin_Info_C);

    function To_C
        (Struct: in
            Extensions.EXT.Pipeline_Sample_Locations_State_Create_Info)
        return Pipeline_Sample_Locations_State_Create_Info_C;
    procedure Free
        (Struct: in out Pipeline_Sample_Locations_State_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Sample_Locations_Properties;
         C_Struct: in Physical_Device_Sample_Locations_Properties_C);

    procedure To_Ada(Ada_Struct: in out Extensions.EXT.Multisample_Properties;
                     C_Struct: in Multisample_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Blend_Operation_Advanced_Features;
         C_Struct: in Physical_Device_Blend_Operation_Advanced_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Blend_Operation_Advanced_Properties;
         C_Struct: in Physical_Device_Blend_Operation_Advanced_Properties_C);

    function To_C
        (Struct: in
            Extensions.EXT.Pipeline_Color_Blend_Advanced_State_Create_Info)
        return Pipeline_Color_Blend_Advanced_State_Create_Info_C;
    procedure Free
        (Struct: in out Pipeline_Color_Blend_Advanced_State_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.DRM_Format_Modifier_Properties_List;
         C_Struct: in DRM_Format_Modifier_Properties_List_C);

    function To_C
        (Struct: in
            Extensions.EXT.Physical_Device_Image_DRM_Format_Modifier_Info)
        return Physical_Device_Image_DRM_Format_Modifier_Info_C;
    procedure Free
        (Struct: in out Physical_Device_Image_DRM_Format_Modifier_Info_C);

    function To_C
        (Struct: in
            Extensions.EXT.Image_DRM_Format_Modifier_List_Create_Info)
        return Image_DRM_Format_Modifier_List_Create_Info_C;
    procedure Free
        (Struct: in out Image_DRM_Format_Modifier_List_Create_Info_C);

    function To_C
        (Struct: in
            Extensions.EXT.Image_DRM_Format_Modifier_Explicit_Create_Info)
        return Image_DRM_Format_Modifier_Explicit_Create_Info_C;
    procedure Free
        (Struct: in out Image_DRM_Format_Modifier_Explicit_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Image_DRM_Format_Modifier_Properties;
         C_Struct: in Image_DRM_Format_Modifier_Properties_C);

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.EXT.DRM_Format_Modifier_Properties_List_2;
         C_Struct: in DRM_Format_Modifier_Properties_List_2_C);

    function To_C(Struct: in Extensions.EXT.Validation_Cache_Create_Info)
        return Validation_Cache_Create_Info_C;
    procedure Free(Struct: in out Validation_Cache_Create_Info_C);

    function To_C
        (Struct: in Extensions.EXT.Shader_Module_Validation_Cache_Create_Info)
        return Shader_Module_Validation_Cache_Create_Info_C;
    procedure Free(Struct: in out Shader_Module_Validation_Cache_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Image_View_Image_Format_Info;
         C_Struct: in Physical_Device_Image_View_Image_Format_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Filter_Cubic_Image_View_Image_Format_Properties;
         C_Struct: in Filter_Cubic_Image_View_Image_Format_Properties_C);

    function To_C(Struct: in Extensions.EXT.Import_Memory_Host_Pointer_Info)
        return Import_Memory_Host_Pointer_Info_C;
    procedure Free(Struct: in out Import_Memory_Host_Pointer_Info_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Memory_Host_Pointer_Properties;
         C_Struct: in Memory_Host_Pointer_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_External_Memory_Host_Properties;
         C_Struct: in Physical_Device_External_Memory_Host_Properties_C);
    
    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_PCI_Bus_Info_Properties;
         C_Struct: in Physical_Device_PCI_Bus_Info_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Fragment_Density_Map_Features;
         C_Struct: in Physical_Device_Fragment_Density_Map_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Fragment_Density_Map_Properties;
         C_Struct: in Physical_Device_Fragment_Density_Map_Properties_C);

    function To_C
        (Struct: in Extensions.EXT.Render_Pass_Fragment_Density_Map_Create_Info)
        return Render_Pass_Fragment_Density_Map_Create_Info_C;
    procedure Free
        (Struct: in out Render_Pass_Fragment_Density_Map_Create_Info_C);

    function To_C
        (Struct:
            in Extensions.EXT.Rendering_Fragment_Density_Map_Attachment_Info)
        return Rendering_Fragment_Density_Map_Attachment_Info_C;
    procedure Free
        (Struct: in out Rendering_Fragment_Density_Map_Attachment_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Shader_Image_Atomic_Int64_Features;
         C_Struct: in Physical_Device_Shader_Image_Atomic_Int64_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Memory_Budget_Properties;
         C_Struct: in Physical_Device_Memory_Budget_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Memory_Priority_Features;
         C_Struct: in Physical_Device_Memory_Priority_Features_C);

    function To_C(Struct: in Extensions.EXT.Memory_Priority_Allocate_Info)
        return Memory_Priority_Allocate_Info_C;
    procedure Free(Struct: in out Memory_Priority_Allocate_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Fragment_Shader_Interlock_Features;
         C_Struct: in Physical_Device_Fragment_Shader_Interlock_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_YCbCr_Image_Arrays_Features;
         C_Struct: in Physical_Device_YCbCr_Image_Arrays_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Provoking_Vertex_Features;
         C_Struct: in Physical_Device_Provoking_Vertex_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Provoking_Vertex_Properties;
         C_Struct: in Physical_Device_Provoking_Vertex_Properties_C);

    function To_C
        (Struct: in
       Extensions.EXT.Pipeline_Rasterization_Provoking_Vertex_State_Create_Info)
        return Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_C;
    procedure Free
        (Struct: in out
            Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_C);

    function To_C(Struct: in Extensions.EXT.Headless_Surface_Create_Info)
        return Headless_Surface_Create_Info_C;
    procedure Free(Struct: in out Headless_Surface_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Shader_Atomic_Float_Features;
         C_Struct: in Physical_Device_Shader_Atomic_Float_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Map_Memory_Placed_Features;
         C_Struct: in Physical_Device_Map_Memory_Placed_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Map_Memory_Placed_Properties;
         C_Struct: in Physical_Device_Map_Memory_Placed_Properties_C);

    function To_C(Struct: in Extensions.EXT.Memory_Map_Placed_Info)
        return Memory_Map_Placed_Info_C;
    procedure Free(Struct: in out Memory_Map_Placed_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Shader_Atomic_Float_2_Features;
         C_Struct: in Physical_Device_Shader_Atomic_Float_2_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Depth_Bias_Control_Features;
         C_Struct: in Physical_Device_Depth_Bias_Control_Features_C);

    function To_C(Struct: in Extensions.EXT.Depth_Bias_Info)
        return Depth_Bias_Info_C;
    procedure Free(Struct: in out Depth_Bias_Info_C);

    function To_C(Struct: in Extensions.EXT.Depth_Bias_Representation_Info)
        return Depth_Bias_Representation_Info_C;
    procedure Free(Struct: in out Depth_Bias_Representation_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Device_Memory_Report_Features;
         C_Struct: in Physical_Device_Device_Memory_Report_Features_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Device_Memory_Report_Callback_Data;
         C_Struct: in Device_Memory_Report_Callback_Data_C);

    function To_C
        (Struct: in Extensions.EXT.Device_Device_Memory_Report_Create_Info)
        return Device_Device_Memory_Report_Create_Info_C;
    procedure Free(Struct: in out Device_Device_Memory_Report_Create_Info_C);

    function To_C
        (Struct: in Extensions.EXT.Sampler_Custom_Border_Color_Create_Info)
        return Sampler_Custom_Border_Color_Create_Info_C;
    procedure Free(Struct: in out Sampler_Custom_Border_Color_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Custom_Border_Color_Properties;
         C_Struct: in Physical_Device_Custom_Border_Color_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Custom_Border_Color_Features;
         C_Struct: in Physical_Device_Custom_Border_Color_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Descriptor_Buffer_Properties;
         C_Struct: in Physical_Device_Descriptor_Buffer_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
        Extensions.EXT.Physical_Device_Descriptor_Buffer_Density_Map_Properties;
         C_Struct: in
            Physical_Device_Descriptor_Buffer_Density_Map_Properties_C);
 
    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Descriptor_Buffer_Features;
         C_Struct: in Physical_Device_Descriptor_Buffer_Features_C);

    procedure To_Ada(Ada_Struct: in out Extensions.EXT.Descriptor_Address_Info;
                     C_Struct: in Descriptor_Address_Info_C);
    
    function To_C(Struct: in Extensions.EXT.Descriptor_Buffer_Binding_Info)
        return Descriptor_Buffer_Binding_Info_C;
    procedure Free(Struct: in out Descriptor_Buffer_Binding_Info_C);

    function To_C
        (Struct: in
         Extensions.EXT.Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle)
        return Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_C;
    procedure Free
        (Struct: in out
            Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_C);

    function To_C(Struct: in Extensions.EXT.Descriptor_Get_Info)
        return Descriptor_Get_Info_C;
    procedure Free(Struct: in out Descriptor_Get_Info_C);

    function To_C(Struct: in Extensions.EXT.Buffer_Capture_Descriptor_Data_Info)
        return Buffer_Capture_Descriptor_Data_Info_C;
    procedure Free(Struct: in out Buffer_Capture_Descriptor_Data_Info_C);

    function To_C(Struct: in Extensions.EXT.Image_Capture_Descriptor_Data_Info)
        return Image_Capture_Descriptor_Data_Info_C;
    procedure Free(Struct: in out Image_Capture_Descriptor_Data_Info_C);

    function To_C
        (Struct: in Extensions.EXT.Image_View_Capture_Descriptor_Data_Info)
        return Image_View_Capture_Descriptor_Data_Info_C;
    procedure Free(Struct: in out Image_View_Capture_Descriptor_Data_Info_C);

    function To_C(Struct: in Extensions.EXT.Sampler_Capture_Descriptor_Data_Info)
        return Sampler_Capture_Descriptor_Data_Info_C;
    procedure Free(Struct: in out Sampler_Capture_Descriptor_Data_Info_C);

    function To_C
        (Struct: in Extensions.EXT.Opaque_Capture_Descriptor_Data_Create_Info)
        return Opaque_Capture_Descriptor_Data_Create_Info_C;
    procedure Free(Struct: in out Opaque_Capture_Descriptor_Data_Create_Info_C);

    function To_C
        (Struct: in
            Extensions.EXT.Acceleration_Structure_Capture_Descriptor_Data_Info)
        return Acceleration_Structure_Capture_Descriptor_Data_Info_C;
    procedure Free
        (Struct: in out Acceleration_Structure_Capture_Descriptor_Data_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Graphics_Pipeline_Library_Features;
         C_Struct: in Physical_Device_Graphics_Pipeline_Library_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Graphics_Pipeline_Library_Properties;
         C_Struct: in Physical_Device_Graphics_Pipeline_Library_Properties_C);

    function To_C
        (Struct: in Extensions.EXT.Graphics_Pipeline_Library_Create_Info)
        return Graphics_Pipeline_Library_Create_Info_C;
    procedure Free(Struct: in out Graphics_Pipeline_Library_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Fragment_Density_Map_2_Features;
         C_Struct: in Physical_Device_Fragment_Density_Map_2_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Fragment_Density_Map_2_Properties;
         C_Struct: in Physical_Device_Fragment_Density_Map_2_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Image_Compression_Control_Features;
         C_Struct: in Physical_Device_Image_Compression_Control_Features_C);

    function To_C(Struct: in Extensions.EXT.Image_Compression_Control)
        return Image_Compression_Control_C;
    procedure Free(Struct: in out Image_Compression_Control_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Image_Compression_Properties;
         C_Struct: in Image_Compression_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
       Extensions.EXT.Physical_Device_Attachment_Feedback_Loop_Layout_Features;
       C_Struct: in Physical_Device_Attachment_Feedback_Loop_Layout_Features_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Physical_Device_Fault_Features;
         C_Struct: in Physical_Device_Fault_Features_C);

    procedure To_Ada(Ada_Struct: in out Extensions.EXT.Device_Fault_Counts;
                     C_Struct: in Device_Fault_Counts_C);

    procedure To_Ada(Ada_Struct: in out Extensions.EXT.Device_Fault_Vendor_Info;
                     C_Struct: in Device_Fault_Vendor_Info_C);

    procedure To_Ada(Ada_Struct: in out Extensions.EXT.Device_Fault_Info;
                     C_Struct: in Device_Fault_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_RGBA10x6_Formats_Features;
         C_Struct: in Physical_Device_RGBA10x6_Formats_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Vertex_Input_Dynamic_State_Features;
         C_Struct: in Physical_Device_Vertex_Input_Dynamic_State_Features_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Vertex_Input_Binding_Description_2;
         C_Struct: in Vertex_Input_Binding_Description_2_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Vertex_Input_Attribute_Description_2;
         C_Struct: in Vertex_Input_Attribute_Description_2_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Physical_Device_DRM_Properties;
         C_Struct: in Physical_Device_DRM_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Address_Binding_Report_Features;
         C_Struct: in Physical_Device_Address_Binding_Report_Features_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Device_Address_Binding_Callback_Data;
         C_Struct: in Device_Address_Binding_Callback_Data_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Depth_Clip_Control_Features;
         C_Struct: in Physical_Device_Depth_Clip_Control_Features_C);

    function To_C
        (Struct: in
            Extensions.EXT.Pipeline_Viewport_Depth_Clip_Control_Create_Info)
        return Pipeline_Viewport_Depth_Clip_Control_Create_Info_C;
    procedure Free
        (Struct: in out Pipeline_Viewport_Depth_Clip_Control_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
        Extensions.EXT.Physical_Device_Primitive_Topology_List_Restart_Features;
         C_Struct: in
            Physical_Device_Primitive_Topology_List_Restart_Features_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Pipeline_Properties_Identifier;
         C_Struct: in Pipeline_Properties_Identifier_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Pipeline_Properties_Features;
         C_Struct: in Physical_Device_Pipeline_Properties_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Frame_Boundary_Features;
         C_Struct: in Physical_Device_Frame_Boundary_Features_C);

    function To_C(Struct: in Extensions.EXT.Frame_Boundary)
        return Frame_Boundary_C;
    procedure Free(Struct: in out Frame_Boundary_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Multisampled_Render_To_Single_Sampled_Features;
         C_Struct: in Physical_Device_Multisampled_Render_To_Single_Sampled_Features_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Subpass_Resolve_Performance_Query;
         C_Struct: in Subpass_Resolve_Performance_Query_C);

    function To_C
        (Struct: in Extensions.EXT.Multisampled_Render_To_Single_Sampled_Info)
        return Multisampled_Render_To_Single_Sampled_Info_C;
    procedure Free(Struct: in out Multisampled_Render_To_Single_Sampled_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Color_Write_Enable_Features;
         C_Struct: in Physical_Device_Color_Write_Enable_Features_C);

    function To_C(Struct: in Extensions.EXT.Pipeline_Color_Write_Create_Info)
        return Pipeline_Color_Write_Create_Info_C;
    procedure Free(Struct: in out Pipeline_Color_Write_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Primitives_Generated_Query_Features;
         C_Struct: in Physical_Device_Primitives_Generated_Query_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Image_View_Min_LOD_Features;
         C_Struct: in Physical_Device_Image_View_Min_LOD_Features_C);

    function To_C(Struct: in Extensions.EXT.Image_View_Min_LOD_Create_Info)
        return Image_View_Min_LOD_Create_Info_C;
    procedure Free(Struct: in out Image_View_Min_LOD_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Physical_Device_Multi_Draw_Features;
         C_Struct: in Physical_Device_Multi_Draw_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Multi_Draw_Properties;
         C_Struct: in Physical_Device_Multi_Draw_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Image_2D_View_Of_3D_Features;
         C_Struct: in Physical_Device_Image_2D_View_Of_3D_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Shader_Tile_Image_Features;
         C_Struct: in Physical_Device_Shader_Tile_Image_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Shader_Tile_Image_Properties;
         C_Struct: in Physical_Device_Shader_Tile_Image_Properties_C);

    function To_C(Struct: in Extensions.EXT.Micromap_Build_Info)
        return Micromap_Build_Info_C;
    procedure Free(Struct: in out Micromap_Build_Info_C);

    function To_C(Struct: in Extensions.EXT.Micromap_Create_Info)
        return Micromap_Create_Info_C;
    procedure Free(Struct: in out Micromap_Create_Info_C);

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.EXT.Physical_Device_Opacity_Micromap_Features;
         C_Struct: in Physical_Device_Opacity_Micromap_Features_C);

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.EXT.Physical_Device_Opacity_Micromap_Properties;
         C_Struct: in Physical_Device_Opacity_Micromap_Properties_C);

    function To_C(Struct: in Extensions.EXT.Micromap_Version_Info)
        return Micromap_Version_Info_C;
    procedure Free(Struct: in out Micromap_Version_Info_C);

    function To_C(Struct: in Extensions.EXT.Copy_Micromap_To_Memory_Info)
        return Copy_Micromap_To_Memory_Info_C;
    procedure Free(Struct: in out Copy_Micromap_To_Memory_Info_C);

    function To_C(Struct: in Extensions.EXT.Copy_Memory_To_Micromap_Info)
        return Copy_Memory_To_Micromap_Info_C;
    procedure Free(Struct: in out Copy_Memory_To_Micromap_Info_C);

    function To_C(Struct: in Extensions.EXT.Copy_Micromap_Info)
        return Copy_Micromap_Info_C;
    procedure Free(Struct: in out Copy_Micromap_Info_C);

    function To_C(Struct: in Extensions.EXT.Micromap_Build_Sizes_Info)
        return Micromap_Build_Sizes_Info_C;
    procedure Free(Struct: in out Micromap_Build_Sizes_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Acceleration_Structure_Triangles_Opacity_Micromap;
         C_Struct: in Acceleration_Structure_Triangles_Opacity_Micromap_C);

    function To_C(Struct: in Extensions.EXT.Metal_Surface_Create_Info)
        return Metal_Surface_Create_Info_C;
    procedure Free(Struct: in out Metal_Surface_Create_Info_C);

    -- Extension record conversion.
    function To_C(Next: in In_Structure_Access) return C.In_Structure_C_Access;
    function To_C(Next: in Out_Structure_Access)
        return C.Out_Structure_C_Access;
    procedure To_Ada(Ada_Struct: in out Vulkan.Out_Structure'Class;
                     Next: in C.Out_Structure_C_Access);
    procedure Free(Next: in out C.In_Structure_C_Access);
    procedure Free(Next: in out C.Out_Structure_C_Access);
end Vulkan.C_EXT;

