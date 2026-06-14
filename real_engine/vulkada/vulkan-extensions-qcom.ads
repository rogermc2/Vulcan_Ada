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

-- Qualcomm extensions root package

with Vulkan.Extensions.KHR;

package Vulkan.Extensions.QCOM is
    -- Bitfields.
    type Tile_Shading_Render_Pass_Flags is new Flags;

    Tile_Shading_Render_Pass_No_Bit:
        constant Tile_Shading_Render_Pass_Flags := 0;
    Tile_Shading_Render_Pass_Enable_Bit:
        constant Tile_Shading_Render_Pass_Flags := 16#00000001#;
    Tile_Shading_Render_Pass_Per_Tile_Execution_Bit:
        constant Tile_Shading_Render_Pass_Flags := 16#00000002#;

    -- Records.
    type Render_Pass_Transform_Begin_Info is new Out_Structure
        (Render_Pass_Transform_Begin_Info_Type) with
    record
        Transform: KHR.Surface_Transform_Flags := KHR.Surface_Transform_No_Bit;
    end record;

    type Command_Buffer_Inheritance_Render_Pass_Transform_Info is
        new Out_Structure
            (Command_Buffer_Inheritance_Render_Pass_Transform_Info_Type) with
    record
        Transform: KHR.Surface_Transform_Flags := KHR.Surface_Transform_No_Bit;
        Render_Area: Rect_2D;
    end record;

    type Physical_Device_Tile_Shading_Features is new Out_Structure
        (Physical_Device_Tile_Shading_Features_Type) with
    record
        Tile_Shading: Boolean;
        Tile_Shading_Fragment_Stage: Boolean;
        Tile_Shading_Color_Attachments: Boolean;
        Tile_Shading_Depth_Attachments: Boolean;
        Tile_Shading_Stencil_Attachments: Boolean;
        Tile_Shading_Input_Attachments: Boolean;
        Tile_Shading_Sampled_Attachments: Boolean;
        Tile_Shading_Per_Tile_Draw: Boolean;
        Tile_Shading_Per_Tile_Dispatch: Boolean;
        Tile_Shading_Dispatch_Tile: Boolean;
        Tile_Shading_Apron: Boolean;
        Tile_Shading_Anisotropic_Apron: Boolean;
        Tile_Shading_Atomic_Ops: Boolean;
        Tile_Shading_Image_Processing: Boolean;
    end record;

    type Physical_Device_Tile_Shading_Properties is new Out_Structure
        (Physical_Device_Tile_Shading_Properties_Type) with
    record
        Max_Apron_Size: Interfaces.Unsigned_32;
        Prefer_Non_Coherent: Boolean;
        Tile_Granularity: Extent_2D;
        Max_Tile_Shading_Rate: Extent_2D;
    end record;

    type Render_Pass_Tile_Shading_Create_Info is new In_Structure
        (Render_Pass_Tile_Shading_Create_Info_Type) with
    record
        Flags: Tile_Shading_Render_Pass_Flags :=
            Tile_Shading_Render_Pass_No_Bit;
        Tile_Apron_Size: Extent_2D;
    end record;

    type Per_Tile_Begin_Info is new In_Structure(Per_Tile_Begin_Info_Type)
        with null record;

    type Per_Tile_End_Info is new In_Structure(Per_Tile_End_Info_Type)
        with null record;

    type Dispatch_Tile_Info is new In_Structure(Dispatch_Tile_Info_Type)
        with null record;

    type Copy_Command_Transform_Info is
        new In_Structure(Copy_Command_Transform_Info_Type) with
    record
        Transform: KHR.Surface_Transform_Flags := KHR.Surface_Transform_No_Bit;
    end record;
end Vulkan.Extensions.QCOM;

