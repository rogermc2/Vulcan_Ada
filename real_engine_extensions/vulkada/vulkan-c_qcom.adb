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

with Ada.Unchecked_Conversion;
with Vulkan.Extension_Records;
with Vulkan.Utilities;

package body Vulkan.C_QCOM is
    procedure To_Ada
        (Ada_Struct: in out Extensions.QCOM.Render_Pass_Transform_Begin_Info;
         C_Struct: in Render_Pass_Transform_Begin_Info_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Transform := C_Struct.Transform;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
          Extensions.QCOM.Command_Buffer_Inheritance_Render_Pass_Transform_Info;
         C_Struct: in
          Command_Buffer_Inheritance_Render_Pass_Transform_Info_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Transform := C_Struct.Transform;
        Ada_Struct.Render_Area := C_Struct.Render_Area;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.QCOM.Physical_Device_Tile_Shading_Features;
         C_Struct: in Physical_Device_Tile_Shading_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Tile_Shading := Utilities.To_Ada(C_Struct.Tile_Shading);
        Ada_Struct.Tile_Shading_Fragment_Stage :=
            Utilities.To_Ada(C_Struct.Tile_Shading_Fragment_Stage);
        Ada_Struct.Tile_Shading_Color_Attachments :=
            Utilities.To_Ada(C_Struct.Tile_Shading_Color_Attachments);
        Ada_Struct.Tile_Shading_Depth_Attachments :=
            Utilities.To_Ada(C_Struct.Tile_Shading_Depth_Attachments);
        Ada_Struct.Tile_Shading_Stencil_Attachments :=
            Utilities.To_Ada(C_Struct.Tile_Shading_Stencil_Attachments);
        Ada_Struct.Tile_Shading_Input_Attachments :=
            Utilities.To_Ada(C_Struct.Tile_Shading_Input_Attachments);
        Ada_Struct.Tile_Shading_Sampled_Attachments :=
            Utilities.To_Ada(C_Struct.Tile_Shading_Sampled_Attachments);
        Ada_Struct.Tile_Shading_Per_Tile_Draw :=
            Utilities.To_Ada(C_Struct.Tile_Shading_Per_Tile_Draw);
        Ada_Struct.Tile_Shading_Per_Tile_Dispatch :=
            Utilities.To_Ada(C_Struct.Tile_Shading_Per_Tile_Dispatch);
        Ada_Struct.Tile_Shading_Dispatch_Tile :=
            Utilities.To_Ada(C_Struct.Tile_Shading_Dispatch_Tile);
        Ada_Struct.Tile_Shading_Apron :=
            Utilities.To_Ada(C_Struct.Tile_Shading_Apron);
        Ada_Struct.Tile_Shading_Anisotropic_Apron :=
            Utilities.To_Ada(C_Struct.Tile_Shading_Anisotropic_Apron);
        Ada_Struct.Tile_Shading_Atomic_Ops :=
            Utilities.To_Ada(C_Struct.Tile_Shading_Atomic_Ops);
        Ada_Struct.Tile_Shading_Image_Processing :=
            Utilities.To_Ada(C_Struct.Tile_Shading_Image_Processing);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.QCOM.Physical_Device_Tile_Shading_Properties;
         C_Struct: in Physical_Device_Tile_Shading_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Max_Apron_Size := C_Struct.Max_Apron_Size;
        Ada_Struct.Prefer_Non_Coherent :=
            Utilities.To_Ada(C_Struct.Prefer_Non_Coherent);
        Ada_Struct.Tile_Granularity := C_Struct.Tile_Granularity;
        Ada_Struct.Max_Tile_Shading_Rate := C_Struct.Max_Tile_Shading_Rate;
    end To_Ada;

    function To_C
        (Struct: in Extensions.QCOM.Render_Pass_Tile_Shading_Create_Info)
        return Render_Pass_Tile_Shading_Create_Info_C is
        RPTSCIC: Render_Pass_Tile_Shading_Create_Info_C;
    begin
        RPTSCIC.Next := Extension_Records.To_C(Struct.Next);
        RPTSCIC.Flags := Struct.Flags;
        RPTSCIC.Tile_Apron_Size := Struct.Tile_Apron_Size;

        return RPTSCIC;
    end To_C;

    procedure Free(Struct: in out Render_Pass_Tile_Shading_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.QCOM.Per_Tile_Begin_Info)
        return Per_Tile_Begin_Info_C is
        PTBIC: Per_Tile_Begin_Info_C;
    begin
        PTBIC.Next := Extension_Records.To_C(Struct.Next);

        return PTBIC;
    end To_C;

    procedure Free(Struct: in out Per_Tile_Begin_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.QCOM.Per_Tile_End_Info)
        return Per_Tile_End_Info_C is
        PTEIC: Per_Tile_End_Info_C;
    begin
        PTEIC.Next := Extension_Records.To_C(Struct.Next);

        return PTEIC;
    end To_C;

    procedure Free(Struct: in out Per_Tile_End_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.QCOM.Dispatch_Tile_Info)
        return Dispatch_Tile_Info_C is
        DTIC: Dispatch_Tile_Info_C;
    begin
        DTIC.Next := Extension_Records.To_C(Struct.Next);

        return DTIC;
    end To_C;

    procedure Free(Struct: in out Dispatch_Tile_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.QCOM.Copy_Command_Transform_Info)
        return Copy_Command_Transform_Info_C is
        CCTIC: Copy_Command_Transform_Info_C;
    begin
        CCTIC.Next := Extension_Records.To_C(Struct.Next);
        CCTIC.Transform := Struct.Transform;

        return CCTIC;
    end To_C;

    procedure Free(Struct: in out Copy_Command_Transform_Info_C) is
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
            when Render_Pass_Tile_Shading_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.QCOM.Render_Pass_Tile_Shading_Create_Info,
                         Render_Pass_Tile_Shading_Create_Info_C,
                         Render_Pass_Tile_Shading_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Per_Tile_Begin_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.QCOM.Per_Tile_Begin_Info,
                         Per_Tile_Begin_Info_C,
                         Per_Tile_Begin_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Per_Tile_End_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.QCOM.Per_Tile_End_Info,
                         Per_Tile_End_Info_C,
                         Per_Tile_End_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Dispatch_Tile_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.QCOM.Dispatch_Tile_Info,
                         Dispatch_Tile_Info_C,
                         Dispatch_Tile_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Copy_Command_Transform_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.QCOM.Copy_Command_Transform_Info,
                         Copy_Command_Transform_Info_C,
                         Copy_Command_Transform_Info_C_Access);
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
            when Render_Pass_Transform_Begin_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.QCOM.Render_Pass_Transform_Begin_Info,
                         Render_Pass_Transform_Begin_Info_C,
                         Render_Pass_Transform_Begin_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Command_Buffer_Inheritance_Render_Pass_Transform_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
         (Extensions.QCOM.Command_Buffer_Inheritance_Render_Pass_Transform_Info,
          Command_Buffer_Inheritance_Render_Pass_Transform_Info_C,
          Command_Buffer_Inheritance_Render_Pass_Transform_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Tile_Shading_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.QCOM.Physical_Device_Tile_Shading_Features,
                         Physical_Device_Tile_Shading_Features_C,
                         Physical_Device_Tile_Shading_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Tile_Shading_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                       (Extensions.QCOM.Physical_Device_Tile_Shading_Properties,
                        Physical_Device_Tile_Shading_Properties_C,
                        Physical_Device_Tile_Shading_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
        end case;
    end To_C;

    procedure To_Ada(Ada_Struct: in out Vulkan.Out_Structure'Class;
                     Next: in C.Out_Structure_C_Access) is
    begin
        case Out_Structure(Ada_Struct.Record_Type) is
            when Render_Pass_Transform_Begin_Info_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Render_Pass_Transform_Begin_Info_C_Access);
                begin
                   To_Ada(Extensions.QCOM.Render_Pass_Transform_Begin_Info
                            (Ada_Struct),
                          To_Access(Next).all);
                end;
             when Command_Buffer_Inheritance_Render_Pass_Transform_Info_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
               (C.Out_Structure_C_Access,
                Command_Buffer_Inheritance_Render_Pass_Transform_Info_C_Access);
                begin
                   To_Ada
          (Extensions.QCOM.Command_Buffer_Inheritance_Render_Pass_Transform_Info
              (Ada_Struct),
           To_Access(Next).all);
                end;
             when Physical_Device_Tile_Shading_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Tile_Shading_Features_C_Access);
                begin
                   To_Ada(Extensions.QCOM.Physical_Device_Tile_Shading_Features
                           (Ada_Struct),
                          To_Access(Next).all);
                end;
             when Physical_Device_Tile_Shading_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Tile_Shading_Properties_C_Access);
                begin
                  To_Ada(Extensions.QCOM.Physical_Device_Tile_Shading_Properties
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
            when Render_Pass_Tile_Shading_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Render_Pass_Tile_Shading_Create_Info_C,
                         Render_Pass_Tile_Shading_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Per_Tile_Begin_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Per_Tile_Begin_Info_C,
                         Per_Tile_Begin_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Per_Tile_End_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Per_Tile_End_Info_C,
                         Per_Tile_End_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Dispatch_Tile_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Dispatch_Tile_Info_C,
                         Dispatch_Tile_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Copy_Command_Transform_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Copy_Command_Transform_Info_C,
                         Copy_Command_Transform_Info_C_Access);
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
            when Render_Pass_Transform_Begin_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Render_Pass_Transform_Begin_Info_C,
                         Render_Pass_Transform_Begin_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Command_Buffer_Inheritance_Render_Pass_Transform_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
               (Command_Buffer_Inheritance_Render_Pass_Transform_Info_C,
                Command_Buffer_Inheritance_Render_Pass_Transform_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Tile_Shading_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Tile_Shading_Features_C,
                         Physical_Device_Tile_Shading_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Tile_Shading_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Tile_Shading_Properties_C,
                         Physical_Device_Tile_Shading_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
        end case;
    end Free;
end Vulkan.C_QCOM;

