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

with Interfaces.C.Strings;
with Vulkan.C;
with Vulkan.Extensions.INTEL;

private package Vulkan.C_INTEL is
    -- Extension record identifiers.
    subtype Structure is Structure_Type
        with Static_Predicate => Structure in
            Physical_Device_Shader_Integer_Functions_2_Features_Type |
            Initialize_Performance_API_Info_Type |
            Query_Pool_Performance_Query_Create_Info_Type |
            Performance_Marker_Info_Type |
            Performance_Stream_Marker_Info_Type |
            Performance_Override_Info_Type |
            Performance_Configuration_Acquire_Info_Type;

    subtype Out_Structure is Structure
        with Static_Predicate => Out_Structure in Out_Structure_Type;

    subtype In_Structure is Structure
        with Static_Predicate => In_Structure not in Out_Structure;

    -- C interface records.
    type Physical_Device_Shader_Integer_Functions_2_Features_C is
    record
        Record_Type: Out_Structure_Type :=
            Physical_Device_Shader_Integer_Functions_2_Features_Type;
        Next: C.Out_Structure_C_Access;
        Shader_Integer_Functions_2: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Physical_Device_Shader_Integer_Functions_2_Features_C_Access is
        access Physical_Device_Shader_Integer_Functions_2_Features_C
        with Convention => C;
    
    type Performance_Value_Data_C
        (Value_Type: Extensions.INTEL.Performance_Value_Type :=
            Extensions.INTEL.Performance_Value_Type_UInt32) is
    record
        case Value_Type is
            when Extensions.INTEL.Performance_Value_Type_UInt32 =>
                Value_32: Interfaces.Unsigned_32;
            when Extensions.INTEL.Performance_Value_Type_UInt64 =>
                Value_64: Interfaces.Unsigned_64;
            when Extensions.INTEL.Performance_Value_Type_Float =>
                Value_Float: Float;
            when Extensions.INTEL.Performance_Value_Type_Bool =>
                Value_Bool: Interfaces.Unsigned_32;
            when Extensions.INTEL.Performance_Value_Type_String =>
                Value_String: Interfaces.C.Strings.Chars_Ptr;
        end case;
    end record
        with Convention => C,
             Unchecked_Union;

    type Performance_Value_C is
    record
        Data_Type: Extensions.INTEL.Performance_Value_Type;
        Data: Performance_Value_Data_C;
    end record
        with Convention => C;

    type Initialize_Performance_API_Info_C is
    record
        Record_Type: In_Structure_Type := Initialize_Performance_API_Info_Type;
        Next: C.In_Structure_C_Access;
        User_Data: Interfaces.C.Extensions.void_ptr;
    end record
        with Convention => C;

    type Initialize_Performance_API_Info_C_Access is
        access Initialize_Performance_API_Info_C
        with Convention => C;

    type Query_Pool_Performance_Query_Create_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Query_Pool_Performance_Query_Create_Info_Type;
        Next: C.In_Structure_C_Access;
        Performance_Counters_Sampling:
            Extensions.INTEL.Query_Pool_Sampling_Mode;
    end record
        with Convention => C;

    type Query_Pool_Performance_Query_Create_Info_C_Access is
        access Query_Pool_Performance_Query_Create_Info_C
        with Convention => C;

    type Performance_Marker_Info_C is
    record
        Record_Type: In_Structure_Type := Performance_Marker_Info_Type;
        Next: C.In_Structure_C_Access;
        Marker: Interfaces.Unsigned_64;
    end record
        with Convention => C;

    type Performance_Marker_Info_C_Access is access Performance_Marker_Info_C
        with Convention => C;

    type Performance_Stream_Marker_Info_C is
    record
        Record_Type: In_Structure_Type := Performance_Stream_Marker_Info_Type;
        Next: C.In_Structure_C_Access;
        Marker: Interfaces.Unsigned_32;
    end record
        with Convention => C;

    type Performance_Stream_Marker_Info_C_Access is
        access Performance_Stream_Marker_Info_C
        with Convention => C;

    type Performance_Override_Info_C is
    record
        Record_Type: In_Structure_Type := Performance_Override_Info_Type;
        Next: C.In_Structure_C_Access;
        Override_Type: Extensions.INTEL.Performance_Override_Type;
        Enable: Interfaces.Unsigned_32;
        Parameter: Interfaces.Unsigned_64;
    end record
        with Convention => C;

    type Performance_Override_Info_C_Access is
        access Performance_Override_Info_C
        with Convention => C;

    type Performance_Configuration_Acquire_Info_C is
    record
        Record_Type: In_Structure_Type :=
            Performance_Configuration_Acquire_Info_Type;
        Next: C.In_Structure_C_Access;
        Configuration_Type: Extensions.INTEL.Performance_Configuration_Type;
    end record
        with Convention => C;

    type Performance_Configuration_Acquire_Info_C_Access is
        access Performance_Configuration_Acquire_Info_C
        with Convention => C;

    -- Conversion subprograms.
    procedure To_Ada
        (Ada_Struct: in out
           Extensions.INTEL.Physical_Device_Shader_Integer_Functions_2_Features;
         C_Struct: in Physical_Device_Shader_Integer_Functions_2_Features_C);

    function To_C(Struct: in Extensions.INTEL.Initialize_Performance_API_Info)
        return Initialize_Performance_API_Info_C;
    procedure Free(Struct: in out Initialize_Performance_API_Info_C);

    function To_C
        (Struct: in Extensions.INTEL.Query_Pool_Performance_Query_Create_Info)
        return Query_Pool_Performance_Query_Create_Info_C;
    procedure Free(Struct: in out Query_Pool_Performance_Query_Create_Info_C);

    function To_C(Struct: in Extensions.INTEL.Performance_Marker_Info)
        return Performance_Marker_Info_C;
    procedure Free(Struct: in out Performance_Marker_Info_C);

    function To_C(Struct: in Extensions.INTEL.Performance_Stream_Marker_Info)
        return Performance_Stream_Marker_Info_C;
    procedure Free(Struct: in out Performance_Stream_Marker_Info_C);

    function To_C(Struct: in Extensions.INTEL.Performance_Override_Info)
        return Performance_Override_Info_C;
    procedure Free(Struct: in out Performance_Override_Info_C);

    function To_C
        (Struct: in Extensions.INTEL.Performance_Configuration_Acquire_Info)
        return Performance_Configuration_Acquire_Info_C;
    procedure Free(Struct: in out Performance_Configuration_Acquire_Info_C);

    -- Extension record conversion.
    function To_C(Next: in In_Structure_Access) return C.In_Structure_C_Access;
    function To_C(Next: in Out_Structure_Access)
        return C.Out_Structure_C_Access;
    procedure To_Ada(Ada_Struct: in out Vulkan.Out_Structure'Class;
                     Next: in C.Out_Structure_C_Access);
    procedure Free(Next: in out C.In_Structure_C_Access);
    procedure Free(Next: in out C.Out_Structure_C_Access);
end Vulkan.C_INTEL;

