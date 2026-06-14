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

-- C interface for HUAWEI records

with Vulkan.C;
with Vulkan.Extensions.HUAWEI;

private package Vulkan.C_HUAWEI is
    -- Extension record identifiers.
    subtype Structure is Structure_Type
        with Static_Predicate => Structure in
            Subpass_Shading_Pipeline_Create_Info_Type |
            Physical_Device_Subpass_Shading_Features_Type |
            Physical_Device_Subpass_Shading_Properties_Type |
            Physical_Device_Invocation_Mask_Features_Type;

    subtype Out_Structure is Structure
        with Static_Predicate => Out_Structure in Out_Structure_Type;

    subtype In_Structure is Structure
        with Static_Predicate => In_Structure not in Out_Structure;

    -- C interface records.
    type Subpass_Shading_Pipeline_Create_Info_C is
    record
        Record_Type: Out_Structure_Type :=
            Subpass_Shading_Pipeline_Create_Info_Type;
        Next: C.Out_Structure_C_Access;
        Render_Pass: Vulkan.Render_Pass;
        Subpass: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Subpass_Shading_Pipeline_Create_Info_C_Access is
        access Subpass_Shading_Pipeline_Create_Info_C
        with Convention => C;

    type Physical_Device_Subpass_Shading_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Subpass_Shading_Features_Type;
        Next: C.Out_Structure_C_Access;
        Subpass_Shading: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Subpass_Shading_Features_C_Access is
        access Physical_Device_Subpass_Shading_Features_C
        with Convention => C;

    type Physical_Device_Subpass_Shading_Properties_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Subpass_Shading_Properties_Type;
        Next: C.Out_Structure_C_Access;
        Max_Subpass_Shading_Workgroup_Size_Aspect_Ratio: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Subpass_Shading_Properties_C_Access is
        access Physical_Device_Subpass_Shading_Properties_C
        with Convention => C;

    type Physical_Device_Invocation_Mask_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Invocation_Mask_Features_Type;
        Next: C.Out_Structure_C_Access;
        Invocation_Mask: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Invocation_Mask_Features_C_Access is
        access Physical_Device_Invocation_Mask_Features_C
        with Convention => C;

    -- Conversion subprograms.
    procedure To_Ada
        (Ada_Struct: in out
            Extensions.HUAWEI.Subpass_Shading_Pipeline_Create_Info;
         C_Struct: in Subpass_Shading_Pipeline_Create_Info_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.HUAWEI.Physical_Device_Subpass_Shading_Features;
         C_Struct: in Physical_Device_Subpass_Shading_Features_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.HUAWEI.Physical_Device_Subpass_Shading_Properties;
         C_Struct: in Physical_Device_Subpass_Shading_Properties_C);

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.HUAWEI.Physical_Device_Invocation_Mask_Features;
         C_Struct: in Physical_Device_Invocation_Mask_Features_C);

    -- Extension record conversion.
    function To_C(Next: in In_Structure_Access) return C.In_Structure_C_Access;
    function To_C(Next: in Out_Structure_Access)
        return C.Out_Structure_C_Access;
    procedure To_Ada(Ada_Struct: in out Vulkan.Out_Structure'Class;
                     Next: in C.Out_Structure_C_Access);
    procedure Free(Next: in out C.In_Structure_C_Access);
    procedure Free(Next: in out C.Out_Structure_C_Access);
end Vulkan.C_HUAWEI;

