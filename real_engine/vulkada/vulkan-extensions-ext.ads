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

-- General extensions root package

with Vulkan.Extensions.KHR;
with Vulkan.Extensions.NV;
with Vulkan.Metal;

package Vulkan.Extensions.EXT is
    -- Handle types.
    type Debug_Utils_Messenger is new Object_Handle;
    type Validation_Cache is new Object_Handle;
    type Micromap is new Object_Handle;

    No_Debug_Utils_Messenger: constant Debug_Utils_Messenger :=
        Debug_Utils_Messenger(System.Null_Address);
    No_Validation_Cache: constant Validation_Cache :=
        Validation_Cache(System.Null_Address);
    No_Micromap: constant Micromap := Micromap(System.Null_Address);

    package Validation_Cache_Vectors is
        new Ada.Containers.Vectors(Positive, Validation_Cache);
    package Micromap_Vectors is
        new Ada.Containers.Vectors(Positive, Micromap);

    -- Enumerations. 
    type Display_Power_State is (Off,
                                 Suspend,
                                 On)
        with Convention => C;

    for Display_Power_State'Size use 32;

    for Display_Power_State use (Off => 0,
                                 Suspend => 1,
                                 On => 2);

    type Device_Event_Type is (Display_Hotplug)
        with Convention => C;

    for Device_Event_Type'Size use 32;

    for Device_Event_Type use (Display_Hotplug => 0);

    type Display_Event_Type is (First_Pixel_Out)
        with Convention => C;

    for Display_Event_Type'Size use 32;

    for Display_Event_Type use (First_Pixel_Out => 0);

    type Discard_Rectangle_Mode is (Inclusive,
                                    Exclusive)
        with Convention => C;

    for Discard_Rectangle_Mode'Size use 32;

    for Discard_Rectangle_Mode use (Inclusive => 0,
                                    Exclusive => 1);

    type Conservative_Rasterization_Mode is (Disabled,
                                             Overestimate,
                                             Underestimate)
        with Convention => C;

    for Conservative_Rasterization_Mode'Size use 32;

    for Conservative_Rasterization_Mode use (Disabled => 0,
                                             Overestimate => 1,
                                             Underestimate => 2);

    type Blend_Overlap is (Uncorrelated,
                           Disjoint,
                           Conjoint)
        with Convention => C;

    for Blend_Overlap'Size use 32;

    for Blend_Overlap use (Uncorrelated => 0,
                           Disjoint => 1,
                           Conjoint => 2);

    type Validation_Cache_Header_Version is (One)
        with Convention => C;

    for Validation_Cache_Header_Version'Size use 32;

    for Validation_Cache_Header_Version use (One => 1);

    type Provoking_Vertex_Mode is (First_Vertex,
                                   Last_Vertex)
        with Convention => C;

    for Provoking_Vertex_Mode'Size use 32;

    for Provoking_Vertex_Mode use (First_Vertex => 0,
                                   Last_Vertex => 1);

    type Depth_Bias_Representation is (Least_Representable_Value_Format,
                                       Least_Representable_Value_Force_Unorm,
                                       Representation_Float)
        with Convention => C;

    for Depth_Bias_Representation'Size use 32;

    for Depth_Bias_Representation use
        (Least_Representable_Value_Format => 0,
         Least_Representable_Value_Force_Unorm => 1,
         Representation_Float => 2);

    type Device_Memory_Report_Event_Type is (Allocate,
                                             Free,
                                             Import,
                                             Unimport,
                                             Allocation_Failed)
        with Convention => C;

    for Device_Memory_Report_Event_Type'Size use 32;

    for Device_Memory_Report_Event_Type use (Allocate => 0,
                                             Free => 1,
                                             Import => 2,
                                             Unimport => 3,
                                             Allocation_Failed => 4);

    type Device_Fault_Address_Type is (None,
                                       Read_Invalid,
                                       Write_Invalid,
                                       Execute_Invalid,
                                       Instruction_Pointer_Unknown,
                                       Instruction_Pointer_Invalid,
                                       Instruction_Pointer_Fault)
        with Convention => C;

    for Device_Fault_Address_Type'Size use 32;

    for Device_Fault_Address_Type use (None => 0,
                                       Read_Invalid => 1,
                                       Write_Invalid => 2,
                                       Execute_Invalid => 3,
                                       Instruction_Pointer_Unknown => 4,
                                       Instruction_Pointer_Invalid => 5,
                                       Instruction_Pointer_Fault => 6);

    type Device_Fault_Vendor_Binary_Header_Version is (One)
        with Convention => C;

    for Device_Fault_Vendor_Binary_Header_Version'Size use 32;

    for Device_Fault_Vendor_Binary_Header_Version use (One => 1);

    type Device_Address_Binding_Type is (Bind,
                                         Unbind)
        with Convention => C;

    for Device_Address_Binding_Type'Size use 32;

    for Device_Address_Binding_Type use (Bind => 0,
                                         Unbind => 1);

    type Micromap_Type is (Opacity,
                           Displacement)
        with Convention => C;

    for Micromap_Type'Size use 32;

    for Micromap_Type use (Opacity => 0,
                           Displacement => 1_000_397_000);

    type Build_Micromap_Mode is (Build)
        with Convention => C;

    for Build_Micromap_Mode'Size use 32;

    for Build_Micromap_Mode use (Build => 0);

    type Copy_Micromap_Mode is (Clone,
                                Serialize,
                                Deserialize,
                                Compact)
        with Convention => C;

    for Copy_Micromap_Mode'Size use 32;

    for Copy_Micromap_Mode use (Clone => 0,
                                Serialize => 1,
                                Deserialize => 2,
                                Compact => 3);

    type Opacity_Micromap_Format is (Format_2_State,
                                     Format_4_State)
        with Convention => C;

    for Opacity_Micromap_Format'Size use 32;

    for Opacity_Micromap_Format use (Format_2_State => 1,
                                     Format_4_State => 2);

    type Opacity_Micromap_Special_Index is
        (Cluster_Geometry_Disable_Opacity_Micromap,
         Fully_Unknown_Opaque,
         Fully_Unknown_Transparent,
         Fully_Opaque,
         Fully_Transparent)
        with Convention => C;

    for Opacity_Micromap_Special_Index'Size use 32;

    for Opacity_Micromap_Special_Index use
        (Cluster_Geometry_Disable_Opacity_Micromap => -5,
         Fully_Unknown_Opaque => -4,
         Fully_Unknown_Transparent => -3,
         Fully_Opaque => -2,
         Fully_Transparent => -1);

    -- Bitfields.
    type Pipeline_Rasterization_State_Stream_Create_Flags is new Flags;

    Pipeline_Rasterization_State_Stream_Create_No_Bit:
        constant Pipeline_Rasterization_State_Stream_Create_Flags := 0;

    type Conditional_Rendering_Flags is new Flags;

    Conditional_Rendering_No_Bit: constant Conditional_Rendering_Flags := 0;
    Conditional_Rendering_Inverted_Bit:
        constant Conditional_Rendering_Flags := 16#00000001#;

    type Surface_Counter_Flags is new Flags;

    Surface_Counter_No_Bit: constant Surface_Counter_Flags := 0;
    Surface_Counter_VBlank_Bit: constant Surface_Counter_Flags := 16#00000001#;

    type Pipeline_Discard_Rectangle_State_Create_Flags is new Flags;

    Pipeline_Discard_Rectangle_State_Create_No_Bit:
        constant Pipeline_Discard_Rectangle_State_Create_Flags := 0;

    type Pipeline_Rasterization_Conservative_State_Create_Flags is new Flags;

    Pipeline_Rasterization_Conservative_State_Create_No_Bit:
        constant Pipeline_Rasterization_Conservative_State_Create_Flags := 0;

    type Pipeline_Rasterization_Depth_Clip_State_Create_Flags is new Flags;

    Pipeline_Rasterization_Depth_Clip_State_Create_No_Bit:
        constant Pipeline_Rasterization_Depth_Clip_State_Create_Flags := 0;

    type Debug_Utils_Messenger_Callback_Data_Flags is new Flags;

    Debug_Utils_Messenger_Callback_Data_No_Bit:
        constant Debug_Utils_Messenger_Callback_Data_Flags := 0;

    type Debug_Utils_Message_Severity_Flags is new Flags;

    Debug_Utils_Message_Severity_No_Bit:
        constant Debug_Utils_Message_Severity_Flags := 0;
    Debug_Utils_Message_Severity_Verbose_Bit:
        constant Debug_Utils_Message_Severity_Flags := 16#00000001#;
    Debug_Utils_Message_Severity_Info_Bit:
        constant Debug_Utils_Message_Severity_Flags := 16#00000010#;
    Debug_Utils_Message_Severity_Warning_Bit:
        constant Debug_Utils_Message_Severity_Flags := 16#00000100#;
    Debug_Utils_Message_Severity_Error_Bit:
        constant Debug_Utils_Message_Severity_Flags := 16#00001000#;

    type Debug_Utils_Message_Type_Flags is new Flags;

    Debug_Utils_Message_Type_No_Bit:
        constant Debug_Utils_Message_Type_Flags := 0;
    Debug_Utils_Message_Type_General_Bit:
        constant Debug_Utils_Message_Type_Flags := 16#00000001#;
    Debug_Utils_Message_Type_Validation_Bit:
        constant Debug_Utils_Message_Type_Flags := 16#00000002#;
    Debug_Utils_Message_Type_Performance_Bit:
        constant Debug_Utils_Message_Type_Flags := 16#00000004#;

    type Debug_Utils_Messenger_Create_Flags is new Flags;

    Debug_Utils_Messenger_Create_No_Bit:
        constant Debug_Utils_Messenger_Create_Flags := 0;

    type Validation_Cache_Create_Flags is new Flags;

    Validation_Cache_Create_No_Bit: constant Validation_Cache_Create_Flags := 0;

    type Headless_Surface_Create_Flags is new Flags;

    Headless_Surface_Create_No_Bit: constant Headless_Surface_Create_Flags := 0;

    type Device_Memory_Report_Flags is new Flags;

    Device_Memory_Report_No_Bit: constant Device_Memory_Report_Flags := 0;

    type Graphics_Pipeline_Library_Flags is new Flags;

    Graphics_Pipeline_Library_No_Bit:
        constant Graphics_Pipeline_Library_Flags := 0;
    Graphics_Pipeline_Library_Vertex_Input_Interface_Bit:
        constant Graphics_Pipeline_Library_Flags := 16#00000001#;
    Graphics_Pipeline_Library_Pre_Rasterization_Shaders_Bit:
        constant Graphics_Pipeline_Library_Flags := 16#00000002#;
    Graphics_Pipeline_Library_Fragment_Shader_Bit:
        constant Graphics_Pipeline_Library_Flags := 16#00000004#;
    Graphics_Pipeline_Library_Fragment_Output_Interface_Bit:
        constant Graphics_Pipeline_Library_Flags := 16#00000008#;

    type Image_Compression_Flags is new Flags;

    Image_Compression_Default_Bit: constant Image_Compression_Flags := 0;
    Image_Compression_Fixed_Rate_Default_Bit:
        constant Image_Compression_Flags := 16#00000001#;
    Image_Compression_Fixed_Rate_Explicit_Bit:
        constant Image_Compression_Flags := 16#00000002#;
    Image_Compression_Disabled_Bit:
        constant Image_Compression_Flags := 16#00000004#;
    
    type Image_Compression_Fixed_Rate_Flags is new Flags;

    Image_Compression_Fixed_Rate_None_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 0;
    Image_Compression_Fixed_Rate_1BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00000001#;
    Image_Compression_Fixed_Rate_2BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00000002#;
    Image_Compression_Fixed_Rate_3BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00000004#;
    Image_Compression_Fixed_Rate_4BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00000008#;
    Image_Compression_Fixed_Rate_5BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00000010#;
    Image_Compression_Fixed_Rate_6BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00000020#;
    Image_Compression_Fixed_Rate_7BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00000040#;
    Image_Compression_Fixed_Rate_8BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00000080#;
    Image_Compression_Fixed_Rate_9BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00000100#;
    Image_Compression_Fixed_Rate_10BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00000200#;
    Image_Compression_Fixed_Rate_11BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00000400#;
    Image_Compression_Fixed_Rate_12BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00000800#;
    Image_Compression_Fixed_Rate_13BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00001000#;
    Image_Compression_Fixed_Rate_14BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00002000#;
    Image_Compression_Fixed_Rate_15BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00004000#;
    Image_Compression_Fixed_Rate_16BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00008000#;
    Image_Compression_Fixed_Rate_17BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00010000#;
    Image_Compression_Fixed_Rate_18BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00020000#;
    Image_Compression_Fixed_Rate_19BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00040000#;
    Image_Compression_Fixed_Rate_20BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00080000#;
    Image_Compression_Fixed_Rate_21BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00100000#;
    Image_Compression_Fixed_Rate_22BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00200000#;
    Image_Compression_Fixed_Rate_23BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00400000#;
    Image_Compression_Fixed_Rate_24BPC_Bit:
        constant Image_Compression_Fixed_Rate_Flags := 16#00800000#;

    type Device_Address_Binding_Flags is new Flags;

    Device_Address_Binding_No_Bit: constant Device_Address_Binding_Flags := 0;
    Device_Address_Binding_Internal_Object_Bit:
        constant Device_Address_Binding_Flags := 16#00000001#;

    type Frame_Boundary_Flags is new Flags;

    Frame_Boundary_No_Bit: constant Frame_Boundary_Flags := 0;
    Frame_Boundary_Frame_End_Bit: constant Frame_Boundary_Flags := 16#00000001#;

    type Build_Micromap_Flags is new Flags;

    Build_Micromap_No_Bit: constant Build_Micromap_Flags := 0;
    Build_Micromap_Prefer_Fast_Trace_Bit:
        constant Build_Micromap_Flags := 16#00000001#;
    Build_Micromap_Prefer_Fast_Build_Bit:
        constant Build_Micromap_Flags := 16#00000002#;
    Build_Micromap_Allow_Compaction_Bit:
        constant Build_Micromap_Flags := 16#00000004#;

    type Micromap_Create_Flags is new Flags;

    Micromap_Create_No_Bit: constant Micromap_Create_Flags := 0;
    Micromap_Create_Device_Address_Capture_Replay_Bit:
        constant Micromap_Create_Flags := 16#00000001#;

    type Metal_Surface_Create_Flags is new Flags;

    Metal_Surface_Create_No_Bit: constant Metal_Surface_Create_Flags := 0;

    -- Records.
    type Physical_Device_Transform_Feedback_Features is new Out_Structure
        (Physical_Device_Transform_Feedback_Features_Type) with
    record
        Transform_Feedback: Boolean;
        Geometry_Streams: Boolean;
    end record;

    type Physical_Device_Transform_Feedback_Properties is new Out_Structure
        (Physical_Device_Transform_Feedback_Properties_Type) with
    record
        Max_Transform_Feedback_Streams: Interfaces.Unsigned_32;
        Max_Transform_Feedback_Buffers: Interfaces.Unsigned_32;
        Max_Transform_Feedback_Buffer_Size: Device_Size;
        Max_Transform_Feedback_Stream_Data_Size: Interfaces.Unsigned_32;
        Max_Transform_Feedback_Buffer_Data_Size: Interfaces.Unsigned_32;
        Max_Transform_Feedback_Buffer_Data_Stride: Interfaces.Unsigned_32;
        Transform_Feedback_Queries: Boolean;
        Transform_Feedback_Streams_Lines_Triangles: Boolean;
        Transform_Feedback_Rasterization_Stream_Select: Boolean;
        Transform_Feedback_Draw: Boolean;
    end record;

    type Pipeline_Rasterization_State_Stream_Create_Info is new In_Structure
        (Pipeline_Rasterization_State_Stream_Create_Info_Type) with
    record
        Flags: Pipeline_Rasterization_State_Stream_Create_Flags :=
            Pipeline_Rasterization_State_Stream_Create_No_Bit;
            Rasterization_Stream: Interfaces.Unsigned_32;
    end record;

    type Image_View_ASTC_Decode_Mode is new In_Structure
        (Image_View_ASTC_Decode_Mode_Type) with
    record
        Decode_Mode: Format;
    end record;

    type Physical_Device_ASTC_Decode_Features is new Out_Structure
        (Physical_Device_ASTC_Decode_Features_Type) with
    record
        Decode_Mode_Shared_Exponent: Boolean;
    end record;
 
    type Conditional_Rendering_Begin_Info is new In_Structure
        (Conditional_Rendering_Begin_Info_Type) with
    record
        Buffer: Vulkan.Buffer;
        Offset: Device_Size;
        Flags: Conditional_Rendering_Flags := Conditional_Rendering_No_Bit;
    end record;
    
    type Physical_Device_Conditional_Rendering_Features is new Out_Structure
        (Physical_Device_Conditional_Rendering_Features_Type) with
    record
        Conditional_Rendering: Boolean;
        Inherited_Conditional_Rendering: Boolean;
    end record;

    type Command_Buffer_Inheritance_Conditional_Rendering_Info is
        new In_Structure
            (Command_Buffer_Inheritance_Conditional_Rendering_Info_Type) with
    record
        Conditional_Rendering_Enable: Boolean;
    end record;

    type Surface_Capabilities_2 is new Out_Structure
        (Surface_Capabilities_2_EXT_Type) with
    record
        Min_Image_Count: Interfaces.Unsigned_32;
        Max_Image_Count: Interfaces.Unsigned_32;
        Current_Extent: Extent_2D;
        Min_Image_Extent: Extent_2D;
        Max_Image_Extent: Extent_2D;
        Max_Image_Array_Layers: Interfaces.Unsigned_32;
        Supported_Transforms: KHR.Surface_Transform_Flags :=
            KHR.Surface_Transform_No_Bit;
        Current_Transform: KHR.Surface_Transform_Flags :=
            KHR.Surface_Transform_No_Bit;
        Supported_Composite_Alpha: KHR.Composite_Alpha_Flags :=
            KHR.Composite_Alpha_No_Bit;
        Supported_Usage_Flags: Image_Usage_Flags := Image_Usage_No_Bit;
        Supported_Surface_Counters: Surface_Counter_Flags :=
            Surface_Counter_No_Bit;
    end record;

    type Display_Power_Info is new In_Structure(Display_Power_Info_Type) with
    record
        Power_State: Display_Power_State;
    end record;

    type Device_Event_Info is new In_Structure(Device_Event_Info_Type) with
    record
        Device_Event: Device_Event_Type;
    end record;

    type Display_Event_Info is new In_Structure(Display_Event_Info_Type) with
    record
        Display_Event: Display_Event_Type;
    end record;

    type Swapchain_Counter_Create_Info is new In_Structure
        (Swapchain_Counter_Create_Info_Type) with
    record
        Surface_Counters: Surface_Counter_Flags := Surface_Counter_No_Bit;
    end record;

    type Physical_Device_Discard_Rectangle_Properties is new Out_Structure
        (Physical_Device_Discard_Rectangle_Properties_Type) with
    record
        Max_Discard_Rectangles: Interfaces.Unsigned_32;
    end record;

    type Pipeline_Discard_Rectangle_State_Create_Info is new In_Structure
        (Pipeline_Discard_Rectangle_State_Create_Info_Type) with
    record
        Flags: Pipeline_Discard_Rectangle_State_Create_Flags :=
            Pipeline_Discard_Rectangle_State_Create_No_Bit;
        Discard_Rectangle_Mode: EXT.Discard_Rectangle_Mode;
        Discard_Rectangles: Rect_2D_Vectors.Vector;
    end record;

    type Physical_Device_Conservative_Rasterization_Properties is
        new Out_Structure
            (Physical_Device_Conservative_Rasterization_Properties_Type) with
    record
        Primitive_Overestimation_Size: Float;
        Max_Extra_Primitive_Overestimation_Size: Float;
        Extra_Primitive_Overestimation_Size_Granularity: Float;
        Primitive_Underestimation: Boolean;
        Conservative_Point_And_Line_Rasterization: Boolean;
        Degenerate_Triangles_Rasterized: Boolean;
        Degenerate_Lines_Rasterized: Boolean;
        Fully_Covered_Fragment_Shader_Input_Variable: Boolean;
        Conservative_Rasterization_Post_Depth_Coverage: Boolean;
    end record;

    type Pipeline_Rasterization_Conservative_State_Create_Info is
        new In_Structure
            (Pipeline_Rasterization_Conservative_State_Create_Info_Type) with
    record
        Flags: Pipeline_Rasterization_Conservative_State_Create_Flags :=
            Pipeline_Rasterization_Conservative_State_Create_No_Bit;
        Conservative_Rasterization_Mode: EXT.Conservative_Rasterization_Mode;
        Extra_Primitive_Overestimation_Size: Float;
    end record;

    type Physical_Device_Depth_Clip_Enable_Features is new Out_Structure
        (Physical_Device_Depth_Clip_Enable_Features_Type) with
    record
        Depth_Clip_Enable: Boolean;
    end record;

    type Pipeline_Rasterization_Depth_Clip_State_Create_Info is new In_Structure
        (Pipeline_Rasterization_Depth_Clip_State_Create_Info_Type) with
    record
        Flags: Pipeline_Rasterization_Depth_Clip_State_Create_Flags :=
            Pipeline_Rasterization_Depth_Clip_State_Create_No_Bit;
        Depth_Clip_Enable: Boolean;
    end record;

    type XY_Color is
    record
        X: Interfaces.C.C_float;
        Y: Interfaces.C.C_float;
    end record
        with Convention => C;

    type HDR_Metadata is new In_Structure(HDR_Metadata_Type) with
    record
        Display_Primary_Red: XY_Color;
        Display_Primary_Green: XY_Color;
        Display_Primary_Blue: XY_Color;
        White_Point: XY_Color;
        Max_Luminance: Float;
        Min_Luminance: Float;
        Max_Content_Light_Level: Float;
        Max_Frame_Average_Light_Level: Float;
    end record;

    package HDR_Metadata_Vectors is new Ada.Containers.Vectors(Positive,
                                                               HDR_Metadata);

    type Debug_Color is array (1 .. 4) of aliased Interfaces.C.C_float
        with Convention => C; 

    type Debug_Utils_Label is new In_Structure(Debug_Utils_Label_Type) with
    record
        Label_Name: Ada.Strings.Unbounded.Unbounded_String;
        Color: Debug_Color;
    end record;

    type Debug_Utils_Object_Name_Info is
        new In_Structure(Debug_Utils_Object_Name_Info_Type) with
    record
        Object_Type: Vulkan.Object_Type;
        Object_Handle: Vulkan.Object_Handle;
        Object_Name: Ada.Strings.Unbounded.Unbounded_String;
    end record;

    package Debug_Utils_Label_Vectors is
        new Ada.Containers.Vectors(Positive, Debug_Utils_Label);

    package Debug_Utils_Object_Name_Info_Vectors is
        new Ada.Containers.Vectors(Positive, Debug_Utils_Object_Name_Info);

    type Debug_Utils_Messenger_Callback_Data is
        new In_Structure(Debug_Utils_Messenger_Callback_Data_Type) with
    record
        Flags: Debug_Utils_Messenger_Callback_Data_Flags :=
            Debug_Utils_Messenger_Callback_Data_No_Bit;
        Message_ID_Name: Ada.Strings.Unbounded.Unbounded_String;
        Message_ID_Number: Interfaces.Integer_32;
        Message: Ada.Strings.Unbounded.Unbounded_String;
        Queue_Labels: Debug_Utils_Label_Vectors.Vector;
        Cmd_Buf_Labels: Debug_Utils_Label_Vectors.Vector;
        Objects: Debug_Utils_Object_Name_Info_Vectors.Vector;
    end record;

    type Debug_Messenger_Callback is access function
        (Message_Severity: in Debug_Utils_Message_Severity_Flags;
         Message_Types: in Debug_Utils_Message_Type_Flags;
         Callback_Data: in Debug_Utils_Messenger_Callback_Data;
         User_Data: in Interfaces.C.Extensions.void_ptr) return Boolean;

    type Debug_Utils_Messenger_Create_Info is
        new In_Structure(Debug_Utils_Messenger_Create_Info_Type) with
    record
        Flags: Debug_Utils_Messenger_Create_Flags :=
            Debug_Utils_Messenger_Create_No_Bit;
        Message_Severity: Debug_Utils_Message_Severity_Flags :=
            Debug_Utils_Message_Severity_No_Bit;
        Message_Type: Debug_Utils_Message_Type_Flags :=
            Debug_Utils_Message_Type_No_Bit;
        User_Callback: Debug_Messenger_Callback;
        User_Data: Interfaces.C.Extensions.void_ptr := System.Null_Address;
    end record;

    type Debug_Utils_Object_Tag_Info is
        new In_Structure(Debug_Utils_Object_Tag_Info_Type) with
    record
        Object_Type: Vulkan.Object_Type;
        Object_Handle: Vulkan.Object_Handle;
        Tag_Name: Interfaces.Unsigned_64;
        Tag_Size: Interfaces.C.size_t;
        Tag: Interfaces.C.Extensions.void_ptr;
    end record;

    type Sample_Location is
    record
        X: Interfaces.C.C_float;
        Y: Interfaces.C.C_float;
    end record
        with Convention => C;

    package Sample_Location_Vectors is
        new Ada.Containers.Vectors(Positive, Sample_Location);

    type Sample_Locations_Info is
        new In_Structure(Sample_Locations_Info_Type) with
    record
        Sample_Locations_Per_Pixel: Sample_Count_Flags := Sample_Count_No_Bit;
        Sample_Location_Grid_Size: Extent_2D;
        Sample_Locations: Sample_Location_Vectors.Vector;
    end record;

    type Attachment_Sample_Locations is
    record
        Attachment_Index: Interfaces.Unsigned_32;
        Sample_Locations_Info: EXT.Sample_Locations_Info;
    end record;

    package Attachment_Sample_Locations_Vectors is
        new Ada.Containers.Vectors(Positive, Attachment_Sample_Locations);

    type Subpass_Sample_Locations is
    record
        Subpass_Index: Interfaces.Unsigned_32;
        Sample_Locations_Info: EXT.Sample_Locations_Info;
    end record;

    package Subpass_Sample_Locations_Vectors is
        new Ada.Containers.Vectors(Positive, Subpass_Sample_Locations);

    type Render_Pass_Sample_Locations_Begin_Info is new In_Structure
        (Render_Pass_Sample_Locations_Begin_Info_Type) with
    record
        Attachment_Initial_Sample_Locations:
            Attachment_Sample_Locations_Vectors.Vector;
        Post_Subpass_Sample_Locations: Subpass_Sample_Locations_Vectors.Vector;
    end record;

    type Pipeline_Sample_Locations_State_Create_Info is new In_Structure
        (Pipeline_Sample_Locations_State_Create_Info_Type) with
    record
        Sample_Locations_Enable: Boolean;
        Sample_Locations_Info: EXT.Sample_Locations_Info;
    end record;

    type Sample_Location_Coordinate_Range_Array is
        array (1 .. 2) of Interfaces.C.C_float
        with Convention => C;

    type Physical_Device_Sample_Locations_Properties is new Out_Structure
        (Physical_Device_Sample_Locations_Properties_Type) with
    record
        Sample_Location_Sample_Counts: Sample_Count_Flags :=
            Sample_Count_No_Bit;
        Max_Sample_Location_Grid_Size: Extent_2D;
        Sample_Location_Coordinate_Range:
            Sample_Location_Coordinate_Range_Array;
        Sample_Location_Sub_Pixel_Bits: Interfaces.Unsigned_32;
        Variable_Sample_Locations: Boolean;
    end record;

    type Multisample_Properties is
        new Out_Structure(Multisample_Properties_Type) with
    record
        Max_Sample_Location_Grid_Size: Extent_2D;
    end record;

    type Physical_Device_Blend_Operation_Advanced_Features is new Out_Structure
        (Physical_Device_Blend_Operation_Advanced_Features_Type) with
    record
        Advanced_Blend_Coherent_Operations: Boolean;
    end record;

    type Physical_Device_Blend_Operation_Advanced_Properties is
        new Out_Structure
            (Physical_Device_Blend_Operation_Advanced_Properties_Type) with
    record
        Advanced_Blend_Max_Color_Attachments: Interfaces.Unsigned_32;
        Advanced_Blend_Independent_Blend: Boolean;
        Advanced_Blend_Non_Premultiplied_Src_Color: Boolean;
        Advanced_Blend_Non_Premultiplied_Dst_Color: Boolean;
        Advanced_Blend_Correlated_Overlap: Boolean;
        Advanced_Blend_All_Operations: Boolean;
    end record;

    type Pipeline_Color_Blend_Advanced_State_Create_Info is new In_Structure
        (Pipeline_Color_Blend_Advanced_State_Create_Info_Type) with
    record
        Src_Premultiplied: Boolean;
        Dst_Premultiplied: Boolean;
        Blend_Overlap: EXT.Blend_Overlap;
    end record;

    type DRM_Format_Modifier_Properties is
    record
        DRM_Format_Modifier: Interfaces.Unsigned_64;
        DRM_Format_Modifier_Plane_Count: Interfaces.Unsigned_32;
        DRM_Format_Modifier_Tiling_Features: Format_Feature_Flags :=
            Format_Feature_No_Bit;
    end record
        with Convention => C;

    package DRM_Format_Modifier_Properties_Vectors is
        new Ada.Containers.Vectors(Positive, DRM_Format_Modifier_Properties);

    -- If passed with DRM_Format_Modifier_Count set to 0, will return with the
    -- number of modifier properties.
    type DRM_Format_Modifier_Properties_List is new Out_Structure
        (DRM_Format_Modifier_Properties_List_Type) with
    record
        DRM_Format_Modifier_Count: Interfaces.Unsigned_32;
        DRM_Format_Modifier_Properties:
            DRM_Format_Modifier_Properties_Vectors.Vector;
    end record;

    type Physical_Device_Image_DRM_Format_Modifier_Info is new In_Structure
        (Physical_Device_Image_DRM_Format_Modifier_Info_Type) with
    record
        DRM_Format_Modifier: Interfaces.Unsigned_64;
        Sharing_Mode: Vulkan.Sharing_Mode;
        Queue_Family_Indices: Queue_Family_Index_Vectors.Vector;
    end record;

    type Image_DRM_Format_Modifier_List_Create_Info is new In_Structure
        (Image_DRM_Format_Modifier_List_Create_Info_Type) with
    record
        DRM_Format_Modifiers: Unsigned_64_Vectors.Vector;
    end record;

    type Image_DRM_Format_Modifier_Explicit_Create_Info is new In_Structure
        (Image_DRM_Format_Modifier_Explicit_Create_Info_Type) with
    record
        DRM_Format_Modifier: Interfaces.Unsigned_64;
        Plane_Layouts: Subresource_Layout_Vectors.Vector;
    end record;

    type Image_DRM_Format_Modifier_Properties is new Out_Structure
        (Image_DRM_Format_Modifier_Properties_Type) with
    record
        DRM_Format_Modifier: Interfaces.Unsigned_64;
    end record;

    type DRM_Format_Modifier_Properties_2 is
    record
        DRM_Format_Modifier: Interfaces.Unsigned_64;
        DRM_Format_Modifier_Plane_Count: Interfaces.Unsigned_32;
        DRM_Format_Modifier_Tiling_Features: Format_Feature_Flags_2 :=
            Format_Feature_2_No_Bit;
    end record
        with Convention => C;

    package DRM_Format_Modifier_Properties_2_Vectors is
        new Ada.Containers.Vectors(Positive, DRM_Format_Modifier_Properties_2);

    -- If passed with DRM_Format_Modifier_Count set to 0, will return with the
    -- number of modifier properties.
    type DRM_Format_Modifier_Properties_List_2 is new Out_Structure
        (DRM_Format_Modifier_Properties_List_2_Type) with
    record
        DRM_Format_Modifier_Count: Interfaces.Unsigned_32;
        DRM_Format_Modifier_Properties:
            DRM_Format_Modifier_Properties_2_Vectors.Vector;
    end record;

    type Validation_Cache_Create_Info is new In_Structure
        (Validation_Cache_Create_Info_Type) with
    record
        Flags: Validation_Cache_Create_Flags := Validation_Cache_Create_No_Bit;
        Initial_Data_Size: Interfaces.C.size_t;
        Initial_Data: Interfaces.C.Extensions.void_ptr;
    end record;

    type Shader_Module_Validation_Cache_Create_Info is new In_Structure
        (Shader_Module_Validation_Cache_Create_Info_Type) with
    record
        Validation_Cache: EXT.Validation_Cache;
    end record;

    type Physical_Device_Image_View_Image_Format_Info is new Out_Structure
        (Physical_Device_Image_View_Image_Format_Info_Type) with
    record
        Image_View_Type: Vulkan.Image_View_Type;
    end record;

    type Filter_Cubic_Image_View_Image_Format_Properties is new Out_Structure
        (Filter_Cubic_Image_View_Image_Format_Properties_Type) with
    record
        Filter_Cubic: Boolean;
        Filter_Cubic_Minmax: Boolean;
    end record;

    type Import_Memory_Host_Pointer_Info is new In_Structure
        (Import_Memory_Host_Pointer_Info_Type) with
    record
        Handle_Type: External_Memory_Handle_Type_Flags :=
            External_Memory_Handle_Type_No_Bit;
        Host_Pointer: Interfaces.C.Extensions.void_ptr;
    end record;

    type Memory_Host_Pointer_Properties is new Out_Structure
        (Memory_Host_Pointer_Properties_Type) with
    record
        Memory_Type_Bits: Interfaces.Unsigned_32;
    end record;

    type Physical_Device_External_Memory_Host_Properties is new Out_Structure
        (Physical_Device_External_Memory_Host_Properties_Type) with
    record
        Min_Imported_Host_Pointer_Alignment: Device_Size;
    end record;

    type Physical_Device_PCI_Bus_Info_Properties is new Out_Structure
        (Physical_Device_PCI_Bus_Info_Properties_Type) with
    record
        PCI_Domain: Interfaces.Unsigned_32;
        PCI_Bus: Interfaces.Unsigned_32;
        PCI_Device: Interfaces.Unsigned_32;
        PCI_Function: Interfaces.Unsigned_32;
    end record;

    type Physical_Device_Fragment_Density_Map_Features is new Out_Structure
        (Physical_Device_Fragment_Density_Map_Features_Type) with
    record
        Fragment_Density_Map: Boolean;
        Fragment_Density_Map_Dynamic: Boolean;
        Fragment_Density_Map_Non_Subsampled_Images: Boolean;
    end record;

    type Physical_Device_Fragment_Density_Map_Properties is new Out_Structure
        (Physical_Device_Fragment_Density_Map_Properties_Type) with
    record
        Min_Fragment_Density_Texel_Size: Extent_2D;
        Max_Fragment_Density_Texel_Size: Extent_2D;
        Fragment_Density_Invocations: Boolean;
    end record;

    type Render_Pass_Fragment_Density_Map_Create_Info is new In_Structure
        (Render_Pass_Fragment_Density_Map_Create_Info_Type) with
    record
        Fragment_Density_Map_Attachment: Attachment_Reference;
    end record;

    type Rendering_Fragment_Density_Map_Attachment_Info is new In_Structure
        (Rendering_Fragment_Density_Map_Attachment_Info_Type) with
    record
        Image_View: Vulkan.Image_View;
        Image_Layout: Vulkan.Image_Layout;
    end record;

    type Physical_Device_Shader_Image_Atomic_Int64_Features is new Out_Structure
        (Physical_Device_Shader_Image_Atomic_Int64_Features_Type) with
    record
        Shader_Image_Int64_Atomics: Boolean;
        Sparse_Image_Int64_Atomics: Boolean;
    end record;

    type Budget_Size_Array is array (1 .. Max_Memory_Heaps) of Device_Size
        with Convention => C;

    type Physical_Device_Memory_Budget_Properties is new Out_Structure
        (Physical_Device_Memory_Budget_Properties_Type) with
    record
        Heap_Budget: Budget_Size_Array;
        Heap_Usage: Budget_Size_Array;
    end record;

    type Physical_Device_Memory_Priority_Features is new Out_Structure
        (Physical_Device_Memory_Priority_Features_Type) with
    record
        Memory_Priority: Boolean;
    end record;

    type Memory_Priority_Allocate_Info is new In_Structure
        (Memory_Priority_Allocate_Info_Type) with
    record
        Priority: Interfaces.C.C_float;
    end record;

    type Physical_Device_Fragment_Shader_Interlock_Features is new Out_Structure
        (Physical_Device_Fragment_Shader_Interlock_Features_Type) with
    record
        Fragment_Shader_Sample_Interlock: Boolean;
        Fragment_Shader_Pixel_Interlock: Boolean;
        Fragment_Shader_Shading_Rate_Interlock: Boolean;
    end record;

    type Physical_Device_YCbCr_Image_Arrays_Features is new Out_Structure
        (Physical_Device_YCbCr_Image_Arrays_Features_Type) with
    record
        YCbCr_Image_Arrays: Boolean;
    end record;

    type Physical_Device_Provoking_Vertex_Features is new Out_Structure
        (Physical_Device_Provoking_Vertex_Features_Type) with
    record
        Provoking_Vertex_Last: Boolean;
        Transform_Feedback_Preserves_Provoking_Vertex: Boolean;
    end record;

    type Physical_Device_Provoking_Vertex_Properties is new Out_Structure
        (Physical_Device_Provoking_Vertex_Properties_Type) with
    record
        Provoking_Vertex_Mode_Per_Pipeline: Boolean;
        Transform_Feedback_Preserves_Triangle_Fan_Provoking_Vertex: Boolean;
    end record;

    type Pipeline_Rasterization_Provoking_Vertex_State_Create_Info is
        new In_Structure
            (Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_Type)
                with
    record
        Provoking_Vertex_Mode: EXT.Provoking_Vertex_Mode;
    end record;

    type Headless_Surface_Create_Info is new In_Structure
        (Headless_Surface_Create_Info_Type) with
    record
        Flags: Headless_Surface_Create_Flags := Headless_Surface_Create_No_Bit;
    end record;

    type Physical_Device_Shader_Atomic_Float_Features is new Out_Structure
        (Physical_Device_Shader_Atomic_Float_Features_Type) with
    record
        Shader_Buffer_Float_32_Atomics: Boolean;
        Shader_Buffer_Float_32_Atomic_Add: Boolean;
        Shader_Buffer_Float_64_Atomics: Boolean;
        Shader_Buffer_Float_64_Atomic_Add: Boolean;
        Shader_Shared_Float_32_Atomics: Boolean;
        Shader_Shared_Float_32_Atomic_Add: Boolean;
        Shader_Shared_Float_64_Atomics: Boolean;
        Shader_Shared_Float_64_Atomic_Add: Boolean;
        Sparse_Image_Float_32_Atomics: Boolean;
        Sparse_Image_Float_32_Atomic_Add: Boolean;
        Sparse_Image_Float_64_Atomics: Boolean;
        Sparse_Image_Float_64_Atomic_Add: Boolean;
    end record;

    type Physical_Device_Map_Memory_Placed_Features is new Out_Structure
        (Physical_Device_Map_Memory_Placed_Features_Type) with
    record
        Memory_Map_Placed: Boolean;
        Memory_Map_Range_Placed: Boolean;
        Memory_Unmap_Reserve: Boolean;
    end record;

    type Physical_Device_Map_Memory_Placed_Properties is new Out_Structure
        (Physical_Device_Map_Memory_Placed_Properties_Type) with
    record
        Min_Placed_Memory_Map_Alignment: Device_Size;
    end record;

    type Memory_Map_Placed_Info is
        new In_Structure(Memory_Map_Placed_Info_Type) with
    record
        Placed_Address: Interfaces.C.Extensions.void_ptr;
    end record;

    type Physical_Device_Shader_Atomic_Float_2_Features is new Out_Structure
        (Physical_Device_Shader_Atomic_Float_2_Features_Type) with
    record
        Shader_Buffer_Float_16_Atomics: Boolean;
        Shader_Buffer_Float_16_Atomic_Add: Boolean;
        Shader_Buffer_Float_16_Atomic_Min_Max: Boolean;
        Shader_Buffer_Float_32_Atomic_Min_Max: Boolean;
        Shader_Buffer_Float_64_Atomic_Min_Max: Boolean;
        Shader_Shared_Float_16_Atomics: Boolean;
        Shader_Shared_Float_16_Atomic_Add: Boolean;
        Shader_Shared_Float_16_Atomic_Min_Max: Boolean;
        Shader_Shared_Float_32_Atomic_Min_Max: Boolean;
        Shader_Shared_Float_64_Atomic_Min_Max: Boolean;
        Shader_Image_Float_32_Atomic_Min_Max: Boolean;
        Sparse_Image_Float_32_Atomic_Min_Max: Boolean;
    end record;

    type Physical_Device_Depth_Bias_Control_Features is new Out_Structure
        (Physical_Device_Depth_Bias_Control_Features_Type) with
    record
        Depth_Bias_Control: Boolean;
        Least_Representable_Value_Force_Unorm_Representation: Boolean;
        Float_Representation: Boolean;
        Depth_Bias_Exact: Boolean;
    end record;

    type Depth_Bias_Info is new In_Structure(Depth_Bias_Info_Type) with
    record
        Depth_Bias_Constant_Factor: Interfaces.C.C_float;
        Depth_Bias_Clamp: Interfaces.C.C_float;
        Depth_Bias_Slope_Factor: Interfaces.C.C_float;
    end record;

    type Depth_Bias_Representation_Info is new In_Structure
        (Depth_Bias_Representation_Info_Type) with
    record
        Depth_Bias_Representation: EXT.Depth_Bias_Representation;
        Depth_Bias_Exact: Boolean;
    end record;

    type Physical_Device_Device_Memory_Report_Features is new Out_Structure
        (Physical_Device_Device_Memory_Report_Features_Type) with
    record
        Device_Memory_Report: Boolean;
    end record;

    type Device_Memory_Report_Callback_Data is new Out_Structure
        (Device_Memory_Report_Callback_Data_Type) with
    record
        Flags: Device_Memory_Report_Flags := Device_Memory_Report_No_Bit;
        Event_Type: Device_Memory_Report_Event_Type;
        Memory_Object_ID: Interfaces.Unsigned_64;
        Size: Device_Size;
        Object_Type: Vulkan.Object_Type;
        Object_Handle: Vulkan.Object_Handle;
        Heap_Index: Interfaces.Unsigned_32;
    end record;

    type Device_Memory_Report_Callback is
        access procedure(Callback_Data: in Device_Memory_Report_Callback_Data;
                         User_Data: in Interfaces.C.Extensions.void_ptr);

    type Device_Device_Memory_Report_Create_Info is new In_Structure
        (Device_Device_Memory_Report_Create_Info_Type) with
    record
        Flags: Device_Memory_Report_Flags := Device_Memory_Report_No_Bit;
        User_Callback: Device_Memory_Report_Callback;
        User_Data: Interfaces.C.Extensions.void_ptr;
    end record;

    type Sampler_Custom_Border_Color_Create_Info(Color_Type: Clear_Color_Type)
        is new In_Structure(Sampler_Custom_Border_Color_Create_Info_Type) with
    record
        Custom_Border_Color: Clear_Color_Value(Color_Type);
        Format: Vulkan.Format;
    end record;

    type Physical_Device_Custom_Border_Color_Properties is new Out_Structure
        (Physical_Device_Custom_Border_Color_Properties_Type) with
    record
        Max_Custom_Border_Color_Samplers: Interfaces.Unsigned_32;
    end record;

    type Physical_Device_Custom_Border_Color_Features is new Out_Structure
        (Physical_Device_Custom_Border_Color_Features_Type) with
    record
        Custom_Border_Colors: Boolean;
        Custom_Border_Color_Without_Format: Boolean;
    end record;

    type Physical_Device_Descriptor_Buffer_Properties is new Out_Structure
        (Physical_Device_Descriptor_Buffer_Properties_Type) with
    record
        Combined_Image_Sampler_Descriptor_Single_Array: Boolean;
        Bufferless_Push_Descriptors: Boolean;
        Allow_Sampler_Image_View_Post_Submit_Creation: Boolean;
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
    end record;

    type Physical_Device_Descriptor_Buffer_Density_Map_Properties is
        new Out_Structure(
            Physical_Device_Descriptor_Buffer_Density_Map_Properties_Type) with
    record
        Combined_Image_Sampler_Density_Map_Descriptor_Size: Interfaces.C.size_t;
    end record;

    type Physical_Device_Descriptor_Buffer_Features is new Out_Structure
        (Physical_Device_Descriptor_Buffer_Features_Type) with
    record
        Descriptor_Buffer: Boolean;
        Descriptor_Buffer_Capture_Replay: Boolean;
        Descriptor_Buffer_Image_Layout_Ignored: Boolean;
        Descriptor_Buffer_Push_Descriptors: Boolean;
    end record;

    type Descriptor_Address_Info is new Out_Structure
        (Descriptor_Address_Info_Type) with
    record
        Address: Device_Address;
        Address_Range: Device_Size;
        Format: Vulkan.Format;
    end record;

    type Descriptor_Address_Info_Access is
        access constant Descriptor_Address_Info
        with Storage_Size => 0;

    type Descriptor_Buffer_Binding_Info is new In_Structure
        (Descriptor_Buffer_Binding_Info_Type) with
    record
        Address: Device_Address;
        Usage: Buffer_Usage_Flags := Buffer_Usage_No_Bit;
    end record;

    package Descriptor_Buffer_Binding_Info_Vectors is
        new Ada.Containers.Vectors(Positive, Descriptor_Buffer_Binding_Info);

    type Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle is
        new In_Structure
            (Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_Type) with
    record
        Buffer: Vulkan.Buffer;
    end record;

    subtype Descriptor_Data_Type is Descriptor_Type
        with Static_Predicate =>
            Descriptor_Data_Type in Type_Sampler |
                                    Combined_Image_Sampler |
                                    Input_Attachment |
                                    Sampled_Image |
                                    Storage_Image |
                                    Uniform_Texel_Buffer |
                                    Storage_Texel_Buffer |
                                    Uniform_Buffer |
                                    Storage_Buffer |
                                    Acceleration_Structure_KHR;

    type Descriptor_Get_Info(Descriptor_Type: Descriptor_Data_Type) is
        new In_Structure(Descriptor_Get_Info_Type) with
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
                Uniform_Texel_Buffer: Descriptor_Address_Info_Access;
            when Storage_Texel_Buffer =>
                Storage_Texel_Buffer: Descriptor_Address_Info_Access;
            when Uniform_Buffer =>
                Uniform_Buffer: Descriptor_Address_Info_Access;
            when Storage_Buffer =>
                Storage_Buffer: Descriptor_Address_Info_Access;
            when Acceleration_Structure_KHR =>
                Acceleration_Structure: Device_Address;
        end case;
    end record;

    type Buffer_Capture_Descriptor_Data_Info is new In_Structure
        (Buffer_Capture_Descriptor_Data_Info_Type) with
    record
        Buffer: Vulkan.Buffer;
    end record;

    type Image_Capture_Descriptor_Data_Info is new In_Structure
        (Image_Capture_Descriptor_Data_Info_Type) with
    record
        Image: Vulkan.Image;
    end record;

    type Image_View_Capture_Descriptor_Data_Info is new In_Structure
        (Image_View_Capture_Descriptor_Data_Info_Type) with
    record
        Image_View: Vulkan.Image_View;
    end record;

    type Sampler_Capture_Descriptor_Data_Info is new In_Structure
        (Sampler_Capture_Descriptor_Data_Info_Type) with
    record
        Sampler: Vulkan.Sampler;
    end record;

    type Opaque_Capture_Descriptor_Data_Create_Info is new In_Structure
        (Opaque_Capture_Descriptor_Data_Create_Info_Type) with
    record
        Opaque_Capture_Descriptor_Data: Interfaces.C.Extensions.void_ptr;
    end record;

    type Acceleration_Structure_Capture_Descriptor_Data_Info is new In_Structure
        (Acceleration_Structure_Capture_Descriptor_Data_Info_Type) with
    record
        Acceleration_Structure: KHR.Acceleration_Structure;
        Acceleration_Structure_NV: NV.Acceleration_Structure;
    end record;

    type Physical_Device_Graphics_Pipeline_Library_Features is new Out_Structure
        (Physical_Device_Graphics_Pipeline_Library_Features_Type) with
    record
        Graphics_Pipeline_Library: Boolean;
    end record;

    type Physical_Device_Graphics_Pipeline_Library_Properties is
        new Out_Structure
            (Physical_Device_Graphics_Pipeline_Library_Properties_Type) with
    record
        Graphics_Pipeline_Library_Fast_Linking: Boolean;
        Graphics_Pipeline_Library_Independent_Interpolation_Decoration: Boolean;
    end record;

    type Graphics_Pipeline_Library_Create_Info is new In_Structure
        (Graphics_Pipeline_Library_Create_Info_Type) with
    record
        Flags: Graphics_Pipeline_Library_Flags :=
            Graphics_Pipeline_Library_No_Bit;
    end record;

    type Physical_Device_Fragment_Density_Map_2_Features is new Out_Structure
        (Physical_Device_Fragment_Density_Map_2_Features_Type) with
    record
        Fragment_Density_Map_Deferred: Boolean;
    end record;

    type Physical_Device_Fragment_Density_Map_2_Properties is new Out_Structure
        (Physical_Device_Fragment_Density_Map_2_Properties_Type) with
    record
        Subsampled_Loads: Boolean;
        Subsampled_Coarse_Reconstruction_Early_Access: Boolean;
        Max_Subsampled_Array_Layers: Interfaces.Unsigned_32;
        Max_Descriptor_Set_Subsampled_Samplers: Interfaces.Unsigned_32;
    end record;

    type Physical_Device_Image_Compression_Control_Features is new Out_Structure
        (Physical_Device_Image_Compression_Control_Features_Type) with
    record
        Image_Compression_Control: Boolean;
    end record;

    package Image_Compression_Fixed_Rate_Flags_Vectors is
        new Ada.Containers.Vectors(Positive,
                                   Image_Compression_Fixed_Rate_Flags);

    type Image_Compression_Control is new In_Structure
        (Image_Compression_Control_Type) with
    record
        Flags: Image_Compression_Flags := Image_Compression_Default_Bit;
        Fixed_Rate_Flags: Image_Compression_Fixed_Rate_Flags_Vectors.Vector;
    end record;

    type Image_Compression_Properties is new Out_Structure
        (Image_Compression_Properties_Type) with
    record
        Image_Compression_Flags: EXT.Image_Compression_Flags :=
            Image_Compression_Default_Bit;
        Image_Compression_Fixed_Rate_Flags:
            EXT.Image_Compression_Fixed_Rate_Flags :=
                Image_Compression_Fixed_Rate_None_Bit;
    end record;

    type Physical_Device_Attachment_Feedback_Loop_Layout_Features is
        new Out_Structure
            (Physical_Device_Attachment_Feedback_Loop_Layout_Features_Type) with
    record
        Attachment_Feedback_Loop_Layout: Boolean;
    end record;

    type Physical_Device_Fault_Features is new Out_Structure
        (Physical_Device_Fault_Features_Type) with
    record
        Device_Fault: Boolean;
        Device_Fault_Vendor_Binary: Boolean;
    end record;

    type Device_Fault_Counts is new Out_Structure(Device_Fault_Counts_Type) with
    record
        Address_Info_Count: Interfaces.Unsigned_32;
        Vendor_Info_Count: Interfaces.Unsigned_32;
        Vendor_Binary_Size: Device_Size;
    end record;

    type Device_Fault_Address_Info is
    record
        Address_Type: Device_Fault_Address_Type;
        Reported_Address: Device_Address;
        Address_Precision: Device_Size;
    end record
        with Convention => C;

    package Device_Fault_Address_Info_Vectors is 
        new Ada.Containers.Vectors(Positive, Device_Fault_Address_Info);

    type Device_Fault_Vendor_Info is
    record
        Description: Ada.Strings.Unbounded.Unbounded_String;
        Vendor_Fault_Code: Interfaces.Unsigned_64;
        Vendor_Fault_Data: Interfaces.Unsigned_64;
    end record;

    package Device_Fault_Vendor_Info_Vectors is
        new Ada.Containers.Vectors(Positive, Device_Fault_Vendor_Info);

    type Device_Fault_Info is new Out_Structure(Device_Fault_Info_Type) with
    record
        Description: Ada.Strings.Unbounded.Unbounded_String;
        Address_Infos: Device_Fault_Address_Info_Vectors.Vector;
        Vendor_Infos: Device_Fault_Vendor_Info_Vectors.Vector;
        Vendor_Binary_Data: Interfaces.C.Extensions.void_ptr;
    end record;

    type Device_Fault_Vendor_Binary_Header_Version_One is
    record
        Header_Size: Interfaces.Unsigned_32;
        Header_Version: Device_Fault_Vendor_Binary_Header_Version;
        Vendor_ID: Interfaces.Unsigned_32;
        Device_ID: Interfaces.Unsigned_32;
        Driver_Version: Interfaces.Unsigned_32;
        Pipeline_Cache_UUID: UUID;
        Application_Name_Offset: Interfaces.Unsigned_32;
        Application_Version: Interfaces.Unsigned_32;
        Engine_Name_Offset: Interfaces.Unsigned_32;
        Engine_Version: Interfaces.Unsigned_32;
        API_Version: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_RGBA10x6_Formats_Features is new Out_Structure
        (Physical_Device_RGBA10x6_Formats_Features_Type) with
    record
        Format_RGBA10x6_Without_YCbCr_Sampler: Boolean;
    end record;

    type Physical_Device_Vertex_Input_Dynamic_State_Features is
        new Out_Structure
            (Physical_Device_Vertex_Input_Dynamic_State_Features_Type) with
    record
        Vertex_Input_Dynamic_State: Boolean;
    end record;

    type Vertex_Input_Binding_Description_2 is new Out_Structure
        (Vertex_Input_Binding_Description_2_Type) with
    record
        Binding: Interfaces.Unsigned_32;
        Stride: Interfaces.Unsigned_32;
        Input_Rate: Vertex_Input_Rate;
        Divisor: Interfaces.Unsigned_32;
    end record;

    package Vertex_Input_Binding_Description_2_Vectors is
        new Ada.Containers.Vectors(Positive,
                                   Vertex_Input_Binding_Description_2);

    type Vertex_Input_Attribute_Description_2 is new Out_Structure
        (Vertex_Input_Attribute_Description_2_Type) with
    record
        Location: Interfaces.Unsigned_32;
        Binding: Interfaces.Unsigned_32;
        Format: Vulkan.Format;
        Offset: Interfaces.Unsigned_32;
    end record;

    package Vertex_Input_Attribute_Description_2_Vectors is
        new Ada.Containers.Vectors(Positive,
                                   Vertex_Input_Attribute_Description_2);

    type Physical_Device_DRM_Properties is new Out_Structure
        (Physical_Device_DRM_Properties_Type) with
    record
        Has_Primary: Boolean;
        Has_Render: Boolean;
        Primary_Major: Interfaces.Integer_64;
        Primary_Minor: Interfaces.Integer_64;
        Render_Major: Interfaces.Integer_64;
        Render_Minor: Interfaces.Integer_64;
    end record;

    type Physical_Device_Address_Binding_Report_Features is new Out_Structure
        (Physical_Device_Address_Binding_Report_Features_Type) with
    record
        Report_Address_Binding: Boolean;
    end record;

    type Device_Address_Binding_Callback_Data is new Out_Structure
        (Device_Address_Binding_Callback_Data_Type) with
    record
        Flags: Device_Address_Binding_Flags := Device_Address_Binding_No_Bit;
        Base_Address: Device_Address;
        Size: Device_Size;
        Binding_Type: Device_Address_Binding_Type;
    end record;

    type Physical_Device_Depth_Clip_Control_Features is new Out_Structure
        (Physical_Device_Depth_Clip_Control_Features_Type) with
    record
        Depth_Clip_Control: Boolean;
    end record;

    type Pipeline_Viewport_Depth_Clip_Control_Create_Info is new In_Structure
        (Pipeline_Viewport_Depth_Clip_Control_Create_Info_Type) with
    record
        Negative_One_To_One: Boolean;
    end record;

    type Physical_Device_Primitive_Topology_List_Restart_Features is
        new Out_Structure
            (Physical_Device_Primitive_Topology_List_Restart_Features_Type) with
    record
        Primitive_Topology_List_Restart: Boolean;
        Primitive_Topology_Patch_List_Restart: Boolean;
    end record;

    type Pipeline_Properties_Identifier is new Out_Structure
        (Pipeline_Properties_Identifier_Type) with
    record
        Pipeline_Identifier: UUID;
    end record;

    type Physical_Device_Pipeline_Properties_Features is new Out_Structure
        (Physical_Device_Pipeline_Properties_Features_Type) with
    record
        Pipeline_Properties_Identifier: Boolean;
    end record;

    type Physical_Device_Frame_Boundary_Features is new Out_Structure
        (Physical_Device_Frame_Boundary_Features_Type) with
    record
        Frame_Boundary: Boolean;
    end record;

    type Frame_Boundary is new In_Structure(Frame_Boundary_Type) with
    record
        Flags: Frame_Boundary_Flags := Frame_Boundary_No_Bit;
        Frame_ID: Interfaces.Unsigned_64;
        Images: Image_Vectors.Vector;
        Buffers: Buffer_Vectors.Vector;
        Tag_Name: Interfaces.Unsigned_64;
        Tag_Size: Interfaces.C.size_t;
        Tag: Interfaces.C.Extensions.void_ptr;
    end record;

    type Physical_Device_Multisampled_Render_To_Single_Sampled_Features is
        new Out_Structure
        (Physical_Device_Multisampled_Render_To_Single_Sampled_Features_Type)
            with
    record
        Multisampled_Render_To_Single_Sampled: Boolean;
    end record;

    type Subpass_Resolve_Performance_Query is new Out_Structure
        (Subpass_Resolve_Performance_Query_Type) with
    record
        Optimal: Boolean;
    end record;

    type Multisampled_Render_To_Single_Sampled_Info is new In_Structure
        (Multisampled_Render_To_Single_Sampled_Info_Type) with
    record
        Multisampled_Render_To_Single_Sampled_Enable: Boolean;
        Rasterization_Samples: Sample_Count_Flags := Sample_Count_No_Bit;
    end record;

    type Physical_Device_Color_Write_Enable_Features is new Out_Structure
        (Physical_Device_Color_Write_Enable_Features_Type) with
    record
        Color_Write_Enable: Boolean;
    end record;

    type Pipeline_Color_Write_Create_Info is new In_Structure
        (Pipeline_Color_Write_Create_Info_Type) with
    record
        Color_Write_Enables: Boolean_Vectors.Vector;
    end record;

    type Physical_Device_Primitives_Generated_Query_Features is
        new Out_Structure
            (Physical_Device_Primitives_Generated_Query_Features_Type) with
    record
        Primitives_Generated_Query: Boolean;
        Primitives_Generated_Query_With_Rasterizer_Discard: Boolean;
        Primitives_Generated_Query_With_Non_Zero_Streams: Boolean;
    end record;

    type Physical_Device_Image_View_Min_LOD_Features is new Out_Structure
        (Physical_Device_Image_View_Min_LOD_Features_Type) with
    record
        Min_LOD: Boolean;
    end record;

    type Image_View_Min_LOD_Create_Info is new In_Structure
        (Image_View_Min_LOD_Create_Info_Type) with
    record
        Min_LOD: Interfaces.C.C_float;
    end record;

    type Physical_Device_Multi_Draw_Features is new Out_Structure
        (Physical_Device_Multi_Draw_Features_Type) with
    record
        Multi_Draw: Boolean;
    end record;

    type Physical_Device_Multi_Draw_Properties is new Out_Structure
        (Physical_Device_Multi_Draw_Properties_Type) with
    record
        Max_Multi_Draw_Count: Interfaces.Unsigned_32;
    end record;

    type Multi_Draw_Info is
    record
        First_Vertex: Interfaces.Unsigned_32;
        Vertex_Count: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    package Multi_Draw_Info_Vectors is
        new Ada.Containers.Vectors(Positive, Multi_Draw_Info);

    type Multi_Draw_Indexed_Info is
    record
        First_Index: Interfaces.Unsigned_32;
        Index_Count: Interfaces.Unsigned_32;
        Vertex_Offset: Interfaces.Integer_32;
    end record
        with Convention => C;

    package Multi_Draw_Indexed_Info_Vectors is
        new Ada.Containers.Vectors(Positive, Multi_Draw_Indexed_Info);

    type Physical_Device_Image_2D_View_Of_3D_Features is new Out_Structure
        (Physical_Device_Image_2D_View_Of_3D_Features_Type) with
    record
        Image_2D_View_Of_3D: Boolean;
        Sampler_2D_View_Of_3D: Boolean;
    end record;

    type Physical_Device_Shader_Tile_Image_Features is new Out_Structure
        (Physical_Device_Shader_Tile_Image_Features_Type) with
    record
        Shader_Tile_Image_Color_Read_Access: Boolean;
        Shader_Tile_Image_Depth_Read_Access: Boolean;
        Shader_Tile_Image_Stencil_Read_Access: Boolean;
    end record;

    type Physical_Device_Shader_Tile_Image_Properties is new Out_Structure
        (Physical_Device_Shader_Tile_Image_Properties_Type) with
    record
        Shader_Tile_Image_Coherent_Read_Accelerated: Boolean;
        Shader_Tile_Image_Read_Sample_From_Pixel_Rate_Invocation: Boolean;
        Shader_Tile_Image_Read_From_Helper_Invocation: Boolean;
    end record;

    type Micromap_Usage is
    record
        Count: Interfaces.Unsigned_32;
        Subdivision_Level: Interfaces.Unsigned_32;
        Format: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Micromap_Usage_Access is access all Micromap_Usage
        with Storage_Size => 0,
             Convention => C;

    type Micromap_Usage_Access_Access is access all Micromap_Usage_Access
        with Storage_Size => 0,
             Convention => C;

    package Micromap_Usage_Vectors is
        new Ada.Containers.Vectors(Positive, Micromap_Usage);

    package Micromap_Usage_Access_Vectors is
        new Ada.Containers.Vectors(Positive, Micromap_Usage_Access);
    
    type Micromap_Build_Info
        (Data_Type, Scratch_Data_Type, Triangle_Array_Type: KHR.Address_Type)
            is new In_Structure(Micromap_Build_Info_Type) with
    record
        Micromap_Type: EXT.Micromap_Type;
        Flags: Build_Micromap_Flags := Build_Micromap_No_Bit;
        Mode: Build_Micromap_Mode;
        Dst_Micromap: Micromap;
        Usage_Counts: Micromap_Usage_Vectors.Vector;
        Usage_Counts_Access: Micromap_Usage_Access_Vectors.Vector;
        Data: KHR.Device_Or_Host_Address(Data_Type);
        Scratch_Data: KHR.Device_Or_Host_Address(Data_Type);
        Triangle_Array: KHR.Device_Or_Host_Address(Triangle_Array_Type);
        Triangle_Array_Stride: Device_Size;
    end record;

    package Micromap_Build_Info_Vectors is
        new Ada.Containers.Indefinite_Vectors(Positive, Micromap_Build_Info);

    type Micromap_Create_Info is new In_Structure
        (Micromap_Create_Info_Type) with
    record
        Create_Flags: Micromap_Create_Flags := Micromap_Create_No_Bit;
        Buffer: Vulkan.Buffer;
        Offset: Device_Size;
        Size: Device_Size;
        Micromap_Type: EXT.Micromap_Type;
        Device_Address: Vulkan.Device_Address;
    end record;

    type Physical_Device_Opacity_Micromap_Features is new Out_Structure
        (Physical_Device_Opacity_Micromap_Features_Type) with
    record
        Micromap: Boolean;
        Micromap_Capture_Replay: Boolean;
        Micromap_Host_Commands: Boolean;
    end record;

    type Physical_Device_Opacity_Micromap_Properties is new Out_Structure
        (Physical_Device_Opacity_Micromap_Properties_Type) with
    record
        Max_Opacity_2_State_Subdivision_Level: Interfaces.Unsigned_32;
        Max_Opacity_4_State_Subdivision_Level: Interfaces.Unsigned_32;
    end record;

    type Version_Data_Array is array (1 .. 2 * UUID_Size) of
        aliased Interfaces.Unsigned_8
        with Convention => C;

    type Version_Data_Array_Access is access constant Version_Data_Array
        with Convention => C;

    type Micromap_Version_Info is new In_Structure
        (Micromap_Version_Info_Type) with
    record
        Version_Data: Version_Data_Array_Access;
    end record;

    type Copy_Micromap_To_Memory_Info(Address_Type: KHR.Address_Type) is
        new In_Structure(Copy_Micromap_To_Memory_Info_Type) with
    record
        Src: Micromap;
        Dst: KHR.Device_Or_Host_Address(Address_Type);
        Mode: Copy_Micromap_Mode;
    end record;

    type Copy_Memory_To_Micromap_Info(Address_Type: KHR.Address_Type) is
        new In_Structure(Copy_Micromap_To_Memory_Info_Type) with
    record
        Src: KHR.Device_Or_Host_Address(Address_Type);
        Dst: Micromap;
        Mode: Copy_Micromap_Mode;
    end record;

    type Copy_Micromap_Info is new In_Structure(Copy_Micromap_Info_Type) with
    record
        Src: Micromap;
        Dst: Micromap;
        Mode: Copy_Micromap_Mode;
    end record;

    type Micromap_Build_Sizes_Info is new In_Structure
        (Micromap_Build_Sizes_Info_Type) with
    record
        Micromap_Size: Device_Size;
        Build_Scratch_Size: Device_Size;
        Discardable: Boolean;
    end record;

    -- This structure has to use the raw C pointers.
    type Acceleration_Structure_Triangles_Opacity_Micromap
        (Address_Type: KHR.Address_Type) is new Out_Structure
            (Acceleration_Structure_Triangles_Opacity_Micromap_Type) with
    record
        Index_Type: Vulkan.Index_Type;
        Index_Buffer: KHR.Device_Or_Host_Address(Address_Type);
        Index_Stride: Device_Size;
        Base_Triangle: Interfaces.Unsigned_32;
        Usage_Counts_Count: Interfaces.Unsigned_32;
        Usage_Counts: Micromap_Usage_Access;
        Usage_Counts_Access: Micromap_Usage_Access_Access;
        Micromap: EXT.Micromap;
    end record;

    type Micromap_Triangle is
    record
        Data_Offset: Interfaces.Unsigned_32;
        Subdivision_Level: Interfaces.Unsigned_16;
        Format: Interfaces.Unsigned_16;
    end record
        with Convention => C;

    type Metal_Surface_Create_Info is new In_Structure
        (Metal_Surface_Create_Info_Type) with
    record
        Flags: Metal_Surface_Create_Flags := Metal_Surface_Create_No_Bit;
        Layer: Metal.Layer;
    end record;
end Vulkan.Extensions.EXT;

