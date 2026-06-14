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

with Ada.Unchecked_Deallocation;
with Ada.Unchecked_Conversion;
with Vulkan.Extension_Records;
with Vulkan.Utilities;

package body Vulkan.C_EXT is
    -- Free procedure for internal structures.
    procedure Free(Struct: in out Attachment_Sample_Locations_C);
    procedure Free(Struct: in out Subpass_Sample_Locations_C);

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.EXT.Physical_Device_Transform_Feedback_Features;
         C_Struct: in Physical_Device_Transform_Feedback_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Transform_Feedback :=
            Utilities.To_Ada(C_Struct.Transform_Feedback);
        Ada_Struct.Geometry_Streams :=
            Utilities.To_Ada(C_Struct.Geometry_Streams);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.EXT.Physical_Device_Transform_Feedback_Properties;
         C_Struct: in Physical_Device_Transform_Feedback_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Max_Transform_Feedback_Streams :=
            C_Struct.Max_Transform_Feedback_Streams;
        Ada_Struct.Max_Transform_Feedback_Buffers :=
            C_Struct.Max_Transform_Feedback_Buffers;
        Ada_Struct.Max_Transform_Feedback_Buffer_Size :=
            C_Struct.Max_Transform_Feedback_Buffer_Size;
        Ada_Struct.Max_Transform_Feedback_Stream_Data_Size :=
            C_Struct.Max_Transform_Feedback_Stream_Data_Size;
        Ada_Struct.Max_Transform_Feedback_Buffer_Data_Size :=
            C_Struct.Max_Transform_Feedback_Buffer_Data_Size;
        Ada_Struct.Max_Transform_Feedback_Buffer_Data_Stride :=
            C_Struct.Max_Transform_Feedback_Buffer_Data_Stride;
        Ada_Struct.Transform_Feedback_Queries :=
            Utilities.To_Ada(C_Struct.Transform_Feedback_Queries);
        Ada_Struct.Transform_Feedback_Streams_Lines_Triangles := 
            Utilities.To_Ada
                (C_Struct.Transform_Feedback_Streams_Lines_Triangles);
        Ada_Struct.Transform_Feedback_Rasterization_Stream_Select :=
            Utilities.To_Ada
                (C_Struct.Transform_Feedback_Rasterization_Stream_Select);
        Ada_Struct.Transform_Feedback_Draw :=
            Utilities.To_Ada(C_Struct.Transform_Feedback_Draw);
    end To_Ada;

    function To_C
        (Struct:
            in Extensions.EXT.Pipeline_Rasterization_State_Stream_Create_Info)
        return Pipeline_Rasterization_State_Stream_Create_Info_C is
        PRSSCIC: Pipeline_Rasterization_State_Stream_Create_Info_C;
    begin
        PRSSCIC.Next := Extension_Records.To_C(Struct.Next);
        PRSSCIC.Flags := Struct.Flags;
        PRSSCIC.Rasterization_Stream := Struct.Rasterization_Stream;

        return PRSSCIC;
    end To_C;

    procedure Free
        (Struct: in out Pipeline_Rasterization_State_Stream_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.EXT.Image_View_ASTC_Decode_Mode)
        return Image_View_ASTC_Decode_Mode_C is
        IVADMC: Image_View_ASTC_Decode_Mode_C;
    begin
        IVADMC.Next := Extension_Records.To_C(Struct.Next);
        IVADMC.Decode_Mode := Struct.Decode_Mode;

        return IVADMC;
    end To_C;

    procedure Free(Struct: in out Image_View_ASTC_Decode_Mode_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Physical_Device_ASTC_Decode_Features;
         C_Struct: in Physical_Device_ASTC_Decode_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Decode_Mode_Shared_Exponent :=
            Utilities.To_Ada(C_Struct.Decode_Mode_Shared_Exponent);
    end To_Ada;

    function To_C(Struct: in Extensions.EXT.Conditional_Rendering_Begin_Info)
        return Conditional_Rendering_Begin_Info_C is
        CRBIC: Conditional_Rendering_Begin_Info_C;
    begin
        CRBIC.Next := Extension_Records.To_C(Struct.Next);
        CRBIC.Buffer := Struct.Buffer;
        CRBIC.Offset := Struct.Offset;
        CRBIC.Flags := Struct.Flags;

        return CRBIC;
    end To_C;

    procedure Free(Struct: in out Conditional_Rendering_Begin_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct:
            in out 
                Extensions.EXT.Physical_Device_Conditional_Rendering_Features;
         C_Struct: in Physical_Device_Conditional_Rendering_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Conditional_Rendering :=
            Utilities.To_Ada(C_Struct.Conditional_Rendering);
        Ada_Struct.Inherited_Conditional_Rendering :=
            Utilities.To_Ada(C_Struct.Inherited_Conditional_Rendering);
    end To_Ada;

    function To_C
        (Struct:
        in Extensions.EXT.Command_Buffer_Inheritance_Conditional_Rendering_Info)
        return Command_Buffer_Inheritance_Conditional_Rendering_Info_C is
        CBICRIC: Command_Buffer_Inheritance_Conditional_Rendering_Info_C;
    begin
        CBICRIC.Next := Extension_Records.To_C(Struct.Next);
        CBICRIC.Conditional_Rendering_Enable :=
            Utilities.To_C(Struct.Conditional_Rendering_Enable);

        return CBICRIC;
    end To_C;

    procedure Free
        (Struct:
            in out Command_Buffer_Inheritance_Conditional_Rendering_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada(Ada_Struct: in out Extensions.EXT.Surface_Capabilities_2;
                     C_Struct: in Surface_Capabilities_2_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Min_Image_Count := C_Struct.Min_Image_Count;
        Ada_Struct.Max_Image_Count := C_Struct.Max_Image_Count;
        Ada_Struct.Current_Extent := C_Struct.Current_Extent;
        Ada_Struct.Min_Image_Extent := C_Struct.Min_Image_Extent;
        Ada_Struct.Max_Image_Extent := C_Struct.Max_Image_Extent;
        Ada_Struct.Max_Image_Array_Layers := C_Struct.Max_Image_Array_Layers;
        Ada_Struct.Supported_Transforms := C_Struct.Supported_Transforms;
        Ada_Struct.Current_Transform := C_Struct.Current_Transform;
        Ada_Struct.Supported_Composite_Alpha :=
            C_Struct.Supported_Composite_Alpha;
        Ada_Struct.Supported_Usage_Flags := C_Struct.Supported_Usage_Flags;
        Ada_Struct.Supported_Surface_Counters :=
            C_Struct.Supported_Surface_Counters;
    end To_Ada;

    function To_C(Struct: in Extensions.EXT.Display_Power_Info)
        return Display_Power_Info_C is
        DPIC: Display_Power_Info_C;
    begin
        DPIC.Next := Extension_Records.To_C(Struct.Next);
        DPIC.Power_State := Struct.Power_State;

        return DPIC;
    end To_C;

    procedure Free(Struct: in out Display_Power_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;
    
    function To_C(Struct: in Extensions.EXT.Device_Event_Info)
        return Device_Event_Info_C is
        DEIC: Device_Event_Info_C;
    begin
        DEIC.Next := Extension_Records.To_C(Struct.Next);
        DEIC.Device_Event := Struct.Device_Event;

        return DEIC;
    end To_C;

    procedure Free(Struct: in out Device_Event_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.EXT.Display_Event_Info)
        return Display_Event_Info_C is
        DEIC: Display_Event_Info_C;
    begin
        DEIC.Next := Extension_Records.To_C(Struct.Next);
        DEIC.Display_Event := Struct.Display_Event;

        return DEIC;
    end To_C;

    procedure Free(Struct: in out Display_Event_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.EXT.Swapchain_Counter_Create_Info)
        return Swapchain_Counter_Create_Info_C is
        SCCIC: Swapchain_Counter_Create_Info_C;
    begin
        SCCIC.Next := Extension_Records.To_C(Struct.Next);
        SCCIC.Surface_Counters := Struct.Surface_Counters;

        return SCCIC;
    end To_C;

    procedure Free(Struct: in out Swapchain_Counter_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.EXT.Physical_Device_Discard_Rectangle_Properties;
         C_Struct: in Physical_Device_Discard_Rectangle_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Max_Discard_Rectangles := C_Struct.Max_Discard_Rectangles;
    end To_Ada;

    function To_C
        (Struct: in Extensions.EXT.Pipeline_Discard_Rectangle_State_Create_Info)
        return Pipeline_Discard_Rectangle_State_Create_Info_C is
        procedure To_C_Array is new Utilities.To_C_Array(C.Rect_2D_Arrays,
                                                         Rect_2D_Vectors);

        PDRSCIC: Pipeline_Discard_Rectangle_State_Create_Info_C;
    begin
        PDRSCIC.Next := Extension_Records.To_C(Struct.Next);
        PDRSCIC.Flags := Struct.Flags;
        PDRSCIC.Discard_Rectangle_Mode := Struct.Discard_Rectangle_Mode;
        To_C_Array(PDRSCIC.Discard_Rectangle_Count,
                   Struct.Discard_Rectangles,
                   PDRSCIC.Discard_Rectangles);

        return PDRSCIC;
    end To_C;

    procedure Free
        (Struct: in out Pipeline_Discard_Rectangle_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        C.Rect_2D_Arrays.Free(Struct.Discard_Rectangles);
    end Free;

    procedure To_Ada
        (Ada_Struct:
            in out
           Extensions.EXT.Physical_Device_Conservative_Rasterization_Properties;
         C_Struct:
            in Physical_Device_Conservative_Rasterization_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Primitive_Overestimation_Size :=
            Float(C_Struct.Primitive_Overestimation_Size);
        Ada_Struct.Max_Extra_Primitive_Overestimation_Size :=
            Float(C_Struct.Max_Extra_Primitive_Overestimation_Size);
        Ada_Struct.Extra_Primitive_Overestimation_Size_Granularity :=
            Float(C_Struct.Extra_Primitive_Overestimation_Size_Granularity);
        Ada_Struct.Primitive_Underestimation :=
            Utilities.To_Ada(C_Struct.Primitive_Underestimation);
        Ada_Struct.Conservative_Point_And_Line_Rasterization :=
            Utilities.To_Ada
                (C_Struct.Conservative_Point_And_Line_Rasterization);
        Ada_Struct.Degenerate_Triangles_Rasterized :=
            Utilities.To_Ada(C_Struct.Degenerate_Triangles_Rasterized);
        Ada_Struct.Degenerate_Lines_Rasterized :=
            Utilities.To_Ada(C_Struct.Degenerate_Lines_Rasterized);
        Ada_Struct.Fully_Covered_Fragment_Shader_Input_Variable :=
            Utilities.To_Ada
                (C_Struct.Fully_Covered_Fragment_Shader_Input_Variable);
        Ada_Struct.Conservative_Rasterization_Post_Depth_Coverage :=
            Utilities.To_Ada
                (C_Struct.Conservative_Rasterization_Post_Depth_Coverage);
    end To_Ada;

    function To_C
        (Struct:
        in Extensions.EXT.Pipeline_Rasterization_Conservative_State_Create_Info)
        return Pipeline_Rasterization_Conservative_State_Create_Info_C is
        PRCSCIC: Pipeline_Rasterization_Conservative_State_Create_Info_C;
    begin
        PRCSCIC.Next := Extension_Records.To_C(Struct.Next);
        PRCSCIC.Flags := Struct.Flags;
        PRCSCIC.Conservative_Rasterization_Mode :=
            Struct.Conservative_Rasterization_Mode;
        PRCSCIC.Extra_Primitive_Overestimation_Size :=
            Interfaces.C.C_Float(Struct.Extra_Primitive_Overestimation_Size);

        return PRCSCIC;
    end To_C;

    procedure Free
        (Struct:
            in out Pipeline_Rasterization_Conservative_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.EXT.Physical_Device_Depth_Clip_Enable_Features;
         C_Struct: in Physical_Device_Depth_Clip_Enable_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Depth_Clip_Enable :=
            Utilities.To_Ada(C_Struct.Depth_Clip_Enable);
    end To_Ada;

    function To_C
        (Struct:
          in Extensions.EXT.Pipeline_Rasterization_Depth_Clip_State_Create_Info)
        return Pipeline_Rasterization_Depth_Clip_State_Create_Info_C is
        PRDCSCIC: Pipeline_Rasterization_Depth_Clip_State_Create_Info_C;
    begin
        PRDCSCIC.Next := Extension_Records.To_C(Struct.Next);
        PRDCSCIC.Flags := Struct.Flags;
        PRDCSCIC.Depth_Clip_Enable := Utilities.To_C(Struct.Depth_Clip_Enable);

        return PRDCSCIC;
    end To_C;

    procedure Free
        (Struct:
            in out Pipeline_Rasterization_Depth_Clip_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.EXT.HDR_Metadata)
        return HDR_Metadata_C is
        HMC: HDR_Metadata_C;
    begin
        HMC.Next := Extension_Records.To_C(Struct.Next);
        HMC.Display_Primary_Red := Struct.Display_Primary_Red;
        HMC.Display_Primary_Green := Struct.Display_Primary_Green;
        HMC.Display_Primary_Blue := Struct.Display_Primary_Blue;
        HMC.White_Point := Struct.White_Point;
        HMC.Max_Luminance := Interfaces.C.C_float(Struct.Max_Luminance);
        HMC.Min_Luminance := Interfaces.C.C_float(Struct.Min_Luminance);
        HMC.Max_Content_Light_Level :=
            Interfaces.C.C_float(Struct.Max_Content_Light_Level);
        HMC.Max_Frame_Average_Light_Level :=
            Interfaces.C.C_float(Struct.Max_Frame_Average_Light_Level);

        return HMC;
    end To_C;

    procedure Free(Struct: in out HDR_Metadata_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.EXT.Debug_Utils_Label)
        return Debug_Utils_Label_C is
        DULC: Debug_Utils_Label_C;
    begin
        DULC.Next := Extension_Records.To_C(Struct.Next);
        DULC.Label_Name := Interfaces.C.Strings.New_String
            (Ada.Strings.Unbounded.To_String(Struct.Label_Name));
        DULC.Color := Struct.Color;

        return DULC;
    end To_C;

    procedure Free(Struct: in out Debug_Utils_Label_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Interfaces.C.Strings.Free(Struct.Label_Name);
    end Free;

    function To_C(Struct: in Extensions.EXT.Debug_Utils_Object_Name_Info)
        return Debug_Utils_Object_Name_Info_C is
        DUONIC: Debug_Utils_Object_Name_Info_C;
    begin
        DUONIC.Next := Extension_Records.To_C(Struct.Next);
        DUONIC.Object_Type := Struct.Object_Type;
        DUONIC.Object_Handle := Struct.Object_Handle;
        DUONIC.Object_Name := Interfaces.C.Strings.New_String
            (Ada.Strings.Unbounded.To_String(Struct.Object_Name));

        return DUONIC;
    end To_C;

    procedure Free(Struct: in out Debug_Utils_Object_Name_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Interfaces.C.Strings.Free(Struct.Object_Name);
    end Free;

    function To_C(Struct: in Extensions.EXT.Debug_Utils_Messenger_Callback_Data)
        return Debug_Utils_Messenger_Callback_Data_C is

        procedure To_C_Array is new Utilities.To_C_Array_Convert
            (Debug_Utils_Label_C_Arrays,
             Extensions.EXT.Debug_Utils_Label_Vectors);

        procedure To_C_Array is new Utilities.To_C_Array_Convert
            (Debug_Utils_Object_Name_Info_C_Arrays,
             Extensions.EXT.Debug_Utils_Object_Name_Info_Vectors);

        DUMCDC: Debug_Utils_Messenger_Callback_Data_C;
    begin
        DUMCDC.Next := Extension_Records.To_C(Struct.Next);
        DUMCDC.Flags := Struct.Flags;
        DUMCDC.Message_ID_Name := Interfaces.C.Strings.New_String
            (Ada.Strings.Unbounded.To_String(Struct.Message_ID_Name));
        DUMCDC.Message_ID_Number := Struct.Message_ID_Number;
        DUMCDC.Message := Interfaces.C.Strings.New_String
            (Ada.Strings.Unbounded.To_String(Struct.Message));
        To_C_Array(DUMCDC.Queue_Label_Count,
                   Struct.Queue_Labels,
                   DUMCDC.Queue_Labels);
        To_C_Array(DUMCDC.Cmd_Buf_Label_Count,
                   Struct.Cmd_Buf_Labels,
                   DUMCDC.Cmd_Buf_Labels);
        To_C_Array(DUMCDC.Object_Count, Struct.Objects, DUMCDC.Objects);

        return DUMCDC;
    end To_C;

    procedure Free(Struct: in out Debug_Utils_Messenger_Callback_Data_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Interfaces.C.Strings.Free(Struct.Message_ID_Name);
        Interfaces.C.Strings.Free(Struct.Message);
        Debug_Utils_Label_C_Arrays.Free(Struct.Queue_Labels, Free'Access);
        Debug_Utils_Label_C_Arrays.Free(Struct.Cmd_Buf_Labels, Free'Access);
        Debug_Utils_Object_Name_Info_C_Arrays.Free(Struct.Objects, Free'Access);
    end Free;

    function To_C(Struct: in Extensions.EXT.Debug_Utils_Messenger_Create_Info)
        return Debug_Utils_Messenger_Create_Info_C is
        DUMCIC: Debug_Utils_Messenger_Create_Info_C;
    begin
        DUMCIC.Next := Extension_Records.To_C(Struct.Next);
        DUMCIC.Flags := Struct.Flags;
        DUMCIC.Message_Severity := Struct.Message_Severity;
        DUMCIC.Message_Type := Struct.Message_Type;

        return DUMCIC;
    end To_C;

    procedure Free(Struct: in out Debug_Utils_Messenger_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.EXT.Debug_Utils_Object_Tag_Info)
        return Debug_Utils_Object_Tag_Info_C is
        DUOTIC: Debug_Utils_Object_Tag_Info_C;
    begin
        DUOTIC.Next := Extension_Records.To_C(Struct.Next);
        DUOTIC.Object_Type := Struct.Object_Type;
        DUOTIC.Object_Handle := Struct.Object_Handle;
        DUOTIC.Tag_Name := Struct.Tag_Name;
        DUOTIC.Tag_Size := Struct.Tag_Size;
        DUOTIC.Tag := Struct.Tag;

        return DUOTIC;
    end To_C;

    procedure Free(Struct: in out Debug_Utils_Object_Tag_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free; 

    function To_C(Struct: in Extensions.EXT.Sample_Locations_Info)
        return Sample_Locations_Info_C is
        procedure To_C_Array is
            new Utilities.To_C_Array(Sample_Location_Arrays,
                                     Extensions.EXT.Sample_Location_Vectors);

        SLIC: Sample_Locations_Info_C;
    begin
        SLIC.Next := Extension_Records.To_C(Struct.Next);
        SLIC.Sample_Locations_Per_Pixel := Struct.Sample_Locations_Per_Pixel;
        SLIC.Sample_Location_Grid_Size := Struct.Sample_Location_Grid_Size;
        To_C_Array(SLIC.Sample_Locations_Count,
                   Struct.Sample_Locations,
                   SLIC.Sample_Locations);

        return SLIC;
    end To_C;

    procedure Free(Struct: in out Sample_Locations_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Sample_Location_Arrays.Free(Struct.Sample_Locations);
    end Free;

    function To_C
            (Struct: in Extensions.EXT.Render_Pass_Sample_Locations_Begin_Info)
        return Render_Pass_Sample_Locations_Begin_Info_C is
        function To_C(Struct: in Extensions.EXT.Attachment_Sample_Locations)
            return Attachment_Sample_Locations_C is
            ASLC: Attachment_Sample_Locations_C;
        begin
            ASLC.Attachment_Index := Struct.Attachment_Index;
            ASLC.Sample_Locations_Info := To_C(Struct.Sample_Locations_Info);

            return ASLC;
        end To_C;

        function To_C(Struct: in Extensions.EXT.Subpass_Sample_Locations)
            return Subpass_Sample_Locations_C is
            SSLC: Subpass_Sample_Locations_C;
        begin
            SSLC.Subpass_Index := Struct.Subpass_Index;
            SSLC.Sample_Locations_Info := To_C(Struct.Sample_Locations_Info);

            return SSLC;
        end To_C;

        procedure To_C_Array is new Utilities.To_C_Array_Convert
            (Attachment_Sample_Locations_C_Arrays,
             Extensions.EXT.Attachment_Sample_Locations_Vectors);

        procedure To_C_Array is new Utilities.To_C_Array_Convert
            (Subpass_Sample_Locations_C_Arrays,
             Extensions.EXT.Subpass_Sample_Locations_Vectors);

        RPSLBIC: Render_Pass_Sample_Locations_Begin_Info_C;
    begin
        RPSLBIC.Next := Extension_Records.To_C(Struct.Next);
        To_C_Array(RPSLBIC.Attachment_Initial_Sample_Locations_Count,
                   Struct.Attachment_Initial_Sample_Locations,
                   RPSLBIC.Attachment_Initial_Sample_Locations);
        To_C_Array(RPSLBIC.Post_Subpass_Sample_Locations_Count,
                   Struct.Post_Subpass_Sample_Locations,
                   RPSLBIC.Post_Subpass_Sample_Locations);
        
        return RPSLBIC;
    end To_C;

    procedure Free(Struct: in out Render_Pass_Sample_Locations_Begin_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Attachment_Sample_Locations_C_Arrays.Free
            (Struct.Attachment_Initial_Sample_Locations, Free'Access);
        Subpass_Sample_Locations_C_Arrays.Free
            (Struct.Post_Subpass_Sample_Locations, Free'Access);
    end Free;

    function To_C
        (Struct: in
            Extensions.EXT.Pipeline_Sample_Locations_State_Create_Info)
        return Pipeline_Sample_Locations_State_Create_Info_C is
        PSLSCIC: Pipeline_Sample_Locations_State_Create_Info_C;
    begin
        PSLSCIC.Next := Extension_Records.To_C(Struct.Next);
        PSLSCIC.Sample_Locations_Enable :=
            Utilities.To_C(Struct.Sample_Locations_Enable);
        PSLSCIC.Sample_Locations_Info := To_C(Struct.Sample_Locations_Info);

        return PSLSCIC;
    end To_C;

    procedure Free
        (Struct: in out Pipeline_Sample_Locations_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Free(Struct.Sample_Locations_Info);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Sample_Locations_Properties;
         C_Struct: in Physical_Device_Sample_Locations_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Sample_Location_Sample_Counts :=
            C_Struct.Sample_Location_Sample_Counts;
        Ada_Struct.Max_Sample_Location_Grid_Size :=
            C_Struct.Max_Sample_Location_Grid_Size;
        Ada_Struct.Sample_Location_Coordinate_Range :=
            C_Struct.Sample_Location_Coordinate_Range;
        Ada_Struct.Sample_Location_Sub_Pixel_Bits :=
            C_Struct.Sample_Location_Sub_Pixel_Bits;
        Ada_Struct.Variable_Sample_Locations :=
            Utilities.To_Ada(C_Struct.Variable_Sample_Locations);
    end To_Ada;

    procedure To_Ada(Ada_Struct: in out Extensions.EXT.Multisample_Properties;
                     C_Struct: in Multisample_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Max_Sample_Location_Grid_Size :=
            C_Struct.Max_Sample_Location_Grid_Size;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Blend_Operation_Advanced_Features;
         C_Struct: in Physical_Device_Blend_Operation_Advanced_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Advanced_Blend_Coherent_Operations :=
            Utilities.To_Ada(C_Struct.Advanced_Blend_Coherent_Operations);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Blend_Operation_Advanced_Properties;
         C_Struct: in Physical_Device_Blend_Operation_Advanced_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Advanced_Blend_Max_Color_Attachments :=
            C_Struct.Advanced_Blend_Max_Color_Attachments;
        Ada_Struct.Advanced_Blend_Independent_Blend :=
            Utilities.To_Ada(C_Struct.Advanced_Blend_Independent_Blend);
        Ada_Struct.Advanced_Blend_Non_Premultiplied_Src_Color :=
            Utilities.To_Ada
                (C_Struct.Advanced_Blend_Non_Premultiplied_Src_Color);
        Ada_Struct.Advanced_Blend_Non_Premultiplied_Dst_Color :=
            Utilities.To_Ada
                (C_Struct.Advanced_Blend_Non_Premultiplied_Dst_Color);
        Ada_Struct.Advanced_Blend_Correlated_Overlap :=
            Utilities.To_Ada(C_Struct.Advanced_Blend_Correlated_Overlap);
        Ada_Struct.Advanced_Blend_All_Operations :=
            Utilities.To_Ada(C_Struct.Advanced_Blend_All_Operations);
    end To_Ada;

    function To_C
        (Struct: in
            Extensions.EXT.Pipeline_Color_Blend_Advanced_State_Create_Info)
        return Pipeline_Color_Blend_Advanced_State_Create_Info_C is
        PCBASCIC: Pipeline_Color_Blend_Advanced_State_Create_Info_C;
    begin
        PCBASCIC.Next := Extension_Records.To_C(Struct.Next);
        PCBASCIC.Src_Premultiplied := Utilities.To_C(Struct.Src_Premultiplied);
        PCBASCIC.Dst_Premultiplied := Utilities.To_C(Struct.Dst_Premultiplied);
        PCBASCIC.Blend_Overlap := Struct.Blend_Overlap;

        return PCBASCIC;
    end To_C;

    procedure Free
        (Struct: in out Pipeline_Color_Blend_Advanced_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.DRM_Format_Modifier_Properties_List;
         C_Struct: in DRM_Format_Modifier_Properties_List_C) is
         use type DRM_Format_Modifier_Properties_Arrays.Pointer;
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);

        if C_Struct.DRM_Format_Modifier_Properties = null then
            Ada_Struct.DRM_Format_Modifier_Count :=
                C_Struct.DRM_Format_Modifier_Count;
        else
            declare
                Modifiers_Array:
                    DRM_Format_Modifier_Properties_Arrays.Array_Access :=
                        DRM_Format_Modifier_Properties_Arrays.Get_Array
                            (C_Struct.DRM_Format_Modifier_Properties);
            begin
                Ada_Struct.DRM_Format_Modifier_Properties.Set_Length
                    (Ada.Containers.Count_Type
                        (C_Struct.DRM_Format_Modifier_Count));
                for X in Modifiers_Array.all'Range loop
                    Ada_Struct.DRM_Format_Modifier_Properties(X) :=
                        Modifiers_Array(X);
                end loop;

                DRM_Format_Modifier_Properties_Arrays.Free(Modifiers_Array);
            end;
        end if;
    end To_Ada;

    function To_C
        (Struct: in
            Extensions.EXT.Physical_Device_Image_DRM_Format_Modifier_Info)
        return Physical_Device_Image_DRM_Format_Modifier_Info_C is
        procedure To_C_Array is
            new Utilities.To_C_Array(C.Queue_Family_Index_Arrays,
                                     Queue_Family_Index_Vectors);

        PDIDFMIC: Physical_Device_Image_DRM_Format_Modifier_Info_C;
    begin
        PDIDFMIC.Next := Extension_Records.To_C(Struct.Next);
        PDIDFMIC.DRM_Format_Modifier := Struct.DRM_Format_Modifier;
        PDIDFMIC.Sharing_Mode := Struct.Sharing_Mode;
        To_C_Array(PDIDFMIC.Queue_Family_Index_Count,
                   Struct.Queue_Family_Indices,
                   PDIDFMIC.Queue_Family_Indices);

        return PDIDFMIC;
    end To_C;

    procedure Free
        (Struct: in out Physical_Device_Image_DRM_Format_Modifier_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        C.Queue_Family_Index_Arrays.Free(Struct.Queue_Family_Indices);
    end Free;

    function To_C
        (Struct: in
            Extensions.EXT.Image_DRM_Format_Modifier_List_Create_Info)
        return Image_DRM_Format_Modifier_List_Create_Info_C is
        procedure To_C_Array is new Utilities.To_C_Array(C.Uint64_t_Arrays,
                                                         Unsigned_64_Vectors);

        IDFMLCIC: Image_DRM_Format_Modifier_List_Create_Info_C;
    begin
        IDFMLCIC.Next := Extension_Records.To_C(Struct.Next);
        To_C_Array(IDFMLCIC.DRM_Format_Modifier_Count,
                   Struct.DRM_Format_Modifiers,
                   IDFMLCIC.DRM_Format_Modifiers);

        return IDFMLCIC;
    end To_C;

    procedure Free
        (Struct: in out Image_DRM_Format_Modifier_List_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        C.Uint64_t_Arrays.Free(Struct.DRM_Format_Modifiers);
    end Free;

    function To_C
        (Struct: in
            Extensions.EXT.Image_DRM_Format_Modifier_Explicit_Create_Info)
        return Image_DRM_Format_Modifier_Explicit_Create_Info_C is
        procedure To_C_Array is
            new Utilities.To_C_Array(Subresource_Layout_Arrays,
                                     Subresource_Layout_Vectors);

        IDFMECIC: Image_DRM_Format_Modifier_Explicit_Create_Info_C;
    begin
        IDFMECIC.Next := Extension_Records.To_C(Struct.Next);
        IDFMECIC.DRM_Format_Modifier := Struct.DRM_Format_Modifier;
        To_C_Array(IDFMECIC.DRM_Format_Modifier_Plane_Count,
                   Struct.Plane_Layouts,
                   IDFMECIC.Plane_Layouts);

        return IDFMECIC;
    end To_C;

    procedure Free
        (Struct: in out Image_DRM_Format_Modifier_Explicit_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Subresource_Layout_Arrays.Free(Struct.Plane_Layouts);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Image_DRM_Format_Modifier_Properties;
         C_Struct: in Image_DRM_Format_Modifier_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.DRM_Format_Modifier := C_Struct.DRM_Format_Modifier;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.EXT.DRM_Format_Modifier_Properties_List_2;
         C_Struct: in DRM_Format_Modifier_Properties_List_2_C) is
         use type DRM_Format_Modifier_Properties_2_Arrays.Pointer;
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);

        if C_Struct.DRM_Format_Modifier_Properties = null then
            Ada_Struct.DRM_Format_Modifier_Count :=
                C_Struct.DRM_Format_Modifier_Count;
        else
            declare
                Modifiers_Array:
                    DRM_Format_Modifier_Properties_2_Arrays.Array_Access :=
                        DRM_Format_Modifier_Properties_2_Arrays.Get_Array
                            (C_Struct.DRM_Format_Modifier_Properties);
            begin
                Ada_Struct.DRM_Format_Modifier_Properties.Set_Length
                    (Ada.Containers.Count_Type
                        (C_Struct.DRM_Format_Modifier_Count));
                for X in Modifiers_Array.all'Range loop
                    Ada_Struct.DRM_Format_Modifier_Properties(X) :=
                        Modifiers_Array(X);
                end loop;

                DRM_Format_Modifier_Properties_2_Arrays.Free(Modifiers_Array);
            end;
        end if;
    end To_Ada;

    function To_C(Struct: in Extensions.EXT.Validation_Cache_Create_Info)
        return Validation_Cache_Create_Info_C is
        VCCIC: Validation_Cache_Create_Info_C;
    begin
        VCCIC.Next := Extension_Records.To_C(Struct.Next);
        VCCIC.Flags := Struct.Flags;
        VCCIC.Initial_Data_Size := Struct.Initial_Data_Size;
        VCCIC.Initial_Data := Struct.Initial_Data;

        return VCCIC;
    end To_C;

    procedure Free(Struct: in out Validation_Cache_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C
        (Struct: in Extensions.EXT.Shader_Module_Validation_Cache_Create_Info)
        return Shader_Module_Validation_Cache_Create_Info_C is
        SMVCCIC: Shader_Module_Validation_Cache_Create_Info_C;
    begin
        SMVCCIC.Next := Extension_Records.To_C(Struct.Next);
        SMVCCIC.Validation_Cache := Struct.Validation_Cache;

        return SMVCCIC;
    end To_C;

    procedure Free
        (Struct: in out Shader_Module_Validation_Cache_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Image_View_Image_Format_Info;
         C_Struct: in Physical_Device_Image_View_Image_Format_Info_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Image_View_Type := C_Struct.Image_View_Type;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Filter_Cubic_Image_View_Image_Format_Properties;
         C_Struct: in Filter_Cubic_Image_View_Image_Format_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Filter_Cubic := Utilities.To_Ada(C_Struct.Filter_Cubic);
        Ada_Struct.Filter_Cubic_Minmax :=
            Utilities.To_Ada(C_Struct.Filter_Cubic_Minmax);
    end To_Ada;

    function To_C(Struct: in Extensions.EXT.Import_Memory_Host_Pointer_Info)
        return Import_Memory_Host_Pointer_Info_C is
        IMHPIC: Import_Memory_Host_Pointer_Info_C;
    begin
        IMHPIC.Next := Extension_Records.To_C(Struct.Next);
        IMHPIC.Handle_Type := Struct.Handle_Type;
        IMHPIC.Host_Pointer := Struct.Host_Pointer;

        return IMHPIC;
    end To_C;

    procedure Free(Struct: in out Import_Memory_Host_Pointer_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Memory_Host_Pointer_Properties;
         C_Struct: in Memory_Host_Pointer_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Memory_Type_Bits := C_Struct.Memory_Type_Bits;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_External_Memory_Host_Properties;
         C_Struct: in Physical_Device_External_Memory_Host_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Min_Imported_Host_Pointer_Alignment :=
            C_Struct.Min_Imported_Host_Pointer_Alignment;
    end To_Ada;
        
    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_PCI_Bus_Info_Properties;
         C_Struct: in Physical_Device_PCI_Bus_Info_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.PCI_Domain := C_Struct.PCI_Domain;
        Ada_Struct.PCI_Bus := C_Struct.PCI_Bus;
        Ada_Struct.PCI_Device := C_Struct.PCI_Device;
        Ada_Struct.PCI_Function := C_Struct.PCI_Function;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Fragment_Density_Map_Features;
         C_Struct: in Physical_Device_Fragment_Density_Map_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Fragment_Density_Map :=
            Utilities.To_Ada(C_Struct.Fragment_Density_Map);
        Ada_Struct.Fragment_Density_Map_Dynamic :=
            Utilities.To_Ada(C_Struct.Fragment_Density_Map_Dynamic);
        Ada_Struct.Fragment_Density_Map_Non_Subsampled_Images :=
            Utilities.To_Ada
                (C_Struct.Fragment_Density_Map_Non_Subsampled_Images);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Fragment_Density_Map_Properties;
         C_Struct: in Physical_Device_Fragment_Density_Map_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Min_Fragment_Density_Texel_Size :=
            C_Struct.Min_Fragment_Density_Texel_Size;
        Ada_Struct.Max_Fragment_Density_Texel_Size :=
            C_Struct.Max_Fragment_Density_Texel_Size;
        Ada_Struct.Fragment_Density_Invocations :=
            Utilities.To_Ada(C_Struct.Fragment_Density_Invocations);
    end To_Ada;

    function To_C
        (Struct: in Extensions.EXT.Render_Pass_Fragment_Density_Map_Create_Info)
        return Render_Pass_Fragment_Density_Map_Create_Info_C is
        RPFDMCIC: Render_Pass_Fragment_Density_Map_Create_Info_C;
    begin
        RPFDMCIC.Next := Extension_Records.To_C(Struct.Next);
        RPFDMCIC.Fragment_Density_Map_Attachment :=
            Struct.Fragment_Density_Map_Attachment;

        return RPFDMCIC;
    end To_C;

    procedure Free
        (Struct: in out Render_Pass_Fragment_Density_Map_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C
        (Struct:
            in Extensions.EXT.Rendering_Fragment_Density_Map_Attachment_Info)
        return Rendering_Fragment_Density_Map_Attachment_Info_C is
        RFDMAIC: Rendering_Fragment_Density_Map_Attachment_Info_C;
    begin
        RFDMAIC.Next := Extension_Records.To_C(Struct.Next);
        RFDMAIC.Image_View := Struct.Image_View;
        RFDMAIC.Image_Layout := Struct.Image_Layout;

        return RFDMAIC;
    end To_C;

    procedure Free
        (Struct: in out Rendering_Fragment_Density_Map_Attachment_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Shader_Image_Atomic_Int64_Features;
         C_Struct: in Physical_Device_Shader_Image_Atomic_Int64_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Shader_Image_Int64_Atomics :=
            Utilities.To_Ada(C_Struct.Shader_Image_Int64_Atomics);
        Ada_Struct.Sparse_Image_Int64_Atomics :=
            Utilities.To_Ada(C_Struct.Sparse_Image_Int64_Atomics);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Memory_Budget_Properties;
         C_Struct: in Physical_Device_Memory_Budget_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Heap_Budget := C_Struct.Heap_Budget;
        Ada_Struct.Heap_Usage := C_Struct.Heap_Usage;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Memory_Priority_Features;
         C_Struct: in Physical_Device_Memory_Priority_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Memory_Priority :=
            Utilities.To_Ada(C_Struct.Memory_Priority);
    end To_Ada;

    function To_C(Struct: in Extensions.EXT.Memory_Priority_Allocate_Info)
        return Memory_Priority_Allocate_Info_C is
        MPAIC: Memory_Priority_Allocate_Info_C;
    begin
        MPAIC.Next := Extension_Records.To_C(Struct.Next);
        MPAIC.Priority := Struct.Priority;

        return MPAIC;
    end To_C;

    procedure Free(Struct: in out Memory_Priority_Allocate_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Fragment_Shader_Interlock_Features;
         C_Struct: in Physical_Device_Fragment_Shader_Interlock_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Fragment_Shader_Sample_Interlock :=
            Utilities.To_Ada(C_Struct.Fragment_Shader_Sample_Interlock);
        Ada_Struct.Fragment_Shader_Pixel_Interlock :=
            Utilities.To_Ada(C_Struct.Fragment_Shader_Pixel_Interlock);
        Ada_Struct.Fragment_Shader_Shading_Rate_Interlock :=
            Utilities.To_Ada(C_Struct.Fragment_Shader_Shading_Rate_Interlock);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_YCbCr_Image_Arrays_Features;
         C_Struct: in Physical_Device_YCbCr_Image_Arrays_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.YCbCr_Image_Arrays :=
            Utilities.To_Ada(C_Struct.YCbCr_Image_Arrays);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Provoking_Vertex_Features;
         C_Struct: in Physical_Device_Provoking_Vertex_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Provoking_Vertex_Last :=
            Utilities.To_Ada(C_Struct.Provoking_Vertex_Last);
        Ada_Struct.Transform_Feedback_Preserves_Provoking_Vertex :=
            Utilities.To_Ada
                (C_Struct.Transform_Feedback_Preserves_Provoking_Vertex);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Provoking_Vertex_Properties;
         C_Struct: in Physical_Device_Provoking_Vertex_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Provoking_Vertex_Mode_Per_Pipeline :=
            Utilities.To_Ada(C_Struct.Provoking_Vertex_Mode_Per_Pipeline);
        Ada_Struct.Transform_Feedback_Preserves_Triangle_Fan_Provoking_Vertex :=
            Utilities.To_Ada
          (C_Struct.Transform_Feedback_Preserves_Triangle_Fan_Provoking_Vertex);
    end To_Ada;

    function To_C
        (Struct: in
       Extensions.EXT.Pipeline_Rasterization_Provoking_Vertex_State_Create_Info)
        return Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_C is
        PRPVSCIC: Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_C;
    begin
        PRPVSCIC.Next := Extension_Records.To_C(Struct.Next);
        PRPVSCIC.Provoking_Vertex_Mode := Struct.Provoking_Vertex_Mode;

        return PRPVSCIC;
    end To_C;

    procedure Free
        (Struct: in out
            Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.EXT.Headless_Surface_Create_Info)
        return Headless_Surface_Create_Info_C is
        HSCIC: Headless_Surface_Create_Info_C;
    begin
        HSCIC.Next := Extension_Records.To_C(Struct.Next);
        HSCIC.Flags := Struct.Flags;

        return HSCIC;
    end To_C;

    procedure Free(Struct: in out Headless_Surface_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Shader_Atomic_Float_Features;
         C_Struct: in Physical_Device_Shader_Atomic_Float_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Shader_Buffer_Float_32_Atomics :=
            Utilities.To_Ada(C_Struct.Shader_Buffer_Float_32_Atomics);
        Ada_Struct.Shader_Buffer_Float_32_Atomic_Add :=
            Utilities.To_Ada(C_Struct.Shader_Buffer_Float_32_Atomic_Add);
        Ada_Struct.Shader_Buffer_Float_64_Atomics :=
            Utilities.To_Ada(C_Struct.Shader_Buffer_Float_64_Atomics);
        Ada_Struct.Shader_Buffer_Float_64_Atomic_Add :=
            Utilities.To_Ada(C_Struct.Shader_Buffer_Float_64_Atomic_Add);
        Ada_Struct.Shader_Shared_Float_32_Atomics :=
            Utilities.To_Ada(C_Struct.Shader_Shared_Float_32_Atomics);
        Ada_Struct.Shader_Shared_Float_32_Atomic_Add :=
            Utilities.To_Ada(C_Struct.Shader_Shared_Float_32_Atomic_Add);
        Ada_Struct.Shader_Shared_Float_64_Atomics :=
            Utilities.To_Ada(C_Struct.Shader_Shared_Float_64_Atomics);
        Ada_Struct.Shader_Shared_Float_64_Atomic_Add :=
            Utilities.To_Ada(C_Struct.Shader_Shared_Float_64_Atomic_Add);
        Ada_Struct.Sparse_Image_Float_32_Atomics :=
            Utilities.To_Ada(C_Struct.Sparse_Image_Float_32_Atomics);
        Ada_Struct.Sparse_Image_Float_32_Atomic_Add :=
            Utilities.To_Ada(C_Struct.Sparse_Image_Float_32_Atomic_Add);
        Ada_Struct.Sparse_Image_Float_64_Atomics :=
            Utilities.To_Ada(C_Struct.Sparse_Image_Float_64_Atomics);
        Ada_Struct.Sparse_Image_Float_64_Atomic_Add :=
            Utilities.To_Ada(C_Struct.Sparse_Image_Float_64_Atomic_Add);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Map_Memory_Placed_Features;
         C_Struct: in Physical_Device_Map_Memory_Placed_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Memory_Map_Placed :=
            Utilities.To_Ada(C_Struct.Memory_Map_Placed);
        Ada_Struct.Memory_Map_Range_Placed :=
            Utilities.To_Ada(C_Struct.Memory_Map_Range_Placed);
        Ada_Struct.Memory_Unmap_Reserve :=
            Utilities.To_Ada(C_Struct.Memory_Unmap_Reserve);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Map_Memory_Placed_Properties;
         C_Struct: in Physical_Device_Map_Memory_Placed_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Min_Placed_Memory_Map_Alignment :=
            C_Struct.Min_Placed_Memory_Map_Alignment;
    end To_Ada;

    function To_C(Struct: in Extensions.EXT.Memory_Map_Placed_Info)
        return Memory_Map_Placed_Info_C is
        MMPIC: Memory_Map_Placed_Info_C;
    begin
        MMPIC.Next := Extension_Records.To_C(Struct.Next);
        MMPIC.Placed_Address := Struct.Placed_Address;

        return MMPIC;
    end To_C;

    procedure Free(Struct: in out Memory_Map_Placed_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Shader_Atomic_Float_2_Features;
         C_Struct: in Physical_Device_Shader_Atomic_Float_2_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Shader_Buffer_Float_16_Atomics :=
            Utilities.To_Ada(C_Struct.Shader_Buffer_Float_16_Atomics);
        Ada_Struct.Shader_Buffer_Float_16_Atomic_Add :=
            Utilities.To_Ada(C_Struct.Shader_Buffer_Float_16_Atomic_Add);
        Ada_Struct.Shader_Buffer_Float_16_Atomic_Min_Max :=
            Utilities.To_Ada(C_Struct.Shader_Buffer_Float_16_Atomic_Min_Max);
        Ada_Struct.Shader_Buffer_Float_32_Atomic_Min_Max :=
            Utilities.To_Ada(C_Struct.Shader_Buffer_Float_32_Atomic_Min_Max);
        Ada_Struct.Shader_Buffer_Float_64_Atomic_Min_Max :=
            Utilities.To_Ada(C_Struct.Shader_Buffer_Float_64_Atomic_Min_Max);
        Ada_Struct.Shader_Shared_Float_16_Atomics :=
            Utilities.To_Ada(C_Struct.Shader_Shared_Float_16_Atomics);
        Ada_Struct.Shader_Shared_Float_16_Atomic_Add :=
            Utilities.To_Ada(C_Struct.Shader_Shared_Float_16_Atomic_Add);
        Ada_Struct.Shader_Shared_Float_16_Atomic_Min_Max :=
            Utilities.To_Ada(C_Struct.Shader_Shared_Float_16_Atomic_Min_Max);
        Ada_Struct.Shader_Shared_Float_32_Atomic_Min_Max :=
            Utilities.To_Ada(C_Struct.Shader_Shared_Float_32_Atomic_Min_Max);
        Ada_Struct.Shader_Shared_Float_64_Atomic_Min_Max :=
            Utilities.To_Ada(C_Struct.Shader_Shared_Float_64_Atomic_Min_Max);
        Ada_Struct.Shader_Image_Float_32_Atomic_Min_Max :=
            Utilities.To_Ada(C_Struct.Shader_Image_Float_32_Atomic_Min_Max);
        Ada_Struct.Sparse_Image_Float_32_Atomic_Min_Max :=
            Utilities.To_Ada(C_Struct.Sparse_Image_Float_32_Atomic_Min_Max);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Depth_Bias_Control_Features;
         C_Struct: in Physical_Device_Depth_Bias_Control_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Depth_Bias_Control :=
            Utilities.To_Ada(C_Struct.Depth_Bias_Control);
        Ada_Struct.Least_Representable_Value_Force_Unorm_Representation :=
            Utilities.To_Ada
                (C_Struct.Least_Representable_Value_Force_Unorm_Representation);
        Ada_Struct.Float_Representation :=
            Utilities.To_Ada(C_Struct.Float_Representation);
        Ada_Struct.Depth_Bias_Exact :=
            Utilities.To_Ada(C_Struct.Depth_Bias_Exact);
    end To_Ada;

    function To_C(Struct: in Extensions.EXT.Depth_Bias_Info)
        return Depth_Bias_Info_C is
        DBIC: Depth_Bias_Info_C;
    begin
        DBIC.Next := Extension_Records.To_C(Struct.Next);
        DBIC.Depth_Bias_Constant_Factor := Struct.Depth_Bias_Constant_Factor;
        DBIC.Depth_Bias_Clamp := Struct.Depth_Bias_Clamp;
        DBIC.Depth_Bias_Slope_Factor := Struct.Depth_Bias_Slope_Factor;

        return DBIC;
    end To_C;

    procedure Free(Struct: in out Depth_Bias_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.EXT.Depth_Bias_Representation_Info)
        return Depth_Bias_Representation_Info_C is
        DBRIC: Depth_Bias_Representation_Info_C;
    begin
        DBRIC.Next := Extension_Records.To_C(Struct.Next);
        DBRIC.Depth_Bias_Representation := Struct.Depth_Bias_Representation;
        DBRIC.Depth_Bias_Exact := Utilities.To_C(Struct.Depth_Bias_Exact);

        return DBRIC;
    end To_C;

    procedure Free(Struct: in out Depth_Bias_Representation_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Device_Memory_Report_Features;
         C_Struct: in Physical_Device_Device_Memory_Report_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Device_Memory_Report :=
            Utilities.To_Ada(C_Struct.Device_Memory_Report);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Device_Memory_Report_Callback_Data;
         C_Struct: in Device_Memory_Report_Callback_Data_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Flags := C_Struct.Flags;
        Ada_Struct.Event_Type := C_Struct.Event_Type;
        Ada_Struct.Memory_Object_ID := C_Struct.Memory_Object_ID;
        Ada_Struct.Size := C_Struct.Size;
        Ada_Struct.Object_Type := C_Struct.Object_Type;
        Ada_Struct.Object_Handle := C_Struct.Object_Handle;
        Ada_Struct.Heap_Index := C_Struct.Heap_Index;
    end To_Ada;

    function To_C
        (Struct: in Extensions.EXT.Device_Device_Memory_Report_Create_Info)
        return Device_Device_Memory_Report_Create_Info_C is
        DDMRCIC: Device_Device_Memory_Report_Create_Info_C;
    begin
        DDMRCIC.Next := Extension_Records.To_C(Struct.Next);
        DDMRCIC.Flags := Struct.Flags;

        return DDMRCIC;
    end To_C;

    procedure Free(Struct: in out Device_Device_Memory_Report_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C
        (Struct: in Extensions.EXT.Sampler_Custom_Border_Color_Create_Info)
        return Sampler_Custom_Border_Color_Create_Info_C is
        SCBCCIC: Sampler_Custom_Border_Color_Create_Info_C;
    begin
        SCBCCIC.Next := Extension_Records.To_C(Struct.Next);
        SCBCCIC.Custom_Border_Color := C.To_C(Struct.Custom_Border_Color);
        SCBCCIC.Format := Struct.Format;

        return SCBCCIC;
    end To_C;

    procedure Free(Struct: in out Sampler_Custom_Border_Color_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Custom_Border_Color_Properties;
         C_Struct: in Physical_Device_Custom_Border_Color_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Max_Custom_Border_Color_Samplers :=
            C_Struct.Max_Custom_Border_Color_Samplers;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Custom_Border_Color_Features;
         C_Struct: in Physical_Device_Custom_Border_Color_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Custom_Border_Colors :=
            Utilities.To_Ada(C_Struct.Custom_Border_Colors);
        Ada_Struct.Custom_Border_Color_Without_Format :=
            Utilities.To_Ada(C_Struct.Custom_Border_Color_Without_Format);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Descriptor_Buffer_Properties;
         C_Struct: in Physical_Device_Descriptor_Buffer_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Combined_Image_Sampler_Descriptor_Single_Array :=
            Utilities.To_Ada
                (C_Struct.Combined_Image_Sampler_Descriptor_Single_Array);
        Ada_Struct.Bufferless_Push_Descriptors :=
            Utilities.To_Ada(C_Struct.Bufferless_Push_Descriptors);
        Ada_Struct.Allow_Sampler_Image_View_Post_Submit_Creation :=
            Utilities.To_Ada
                (C_Struct.Allow_Sampler_Image_View_Post_Submit_Creation);
        Ada_Struct.Descriptor_Buffer_Offset_Alignment :=
            C_Struct.Descriptor_Buffer_Offset_Alignment;
        Ada_Struct.Max_Descriptor_Buffer_Bindings :=
            C_Struct.Max_Descriptor_Buffer_Bindings;
        Ada_Struct.Max_Resource_Descriptor_Buffer_Bindings :=
            C_Struct.Max_Resource_Descriptor_Buffer_Bindings;
        Ada_Struct.Max_Sampler_Descriptor_Buffer_Bindings :=
            C_Struct.Max_Sampler_Descriptor_Buffer_Bindings;
        Ada_Struct.Max_Embedded_Immutable_Sampler_Bindings :=
            C_Struct.Max_Embedded_Immutable_Sampler_Bindings;
        Ada_Struct.Max_Embedded_Immutable_Samplers :=
            C_Struct.Max_Embedded_Immutable_Samplers;
        Ada_Struct.Buffer_Capture_Replay_Descriptor_Data_Size :=
            C_Struct.Buffer_Capture_Replay_Descriptor_Data_Size;
        Ada_Struct.Image_Capture_Replay_Descriptor_Data_Size :=
            C_Struct.Image_Capture_Replay_Descriptor_Data_Size;
        Ada_Struct.Image_View_Capture_Replay_Descriptor_Data_Size :=
            C_Struct.Image_View_Capture_Replay_Descriptor_Data_Size;
        Ada_Struct.Sampler_Capture_Replay_Descriptor_Data_Size :=
            C_Struct.Sampler_Capture_Replay_Descriptor_Data_Size;
        Ada_Struct.Acceleration_Structure_Capture_Replay_Descriptor_Data_Size :=
            C_Struct.Acceleration_Structure_Capture_Replay_Descriptor_Data_Size;
        Ada_Struct.Sampler_Descriptor_Size := C_Struct.Sampler_Descriptor_Size;
        Ada_Struct.Combined_Image_Sampler_Descriptor_Size :=
            C_Struct.Combined_Image_Sampler_Descriptor_Size;
        Ada_Struct.Sampled_Image_Descriptor_Size :=
            C_Struct.Sampled_Image_Descriptor_Size;
        Ada_Struct.Storage_Image_Descriptor_Size :=
            C_Struct.Storage_Image_Descriptor_Size;
        Ada_Struct.Uniform_Texel_Buffer_Descriptor_Size :=
            C_Struct.Uniform_Texel_Buffer_Descriptor_Size;
        Ada_Struct.Robust_Uniform_Texel_Buffer_Descriptor_Size :=
            C_Struct.Robust_Uniform_Texel_Buffer_Descriptor_Size;
        Ada_Struct.Storage_Texel_Buffer_Descriptor_Size :=
            C_Struct.Storage_Texel_Buffer_Descriptor_Size;
        Ada_Struct.Robust_Storage_Texel_Buffer_Descriptor_Size :=
            C_Struct.Robust_Storage_Texel_Buffer_Descriptor_Size;
        Ada_Struct.Uniform_Buffer_Descriptor_Size :=
            C_Struct.Uniform_Buffer_Descriptor_Size;
        Ada_Struct.Robust_Uniform_Buffer_Descriptor_Size :=
            C_Struct.Robust_Uniform_Buffer_Descriptor_Size;
        Ada_Struct.Storage_Buffer_Descriptor_Size :=
            C_Struct.Storage_Buffer_Descriptor_Size;
        Ada_Struct.Robust_Storage_Buffer_Descriptor_Size :=
            C_Struct.Robust_Storage_Buffer_Descriptor_Size;
        Ada_Struct.Input_Attachment_Descriptor_Size :=
            C_Struct.Input_Attachment_Descriptor_Size;
        Ada_Struct.Acceleration_Structure_Descriptor_Size :=
            C_Struct.Acceleration_Structure_Descriptor_Size;
        Ada_Struct.Max_Sampler_Descriptor_Buffer_Range :=
            C_Struct.Max_Sampler_Descriptor_Buffer_Range;
        Ada_Struct.Max_Resource_Descriptor_Buffer_Range :=
            C_Struct.Max_Resource_Descriptor_Buffer_Range;
        Ada_Struct.Sampler_Descriptor_Buffer_Address_Space_Size :=
            C_Struct.Sampler_Descriptor_Buffer_Address_Space_Size;
        Ada_Struct.Resource_Descriptor_Buffer_Address_Space_Size :=
            C_Struct.Resource_Descriptor_Buffer_Address_Space_Size;
        Ada_Struct.Descriptor_Buffer_Address_Space_Size :=
            C_Struct.Descriptor_Buffer_Address_Space_Size;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
        Extensions.EXT.Physical_Device_Descriptor_Buffer_Density_Map_Properties;
         C_Struct: in
            Physical_Device_Descriptor_Buffer_Density_Map_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Combined_Image_Sampler_Density_Map_Descriptor_Size :=
            C_Struct.Combined_Image_Sampler_Density_Map_Descriptor_Size;
    end To_Ada;
 
    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Descriptor_Buffer_Features;
         C_Struct: in Physical_Device_Descriptor_Buffer_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Descriptor_Buffer :=
            Utilities.To_Ada(C_Struct.Descriptor_Buffer);
        Ada_Struct.Descriptor_Buffer_Capture_Replay :=
            Utilities.To_Ada(C_Struct.Descriptor_Buffer_Capture_Replay);
        Ada_Struct.Descriptor_Buffer_Image_Layout_Ignored :=
            Utilities.To_Ada(C_Struct.Descriptor_Buffer_Image_Layout_Ignored);
        Ada_Struct.Descriptor_Buffer_Push_Descriptors :=
            Utilities.To_Ada(C_Struct.Descriptor_Buffer_Push_Descriptors);
    end To_Ada;

    procedure To_Ada(Ada_Struct: in out Extensions.EXT.Descriptor_Address_Info;
                     C_Struct: in Descriptor_Address_Info_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Address := C_Struct.Address;
        Ada_Struct.Address_Range := C_Struct.Address_Range;
        Ada_Struct.Format := C_Struct.Format;
    end To_Ada;
    
    function To_C(Struct: in Extensions.EXT.Descriptor_Buffer_Binding_Info)
        return Descriptor_Buffer_Binding_Info_C is
        DBBIC: Descriptor_Buffer_Binding_Info_C;
    begin
        DBBIC.Next := Extension_Records.To_C(Struct.Next);
        DBBIC.Address := Struct.Address;
        DBBIC.Usage := Struct.Usage;

        return DBBIC;
    end To_C;

    procedure Free(Struct: in out Descriptor_Buffer_Binding_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C
        (Struct: in
         Extensions.EXT.Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle)
        return Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_C is
        DBBPDBHC: Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_C;
    begin
        DBBPDBHC.Next := Extension_Records.To_C(Struct.Next);
        DBBPDBHC.Buffer := Struct.Buffer;

        return DBBPDBHC;
    end To_C;

    procedure Free
        (Struct: in out
            Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.EXT.Descriptor_Get_Info)
        return Descriptor_Get_Info_C is
        DGIC: Descriptor_Get_Info_C;
    begin
        DGIC.Next := Extension_Records.To_C(Struct.Next);
        DGIC.Descriptor_Type := Struct.Descriptor_Type;

        case Struct.Descriptor_Type is
            when Type_Sampler =>
                DGIC.Data.Sampler := Struct.Sampler;
            when Combined_Image_Sampler =>
                DGIC.Data.Combined_Image_Sampler :=
                    Struct.Combined_Image_Sampler;
            when Input_Attachment =>
                DGIC.Data.Input_Attachment_Image :=
                    Struct.Input_Attachment_Image;
            when Sampled_Image =>
                DGIC.Data.Sampled_Image := Struct.Sampled_Image;
            when Storage_Image =>
                DGIC.Data.Storage_Image := Struct.Storage_Image;
            when Uniform_Texel_Buffer =>
                DGIC.Data.Uniform_Texel_Buffer := new Descriptor_Address_Info_C;
                DGIC.Data.Uniform_Texel_Buffer.Next := Extension_Records.To_C
                    (Struct.Uniform_Texel_Buffer.Next);
            when Storage_Texel_Buffer =>
                DGIC.Data.Storage_Texel_Buffer := new Descriptor_Address_Info_C;
                DGIC.Data.Storage_Texel_Buffer.Next := Extension_Records.To_C
                    (Struct.Storage_Texel_Buffer.Next);
            when Uniform_Buffer =>
                DGIC.Data.Uniform_Buffer := new Descriptor_Address_Info_C;
                DGIC.Data.Uniform_Buffer.Next := Extension_Records.To_C
                    (Struct.Uniform_Buffer.Next);
            when Storage_Buffer =>
                DGIC.Data.Storage_Buffer := new Descriptor_Address_Info_C;
                DGIC.Data.Storage_Buffer.Next := Extension_Records.To_C
                    (Struct.Storage_Buffer.Next);
            when Acceleration_Structure_KHR =>
                DGIC.Data.Acceleration_Structure :=
                    Struct.Acceleration_Structure;
        end case;

        return DGIC;
    end To_C;

    procedure Free(Struct: in out Descriptor_Get_Info_C) is
        procedure Free is
            new Ada.Unchecked_Deallocation(Descriptor_Address_Info_C,
                                           Descriptor_Address_Info_C_Access);
    begin
        Extension_Records.Free(Struct.Next);

        case Struct.Descriptor_Type is
            when Uniform_Texel_Buffer =>
                Extension_Records.Free(Struct.Data.Uniform_Texel_Buffer.Next);
                Free(Struct.Data.Uniform_Texel_Buffer);
            when Storage_Texel_Buffer =>
                Extension_Records.Free(Struct.Data.Storage_Texel_Buffer.Next);
                Free(Struct.Data.Storage_Texel_Buffer);
            when Uniform_Buffer =>
                Extension_Records.Free(Struct.Data.Uniform_Buffer.Next);
                Free(Struct.Data.Uniform_Buffer);
            when Storage_Buffer =>
                Extension_Records.Free(Struct.Data.Storage_Buffer.Next);
                Free(Struct.Data.Storage_Buffer);
            when others =>
                null;
        end case;
    end Free;

    function To_C(Struct: in Extensions.EXT.Buffer_Capture_Descriptor_Data_Info)
        return Buffer_Capture_Descriptor_Data_Info_C is
        BCDDIC: Buffer_Capture_Descriptor_Data_Info_C;
    begin
        BCDDIC.Next := Extension_Records.To_C(Struct.Next);
        BCDDIC.Buffer := Struct.Buffer;

        return BCDDIC;
    end To_C;

    procedure Free(Struct: in out Buffer_Capture_Descriptor_Data_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.EXT.Image_Capture_Descriptor_Data_Info)
        return Image_Capture_Descriptor_Data_Info_C is
        ICDDIC: Image_Capture_Descriptor_Data_Info_C;
    begin
        ICDDIC.Next := Extension_Records.To_C(Struct.Next);
        ICDDIC.Image := Struct.Image;

        return ICDDIC;
    end To_C;

    procedure Free(Struct: in out Image_Capture_Descriptor_Data_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C
        (Struct: in Extensions.EXT.Image_View_Capture_Descriptor_Data_Info)
        return Image_View_Capture_Descriptor_Data_Info_C is
        IVCDDIC: Image_View_Capture_Descriptor_Data_Info_C;
    begin
        IVCDDIC.Next := Extension_Records.To_C(Struct.Next);
        IVCDDIC.Image_View := Struct.Image_View;

        return IVCDDIC;
    end To_C;

    procedure Free(Struct: in out Image_View_Capture_Descriptor_Data_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C
        (Struct: in Extensions.EXT.Sampler_Capture_Descriptor_Data_Info)
        return Sampler_Capture_Descriptor_Data_Info_C is
        SCDDIC: Sampler_Capture_Descriptor_Data_Info_C;
    begin
        SCDDIC.Next := Extension_Records.To_C(Struct.Next);
        SCDDIC.Sampler := Struct.Sampler;

        return SCDDIC;
    end To_C;

    procedure Free(Struct: in out Sampler_Capture_Descriptor_Data_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C
        (Struct: in Extensions.EXT.Opaque_Capture_Descriptor_Data_Create_Info)
        return Opaque_Capture_Descriptor_Data_Create_Info_C is
        OCDDCIC: Opaque_Capture_Descriptor_Data_Create_Info_C;
    begin
        OCDDCIC.Next := Extension_Records.To_C(Struct.Next);
        OCDDCIC.Opaque_Capture_Descriptor_Data :=
            Struct.Opaque_Capture_Descriptor_Data;

        return OCDDCIC;
    end To_C;

    procedure Free
        (Struct: in out Opaque_Capture_Descriptor_Data_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C
        (Struct: in
            Extensions.EXT.Acceleration_Structure_Capture_Descriptor_Data_Info)
        return Acceleration_Structure_Capture_Descriptor_Data_Info_C is
        ASCDDIC: Acceleration_Structure_Capture_Descriptor_Data_Info_C;
    begin
        ASCDDIC.Next := Extension_Records.To_C(Struct.Next);
        ASCDDIC.Acceleration_Structure := Struct.Acceleration_Structure;
        ASCDDIC.Acceleration_Structure_NV := Struct.Acceleration_Structure_NV;

        return ASCDDIC;
    end To_C;

    procedure Free
        (Struct: in out
            Acceleration_Structure_Capture_Descriptor_Data_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Graphics_Pipeline_Library_Features;
         C_Struct: in Physical_Device_Graphics_Pipeline_Library_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Graphics_Pipeline_Library :=
            Utilities.To_Ada(C_Struct.Graphics_Pipeline_Library);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Graphics_Pipeline_Library_Properties;
         C_Struct: in Physical_Device_Graphics_Pipeline_Library_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Graphics_Pipeline_Library_Fast_Linking :=
            Utilities.To_Ada(C_Struct.Graphics_Pipeline_Library_Fast_Linking);
        Ada_Struct.
            Graphics_Pipeline_Library_Independent_Interpolation_Decoration :=
                Utilities.To_Ada(C_Struct.
                Graphics_Pipeline_Library_Independent_Interpolation_Decoration);
    end To_Ada;

    function To_C
        (Struct: in Extensions.EXT.Graphics_Pipeline_Library_Create_Info)
        return Graphics_Pipeline_Library_Create_Info_C is
        GPLCIC: Graphics_Pipeline_Library_Create_Info_C;
    begin
        GPLCIC.Next := Extension_Records.To_C(Struct.Next);
        GPLCIC.Flags := Struct.Flags;

        return GPLCIC;
    end To_C;

    procedure Free(Struct: in out Graphics_Pipeline_Library_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Fragment_Density_Map_2_Features;
         C_Struct: in Physical_Device_Fragment_Density_Map_2_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Fragment_Density_Map_Deferred :=
            Utilities.To_Ada(C_Struct.Fragment_Density_Map_Deferred);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Fragment_Density_Map_2_Properties;
         C_Struct: in Physical_Device_Fragment_Density_Map_2_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Subsampled_Loads :=
            Utilities.To_Ada(C_Struct.Subsampled_Loads);
        Ada_Struct.Subsampled_Coarse_Reconstruction_Early_Access :=
            Utilities.To_Ada
                (C_Struct.Subsampled_Coarse_Reconstruction_Early_Access);
        Ada_Struct.Max_Subsampled_Array_Layers :=
            C_Struct.Max_Subsampled_Array_Layers;
        Ada_Struct.Max_Descriptor_Set_Subsampled_Samplers :=
            C_Struct.Max_Descriptor_Set_Subsampled_Samplers;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Image_Compression_Control_Features;
         C_Struct: in Physical_Device_Image_Compression_Control_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Image_Compression_Control :=
            Utilities.To_Ada(C_Struct.Image_Compression_Control);
    end To_Ada;

    function To_C(Struct: in Extensions.EXT.Image_Compression_Control)
        return Image_Compression_Control_C is
        procedure To_C_Array is new Utilities.To_C_Array
            (Image_Compression_Fixed_Rate_Flags_Arrays,
             Extensions.EXT.Image_Compression_Fixed_Rate_Flags_Vectors);

        ICCC: Image_Compression_Control_C;
    begin
        ICCC.Next := Extension_Records.To_C(Struct.Next);
        ICCC.Flags := Struct.Flags;
        To_C_Array(ICCC.Compression_Control_Plane_Count,
                   Struct.Fixed_Rate_Flags,
                   ICCC.Fixed_Rate_Flags);

        return ICCC;
    end To_C;

    procedure Free(Struct: in out Image_Compression_Control_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Image_Compression_Fixed_Rate_Flags_Arrays.Free(Struct.Fixed_Rate_Flags);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Image_Compression_Properties;
         C_Struct: in Image_Compression_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Image_Compression_Flags := C_Struct.Image_Compression_Flags;
        Ada_Struct.Image_Compression_Fixed_Rate_Flags :=
            C_Struct.Image_Compression_Fixed_Rate_Flags;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
       Extensions.EXT.Physical_Device_Attachment_Feedback_Loop_Layout_Features;
       C_Struct: in Physical_Device_Attachment_Feedback_Loop_Layout_Features_C)
        is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Attachment_Feedback_Loop_Layout :=
            Utilities.To_Ada(C_Struct.Attachment_Feedback_Loop_Layout);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Physical_Device_Fault_Features;
         C_Struct: in Physical_Device_Fault_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Device_Fault := Utilities.To_Ada(C_Struct.Device_Fault);
        Ada_Struct.Device_Fault_Vendor_Binary :=
            Utilities.To_Ada(C_Struct.Device_Fault_Vendor_Binary);
    end To_Ada;

    procedure To_Ada(Ada_Struct: in out Extensions.EXT.Device_Fault_Counts;
                     C_Struct: in Device_Fault_Counts_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Address_Info_Count := C_Struct.Address_Info_Count;
        Ada_Struct.Vendor_Info_Count := C_Struct.Vendor_Info_Count;
        Ada_Struct.Vendor_Binary_Size := C_Struct.Vendor_Binary_Size;
    end To_Ada;

    procedure To_Ada(Ada_Struct: in out Extensions.EXT.Device_Fault_Vendor_Info;
                     C_Struct: in Device_Fault_Vendor_Info_C) is
    begin
        Ada.Strings.Unbounded.Set_Unbounded_String
            (Ada_Struct.Description, Interfaces.C.To_Ada(C_Struct.Description));
        Ada_Struct.Vendor_Fault_Code := C_Struct.Vendor_Fault_Code;
        Ada_Struct.Vendor_Fault_Data := C_Struct.Vendor_Fault_Data;
    end To_Ada;

    procedure To_Ada(Ada_Struct: in out Extensions.EXT.Device_Fault_Info;
                     C_Struct: in Device_Fault_Info_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada.Strings.Unbounded.Set_Unbounded_String
            (Ada_Struct.Description, Interfaces.C.To_Ada(C_Struct.Description));
        Ada_Struct.Vendor_Binary_Data := C_Struct.Vendor_Binary_Data;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_RGBA10x6_Formats_Features;
         C_Struct: in Physical_Device_RGBA10x6_Formats_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Format_RGBA10x6_Without_YCbCr_Sampler :=
            Utilities.To_Ada(C_Struct.Format_RGBA10x6_Without_YCbCr_Sampler);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Vertex_Input_Dynamic_State_Features;
         C_Struct: in Physical_Device_Vertex_Input_Dynamic_State_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Vertex_Input_Dynamic_State :=
            Utilities.To_Ada(C_Struct.Vertex_Input_Dynamic_State);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Vertex_Input_Binding_Description_2;
         C_Struct: in Vertex_Input_Binding_Description_2_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Binding := C_Struct.Binding;
        Ada_Struct.Stride := C_Struct.Stride;
        Ada_Struct.Input_Rate := C_Struct.Input_Rate;
        Ada_Struct.Divisor := C_Struct.Divisor;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Vertex_Input_Attribute_Description_2;
         C_Struct: in Vertex_Input_Attribute_Description_2_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Location := C_Struct.Location;
        Ada_Struct.Binding := C_Struct.Binding;
        Ada_Struct.Format := C_Struct.Format;
        Ada_Struct.Offset := C_Struct.Offset;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Physical_Device_DRM_Properties;
         C_Struct: in Physical_Device_DRM_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Has_Primary := Utilities.To_Ada(C_Struct.Has_Primary);
        Ada_Struct.Has_Render := Utilities.To_Ada(C_Struct.Has_Render);
        Ada_Struct.Primary_Major := C_Struct.Primary_Major;
        Ada_Struct.Primary_Minor := C_Struct.Primary_Minor;
        Ada_Struct.Render_Major := C_Struct.Render_Major;
        Ada_Struct.Render_Minor := C_Struct.Render_Minor;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Address_Binding_Report_Features;
         C_Struct: in Physical_Device_Address_Binding_Report_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Report_Address_Binding :=
            Utilities.To_Ada(C_Struct.Report_Address_Binding);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Device_Address_Binding_Callback_Data;
         C_Struct: in Device_Address_Binding_Callback_Data_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Flags := C_Struct.Flags;
        Ada_Struct.Base_Address := C_Struct.Base_Address;
        Ada_Struct.Size := C_Struct.Size;
        Ada_Struct.Binding_Type := C_Struct.Binding_Type;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Depth_Clip_Control_Features;
         C_Struct: in Physical_Device_Depth_Clip_Control_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Depth_Clip_Control :=
            Utilities.To_Ada(C_Struct.Depth_Clip_Control);
    end To_Ada;

    function To_C
        (Struct: in
            Extensions.EXT.Pipeline_Viewport_Depth_Clip_Control_Create_Info)
        return Pipeline_Viewport_Depth_Clip_Control_Create_Info_C is
        PVDCCCIC: Pipeline_Viewport_Depth_Clip_Control_Create_Info_C;
    begin
        PVDCCCIC.Next := Extension_Records.To_C(Struct.Next);
        PVDCCCIC.Negative_One_To_One :=
            Utilities.To_C(Struct.Negative_One_To_One);

        return PVDCCCIC;
    end To_C;

    procedure Free
        (Struct: in out Pipeline_Viewport_Depth_Clip_Control_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
        Extensions.EXT.Physical_Device_Primitive_Topology_List_Restart_Features;
         C_Struct: in
            Physical_Device_Primitive_Topology_List_Restart_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Primitive_Topology_List_Restart :=
            Utilities.To_Ada(C_Struct.Primitive_Topology_List_Restart);
        Ada_Struct.Primitive_Topology_Patch_List_Restart :=
            Utilities.To_Ada(C_Struct.Primitive_Topology_Patch_List_Restart);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Pipeline_Properties_Identifier;
         C_Struct: in Pipeline_Properties_Identifier_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Pipeline_Identifier := C_Struct.Pipeline_Identifier;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Pipeline_Properties_Features;
         C_Struct: in Physical_Device_Pipeline_Properties_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Pipeline_Properties_Identifier :=
            Utilities.To_Ada(C_Struct.Pipeline_Properties_Identifier);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Frame_Boundary_Features;
         C_Struct: in Physical_Device_Frame_Boundary_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Frame_Boundary := Utilities.To_Ada(C_Struct.Frame_Boundary);
    end To_Ada;

    function To_C(Struct: in Extensions.EXT.Frame_Boundary)
        return Frame_Boundary_C is
        procedure To_C_Array is new Utilities.To_C_Array(Image_Arrays,
                                                         Image_Vectors);
        procedure To_C_Array is new Utilities.To_C_Array(Buffer_Arrays,
                                                         Buffer_Vectors);
        
        FBC: Frame_Boundary_C;
    begin
        FBC.Next := Extension_Records.To_C(Struct.Next);
        FBC.Flags := Struct.Flags;
        FBC.Frame_ID := Struct.Frame_ID;
        To_C_Array(FBC.Image_Count, Struct.Images, FBC.Images);
        To_C_Array(FBC.Buffer_Count, Struct.Buffers, FBC.Buffers);
        FBC.Tag_Name := Struct.Tag_Name;
        FBC.Tag_Size := Struct.Tag_Size;
        FBC.Tag := Struct.Tag;

        return FBC;
    end To_C;

    procedure Free(Struct: in out Frame_Boundary_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Image_Arrays.Free(Struct.Images);
        Buffer_Arrays.Free(Struct.Buffers);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Multisampled_Render_To_Single_Sampled_Features;
         C_Struct: in Physical_Device_Multisampled_Render_To_Single_Sampled_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Multisampled_Render_to_Single_Sampled :=
            Utilities.To_Ada(C_Struct.Multisampled_Render_To_Single_Sampled);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Subpass_Resolve_Performance_Query;
         C_Struct: in Subpass_Resolve_Performance_Query_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, c_Struct.Next);
        Ada_Struct.Optimal := Utilities.To_Ada(C_Struct.Optimal);
    end To_Ada;

    function To_C
        (Struct: in Extensions.EXT.Multisampled_Render_To_Single_Sampled_Info)
        return Multisampled_Render_To_Single_Sampled_Info_C is
        MRTSSIC: Multisampled_Render_To_Single_Sampled_Info_C;
    begin
        MRTSSIC.Next := Extension_Records.To_C(Struct.Next);
        MRTSSIC.Multisampled_Render_To_Single_Sampled_Enable :=
            Utilities.To_C(Struct.Multisampled_Render_To_Single_Sampled_Enable);
        MRTSSIC.Rasterization_Samples := Struct.Rasterization_Samples;

        return MRTSSIC;
    end To_C;

    procedure Free
        (Struct: in out Multisampled_Render_To_Single_Sampled_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Color_Write_Enable_Features;
         C_Struct: in Physical_Device_Color_Write_Enable_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Color_Write_Enable :=
            Utilities.To_Ada(C_Struct.Color_Write_Enable);
    end To_Ada;

    function To_C(Struct: in Extensions.EXT.Pipeline_Color_Write_Create_Info)
        return Pipeline_Color_Write_Create_Info_C is
        procedure To_C_Array is
            new Utilities.To_C_Array_Convert(C.Uint32_t_Arrays,
                                             Boolean_Vectors,
                                             Utilities.To_C);

        PCWCIC: Pipeline_Color_Write_Create_Info_C;
    begin
        PCWCIC.Next := Extension_Records.To_C(Struct.Next);
        To_C_Array(PCWCIC.Attachment_Count,
                   Struct.Color_Write_Enables,
                   PCWCIC.Color_Write_Enables);

        return PCWCIC;
    end To_C;

    procedure Free(Struct: in out Pipeline_Color_Write_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        C.Uint32_t_Arrays.Free(Struct.Color_Write_Enables);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Primitives_Generated_Query_Features;
         C_Struct: in Physical_Device_Primitives_Generated_Query_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Primitives_Generated_Query :=
            Utilities.To_Ada(C_Struct.Primitives_Generated_Query);
        Ada_Struct.Primitives_Generated_Query_With_Rasterizer_Discard :=
            Utilities.To_Ada
                (C_Struct.Primitives_Generated_Query_With_Rasterizer_Discard);
        Ada_Struct.Primitives_Generated_Query_With_Non_Zero_Streams :=
            Utilities.To_Ada
                (C_Struct.Primitives_Generated_Query_With_Non_Zero_Streams);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Image_View_Min_LOD_Features;
         C_Struct: in Physical_Device_Image_View_Min_LOD_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Min_LOD := Utilities.To_Ada(C_Struct.Min_LOD);
    end To_Ada;

    function To_C(Struct: in Extensions.EXT.Image_View_Min_LOD_Create_Info)
        return Image_View_Min_LOD_Create_Info_C is
        IVMLCIC: Image_View_Min_LOD_Create_Info_C;
    begin
        IVMLCIC.Next := Extension_Records.To_C(Struct.Next);
        IVMLCIC.Min_LOD := Struct.Min_LOD;

        return IVMLCIC;
    end To_C;

    procedure Free(Struct: in out Image_View_Min_LOD_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out Extensions.EXT.Physical_Device_Multi_Draw_Features;
         C_Struct: in Physical_Device_Multi_Draw_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Multi_Draw := Utilities.To_Ada(C_Struct.Multi_Draw);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Multi_Draw_Properties;
         C_Struct: in Physical_Device_Multi_Draw_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Max_Multi_Draw_Count := C_Struct.Max_Multi_Draw_Count;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Image_2D_View_Of_3D_Features;
         C_Struct: in Physical_Device_Image_2D_View_Of_3D_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Image_2D_View_Of_3D :=
            Utilities.To_Ada(C_Struct.Image_2D_View_Of_3D);
        Ada_Struct.Sampler_2D_View_Of_3D :=
            Utilities.To_Ada(C_Struct.Sampler_2D_View_Of_3D);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Shader_Tile_Image_Features;
         C_Struct: in Physical_Device_Shader_Tile_Image_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Shader_Tile_Image_Color_Read_Access :=
            Utilities.To_Ada(C_Struct.Shader_Tile_Image_Color_Read_Access);
        Ada_Struct.Shader_Tile_Image_Depth_Read_Access :=
            Utilities.To_Ada(C_Struct.Shader_Tile_Image_Depth_Read_Access);
        Ada_Struct.Shader_Tile_Image_Stencil_Read_Access :=
            Utilities.To_Ada(C_Struct.Shader_Tile_Image_Stencil_Read_Access);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Physical_Device_Shader_Tile_Image_Properties;
         C_Struct: in Physical_Device_Shader_Tile_Image_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Shader_Tile_Image_Coherent_Read_Accelerated :=
            Utilities.To_Ada
                (C_Struct.Shader_Tile_Image_Coherent_Read_Accelerated);
        Ada_Struct.Shader_Tile_Image_Read_Sample_From_Pixel_Rate_Invocation :=
            Utilities.To_Ada
            (C_Struct.Shader_Tile_Image_Read_Sample_From_Pixel_Rate_Invocation);
        Ada_Struct.Shader_Tile_Image_Read_From_Helper_Invocation :=
            Utilities.To_Ada
                (C_Struct.Shader_Tile_Image_Read_From_Helper_Invocation);
    end To_Ada;

    function To_C(Struct: in Extensions.EXT.Micromap_Build_Info)
        return Micromap_Build_Info_C is
        procedure To_C_Array is
            new Utilities.To_C_Array(Micromap_Usage_Arrays,
                                     Extensions.EXT.Micromap_Usage_Vectors);

        procedure To_C_Array is
            new Utilities.To_C_Array
                (Micromap_Usage_Access_Arrays,
                 Extensions.EXT.Micromap_Usage_Access_Vectors);

        MBIC: Micromap_Build_Info_C;
    begin
        MBIC.Next := Extension_Records.To_C(Struct.Next);
        MBIC.Micromap_Type := Struct.Micromap_Type;
        MBIC.Flags := Struct.Flags;
        MBIC.Mode := Struct.Mode;
        MBIC.Dst_Micromap := Struct.Dst_Micromap;

        if not Struct.Usage_Counts.Is_Empty then
            To_C_Array(MBIC.Usage_Counts_Count,
                       Struct.Usage_Counts,
                       MBIC.Usage_Counts);
        elsif not Struct.Usage_Counts_Access.Is_Empty then
            To_C_Array(MBIC.Usage_Counts_Count,
                       Struct.Usage_Counts_Access,
                       MBIC.Usage_Counts_Access);
        else
            MBIC.Usage_Counts_Count := 0;
        end if;

        C_KHR.To_C(MBIC.Data, Struct.Data);
        C_KHR.To_C(MBIC.Scratch_Data, Struct.Scratch_Data);
        C_KHR.To_C(MBIC.Triangle_Array, Struct.Triangle_Array);
        MBIC.Triangle_Array_Stride := Struct.Triangle_Array_Stride;
        
        return MBIC;
    end To_C;

    procedure Free(Struct: in out Micromap_Build_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Micromap_Usage_Arrays.Free(Struct.Usage_Counts);
        Micromap_Usage_Access_Arrays.Free(Struct.Usage_Counts_Access);
    end Free;

    function To_C(Struct: in Extensions.EXT.Micromap_Create_Info)
        return Micromap_Create_Info_C is
        MCIC: Micromap_Create_Info_C;
    begin
        MCIC.Next := Extension_Records.To_C(Struct.Next);
        MCIC.Create_Flags := Struct.Create_Flags;
        MCIC.Buffer := Struct.Buffer;
        MCIC.Offset := Struct.Offset;
        MCIC.Size := Struct.Size;
        MCIC.Micromap_Type := Struct.Micromap_Type;
        MCIC.Device_Address := Struct.Device_Address;

        return MCIC;
    end To_C;

    procedure Free(Struct: in out Micromap_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.EXT.Physical_Device_Opacity_Micromap_Features;
         C_Struct: in Physical_Device_Opacity_Micromap_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Micromap := Utilities.To_Ada(C_Struct.Micromap);
        Ada_Struct.Micromap_Capture_Replay :=
            Utilities.To_Ada(C_Struct.Micromap_Capture_Replay);
        Ada_Struct.Micromap_Host_Commands :=
            Utilities.To_Ada(C_Struct.Micromap_Host_Commands);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct:
            in out Extensions.EXT.Physical_Device_Opacity_Micromap_Properties;
         C_Struct: in Physical_Device_Opacity_Micromap_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Max_Opacity_2_State_Subdivision_Level :=
            C_Struct.Max_Opacity_2_State_Subdivision_Level;
        Ada_Struct.Max_Opacity_4_State_Subdivision_Level :=
            C_Struct.Max_Opacity_4_State_Subdivision_Level;
    end To_Ada;

    function To_C(Struct: in Extensions.EXT.Micromap_Version_Info)
        return Micromap_Version_Info_C is
        MVIC: Micromap_Version_Info_C;
    begin
        MVIC.Next := Extension_Records.To_C(Struct.Next);
        MVIC.Version_Data := Struct.Version_Data;

        return MVIC;
    end To_C;

    procedure Free(Struct: in out Micromap_Version_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.EXT.Copy_Micromap_To_Memory_Info)
        return Copy_Micromap_To_Memory_Info_C is
        CMTMIC: Copy_Micromap_To_Memory_Info_C;
    begin
        CMTMIC.Next := Extension_Records.To_C(Struct.Next);
        CMTMIC.Src := Struct.Src;
        C_KHR.To_C(CMTMIC.Dst, Struct.Dst);
        CMTMIC.Mode := Struct.Mode;

        return CMTMIC;
    end To_C;

    procedure Free(Struct: in out Copy_Micromap_To_Memory_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.EXT.Copy_Memory_To_Micromap_Info)
        return Copy_Memory_To_Micromap_Info_C is
        CMTMIC: Copy_Memory_To_Micromap_Info_C;
    begin
        CMTMIC.Next := Extension_Records.To_C(Struct.Next);
        C_KHR.To_C(CMTMIC.Src, Struct.Src);
        CMTMIC.Dst := Struct.Dst;
        CMTMIC.Mode := Struct.Mode;

        return CMTMIC;
    end To_C;

    procedure Free(Struct: in out Copy_Memory_To_Micromap_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.EXT.Copy_Micromap_Info)
        return Copy_Micromap_Info_C is
        CMIC: Copy_Micromap_Info_C;
    begin
        CMIC.Next := Extension_Records.To_C(Struct.Next);
        CMIC.Src := Struct.Src;
        CMIC.Dst := Struct.Dst;
        CMIC.Mode := Struct.Mode;

        return CMIC;
    end To_C;

    procedure Free(Struct: in out Copy_Micromap_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.EXT.Micromap_Build_Sizes_Info)
        return Micromap_Build_Sizes_Info_C is
        MBSIC: Micromap_Build_Sizes_Info_C;
    begin
        MBSIC.Next := Extension_Records.To_C(Struct.Next);
        MBSIC.Micromap_Size := Struct.Micromap_Size;
        MBSIC.Build_Scratch_Size := Struct.Build_Scratch_Size;
        MBSIC.Discardable := Utilities.To_C(Struct.Discardable);

        return MBSIC;
    end To_C;

    procedure Free(Struct: in out Micromap_Build_Sizes_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.EXT.Acceleration_Structure_Triangles_Opacity_Micromap;
         C_Struct: in Acceleration_Structure_Triangles_Opacity_Micromap_C) is
    begin
        null;
    end To_Ada;

    function To_C(Struct: in Extensions.EXT.Metal_Surface_Create_Info)
        return Metal_Surface_Create_Info_C is
        MSCIC: Metal_Surface_Create_Info_C;
    begin
        MSCIC.Next := Extension_Records.To_C(Struct.Next);
        MSCIC.Flags := Struct.Flags;
        MSCIC.Layer := Struct.Layer;

        return MSCIC;
    end To_C;

    procedure Free(Struct: in out Metal_Surface_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Next: in In_Structure_Access)
        return C.In_Structure_C_Access is
    begin
        if Next = null then
            return null;
        end if;

        case In_Structure(Next.Record_Type) is
            when Pipeline_Rasterization_State_Stream_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                (Extensions.EXT.Pipeline_Rasterization_State_Stream_Create_Info,
                 Pipeline_Rasterization_State_Stream_Create_Info_C,
                 Pipeline_Rasterization_State_Stream_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Image_View_ASTC_Decode_Mode_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Image_View_ASTC_Decode_Mode,
                         Image_View_ASTC_Decode_Mode_C,
                         Image_View_ASTC_Decode_Mode_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Conditional_Rendering_Begin_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Conditional_Rendering_Begin_Info,
                         Conditional_Rendering_Begin_Info_C,
                         Conditional_Rendering_Begin_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Command_Buffer_Inheritance_Conditional_Rendering_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
          (Extensions.EXT.Command_Buffer_Inheritance_Conditional_Rendering_Info,
           Command_Buffer_Inheritance_Conditional_Rendering_Info_C,
           Command_Buffer_Inheritance_Conditional_Rendering_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Display_Power_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Display_Power_Info,
                         Display_Power_Info_C,
                         Display_Power_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Device_Event_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Device_Event_Info,
                         Device_Event_Info_C,
                         Device_Event_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Display_Event_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Display_Event_Info,
                         Display_Event_Info_C,
                         Display_Event_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Swapchain_Counter_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Swapchain_Counter_Create_Info,
                         Swapchain_Counter_Create_Info_C,
                         Swapchain_Counter_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Discard_Rectangle_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                   (Extensions.EXT.Pipeline_Discard_Rectangle_State_Create_Info,
                    Pipeline_Discard_Rectangle_State_Create_Info_C,
                    Pipeline_Discard_Rectangle_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Rasterization_Conservative_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
          (Extensions.EXT.Pipeline_Rasterization_Conservative_State_Create_Info,
           Pipeline_Rasterization_Conservative_State_Create_Info_C,
           Pipeline_Rasterization_Conservative_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Rasterization_Depth_Clip_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
            (Extensions.EXT.Pipeline_Rasterization_Depth_Clip_State_Create_Info,
             Pipeline_Rasterization_Depth_Clip_State_Create_Info_C,
             Pipeline_Rasterization_Depth_Clip_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when HDR_Metadata_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.HDR_Metadata,
                         HDR_Metadata_C,
                         HDR_Metadata_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Debug_Utils_Label_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Debug_Utils_Label,
                         Debug_Utils_Label_C,
                         Debug_Utils_Label_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Debug_Utils_Object_Name_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Debug_Utils_Object_Name_Info,
                         Debug_Utils_Object_Name_Info_C,
                         Debug_Utils_Object_Name_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Debug_Utils_Messenger_Callback_Data_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Debug_Utils_Messenger_Callback_Data,
                         Debug_Utils_Messenger_Callback_Data_C,
                         Debug_Utils_Messenger_Callback_Data_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Debug_Utils_Messenger_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Debug_Utils_Messenger_Create_Info,
                         Debug_Utils_Messenger_Create_Info_C,
                         Debug_Utils_Messenger_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Debug_Utils_Object_Tag_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Debug_Utils_Object_Tag_Info,
                         Debug_Utils_Object_Tag_Info_C,
                         Debug_Utils_Object_Tag_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Sample_Locations_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Sample_Locations_Info,
                         Sample_Locations_Info_C,
                         Sample_Locations_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Render_Pass_Sample_Locations_Begin_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Render_Pass_Sample_Locations_Begin_Info,
                         Render_Pass_Sample_Locations_Begin_Info_C,
                         Render_Pass_Sample_Locations_Begin_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Sample_Locations_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                    (Extensions.EXT.Pipeline_Sample_Locations_State_Create_Info,
                     Pipeline_Sample_Locations_State_Create_Info_C,
                     Pipeline_Sample_Locations_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Color_Blend_Advanced_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                (Extensions.EXT.Pipeline_Color_Blend_Advanced_State_Create_Info,
                 Pipeline_Color_Blend_Advanced_State_Create_Info_C,
                 Pipeline_Color_Blend_Advanced_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Image_DRM_Format_Modifier_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                 (Extensions.EXT.Physical_Device_Image_DRM_Format_Modifier_Info,
                  Physical_Device_Image_DRM_Format_Modifier_Info_C,
                  Physical_Device_Image_DRM_Format_Modifier_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Image_DRM_Format_Modifier_List_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                     (Extensions.EXT.Image_DRM_Format_Modifier_List_Create_Info,
                      Image_DRM_Format_Modifier_List_Create_Info_C,
                      Image_DRM_Format_Modifier_List_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Image_DRM_Format_Modifier_Explicit_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                 (Extensions.EXT.Image_DRM_Format_Modifier_Explicit_Create_Info,
                  Image_DRM_Format_Modifier_Explicit_Create_Info_C,
                  Image_DRM_Format_Modifier_Explicit_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Validation_Cache_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Validation_Cache_Create_Info,
                         Validation_Cache_Create_Info_C,
                         Validation_Cache_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Shader_Module_Validation_Cache_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                     (Extensions.EXT.Shader_Module_Validation_Cache_Create_Info,
                      Shader_Module_Validation_Cache_Create_Info_C,
                      Shader_Module_Validation_Cache_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Import_Memory_Host_Pointer_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Import_Memory_Host_Pointer_Info,
                         Import_Memory_Host_Pointer_Info_C,
                         Import_Memory_Host_Pointer_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Render_Pass_Fragment_Density_Map_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                   (Extensions.EXT.Render_Pass_Fragment_Density_Map_Create_Info,
                    Render_Pass_Fragment_Density_Map_Create_Info_C,
                    Render_Pass_Fragment_Density_Map_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Rendering_Fragment_Density_Map_Attachment_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                 (Extensions.EXT.Rendering_Fragment_Density_Map_Attachment_Info,
                  Rendering_Fragment_Density_Map_Attachment_Info_C,
                  Rendering_Fragment_Density_Map_Attachment_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Memory_Priority_Allocate_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Memory_Priority_Allocate_Info,
                         Memory_Priority_Allocate_Info_C,
                         Memory_Priority_Allocate_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
          when Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
      (Extensions.EXT.Pipeline_Rasterization_Provoking_Vertex_State_Create_Info,
       Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_C,
       Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Headless_Surface_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Headless_Surface_Create_Info,
                         Headless_Surface_Create_Info_C,
                         Headless_Surface_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Memory_Map_Placed_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Memory_Map_Placed_Info,
                         Memory_Map_Placed_Info_C,
                         Memory_Map_Placed_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Depth_Bias_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Depth_Bias_Info,
                         Depth_Bias_Info_C,
                         Depth_Bias_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Depth_Bias_Representation_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Depth_Bias_Representation_Info,
                         Depth_Bias_Representation_Info_C,
                         Depth_Bias_Representation_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Device_Device_Memory_Report_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Device_Device_Memory_Report_Create_Info,
                         Device_Device_Memory_Report_Create_Info_C,
                         Device_Device_Memory_Report_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Sampler_Custom_Border_Color_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Sampler_Custom_Border_Color_Create_Info,
                         Sampler_Custom_Border_Color_Create_Info_C,
                         Sampler_Custom_Border_Color_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Descriptor_Buffer_Binding_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Descriptor_Buffer_Binding_Info,
                         Descriptor_Buffer_Binding_Info_C,
                         Descriptor_Buffer_Binding_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
        (Extensions.EXT.Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle,
         Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_C,
         Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Descriptor_Get_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Descriptor_Get_Info,
                         Descriptor_Get_Info_C,
                         Descriptor_Get_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Buffer_Capture_Descriptor_Data_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Buffer_Capture_Descriptor_Data_Info,
                         Buffer_Capture_Descriptor_Data_Info_C,
                         Buffer_Capture_Descriptor_Data_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Image_Capture_Descriptor_Data_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Image_Capture_Descriptor_Data_Info,
                         Image_Capture_Descriptor_Data_Info_C,
                         Image_Capture_Descriptor_Data_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Image_View_Capture_Descriptor_Data_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Image_View_Capture_Descriptor_Data_Info,
                         Image_View_Capture_Descriptor_Data_Info_C,
                         Image_View_Capture_Descriptor_Data_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Sampler_Capture_Descriptor_Data_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Sampler_Capture_Descriptor_Data_Info,
                         Sampler_Capture_Descriptor_Data_Info_C,
                         Sampler_Capture_Descriptor_Data_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Opaque_Capture_Descriptor_Data_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                     (Extensions.EXT.Opaque_Capture_Descriptor_Data_Create_Info,
                      Opaque_Capture_Descriptor_Data_Create_Info_C,
                      Opaque_Capture_Descriptor_Data_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
             when Acceleration_Structure_Capture_Descriptor_Data_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
            (Extensions.EXT.Acceleration_Structure_Capture_Descriptor_Data_Info,
             Acceleration_Structure_Capture_Descriptor_Data_Info_C,
             Acceleration_Structure_Capture_Descriptor_Data_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
             when Graphics_Pipeline_Library_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Graphics_Pipeline_Library_Create_Info,
                         Graphics_Pipeline_Library_Create_Info_C,
                         Graphics_Pipeline_Library_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
             when Image_Compression_Control_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Image_Compression_Control,
                         Image_Compression_Control_C,
                         Image_Compression_Control_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Viewport_Depth_Clip_Control_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
               (Extensions.EXT.Pipeline_Viewport_Depth_Clip_Control_Create_Info,
                Pipeline_Viewport_Depth_Clip_Control_Create_Info_C,
                Pipeline_Viewport_Depth_Clip_Control_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Frame_Boundary_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Frame_Boundary,
                         Frame_Boundary_C,
                         Frame_Boundary_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Multisampled_Render_To_Single_Sampled_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Multisampled_Render_To_Single_Sampled_Info,
                         Multisampled_Render_To_Single_Sampled_Info_C,
                         Multisampled_Render_To_Single_Sampled_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Color_Write_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Pipeline_Color_Write_Create_Info,
                         Pipeline_Color_Write_Create_Info_C,
                         Pipeline_Color_Write_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Image_View_Min_LOD_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Image_View_Min_LOD_Create_Info,
                         Image_View_Min_LOD_Create_Info_C,
                         Image_View_Min_LOD_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Micromap_Build_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Micromap_Build_Info,
                         Micromap_Build_Info_C,
                         Micromap_Build_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Micromap_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Micromap_Create_Info,
                         Micromap_Create_Info_C,
                         Micromap_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Micromap_Version_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Micromap_Version_Info,
                         Micromap_Version_Info_C,
                         Micromap_Version_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Copy_Micromap_To_Memory_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Copy_Micromap_To_Memory_Info,
                         Copy_Micromap_To_Memory_Info_C,
                         Copy_Micromap_To_Memory_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Copy_Memory_To_Micromap_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Copy_Memory_To_Micromap_Info,
                         Copy_Memory_To_Micromap_Info_C,
                         Copy_Memory_To_Micromap_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Copy_Micromap_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Copy_Micromap_Info,
                         Copy_Micromap_Info_C,
                         Copy_Micromap_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Micromap_Build_Sizes_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Micromap_Build_Sizes_Info,
                         Micromap_Build_Sizes_Info_C,
                         Micromap_Build_Sizes_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Metal_Surface_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.EXT.Metal_Surface_Create_Info,
                         Metal_Surface_Create_Info_C,
                         Metal_Surface_Create_Info_C_Access);
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
            when Physical_Device_Transform_Feedback_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                    (Extensions.EXT.Physical_Device_Transform_Feedback_Features,
                     Physical_Device_Transform_Feedback_Features_C,
                     Physical_Device_Transform_Feedback_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Transform_Feedback_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                  (Extensions.EXT.Physical_Device_Transform_Feedback_Properties,
                   Physical_Device_Transform_Feedback_Properties_C,
                   Physical_Device_Transform_Feedback_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_ASTC_Decode_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Physical_Device_ASTC_Decode_Features,
                         Physical_Device_ASTC_Decode_Features_C,
                         Physical_Device_ASTC_Decode_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Conditional_Rendering_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                 (Extensions.EXT.Physical_Device_Conditional_Rendering_Features,
                  Physical_Device_Conditional_Rendering_Features_C,
                  Physical_Device_Conditional_Rendering_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Surface_Capabilities_2_EXT_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Surface_Capabilities_2,
                         Surface_Capabilities_2_C,
                         Surface_Capabilities_2_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Discard_Rectangle_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                   (Extensions.EXT.Physical_Device_Discard_Rectangle_Properties,
                    Physical_Device_Discard_Rectangle_Properties_C,
                    Physical_Device_Discard_Rectangle_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Conservative_Rasterization_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
          (Extensions.EXT.Physical_Device_Conservative_Rasterization_Properties,
           Physical_Device_Conservative_Rasterization_Properties_C,
           Physical_Device_Conservative_Rasterization_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Depth_Clip_Enable_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                     (Extensions.EXT.Physical_Device_Depth_Clip_Enable_Features,
                      Physical_Device_Depth_Clip_Enable_Features_C,
                      Physical_Device_Depth_Clip_Enable_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Sample_Locations_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                    (Extensions.EXT.Physical_Device_Sample_Locations_Properties,
                     Physical_Device_Sample_Locations_Properties_C,
                     Physical_Device_Sample_Locations_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Multisample_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Multisample_Properties,
                         Multisample_Properties_C,
                         Multisample_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Blend_Operation_Advanced_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
              (Extensions.EXT.Physical_Device_Blend_Operation_Advanced_Features,
               Physical_Device_Blend_Operation_Advanced_Features_C,
               Physical_Device_Blend_Operation_Advanced_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Blend_Operation_Advanced_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
            (Extensions.EXT.Physical_Device_Blend_Operation_Advanced_Properties,
             Physical_Device_Blend_Operation_Advanced_Properties_C,
             Physical_Device_Blend_Operation_Advanced_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when DRM_Format_Modifier_Properties_List_Type =>
                declare
                    use type Interfaces.Unsigned_32;

                    function To_Out_Structure_C_Access is
                        new Ada.Unchecked_Conversion
                            (DRM_Format_Modifier_Properties_List_C_Access,
                             C.Out_Structure_C_Access);

                    Ada_Struct:
                        Extensions.EXT.DRM_Format_Modifier_Properties_List
                            renames
                        Extensions.EXT.DRM_Format_Modifier_Properties_List
                            (Next.all);
                    C_Struct: DRM_Format_Modifier_Properties_List_C_Access;
                    C_Out: C.Out_Structure_C_Access;
                begin
                    C_Struct := new DRM_Format_Modifier_Properties_List_C;
                    C_Struct.DRM_Format_Modifier_Count :=
                        Ada_Struct.DRM_Format_Modifier_Count;

                    if C_Struct.DRM_Format_Modifier_Count /= 0 then
                        C_Struct.DRM_Format_Modifier_Properties :=
                            DRM_Format_Modifier_Properties_Arrays.Allocate
                                (Positive(C_Struct.DRM_Format_Modifier_Count))
                                    (1)'Access;
                    end if;

                    C_Out := To_Out_Structure_C_Access(C_Struct);
                    C_Out.Next := Extension_Records.To_C(Next.Next);

                    return C_Out;
                end;
            when Image_DRM_Format_Modifier_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Image_DRM_Format_Modifier_Properties,
                         Image_DRM_Format_Modifier_Properties_C,
                         Image_DRM_Format_Modifier_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when DRM_Format_Modifier_Properties_List_2_Type =>
                declare
                    use type Interfaces.Unsigned_32;

                    function To_Out_Structure_C_Access is
                        new Ada.Unchecked_Conversion
                            (DRM_Format_Modifier_Properties_List_2_C_Access,
                             C.Out_Structure_C_Access);

                    Ada_Struct:
                        Extensions.EXT.DRM_Format_Modifier_Properties_List_2
                            renames
                        Extensions.EXT.DRM_Format_Modifier_Properties_List_2
                            (Next.all);
                    C_Struct: DRM_Format_Modifier_Properties_List_2_C_Access;
                    C_Out: C.Out_Structure_C_Access;
                begin
                    C_Struct := new DRM_Format_Modifier_Properties_List_2_C;
                    C_Struct.DRM_Format_Modifier_Count :=
                        Ada_Struct.DRM_Format_Modifier_Count;

                    if C_Struct.DRM_Format_Modifier_Count /= 0 then
                        C_Struct.DRM_Format_Modifier_Properties :=
                            DRM_Format_Modifier_Properties_2_Arrays.Allocate
                                (Positive(C_Struct.DRM_Format_Modifier_Count))
                                    (1)'Access;
                    end if;

                    C_Out := To_Out_Structure_C_Access(C_Struct);
                    C_Out.Next := Extension_Records.To_C(Next.Next);

                    return C_Out;
                end;
            when Physical_Device_Image_View_Image_Format_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                   (Extensions.EXT.Physical_Device_Image_View_Image_Format_Info,
                    Physical_Device_Image_View_Image_Format_Info_C,
                    Physical_Device_Image_View_Image_Format_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Filter_Cubic_Image_View_Image_Format_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                (Extensions.EXT.Filter_Cubic_Image_View_Image_Format_Properties,
                 Filter_Cubic_Image_View_Image_Format_Properties_C,
                 Filter_Cubic_Image_View_Image_Format_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Memory_Host_Pointer_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Memory_Host_Pointer_Properties,
                         Memory_Host_Pointer_Properties_C,
                         Memory_Host_Pointer_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_External_Memory_Host_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                (Extensions.EXT.Physical_Device_External_Memory_Host_Properties,
                 Physical_Device_External_Memory_Host_Properties_C,
                 Physical_Device_External_Memory_Host_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_PCI_Bus_Info_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Physical_Device_PCI_Bus_Info_Properties,
                         Physical_Device_PCI_Bus_Info_Properties_C,
                         Physical_Device_PCI_Bus_Info_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Fragment_Density_Map_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                  (Extensions.EXT.Physical_Device_Fragment_Density_Map_Features,
                   Physical_Device_Fragment_Density_Map_Features_C,
                   Physical_Device_Fragment_Density_Map_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Fragment_Density_Map_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                (Extensions.EXT.Physical_Device_Fragment_Density_Map_Properties,
                 Physical_Device_Fragment_Density_Map_Properties_C,
                 Physical_Device_Fragment_Density_Map_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Shader_Image_Atomic_Int64_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
             (Extensions.EXT.Physical_Device_Shader_Image_Atomic_Int64_Features,
              Physical_Device_Shader_Image_Atomic_Int64_Features_C,
              Physical_Device_Shader_Image_Atomic_Int64_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Memory_Budget_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                       (Extensions.EXT.Physical_Device_Memory_Budget_Properties,
                        Physical_Device_Memory_Budget_Properties_C,
                        Physical_Device_Memory_Budget_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Memory_Priority_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                       (Extensions.EXT.Physical_Device_Memory_Priority_Features,
                        Physical_Device_Memory_Priority_Features_C,
                        Physical_Device_Memory_Priority_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Fragment_Shader_Interlock_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
             (Extensions.EXT.Physical_Device_Fragment_Shader_Interlock_Features,
              Physical_Device_Fragment_Shader_Interlock_Features_C,
              Physical_Device_Fragment_Shader_Interlock_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_YCbCr_Image_Arrays_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                    (Extensions.EXT.Physical_Device_YCbCr_Image_Arrays_Features,
                     Physical_Device_YCbCr_Image_Arrays_Features_C,
                     Physical_Device_YCbCr_Image_Arrays_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Provoking_Vertex_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                      (Extensions.EXT.Physical_Device_Provoking_Vertex_Features,
                       Physical_Device_Provoking_Vertex_Features_C,
                       Physical_Device_Provoking_Vertex_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Provoking_Vertex_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                    (Extensions.EXT.Physical_Device_Provoking_Vertex_Properties,
                     Physical_Device_Provoking_Vertex_Properties_C,
                     Physical_Device_Provoking_Vertex_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Shader_Atomic_Float_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                   (Extensions.EXT.Physical_Device_Shader_Atomic_Float_Features,
                    Physical_Device_Shader_Atomic_Float_Features_C,
                    Physical_Device_Shader_Atomic_Float_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Map_Memory_Placed_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                     (Extensions.EXT.Physical_Device_Map_Memory_Placed_Features,
                      Physical_Device_Map_Memory_Placed_Features_C,
                      Physical_Device_Map_Memory_Placed_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Map_Memory_Placed_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                   (Extensions.EXT.Physical_Device_Map_Memory_Placed_Properties,
                    Physical_Device_Map_Memory_Placed_Properties_C,
                    Physical_Device_Map_Memory_Placed_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Shader_Atomic_Float_2_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                 (Extensions.EXT.Physical_Device_Shader_Atomic_Float_2_Features,
                  Physical_Device_Shader_Atomic_Float_2_Features_C,
                  Physical_Device_Shader_Atomic_Float_2_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Depth_Bias_Control_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                    (Extensions.EXT.Physical_Device_Depth_Bias_Control_Features,
                     Physical_Device_Depth_Bias_Control_Features_C,
                     Physical_Device_Depth_Bias_Control_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Device_Memory_Report_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                  (Extensions.EXT.Physical_Device_Device_Memory_Report_Features,
                   Physical_Device_Device_Memory_Report_Features_C,
                   Physical_Device_Device_Memory_Report_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Device_Memory_Report_Callback_Data_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Device_Memory_Report_Callback_Data,
                         Device_Memory_Report_Callback_Data_C,
                         Device_Memory_Report_Callback_Data_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Custom_Border_Color_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                 (Extensions.EXT.Physical_Device_Custom_Border_Color_Properties,
                  Physical_Device_Custom_Border_Color_Properties_C,
                  Physical_Device_Custom_Border_Color_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Custom_Border_Color_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                   (Extensions.EXT.Physical_Device_Custom_Border_Color_Features,
                    Physical_Device_Custom_Border_Color_Features_C,
                    Physical_Device_Custom_Border_Color_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Descriptor_Buffer_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                   (Extensions.EXT.Physical_Device_Descriptor_Buffer_Properties,
                    Physical_Device_Descriptor_Buffer_Properties_C,
                    Physical_Device_Descriptor_Buffer_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Descriptor_Buffer_Density_Map_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
       (Extensions.EXT.Physical_Device_Descriptor_Buffer_Density_Map_Properties,
        Physical_Device_Descriptor_Buffer_Density_Map_Properties_C,
        Physical_Device_Descriptor_Buffer_Density_Map_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Descriptor_Buffer_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                     (Extensions.EXT.Physical_Device_Descriptor_Buffer_Features,
                      Physical_Device_Descriptor_Buffer_Features_C,
                      Physical_Device_Descriptor_Buffer_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Descriptor_Address_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Descriptor_Address_Info,
                         Descriptor_Address_Info_C,
                         Descriptor_Address_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Graphics_Pipeline_Library_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
             (Extensions.EXT.Physical_Device_Graphics_Pipeline_Library_Features,
              Physical_Device_Graphics_Pipeline_Library_Features_C,
              Physical_Device_Graphics_Pipeline_Library_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Graphics_Pipeline_Library_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
           (Extensions.EXT.Physical_Device_Graphics_Pipeline_Library_Properties,
            Physical_Device_Graphics_Pipeline_Library_Properties_C,
            Physical_Device_Graphics_Pipeline_Library_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Fragment_Density_Map_2_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                (Extensions.EXT.Physical_Device_Fragment_Density_Map_2_Features,
                 Physical_Device_Fragment_Density_Map_2_Features_C,
                 Physical_Device_Fragment_Density_Map_2_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Fragment_Density_Map_2_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
              (Extensions.EXT.Physical_Device_Fragment_Density_Map_2_Properties,
               Physical_Device_Fragment_Density_Map_2_Properties_C,
               Physical_Device_Fragment_Density_Map_2_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Image_Compression_Control_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
             (Extensions.EXT.Physical_Device_Image_Compression_Control_Features,
              Physical_Device_Image_Compression_Control_Features_C,
              Physical_Device_Image_Compression_Control_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Image_Compression_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Image_Compression_Properties,
                         Image_Compression_Properties_C,
                         Image_Compression_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
           when Physical_Device_Attachment_Feedback_Loop_Layout_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
       (Extensions.EXT.Physical_Device_Attachment_Feedback_Loop_Layout_Features,
        Physical_Device_Attachment_Feedback_Loop_Layout_Features_C,
        Physical_Device_Attachment_Feedback_Loop_Layout_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Fault_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Physical_Device_Fault_Features,
                         Physical_Device_Fault_Features_C,
                         Physical_Device_Fault_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Device_Fault_Counts_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Device_Fault_Counts,
                         Device_Fault_Counts_C,
                         Device_Fault_Counts_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Device_Fault_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Device_Fault_Info,
                         Device_Fault_Info_C,
                         Device_Fault_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_RGBA10x6_Formats_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                      (Extensions.EXT.Physical_Device_RGBA10x6_Formats_Features,
                       Physical_Device_RGBA10x6_Formats_Features_C,
                       Physical_Device_RGBA10x6_Formats_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Vertex_Input_Dynamic_State_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
            (Extensions.EXT.Physical_Device_Vertex_Input_Dynamic_State_Features,
             Physical_Device_Vertex_Input_Dynamic_State_Features_C,
             Physical_Device_Vertex_Input_Dynamic_State_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
             when Vertex_Input_Binding_Description_2_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Vertex_Input_Binding_Description_2,
                         Vertex_Input_Binding_Description_2_C,
                         Vertex_Input_Binding_Description_2_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Vertex_Input_Attribute_Description_2_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Vertex_Input_Attribute_Description_2,
                         Vertex_Input_Attribute_Description_2_C,
                         Vertex_Input_Attribute_Description_2_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_DRM_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Physical_Device_DRM_Properties,
                         Physical_Device_DRM_Properties_C,
                         Physical_Device_DRM_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Address_Binding_Report_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                (Extensions.EXT.Physical_Device_Address_Binding_Report_Features,
                 Physical_Device_Address_Binding_Report_Features_C,
                 Physical_Device_Address_Binding_Report_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Device_Address_Binding_Callback_Data_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Device_Address_Binding_Callback_Data,
                         Device_Address_Binding_Callback_Data_C,
                         Device_Address_Binding_Callback_Data_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Depth_Clip_Control_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                    (Extensions.EXT.Physical_Device_Depth_Clip_Control_Features,
                     Physical_Device_Depth_Clip_Control_Features_C,
                     Physical_Device_Depth_Clip_Control_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Primitive_Topology_List_Restart_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
       (Extensions.EXT.Physical_Device_Primitive_Topology_List_Restart_Features,
        Physical_Device_Primitive_Topology_List_Restart_Features_C,
        Physical_Device_Primitive_Topology_List_Restart_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Properties_Identifier_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Pipeline_Properties_Identifier,
                         Pipeline_Properties_Identifier_C,
                         Pipeline_Properties_Identifier_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Pipeline_Properties_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                   (Extensions.EXT.Physical_Device_Pipeline_Properties_Features,
                    Physical_Device_Pipeline_Properties_Features_C,
                    Physical_Device_Pipeline_Properties_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Frame_Boundary_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Physical_Device_Frame_Boundary_Features,
                         Physical_Device_Frame_Boundary_Features_C,
                         Physical_Device_Frame_Boundary_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Multisampled_Render_To_Single_Sampled_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Physical_Device_Multisampled_Render_To_Single_Sampled_Features,
                         Physical_Device_Multisampled_Render_To_Single_Sampled_Features_C,
                         Physical_Device_Multisampled_Render_To_Single_Sampled_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Subpass_Resolve_Performance_Query_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Subpass_Resolve_Performance_Query,
                         Subpass_Resolve_Performance_Query_C,
                         Subpass_Resolve_Performance_Query_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Color_Write_Enable_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Physical_Device_Color_Write_Enable_Features,
                         Physical_Device_Color_Write_Enable_Features_C,
                         Physical_Device_Color_Write_Enable_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Primitives_Generated_Query_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Physical_Device_Primitives_Generated_Query_Features,
                         Physical_Device_Primitives_Generated_Query_Features_C,
                         Physical_Device_Primitives_Generated_Query_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Image_View_Min_LOD_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Physical_Device_Image_View_Min_LOD_Features,
                         Physical_Device_Image_View_Min_LOD_Features_C,
                         Physical_Device_Image_View_Min_LOD_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Multi_Draw_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Physical_Device_Multi_Draw_Features,
                         Physical_Device_Multi_Draw_Features_C,
                         Physical_Device_Multi_Draw_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Multi_Draw_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.EXT.Physical_Device_Multi_Draw_Properties,
                         Physical_Device_Multi_Draw_Properties_C,
                         Physical_Device_Multi_Draw_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Image_2D_View_Of_3D_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                    (Extensions.EXT.Physical_Device_Image_2D_View_Of_3D_Features,
                     Physical_Device_Image_2D_View_Of_3D_Features_C,
                     Physical_Device_Image_2D_View_Of_3D_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Shader_Tile_Image_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                     (Extensions.EXT.Physical_Device_Shader_Tile_Image_Features,
                      Physical_Device_Shader_Tile_Image_Features_C,
                      Physical_Device_Shader_Tile_Image_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Shader_Tile_Image_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                    (Extensions.EXT.Physical_Device_Shader_Tile_Image_Properties,
                     Physical_Device_Shader_Tile_Image_Properties_C,
                     Physical_Device_Shader_Tile_Image_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Opacity_Micromap_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                    (Extensions.EXT.Physical_Device_Opacity_Micromap_Features,
                     Physical_Device_Opacity_Micromap_Features_C,
                     Physical_Device_Opacity_Micromap_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Opacity_Micromap_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                    (Extensions.EXT.Physical_Device_Opacity_Micromap_Properties,
                     Physical_Device_Opacity_Micromap_Properties_C,
                     Physical_Device_Opacity_Micromap_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Acceleration_Structure_Triangles_Opacity_Micromap_Type =>
                declare
                    function To_Out_Structure_C_Access is
                        new Ada.Unchecked_Conversion
                            (Acceleration_Structure_Triangles_Opacity_Micromap_C_Access,
                             C.Out_Structure_C_Access);

                    Ada_Struct:
                        Extensions.EXT.Acceleration_Structure_Triangles_Opacity_Micromap
                            renames
                        Extensions.EXT.Acceleration_Structure_Triangles_Opacity_Micromap
                            (Next.all);
                    C_Struct: Acceleration_Structure_Triangles_Opacity_Micromap_C_Access;
                    C_Out: C.Out_Structure_C_Access;
                begin
                    C_Struct := new Acceleration_Structure_Triangles_Opacity_Micromap_C;
                    C_Struct.Index_Type := Ada_Struct.Index_Type;
                    C_KHR.To_C(C_Struct.Index_Buffer, Ada_Struct.Index_Buffer);
                    C_Struct.Index_Stride := Ada_Struct.Index_Stride;
                    C_Struct.Base_Triangle := Ada_Struct.Base_Triangle;
                    C_Struct.Usage_Counts_Count :=
                        Ada_Struct.Usage_Counts_Count;
                    C_Struct.Usage_Counts := Ada_Struct.Usage_Counts;
                    C_Struct.Usage_Counts_Access :=
                        Ada_Struct.Usage_Counts_Access;
                    C_Struct.Micromap := Ada_Struct.Micromap;

                    C_Out := To_Out_Structure_C_Access(C_Struct);
                    C_Out.Next := Extension_Records.To_C(Next.Next);

                    return C_Out;
                end;
        end case;
    end To_C;

    procedure To_Ada(Ada_Struct: in out Vulkan.Out_Structure'Class;
                     Next: in C.Out_Structure_C_Access) is
    begin
        case Out_Structure(Ada_Struct.Record_Type) is
            when Physical_Device_Transform_Feedback_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Transform_Feedback_Features_C_Access);
                begin
                    To_Ada
                     (Extensions.EXT.Physical_Device_Transform_Feedback_Features
                         (Ada_Struct),
                      To_Access(Next).all);
                end;
            when Physical_Device_Transform_Feedback_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                       (C.Out_Structure_C_Access,
                        Physical_Device_Transform_Feedback_Properties_C_Access);
                begin
                    To_Ada
                   (Extensions.EXT.Physical_Device_Transform_Feedback_Properties
                       (Ada_Struct),
                    To_Access(Next).all);
                end;
            when Physical_Device_ASTC_Decode_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_ASTC_Decode_Features_C_Access);
                begin
                    To_Ada(Extensions.EXT.Physical_Device_ASTC_Decode_Features
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Physical_Device_Conditional_Rendering_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                      (C.Out_Structure_C_Access,
                       Physical_Device_Conditional_Rendering_Features_C_Access);
                begin
                    To_Ada
                  (Extensions.EXT.Physical_Device_Conditional_Rendering_Features
                      (Ada_Struct),
                   To_Access(Next).all);
                end;
            when Surface_Capabilities_2_EXT_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Surface_Capabilities_2_C_Access);
                begin
                    To_Ada(Extensions.EXT.Surface_Capabilities_2(Ada_Struct),
                           To_Access(Next).all);
                end;
            when Physical_Device_Discard_Rectangle_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Discard_Rectangle_Properties_C_Access);
                begin
                    To_Ada
                    (Extensions.EXT.Physical_Device_Discard_Rectangle_Properties
                        (Ada_Struct),
                     To_Access(Next).all);
                end;
            when Physical_Device_Conservative_Rasterization_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
               (C.Out_Structure_C_Access,
                Physical_Device_Conservative_Rasterization_Properties_C_Access);
                begin
                    To_Ada
           (Extensions.EXT.Physical_Device_Conservative_Rasterization_Properties
               (Ada_Struct),
            To_Access(Next).all);
                end;
            when Physical_Device_Depth_Clip_Enable_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Depth_Clip_Enable_Features_C_Access);
                begin
                  To_Ada
                      (Extensions.EXT.Physical_Device_Depth_Clip_Enable_Features
                          (Ada_Struct),
                       To_Access(Next).all);
                end;
            when Physical_Device_Sample_Locations_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Sample_Locations_Properties_C_Access);
                begin
                  To_Ada
                     (Extensions.EXT.Physical_Device_Sample_Locations_Properties
                         (Ada_Struct),
                      To_Access(Next).all);
                end;
            when Multisample_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Multisample_Properties_C_Access);
                begin
                    To_Ada(Extensions.EXT.Multisample_Properties(Ada_Struct),
                           To_Access(Next).all);
                end;
            when Physical_Device_Blend_Operation_Advanced_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                   (C.Out_Structure_C_Access,
                    Physical_Device_Blend_Operation_Advanced_Features_C_Access);
                begin
                    To_Ada
               (Extensions.EXT.Physical_Device_Blend_Operation_Advanced_Features
                   (Ada_Struct),
                To_Access(Next).all);
                end;
            when Physical_Device_Blend_Operation_Advanced_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                 (C.Out_Structure_C_Access,
                  Physical_Device_Blend_Operation_Advanced_Properties_C_Access);
                begin
                    To_Ada
             (Extensions.EXT.Physical_Device_Blend_Operation_Advanced_Properties
                 (Ada_Struct),
              To_Access(Next).all);
                end;
            when DRM_Format_Modifier_Properties_List_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         DRM_Format_Modifier_Properties_List_C_Access);
                begin
                    To_Ada(Extensions.EXT.DRM_Format_Modifier_Properties_List
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Image_DRM_Format_Modifier_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Image_DRM_Format_Modifier_Properties_C_Access);
                begin
                    To_Ada(Extensions.EXT.Image_DRM_Format_Modifier_Properties
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
            when DRM_Format_Modifier_Properties_List_2_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         DRM_Format_Modifier_Properties_List_2_C_Access);
                begin
                    To_Ada(Extensions.EXT.DRM_Format_Modifier_Properties_List_2
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Physical_Device_Image_View_Image_Format_Info_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Image_View_Image_Format_Info_C_Access);
                begin
              To_Ada(Extensions.EXT.Physical_Device_Image_View_Image_Format_Info
                        (Ada_Struct),
                     To_Access(Next).all);
                end;
            when Filter_Cubic_Image_View_Image_Format_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                     (C.Out_Structure_C_Access,
                      Filter_Cubic_Image_View_Image_Format_Properties_C_Access);
                begin
           To_Ada(Extensions.EXT.Filter_Cubic_Image_View_Image_Format_Properties
                    (Ada_Struct),
                  To_Access(Next).all);
                end;
            when Memory_Host_Pointer_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Memory_Host_Pointer_Properties_C_Access);
                begin
                    To_Ada(Extensions.EXT.Memory_Host_Pointer_Properties
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Physical_Device_External_Memory_Host_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                     (C.Out_Structure_C_Access,
                      Physical_Device_External_Memory_Host_Properties_C_Access);
                begin
                    To_Ada
                 (Extensions.EXT.Physical_Device_External_Memory_Host_Properties
                     (Ada_Struct),
                  To_Access(Next).all);
                end;
            when Physical_Device_PCI_Bus_Info_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_PCI_Bus_Info_Properties_C_Access);
                begin
                    To_Ada
                        (Extensions.EXT.Physical_Device_PCI_Bus_Info_Properties
                         (Ada_Struct),
                        To_Access(Next).all);
                end;
            when Physical_Device_Fragment_Density_Map_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                       (C.Out_Structure_C_Access,
                        Physical_Device_Fragment_Density_Map_Features_C_Access);
                begin
                    To_Ada
                   (Extensions.EXT.Physical_Device_Fragment_Density_Map_Features
                     (Ada_Struct),
                    To_Access(Next).all);
                end;
            when Physical_Device_Fragment_Density_Map_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                     (C.Out_Structure_C_Access,
                      Physical_Device_Fragment_Density_Map_Properties_C_Access);
                begin
                    To_Ada
                 (Extensions.EXT.Physical_Device_Fragment_Density_Map_Properties
                    (Ada_Struct),
                  To_Access(Next).all);
                end;
            when Physical_Device_Shader_Image_Atomic_Int64_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                  (C.Out_Structure_C_Access,
                   Physical_Device_Shader_Image_Atomic_Int64_Features_C_Access);
                begin
                    To_Ada
              (Extensions.EXT.Physical_Device_Shader_Image_Atomic_Int64_Features
                 (Ada_Struct),
               To_Access(Next).all);
                end;
            when Physical_Device_Memory_Budget_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                  (C.Out_Structure_C_Access,
                   Physical_Device_Memory_Budget_Properties_C_Access);
                begin
                    To_Ada
                        (Extensions.EXT.Physical_Device_Memory_Budget_Properties
                         (Ada_Struct),
                         To_Access(Next).all);
                end;
            when Physical_Device_Memory_Priority_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                  (C.Out_Structure_C_Access,
                   Physical_Device_Memory_Priority_Features_C_Access);
                begin
                    To_Ada
                        (Extensions.EXT.Physical_Device_Memory_Priority_Features
                         (Ada_Struct),
                         To_Access(Next).all);
                end;
            when Physical_Device_Fragment_Shader_Interlock_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                  (C.Out_Structure_C_Access,
                   Physical_Device_Fragment_Shader_Interlock_Features_C_Access);
                begin
                    To_Ada
              (Extensions.EXT.Physical_Device_Fragment_Shader_Interlock_Features
                  (Ada_Struct),
               To_Access(Next).all);
                end;
            when Physical_Device_YCbCr_Image_Arrays_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_YCbCr_Image_Arrays_Features_C_Access);
                begin
                    To_Ada
                     (Extensions.EXT.Physical_Device_YCbCr_Image_Arrays_Features
                      (Ada_Struct),
                      To_Access(Next).all);
                end;
            when Physical_Device_Provoking_Vertex_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Provoking_Vertex_Features_C_Access);
                begin
                    To_Ada
                       (Extensions.EXT.Physical_Device_Provoking_Vertex_Features
                        (Ada_Struct),
                        To_Access(Next).all);
                end;
            when Physical_Device_Provoking_Vertex_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Provoking_Vertex_Properties_C_Access);
                begin
                    To_Ada
                     (Extensions.EXT.Physical_Device_Provoking_Vertex_Properties
                      (Ada_Struct),
                      To_Access(Next).all);
                end;
            when Physical_Device_Shader_Atomic_Float_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Shader_Atomic_Float_Features_C_Access);
                begin
                    To_Ada
                    (Extensions.EXT.Physical_Device_Shader_Atomic_Float_Features
                      (Ada_Struct),
                     To_Access(Next).all);
                end;
            when Physical_Device_Map_Memory_Placed_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Map_Memory_Placed_Features_C_Access);
                begin
                    To_Ada
                      (Extensions.EXT.Physical_Device_Map_Memory_Placed_Features
                        (Ada_Struct),
                       To_Access(Next).all);
                end;
            when Physical_Device_Map_Memory_Placed_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Map_Memory_Placed_Properties_C_Access);
                begin
                    To_Ada
                    (Extensions.EXT.Physical_Device_Map_Memory_Placed_Properties
                      (Ada_Struct),
                     To_Access(Next).all);
                end;
            when Physical_Device_Shader_Atomic_Float_2_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                      (C.Out_Structure_C_Access,
                       Physical_Device_Shader_Atomic_Float_2_Features_C_Access);
                begin
                    To_Ada
                  (Extensions.EXT.Physical_Device_Shader_Atomic_Float_2_Features
                    (Ada_Struct),
                   To_Access(Next).all);
                end;
            when Physical_Device_Depth_Bias_Control_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                      (C.Out_Structure_C_Access,
                       Physical_Device_Depth_Bias_Control_Features_C_Access);
                begin
                    To_Ada
                     (Extensions.EXT.Physical_Device_Depth_Bias_Control_Features
                       (Ada_Struct),
                      To_Access(Next).all);
                end;
            when Physical_Device_Device_Memory_Report_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                      (C.Out_Structure_C_Access,
                       Physical_Device_Device_Memory_Report_Features_C_Access);
                begin
                    To_Ada
                   (Extensions.EXT.Physical_Device_Device_Memory_Report_Features
                     (Ada_Struct),
                    To_Access(Next).all);
                end;
            when Device_Memory_Report_Callback_Data_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Device_Memory_Report_Callback_Data_C_Access);
                begin
                    To_Ada(Extensions.EXT.Device_Memory_Report_Callback_Data
                             (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Physical_Device_Custom_Border_Color_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                      (C.Out_Structure_C_Access,
                       Physical_Device_Custom_Border_Color_Properties_C_Access);
                begin
            To_Ada(Extensions.EXT.Physical_Device_Custom_Border_Color_Properties
                     (Ada_Struct),
                   To_Access(Next).all);
                end;
            when Physical_Device_Custom_Border_Color_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Custom_Border_Color_Features_C_Access);
                begin
              To_Ada(Extensions.EXT.Physical_Device_Custom_Border_Color_Features
                        (Ada_Struct),
                     To_Access(Next).all);
                end;
            when Physical_Device_Descriptor_Buffer_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Descriptor_Buffer_Properties_C_Access);
                begin
              To_Ada(Extensions.EXT.Physical_Device_Descriptor_Buffer_Properties
                        (Ada_Struct),
                     To_Access(Next).all);
                end;
            when Physical_Device_Descriptor_Buffer_Density_Map_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
            (C.Out_Structure_C_Access,
             Physical_Device_Descriptor_Buffer_Density_Map_Properties_C_Access);
                begin
  To_Ada(Extensions.EXT.Physical_Device_Descriptor_Buffer_Density_Map_Properties
             (Ada_Struct),
         To_Access(Next).all);
                end;
            when Physical_Device_Descriptor_Buffer_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Descriptor_Buffer_Features_C_Access);
                begin
                To_Ada(Extensions.EXT.Physical_Device_Descriptor_Buffer_Features
                          (Ada_Struct),
                       To_Access(Next).all);
                end;
            when Descriptor_Address_Info_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Descriptor_Address_Info_C_Access);
                begin
                    To_Ada(Extensions.EXT.Descriptor_Address_Info
                              (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Physical_Device_Graphics_Pipeline_Library_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                  (C.Out_Structure_C_Access,
                   Physical_Device_Graphics_Pipeline_Library_Features_C_Access);
                begin
                    To_Ada
              (Extensions.EXT.Physical_Device_Graphics_Pipeline_Library_Features
                  (Ada_Struct),
               To_Access(Next).all);
                end;
            when Physical_Device_Graphics_Pipeline_Library_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                (C.Out_Structure_C_Access,
                 Physical_Device_Graphics_Pipeline_Library_Properties_C_Access);
                begin
                    To_Ada
            (Extensions.EXT.Physical_Device_Graphics_Pipeline_Library_Properties
               (Ada_Struct),
             To_Access(Next).all);
                end;
            when Physical_Device_Fragment_Density_Map_2_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                     (C.Out_Structure_C_Access,
                      Physical_Device_Fragment_Density_Map_2_Features_C_Access);
                begin
                    To_Ada
                 (Extensions.EXT.Physical_Device_Fragment_Density_Map_2_Features
                     (Ada_Struct),
                  To_Access(Next).all);
                end;
            when Physical_Device_Fragment_Density_Map_2_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                   (C.Out_Structure_C_Access,
                    Physical_Device_Fragment_Density_Map_2_Properties_C_Access);
                begin
                    To_Ada
               (Extensions.EXT.Physical_Device_Fragment_Density_Map_2_Properties
                  (Ada_Struct),
                To_Access(Next).all);
                end;
            when Physical_Device_Image_Compression_Control_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                  (C.Out_Structure_C_Access,
                   Physical_Device_Image_Compression_Control_Features_C_Access);
                begin
                    To_Ada
              (Extensions.EXT.Physical_Device_Image_Compression_Control_Features
                 (Ada_Struct),
               To_Access(Next).all);
                end;
            when Image_Compression_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Image_Compression_Properties_C_Access);
                begin
                    To_Ada(Extensions.EXT.Image_Compression_Properties
                             (Ada_Struct),
                           To_Access(Next).all);
                end;
           when Physical_Device_Attachment_Feedback_Loop_Layout_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
            (C.Out_Structure_C_Access,
             Physical_Device_Attachment_Feedback_Loop_Layout_Features_C_Access);
                begin
                    To_Ada
        (Extensions.EXT.Physical_Device_Attachment_Feedback_Loop_Layout_Features
          (Ada_Struct),
         To_Access(Next).all);
                end;
           when Physical_Device_Fault_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Fault_Features_C_Access);
                begin
                    To_Ada(Extensions.EXT.Physical_Device_Fault_Features
                              (Ada_Struct),
                           To_Access(Next).all);
                end;
           when Device_Fault_Counts_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Device_Fault_Counts_C_Access);
                begin
                    To_Ada(Extensions.EXT.Device_Fault_Counts(Ada_Struct),
                           To_Access(Next).all);
                end;
           when Device_Fault_Info_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Device_Fault_Info_C_Access);
                begin
                    To_Ada(Extensions.EXT.Device_Fault_Info(Ada_Struct),
                           To_Access(Next).all);
                end;
           when Physical_Device_RGBA10x6_Formats_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_RGBA10x6_Formats_Features_C_Access);
                begin
                    To_Ada
          (Extensions.EXT.Physical_Device_RGBA10x6_Formats_Features(Ada_Struct),
           To_Access(Next).all);
                end;
           when Physical_Device_Vertex_Input_Dynamic_State_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                 (C.Out_Structure_C_Access,
                  Physical_Device_Vertex_Input_Dynamic_State_Features_C_Access);
                begin
                    To_Ada
             (Extensions.EXT.Physical_Device_Vertex_Input_Dynamic_State_Features
              (Ada_Struct),
              To_Access(Next).all);
                end;
           when Vertex_Input_Binding_Description_2_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Vertex_Input_Binding_Description_2_C_Access);
                begin
                    To_Ada(Extensions.EXT.Vertex_Input_Binding_Description_2
                              (Ada_Struct),
                           To_Access(Next).all);
                end;
           when Vertex_Input_Attribute_Description_2_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Vertex_Input_Attribute_Description_2_C_Access);
                begin
                    To_Ada(Extensions.EXT.Vertex_Input_Attribute_Description_2
                              (Ada_Struct),
                           To_Access(Next).all);
                end;
           when Physical_Device_DRM_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_DRM_Properties_C_Access);
                begin
                    To_Ada(Extensions.EXT.Physical_Device_DRM_Properties
                              (Ada_Struct),
                           To_Access(Next).all);
                end;
           when Physical_Device_Address_Binding_Report_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Address_Binding_Report_Features_C_Access);
                begin
           To_Ada(Extensions.EXT.Physical_Device_Address_Binding_Report_Features
                     (Ada_Struct),
                  To_Access(Next).all);
                end;
           when Device_Address_Binding_Callback_Data_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Device_Address_Binding_Callback_Data_C_Access);
                begin
                    To_Ada(Extensions.EXT.Device_Address_Binding_Callback_Data
                              (Ada_Struct),
                           To_Access(Next).all);
                end;
           when Physical_Device_Depth_Clip_Control_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Depth_Clip_Control_Features_C_Access);
                begin
               To_Ada(Extensions.EXT.Physical_Device_Depth_Clip_Control_Features
                         (Ada_Struct),
                      To_Access(Next).all);
                end;
           when Physical_Device_Primitive_Topology_List_Restart_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
            (C.Out_Structure_C_Access,
             Physical_Device_Primitive_Topology_List_Restart_Features_C_Access);
                begin
                    To_Ada
        (Extensions.EXT.Physical_Device_Primitive_Topology_List_Restart_Features
            (Ada_Struct),
         To_Access(Next).all);
                end;
           when Pipeline_Properties_Identifier_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Pipeline_Properties_Identifier_C_Access);
                begin
                    To_Ada(Extensions.EXT.Pipeline_Properties_Identifier
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
           when Physical_Device_Pipeline_Properties_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Pipeline_Properties_Features_C_Access);
                begin
                    To_Ada
                    (Extensions.EXT.Physical_Device_Pipeline_Properties_Features
                        (Ada_Struct),
                     To_Access(Next).all);
                end;
           when Physical_Device_Frame_Boundary_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Frame_Boundary_Features_C_Access);
                begin
                    To_Ada
                        (Extensions.EXT.Physical_Device_Frame_Boundary_Features
                            (Ada_Struct),
                         To_Access(Next).all);
                end;
           when Physical_Device_Multisampled_Render_To_Single_Sampled_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Multisampled_Render_To_Single_Sampled_Features_C_Access);
                begin
                    To_Ada
                        (Extensions.EXT.Physical_Device_Multisampled_Render_To_Single_Sampled_Features
                            (Ada_Struct),
                         To_Access(Next).all);
                end;
           when Subpass_Resolve_Performance_Query_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Subpass_Resolve_Performance_Query_C_Access);
                begin
                    To_Ada(Extensions.EXT.Subpass_Resolve_Performance_Query
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Physical_Device_Color_Write_Enable_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Color_Write_Enable_Features_C_Access);
                begin
                    To_Ada
                     (Extensions.EXT.Physical_Device_Color_Write_Enable_Features
                         (Ada_Struct),
                      To_Access(Next).all);
                end;
            when Physical_Device_Primitives_Generated_Query_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Primitives_Generated_Query_Features_C_Access);
                begin
                    To_Ada
                     (Extensions.EXT.Physical_Device_Primitives_Generated_Query_Features
                         (Ada_Struct),
                      To_Access(Next).all);
                end;
            when Physical_Device_Image_View_Min_LOD_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Image_View_Min_LOD_Features_C_Access);
                begin
                    To_Ada
                     (Extensions.EXT.Physical_Device_Image_View_Min_LOD_Features
                         (Ada_Struct),
                      To_Access(Next).all);
                end;
            when Physical_Device_Multi_Draw_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Multi_Draw_Features_C_Access);
                begin
                    To_Ada
                     (Extensions.EXT.Physical_Device_Multi_Draw_Features
                         (Ada_Struct),
                      To_Access(Next).all);
                end;
            when Physical_Device_Multi_Draw_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Multi_Draw_Properties_C_Access);
                begin
                    To_Ada
                     (Extensions.EXT.Physical_Device_Multi_Draw_Properties
                         (Ada_Struct),
                      To_Access(Next).all);
                end;
            when Physical_Device_Image_2D_View_Of_3D_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Image_2D_View_Of_3D_Features_C_Access);
                begin
                    To_Ada
                    (Extensions.EXT.Physical_Device_Image_2D_View_Of_3D_Features
                        (Ada_Struct),
                     To_Access(Next).all);
                end;
            when Physical_Device_Shader_Tile_Image_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Shader_Tile_Image_Features_C_Access);
                begin
                    To_Ada
                     (Extensions.EXT.Physical_Device_Shader_Tile_Image_Features
                         (Ada_Struct),
                      To_Access(Next).all);
                end;
            when Physical_Device_Shader_Tile_Image_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Shader_Tile_Image_Properties_C_Access);
                begin
                    To_Ada
                    (Extensions.EXT.Physical_Device_Shader_Tile_Image_Properties
                        (Ada_Struct),
                     To_Access(Next).all);
                end;
            when Physical_Device_Opacity_Micromap_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Opacity_Micromap_Features_C_Access);
                begin
                    To_Ada
                    (Extensions.EXT.Physical_Device_Opacity_Micromap_Features
                        (Ada_Struct),
                     To_Access(Next).all);
                end;
            when Physical_Device_Opacity_Micromap_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Opacity_Micromap_Properties_C_Access);
                begin
                    To_Ada
                    (Extensions.EXT.Physical_Device_Opacity_Micromap_Properties
                        (Ada_Struct),
                     To_Access(Next).all);
                end;
            when Acceleration_Structure_Triangles_Opacity_Micromap_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Acceleration_Structure_Triangles_Opacity_Micromap_C_Access);
                begin
                    To_Ada
                    (Extensions.EXT.Acceleration_Structure_Triangles_Opacity_Micromap
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
            when Pipeline_Rasterization_State_Stream_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                     (Pipeline_Rasterization_State_Stream_Create_Info_C,
                      Pipeline_Rasterization_State_Stream_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Image_View_ASTC_Decode_Mode_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Image_View_ASTC_Decode_Mode_C,
                         Image_View_ASTC_Decode_Mode_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Conditional_Rendering_Begin_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Conditional_Rendering_Begin_Info_C,
                         Conditional_Rendering_Begin_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Command_Buffer_Inheritance_Conditional_Rendering_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
               (Command_Buffer_Inheritance_Conditional_Rendering_Info_C,
                Command_Buffer_Inheritance_Conditional_Rendering_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Display_Power_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Display_Power_Info_C, Display_Power_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Device_Event_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Device_Event_Info_C, Device_Event_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Display_Event_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Display_Event_Info_C, Display_Event_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Swapchain_Counter_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Swapchain_Counter_Create_Info_C,
                         Swapchain_Counter_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Discard_Rectangle_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Pipeline_Discard_Rectangle_State_Create_Info_C,
                         Pipeline_Discard_Rectangle_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Rasterization_Conservative_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
               (Pipeline_Rasterization_Conservative_State_Create_Info_C,
                Pipeline_Rasterization_Conservative_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Rasterization_Depth_Clip_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                 (Pipeline_Rasterization_Depth_Clip_State_Create_Info_C,
                  Pipeline_Rasterization_Depth_Clip_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when HDR_Metadata_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (HDR_Metadata_C, HDR_Metadata_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Debug_Utils_Label_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Debug_Utils_Label_C,
                         Debug_Utils_Label_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Debug_Utils_Object_Name_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Debug_Utils_Object_Name_Info_C,
                         Debug_Utils_Object_Name_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Debug_Utils_Messenger_Callback_Data_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Debug_Utils_Messenger_Callback_Data_C,
                         Debug_Utils_Messenger_Callback_Data_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Debug_Utils_Messenger_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Debug_Utils_Messenger_Create_Info_C,
                         Debug_Utils_Messenger_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Debug_Utils_Object_Tag_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Debug_Utils_Object_Tag_Info_C,
                         Debug_Utils_Object_Tag_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Sample_Locations_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Sample_Locations_Info_C,
                         Sample_Locations_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Render_Pass_Sample_Locations_Begin_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Render_Pass_Sample_Locations_Begin_Info_C,
                         Render_Pass_Sample_Locations_Begin_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Sample_Locations_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Pipeline_Sample_Locations_State_Create_Info_C,
                         Pipeline_Sample_Locations_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Color_Blend_Advanced_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                     (Pipeline_Color_Blend_Advanced_State_Create_Info_C,
                      Pipeline_Color_Blend_Advanced_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Image_DRM_Format_Modifier_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                      (Physical_Device_Image_DRM_Format_Modifier_Info_C,
                       Physical_Device_Image_DRM_Format_Modifier_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Image_DRM_Format_Modifier_List_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Image_DRM_Format_Modifier_List_Create_Info_C,
                         Image_DRM_Format_Modifier_List_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Image_DRM_Format_Modifier_Explicit_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                      (Image_DRM_Format_Modifier_Explicit_Create_Info_C,
                       Image_DRM_Format_Modifier_Explicit_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Validation_Cache_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Validation_Cache_Create_Info_C,
                         Validation_Cache_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Shader_Module_Validation_Cache_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Shader_Module_Validation_Cache_Create_Info_C,
                         Shader_Module_Validation_Cache_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Import_Memory_Host_Pointer_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Import_Memory_Host_Pointer_Info_C,
                         Import_Memory_Host_Pointer_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Render_Pass_Fragment_Density_Map_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Render_Pass_Fragment_Density_Map_Create_Info_C,
                         Render_Pass_Fragment_Density_Map_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Rendering_Fragment_Density_Map_Attachment_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                      (Rendering_Fragment_Density_Map_Attachment_Info_C,
                       Rendering_Fragment_Density_Map_Attachment_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Memory_Priority_Allocate_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Memory_Priority_Allocate_Info_C,
                         Memory_Priority_Allocate_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
          when Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
           (Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_C,
            Pipeline_Rasterization_Provoking_Vertex_State_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Headless_Surface_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Headless_Surface_Create_Info_C,
                         Headless_Surface_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Memory_Map_Placed_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Memory_Map_Placed_Info_C,
                         Memory_Map_Placed_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Depth_Bias_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Depth_Bias_Info_C,
                         Depth_Bias_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Depth_Bias_Representation_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Depth_Bias_Representation_Info_C,
                         Depth_Bias_Representation_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Device_Device_Memory_Report_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Device_Device_Memory_Report_Create_Info_C,
                         Device_Device_Memory_Report_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Sampler_Custom_Border_Color_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Sampler_Custom_Border_Color_Create_Info_C,
                         Sampler_Custom_Border_Color_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Descriptor_Buffer_Binding_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Descriptor_Buffer_Binding_Info_C,
                         Descriptor_Buffer_Binding_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
             (Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_C,
              Descriptor_Buffer_Binding_Push_Descriptor_Buffer_Handle_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Descriptor_Get_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Descriptor_Get_Info_C,
                         Descriptor_Get_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Buffer_Capture_Descriptor_Data_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Buffer_Capture_Descriptor_Data_Info_C,
                         Buffer_Capture_Descriptor_Data_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Image_Capture_Descriptor_Data_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Image_Capture_Descriptor_Data_Info_C,
                         Image_Capture_Descriptor_Data_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Image_View_Capture_Descriptor_Data_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Image_View_Capture_Descriptor_Data_Info_C,
                         Image_View_Capture_Descriptor_Data_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Sampler_Capture_Descriptor_Data_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Sampler_Capture_Descriptor_Data_Info_C,
                         Sampler_Capture_Descriptor_Data_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Opaque_Capture_Descriptor_Data_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Opaque_Capture_Descriptor_Data_Create_Info_C,
                         Opaque_Capture_Descriptor_Data_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Acceleration_Structure_Capture_Descriptor_Data_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                 (Acceleration_Structure_Capture_Descriptor_Data_Info_C,
                  Acceleration_Structure_Capture_Descriptor_Data_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Graphics_Pipeline_Library_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Graphics_Pipeline_Library_Create_Info_C,
                         Graphics_Pipeline_Library_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Image_Compression_Control_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Image_Compression_Control_C,
                         Image_Compression_Control_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Viewport_Depth_Clip_Control_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                    (Pipeline_Viewport_Depth_Clip_Control_Create_Info_C,
                     Pipeline_Viewport_Depth_Clip_Control_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Frame_Boundary_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Frame_Boundary_C,
                         Frame_Boundary_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Multisampled_Render_To_Single_Sampled_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Multisampled_Render_To_Single_Sampled_Info_C,
                         Multisampled_Render_To_Single_Sampled_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Color_Write_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Pipeline_Color_Write_Create_Info_C,
                         Pipeline_Color_Write_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Image_View_Min_LOD_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Image_View_Min_LOD_Create_Info_C,
                         Image_View_Min_LOD_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Micromap_Build_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Micromap_Build_Info_C,
                         Micromap_Build_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Micromap_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Micromap_Create_Info_C,
                         Micromap_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Micromap_Version_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Micromap_Version_Info_C,
                         Micromap_Version_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Copy_Micromap_To_Memory_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Copy_Micromap_To_Memory_Info_C,
                         Copy_Micromap_To_Memory_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Copy_Memory_To_Micromap_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Copy_Memory_To_Micromap_Info_C,
                         Copy_Memory_To_Micromap_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Copy_Micromap_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Copy_Micromap_Info_C,
                         Copy_Micromap_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Micromap_Build_Sizes_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Micromap_Build_Sizes_Info_C,
                         Micromap_Build_Sizes_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Metal_Surface_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Metal_Surface_Create_Info_C,
                         Metal_Surface_Create_Info_C_Access);
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
            when Physical_Device_Transform_Feedback_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Transform_Feedback_Features_C,
                         Physical_Device_Transform_Feedback_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Transform_Feedback_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                       (Physical_Device_Transform_Feedback_Properties_C,
                        Physical_Device_Transform_Feedback_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_ASTC_Decode_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_ASTC_Decode_Features_C,
                         Physical_Device_ASTC_Decode_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Conditional_Rendering_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                      (Physical_Device_Conditional_Rendering_Features_C,
                       Physical_Device_Conditional_Rendering_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Surface_Capabilities_2_EXT_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Surface_Capabilities_2_C,
                         Surface_Capabilities_2_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Discard_Rectangle_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Discard_Rectangle_Properties_C,
                         Physical_Device_Discard_Rectangle_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Conservative_Rasterization_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
               (Physical_Device_Conservative_Rasterization_Properties_C,
                Physical_Device_Conservative_Rasterization_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Depth_Clip_Enable_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Depth_Clip_Enable_Features_C,
                         Physical_Device_Depth_Clip_Enable_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Sample_Locations_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Sample_Locations_Properties_C,
                         Physical_Device_Sample_Locations_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Multisample_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Multisample_Properties_C,
                         Multisample_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Blend_Operation_Advanced_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                   (Physical_Device_Blend_Operation_Advanced_Features_C,
                    Physical_Device_Blend_Operation_Advanced_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Blend_Operation_Advanced_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                 (Physical_Device_Blend_Operation_Advanced_Properties_C,
                  Physical_Device_Blend_Operation_Advanced_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when DRM_Format_Modifier_Properties_List_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (DRM_Format_Modifier_Properties_List_C,
                         DRM_Format_Modifier_Properties_List_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Image_DRM_Format_Modifier_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Image_DRM_Format_Modifier_Properties_C,
                         Image_DRM_Format_Modifier_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when DRM_Format_Modifier_Properties_List_2_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (DRM_Format_Modifier_Properties_List_2_C,
                         DRM_Format_Modifier_Properties_List_2_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Image_View_Image_Format_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Image_View_Image_Format_Info_C,
                         Physical_Device_Image_View_Image_Format_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Filter_Cubic_Image_View_Image_Format_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                     (Filter_Cubic_Image_View_Image_Format_Properties_C,
                      Filter_Cubic_Image_View_Image_Format_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Memory_Host_Pointer_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Memory_Host_Pointer_Properties_C,
                         Memory_Host_Pointer_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_External_Memory_Host_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                     (Physical_Device_External_Memory_Host_Properties_C,
                      Physical_Device_External_Memory_Host_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_PCI_Bus_Info_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_PCI_Bus_Info_Properties_C,
                         Physical_Device_PCI_Bus_Info_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Fragment_Density_Map_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                       (Physical_Device_Fragment_Density_Map_Features_C,
                        Physical_Device_Fragment_Density_Map_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Fragment_Density_Map_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                     (Physical_Device_Fragment_Density_Map_Properties_C,
                      Physical_Device_Fragment_Density_Map_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Shader_Image_Atomic_Int64_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                  (Physical_Device_Shader_Image_Atomic_Int64_Features_C,
                   Physical_Device_Shader_Image_Atomic_Int64_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Memory_Budget_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Memory_Budget_Properties_C,
                         Physical_Device_Memory_Budget_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Memory_Priority_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Memory_Priority_Features_C,
                         Physical_Device_Memory_Priority_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Fragment_Shader_Interlock_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                  (Physical_Device_Fragment_Shader_Interlock_Features_C,
                   Physical_Device_Fragment_Shader_Interlock_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_YCbCr_Image_Arrays_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_YCbCr_Image_Arrays_Features_C,
                         Physical_Device_YCbCr_Image_Arrays_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Provoking_Vertex_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Provoking_Vertex_Features_C,
                         Physical_Device_Provoking_Vertex_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Provoking_Vertex_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Provoking_Vertex_Properties_C,
                         Physical_Device_Provoking_Vertex_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Shader_Atomic_Float_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Shader_Atomic_Float_Features_C,
                         Physical_Device_Shader_Atomic_Float_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Map_Memory_Placed_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Map_Memory_Placed_Features_C,
                         Physical_Device_Map_Memory_Placed_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Map_Memory_Placed_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Map_Memory_Placed_Properties_C,
                         Physical_Device_Map_Memory_Placed_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Shader_Atomic_Float_2_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                      (Physical_Device_Shader_Atomic_Float_2_Features_C,
                       Physical_Device_Shader_Atomic_Float_2_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Depth_Bias_Control_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Depth_Bias_Control_Features_C,
                         Physical_Device_Depth_Bias_Control_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Device_Memory_Report_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                       (Physical_Device_Device_Memory_Report_Features_C,
                        Physical_Device_Device_Memory_Report_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Device_Memory_Report_Callback_Data_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Device_Memory_Report_Callback_Data_C,
                         Device_Memory_Report_Callback_Data_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Custom_Border_Color_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                      (Physical_Device_Custom_Border_Color_Properties_C,
                       Physical_Device_Custom_Border_Color_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Custom_Border_Color_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Custom_Border_Color_Features_C,
                         Physical_Device_Custom_Border_Color_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Descriptor_Buffer_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Descriptor_Buffer_Properties_C,
                         Physical_Device_Descriptor_Buffer_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Descriptor_Buffer_Density_Map_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
            (Physical_Device_Descriptor_Buffer_Density_Map_Properties_C,
             Physical_Device_Descriptor_Buffer_Density_Map_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Descriptor_Buffer_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Descriptor_Buffer_Features_C,
                         Physical_Device_Descriptor_Buffer_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Descriptor_Address_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Descriptor_Address_Info_C,
                         Descriptor_Address_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Graphics_Pipeline_Library_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                  (Physical_Device_Graphics_Pipeline_Library_Features_C,
                   Physical_Device_Graphics_Pipeline_Library_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Graphics_Pipeline_Library_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                (Physical_Device_Graphics_Pipeline_Library_Properties_C,
                 Physical_Device_Graphics_Pipeline_Library_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Fragment_Density_Map_2_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                     (Physical_Device_Fragment_Density_Map_2_Features_C,
                      Physical_Device_Fragment_Density_Map_2_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Fragment_Density_Map_2_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                   (Physical_Device_Fragment_Density_Map_2_Properties_C,
                    Physical_Device_Fragment_Density_Map_2_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Image_Compression_Control_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                  (Physical_Device_Image_Compression_Control_Features_C,
                   Physical_Device_Image_Compression_Control_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Image_Compression_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Image_Compression_Properties_C,
                         Image_Compression_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Attachment_Feedback_Loop_Layout_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
            (Physical_Device_Attachment_Feedback_Loop_Layout_Features_C,
             Physical_Device_Attachment_Feedback_Loop_Layout_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Fault_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Fault_Features_C,
                         Physical_Device_Fault_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Device_Fault_Counts_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Device_Fault_Counts_C,
                         Device_Fault_Counts_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Device_Fault_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Device_Fault_Info_C,
                         Device_Fault_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_RGBA10x6_Formats_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_RGBA10x6_Formats_Features_C,
                         Physical_Device_RGBA10x6_Formats_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Vertex_Input_Dynamic_State_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                 (Physical_Device_Vertex_Input_Dynamic_State_Features_C,
                  Physical_Device_Vertex_Input_Dynamic_State_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Vertex_Input_Binding_Description_2_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Vertex_Input_Binding_Description_2_C,
                         Vertex_Input_Binding_Description_2_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Vertex_Input_Attribute_Description_2_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Vertex_Input_Attribute_Description_2_C,
                         Vertex_Input_Attribute_Description_2_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_DRM_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_DRM_Properties_C,
                         Physical_Device_DRM_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Address_Binding_Report_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                     (Physical_Device_Address_Binding_Report_Features_C,
                      Physical_Device_Address_Binding_Report_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Device_Address_Binding_Callback_Data_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Device_Address_Binding_Callback_Data_C,
                         Device_Address_Binding_Callback_Data_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Depth_Clip_Control_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Depth_Clip_Control_Features_C,
                         Physical_Device_Depth_Clip_Control_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Primitive_Topology_List_Restart_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
            (Physical_Device_Primitive_Topology_List_Restart_Features_C,
             Physical_Device_Primitive_Topology_List_Restart_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Pipeline_Properties_Identifier_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Pipeline_Properties_Identifier_C,
                         Pipeline_Properties_Identifier_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Pipeline_Properties_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Pipeline_Properties_Features_C,
                         Physical_Device_Pipeline_Properties_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Frame_Boundary_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Frame_Boundary_Features_C,
                         Physical_Device_Frame_Boundary_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Multisampled_Render_To_Single_Sampled_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Multisampled_Render_To_Single_Sampled_Features_C,
                         Physical_Device_Multisampled_Render_To_Single_Sampled_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Subpass_Resolve_Performance_Query_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Subpass_Resolve_Performance_Query_C,
                         Subpass_Resolve_Performance_Query_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Color_Write_Enable_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Color_Write_Enable_Features_C,
                         Physical_Device_Color_Write_Enable_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Primitives_Generated_Query_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Primitives_Generated_Query_Features_C,
                         Physical_Device_Primitives_Generated_Query_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Image_View_Min_LOD_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Image_View_Min_LOD_Features_C,
                         Physical_Device_Image_View_Min_LOD_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Multi_Draw_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Multi_Draw_Features_C,
                         Physical_Device_Multi_Draw_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Multi_Draw_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Multi_Draw_Properties_C,
                         Physical_Device_Multi_Draw_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Image_2D_View_Of_3D_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Image_2D_View_Of_3D_Features_C,
                         Physical_Device_Image_2D_View_Of_3D_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Shader_Tile_Image_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Shader_Tile_Image_Features_C,
                         Physical_Device_Shader_Tile_Image_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Shader_Tile_Image_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Shader_Tile_Image_Properties_C,
                         Physical_Device_Shader_Tile_Image_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Opacity_Micromap_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Opacity_Micromap_Features_C,
                         Physical_Device_Opacity_Micromap_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Opacity_Micromap_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Opacity_Micromap_Properties_C,
                         Physical_Device_Opacity_Micromap_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Acceleration_Structure_Triangles_Opacity_Micromap_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                    (Acceleration_Structure_Triangles_Opacity_Micromap_C,
                     Acceleration_Structure_Triangles_Opacity_Micromap_C_Access);
                begin
                    Free_Struct(Next);
                end;
        end case;
    end Free;

    procedure Free(Struct: in out Attachment_Sample_Locations_C) is
    begin
        Free(Struct.Sample_Locations_Info);
    end Free;

    procedure Free(Struct: in out Subpass_Sample_Locations_C) is
    begin
        Free(Struct.Sample_Locations_Info);
    end Free;
end Vulkan.C_EXT;

