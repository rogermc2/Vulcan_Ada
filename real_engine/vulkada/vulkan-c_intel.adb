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

-- C interfaces for INTEL records

with Ada.Unchecked_Conversion;
with Vulkan.Utilities;
with Vulkan.Extension_Records;

package body Vulkan.C_INTEL is
    procedure To_Ada
        (Ada_Struct: in out
           Extensions.INTEL.Physical_Device_Shader_Integer_Functions_2_Features;
         C_Struct: in Physical_Device_Shader_Integer_Functions_2_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Shader_Integer_Functions_2 :=
            Utilities.To_Ada(C_Struct.Shader_Integer_Functions_2);
    end To_Ada;

    function To_C(Struct: in Extensions.INTEL.Initialize_Performance_API_Info)
        return Initialize_Performance_API_Info_C is
        IPAIC: Initialize_Performance_API_Info_C;
    begin
        IPAIC.Next := Extension_Records.To_C(Struct.Next);
        IPAIC.User_Data := Struct.User_Data;

        return IPAIC;
    end To_C;

    procedure Free(Struct: in out Initialize_Performance_API_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C
        (Struct: in Extensions.INTEL.Query_Pool_Performance_Query_Create_Info)
        return Query_Pool_Performance_Query_Create_Info_C is
        QPPQCIC: Query_Pool_Performance_Query_Create_Info_C;
    begin
        QPPQCIC.Next := Extension_Records.To_C(Struct.Next);
        QPPQCIC.Performance_Counters_Sampling :=
            Struct.Performance_Counters_Sampling;

        return QPPQCIC;
    end To_C;

    procedure Free(Struct: in out Query_Pool_Performance_Query_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.INTEL.Performance_Marker_Info)
        return Performance_Marker_Info_C is
        PMIC: Performance_Marker_Info_C;
    begin
        PMIC.Next := Extension_Records.To_C(Struct.Next);
        PMIC.Marker := Struct.Marker;

        return PMIC;
    end To_C;

    procedure Free(Struct: in out Performance_Marker_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.INTEL.Performance_Stream_Marker_Info)
        return Performance_Stream_Marker_Info_C is
        PSMIC: Performance_Stream_Marker_Info_C;
    begin
        PSMIC.Next := Extension_Records.To_C(Struct.Next);
        PSMIC.Marker := Struct.Marker;
        
        return PSMIC;
    end To_C;

    procedure Free(Struct: in out Performance_Stream_Marker_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Struct: in Extensions.INTEL.Performance_Override_Info)
        return Performance_Override_Info_C is
        POIC: Performance_Override_Info_C;
    begin
        POIC.Next := Extension_Records.To_C(Struct.Next);
        POIC.Override_Type := Struct.Override_Type;
        POIC.Enable := Utilities.To_C(Struct.Enable);
        POIC.Parameter := Struct.Parameter;

        return POIC;
    end To_C;

    procedure Free(Struct: in out Performance_Override_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C
        (Struct: in Extensions.INTEL.Performance_Configuration_Acquire_Info)
        return Performance_Configuration_Acquire_Info_C is
        PCAIC: Performance_Configuration_Acquire_Info_C;
    begin
        PCAIC.Next := Extension_Records.To_C(Struct.Next);
        PCAIC.Configuration_Type := Struct.Configuration_Type;

        return PCAIC;
    end To_C;

    procedure Free(Struct: in out Performance_Configuration_Acquire_Info_C) is
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
            when Initialize_Performance_API_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.INTEL.Initialize_Performance_API_Info,
                         Initialize_Performance_API_Info_C,
                         Initialize_Performance_API_Info_C_Access,
                         To_C);
                begin
                    return Make_Struct(Next);
                end;
            when Query_Pool_Performance_Query_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                     (Extensions.INTEL.Query_Pool_Performance_Query_Create_Info,
                      Query_Pool_Performance_Query_Create_Info_C,
                      Query_Pool_Performance_Query_Create_Info_C_Access,
                      To_C);
                begin
                    return Make_Struct(Next);
                end;
            when Performance_Marker_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.INTEL.Performance_Marker_Info,
                         Performance_Marker_Info_C,
                         Performance_Marker_Info_C_Access,
                         To_C);
                begin
                    return Make_Struct(Next);
                end;
            when Performance_Stream_Marker_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.INTEL.Performance_Stream_Marker_Info,
                         Performance_Stream_Marker_Info_C,
                         Performance_Stream_Marker_Info_C_Access,
                         To_C);
                begin
                    return Make_Struct(Next);
                end;
            when Performance_Override_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.INTEL.Performance_Override_Info,
                         Performance_Override_Info_C,
                         Performance_Override_Info_C_Access,
                         To_C);
                begin
                    return Make_Struct(Next);
                end;
            when Performance_Configuration_Acquire_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                       (Extensions.INTEL.Performance_Configuration_Acquire_Info,
                        Performance_Configuration_Acquire_Info_C,
                        Performance_Configuration_Acquire_Info_C_Access,
                        To_C);
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
            when Physical_Device_Shader_Integer_Functions_2_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
          (Extensions.INTEL.Physical_Device_Shader_Integer_Functions_2_Features,
           Physical_Device_Shader_Integer_Functions_2_Features_C,
           Physical_Device_Shader_Integer_Functions_2_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
        end case;
    end To_C;

    procedure To_Ada(Ada_Struct: in out Vulkan.Out_Structure'Class;
                     Next: in C.Out_Structure_C_Access) is
    begin
        case Out_Structure(Ada_Struct.Record_Type) is
            when Physical_Device_Shader_Integer_Functions_2_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                 (C.Out_Structure_C_Access,
                  Physical_Device_Shader_Integer_Functions_2_Features_C_Access);
                begin
                    To_Ada
           (Extensions.INTEL.Physical_Device_Shader_Integer_Functions_2_Features
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
            when Initialize_Performance_API_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Initialize_Performance_API_Info_C,
                         Initialize_Performance_API_Info_C_Access,
                         Free);
                begin
                    Free_Struct(Next);
                end;
            when Query_Pool_Performance_Query_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Query_Pool_Performance_Query_Create_Info_C,
                         Query_Pool_Performance_Query_Create_Info_C_Access,
                         Free);
                begin
                    Free_Struct(Next);
                end;
            when Performance_Marker_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Performance_Marker_Info_C,
                         Performance_Marker_Info_C_Access,
                         Free);
                begin
                    Free_Struct(Next);
                end;
            when Performance_Stream_Marker_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Performance_Stream_Marker_Info_C,
                         Performance_Stream_Marker_Info_C_Access,
                         Free);
                begin
                    Free_Struct(Next);
                end;
            when Performance_Override_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Performance_Override_Info_C,
                         Performance_Override_Info_C_Access,
                         Free);
                begin
                    Free_Struct(Next);
                end;
            when Performance_Configuration_Acquire_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Performance_Configuration_Acquire_Info_C,
                         Performance_Configuration_Acquire_Info_C_Access,
                         Free);
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
            when Physical_Device_Shader_Integer_Functions_2_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                 (Physical_Device_Shader_Integer_Functions_2_Features_C,
                  Physical_Device_Shader_Integer_Functions_2_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
        end case;
    end Free;
end Vulkan.C_INTEL;

