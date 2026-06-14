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

-- C interface for QCOM records

with Vulkan.C;
with Vulkan.Extensions.QCOM;
with Vulkan.Extensions.KHR;

private package Vulkan.C_QCOM is
    -- Extension record identifiers.
    subtype Structure is Structure_Type
        with Static_Predicate => Structure in
            Render_Pass_Transform_Begin_Info_Type |
            Command_Buffer_Inheritance_Render_Pass_Transform_Info_Type |
            Physical_Device_Tile_Shading_Features_Type |
            Physical_Device_Tile_Shading_Properties_Type |
            Render_Pass_Tile_Shading_Create_Info_Type |
            Per_Tile_Begin_Info_Type |
            Per_Tile_End_Info_Type |
            Dispatch_Tile_Info_Type |
            Copy_Command_Transform_Info_Type;
    
    subtype Out_Structure is Structure
        with Static_Predicate => Out_Structure in Out_Structure_Type;

    subtype In_Structure is Structure
        with Static_Predicate => In_Structure not in Out_Structure;

    -- C interface records.
    type Render_Pass_Transform_Begin_Info_C is
    record
        Record_Type: Out_Structure_Type :=
            Render_Pass_Transform_Begin_Info_Type;
        Next: C.Out_Structure_C_Access;
        Transform: Extensions.KHR.Surface_Transform_Flags;
        Render_Area: Rect_2D;
    end record
        with Convention => C;

    type Render_Pass_Transform_Begin_Info_C_Access is
        access Render_Pass_Transform_Begin_Info_C
        with Convention => C;

    type Command_Buffer_Inheritance_Render_Pass_Transform_Info_C is
    record
        Record_Type: Out_Structure_Type :=
            Command_Buffer_Inheritance_Render_Pass_Transform_Info_Type;
        Next: C.Out_Structure_C_Access;
        Transform: Extensions.KHR.Surface_Transform_Flags;
        Render_Area: Rect_2D;
    end record
        with Convention => C;

    type Command_Buffer_Inheritance_Render_Pass_Transform_Info_C_Access is
        access Command_Buffer_Inheritance_Render_Pass_Transform_Info_C
        with Convention => C;

    type Physical_Device_Tile_Shading_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Tile_Shading_Features_Type;
        Next: C.Out_Structure_C_Access;
        Tile_Shading: Interfaces.Unsigned_32;
        Tile_Shading_Fragment_Stage: Interfaces.Unsigned_32;
        Tile_Shading_Color_Attachments: Interfaces.Unsigned_32;
        Tile_Shading_Depth_Attachments: Interfaces.Unsigned_32;
        Tile_Shading_Stencil_Attachments: Interfaces.Unsigned_32;
        Tile_Shading_Input_Attachments: Interfaces.Unsigned_32;
        Tile_Shading_Sampled_Attachments: Interfaces.Unsigned_32;
        Tile_Shading_Per_Tile_Draw: Interfaces.Unsigned_32;
        Tile_Shading_Per_Tile_Dispatch: Interfaces.Unsigned_32;
        Tile_Shading_Dispatch_Tile: Interfaces.Unsigned_32;
        Tile_Shading_Apron: Interfaces.Unsigned_32;
        Tile_Shading_Anisotropic_Apron: Interfaces.Unsigned_32;
        Tile_Shading_Atomic_Ops: Interfaces.Unsigned_32;
        Tile_Shading_Image_Processing: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Tile_Shading_Features_C_Access is
        access Physical_Device_Tile_Shading_Features_C
        with Convention => C;

    type Physical_Device_Tile_Shading_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Tile_Shading_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Max_Apron_Size: Interfaces.Unsigned_32;
        Prefer_Non_Coherent: Interfaces.Unsigned_32;
        Tile_Granularity: Extent_2D;
        Max_Tile_Shading_Rate: Extent_2D;
    end record
        with Convention => C;

    type Physical_Device_Tile_Shading_Properties_C_Access is
        access Physical_Device_Tile_Shading_Properties_C
        with Convention => C;

    type Render_Pass_Tile_Shading_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Render_Pass_Tile_Shading_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Flags: Extensions.QCOM.Tile_Shading_Render_Pass_Flags;
        Tile_Apron_Size: Extent_2D;
    end record
        with Convention => C;

    type Render_Pass_Tile_Shading_Create_Info_C_Access is
        access Render_Pass_Tile_Shading_Create_Info_C
        with Convention => C;

    type Per_Tile_Begin_Info_C is
    record
        Record_Type: In_Structure_Type := Per_Tile_Begin_Info_Type;
        Next: C.In_Structure_C_Access;
    end record
        with Convention => C;

    type Per_Tile_Begin_Info_C_Access is access Per_Tile_Begin_Info_C
        with Convention => C;

    type Per_Tile_End_Info_C is
    record
        Record_Type: In_Structure_Type := Per_Tile_End_Info_Type;
        Next: C.In_Structure_C_Access;
    end record
        with Convention => C;

    type Per_Tile_End_Info_C_Access is access Per_Tile_End_Info_C
        with Convention => C;

    type Dispatch_Tile_Info_C is
    record
        Record_Type: In_Structure_Type := Dispatch_Tile_Info_Type;
        Next: C.In_Structure_C_Access;
    end record
        with Convention => C;

    type Dispatch_Tile_Info_C_Access is access Dispatch_Tile_Info_C
        with Convention => C;

    type Copy_Command_Transform_Info_C is
    record
        Record_Type: In_Structure_Type := Copy_Command_Transform_Info_Type;
        Next: C.In_Structure_C_Access;
        Transform: Extensions.KHR.Surface_Transform_Flags;
    end record
        with Convention => C;

    type Copy_Command_Transform_Info_C_Access is
        access Copy_Command_Transform_Info_C
        with Convention => C;

    -- Conversion subprograms.
    procedure To_Ada
        (Ada_Struct: in out Extensions.QCOM.Render_Pass_Transform_Begin_Info;
         C_Struct: in Render_Pass_Transform_Begin_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
          Extensions.QCOM.Command_Buffer_Inheritance_Render_Pass_Transform_Info;
         C_Struct: in Command_Buffer_Inheritance_Render_Pass_Transform_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.QCOM.Physical_Device_Tile_Shading_Features;
         C_Struct: in Physical_Device_Tile_Shading_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.QCOM.Physical_Device_Tile_Shading_Properties;
         C_Struct: in Physical_Device_Tile_Shading_Properties_C);

    function To_C
        (Struct: in Extensions.QCOM.Render_Pass_Tile_Shading_Create_Info)
        return Render_Pass_Tile_Shading_Create_Info_C;
    procedure Free(Struct: in out Render_Pass_Tile_Shading_Create_Info_C);

    function To_C(Struct: in Extensions.QCOM.Per_Tile_Begin_Info)
        return Per_Tile_Begin_Info_C;
    procedure Free(Struct: in out Per_Tile_Begin_Info_C);

    function To_C(Struct: in Extensions.QCOM.Per_Tile_End_Info)
        return Per_Tile_End_Info_C;
    procedure Free(Struct: in out Per_Tile_End_Info_C);

    function To_C(Struct: in Extensions.QCOM.Dispatch_Tile_Info)
        return Dispatch_Tile_Info_C;
    procedure Free(Struct: in out Dispatch_Tile_Info_C);

    function To_C(Struct: in Extensions.QCOM.Copy_Command_Transform_Info)
        return Copy_Command_Transform_Info_C;
    procedure Free(Struct: in out Copy_Command_Transform_Info_C);

    -- Extension record conversion.
    function To_C(Next: in In_Structure_Access) return C.In_Structure_C_Access;
    function To_C(Next: in Out_Structure_Access)
        return C.Out_Structure_C_Access;
    procedure To_Ada(Ada_Struct: in out Vulkan.Out_Structure'Class;
                     Next: in C.Out_Structure_C_Access);
    procedure Free(Next: in out C.In_Structure_C_Access);
    procedure Free(Next: in out C.Out_Structure_C_Access);
end Vulkan.C_QCOM;

