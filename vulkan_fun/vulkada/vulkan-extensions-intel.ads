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

-- INTEL extensions root package

package Vulkan.Extensions.INTEL is
    -- Handle types.
    type Performance_Configuration is new Object_Handle;
    
    No_Performance_Configuration: constant Performance_Configuration :=
        Performance_Configuration(System.Null_Address);

    -- Enumerations.
    type Performance_Configuration_Type is
        (Command_Queue_Metrics_Discovery_Activated)
        with Convention => C;

    for Performance_Configuration_Type'Size use 32;

    for Performance_Configuration_Type use
        (Command_Queue_Metrics_Discovery_Activated => 0);

    type Query_Pool_Sampling_Mode is (Manual)
        with Convention => C;

    for Query_Pool_Sampling_Mode'Size use 32;

    for Query_Pool_Sampling_Mode use (Manual => 0);

    type Performance_Override_Type is (Null_Hardware,
                                       Flush_GPU_Caches)
        with Convention => C;

    for Performance_Override_Type'Size use 32;

    for Performance_Override_Type use (Null_Hardware => 0,
                                       Flush_GPU_Caches => 1);

    type Performance_Parameter_Type is (HW_Counters_Supported,
                                        Stream_Marker_Valid_Bits)
        with Convention => C;

    for Performance_Parameter_Type'Size use 32;

    for Performance_Parameter_Type use (HW_Counters_Supported => 0,
                                        Stream_Marker_Valid_Bits => 1);

    type Performance_Value_Type is (Performance_Value_Type_UInt32,
                                    Performance_Value_Type_UInt64,
                                    Performance_Value_Type_Float,
                                    Performance_Value_Type_Bool,
                                    Performance_Value_Type_String)
        with Convention => C;

    for Performance_Value_Type'Size use 32;

    for Performance_Value_Type use (Performance_Value_Type_UInt32 => 0,
                                    Performance_Value_Type_UInt64 => 1,
                                    Performance_Value_Type_Float => 2,
                                    Performance_Value_Type_Bool => 3,
                                    Performance_Value_Type_String => 4);

    -- Records.
    type Physical_Device_Shader_Integer_Functions_2_Features is
        new Out_Structure
            (Physical_Device_Shader_Integer_Functions_2_Features_Type) with
    record
        Shader_Integer_Functions_2: Boolean;
    end record;

    type Performance_Value(Value_Type: Performance_Value_Type) is
    record
        case Value_Type is
            when Performance_Value_Type_UInt32 =>
                Value_32: Interfaces.Unsigned_32;
            when Performance_Value_Type_UInt64 =>
                Value_64: Interfaces.Unsigned_64;
            when Performance_Value_Type_Float =>
                Value_Float: Float;
            when Performance_Value_Type_Bool =>
                Value_Bool: Boolean;
            when Performance_Value_Type_String =>
                Value_String: Ada.Strings.Unbounded.Unbounded_String;
        end case;
    end record;

    type Initialize_Performance_API_Info is new In_Structure
        (Initialize_Performance_API_Info_Type) with
    record
        User_Data: Interfaces.C.Extensions.void_ptr;
    end record;

    type Query_Pool_Performance_Query_Create_Info is new In_Structure
        (Query_Pool_Performance_Query_Create_Info_Type) with
    record
        Performance_Counters_Sampling: Query_Pool_Sampling_Mode;
    end record;

    type Performance_Marker_Info is new In_Structure
        (Performance_Marker_Info_Type) with
    record
        Marker: Interfaces.Unsigned_64;
    end record;

    type Performance_Stream_Marker_Info is new In_Structure
        (Performance_Stream_Marker_Info_Type) with
    record
        Marker: Interfaces.Unsigned_32;
    end record;

    type Performance_Override_Info is new In_Structure
        (Performance_Override_Info_Type) with
    record
        Override_Type: Performance_Override_Type;
        Enable: Boolean;
        Parameter: Interfaces.Unsigned_64;
    end record;

    type Performance_Configuration_Acquire_Info is new In_Structure
        (Performance_Configuration_Acquire_Info_Type) with
    record
        Configuration_Type: Performance_Configuration_Type;
    end record;
end Vulkan.Extensions.INTEL;

