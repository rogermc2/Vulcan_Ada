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

with Ada.Unchecked_Conversion;
with Vulkan.Extension_Records;
with Vulkan.Utilities;

package body Vulkan.C_HUAWEI is
    procedure To_Ada
        (Ada_Struct: in out
            Extensions.HUAWEI.Subpass_Shading_Pipeline_Create_Info;
         C_Struct: in Subpass_Shading_Pipeline_Create_Info_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Render_Pass := C_Struct.Render_Pass;
        Ada_Struct.Subpass := C_Struct.Subpass;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.HUAWEI.Physical_Device_Subpass_Shading_Features;
         C_Struct: in Physical_Device_Subpass_Shading_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Subpass_Shading :=
            Utilities.To_Ada(C_Struct.Subpass_Shading);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.HUAWEI.Physical_Device_Subpass_Shading_Properties;
         C_Struct: in Physical_Device_Subpass_Shading_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Max_Subpass_Shading_Workgroup_Size_Aspect_Ratio :=
            C_Struct.Max_Subpass_Shading_Workgroup_Size_Aspect_Ratio;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.HUAWEI.Physical_Device_Invocation_Mask_Features;
         C_Struct: in Physical_Device_Invocation_Mask_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Invocation_Mask :=
            Utilities.To_Ada(C_Struct.Invocation_Mask);
    end To_Ada;

    function To_C(Next: in In_Structure_Access)
        return C.In_Structure_C_Access is
    begin
        if Next = null then
            return null;
        end if;

        case In_Structure(Next.Record_Type) is
            when others => return null;
        end case;
    end To_C;

    function To_C(Next: in Out_Structure_Access)
        return C.Out_Structure_C_Access is
    begin
        if Next = null then
            return null;
        end if;

        case Out_Structure(Next.Record_Type) is
            when Subpass_Shading_Pipeline_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.HUAWEI.Subpass_Shading_Pipeline_Create_Info,
                         Subpass_Shading_Pipeline_Create_Info_C,
                         Subpass_Shading_Pipeline_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Subpass_Shading_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                    (Extensions.HUAWEI.Physical_Device_Subpass_Shading_Features,
                     Physical_Device_Subpass_Shading_Features_C,
                     Physical_Device_Subpass_Shading_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Subpass_Shading_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                  (Extensions.HUAWEI.Physical_Device_Subpass_Shading_Properties,
                   Physical_Device_Subpass_Shading_Properties_C,
                   Physical_Device_Subpass_Shading_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Invocation_Mask_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                    (Extensions.HUAWEI.Physical_Device_Invocation_Mask_Features,
                     Physical_Device_Invocation_Mask_Features_C,
                     Physical_Device_Invocation_Mask_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
        end case;
    end To_C;

    procedure To_Ada(Ada_Struct: in out Vulkan.Out_Structure'Class;
                     Next: in C.Out_Structure_C_Access) is
    begin
        case Out_Structure(Ada_Struct.Record_Type) is
            when Subpass_Shading_Pipeline_Create_Info_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Subpass_Shading_Pipeline_Create_Info_C_Access);
                begin
                    To_Ada
                        (Extensions.HUAWEI.Subpass_Shading_Pipeline_Create_Info
                            (Ada_Struct),
                         To_Access(Next).all);
                end;
            when Physical_Device_Subpass_Shading_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Subpass_Shading_Features_C_Access);
                begin
                    To_Ada
                     (Extensions.HUAWEI.Physical_Device_Subpass_Shading_Features
                         (Ada_Struct),
                      To_Access(Next).all);
                end;
            when Physical_Device_Subpass_Shading_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Subpass_Shading_Properties_C_Access);
                begin
                    To_Ada
                   (Extensions.HUAWEI.Physical_Device_Subpass_Shading_Properties
                       (Ada_Struct),
                    To_Access(Next).all);
                end;
            when Physical_Device_Invocation_Mask_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Invocation_Mask_Features_C_Access);
                begin
                    To_Ada
                     (Extensions.HUAWEI.Physical_Device_Invocation_Mask_Features
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
            when others => null;
        end case;
    end Free;

    procedure Free(Next: in out C.Out_Structure_C_Access) is
        use type C.Out_Structure_C_Access;
    begin
        if Next = null then
            return;
        end if;

        case Out_Structure(Next.Record_Type) is
            when Subpass_Shading_Pipeline_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Subpass_Shading_Pipeline_Create_Info_C,
                         Subpass_Shading_Pipeline_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Subpass_Shading_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Subpass_Shading_Features_C,
                         Physical_Device_Subpass_Shading_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Subpass_Shading_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Subpass_Shading_Properties_C,
                         Physical_Device_Subpass_Shading_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
           when Physical_Device_Invocation_Mask_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Invocation_Mask_Features_C,
                         Physical_Device_Invocation_Mask_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
        end case;
    end Free;
end Vulkan.C_HUAWEI;

