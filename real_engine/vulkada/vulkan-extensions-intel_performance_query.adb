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

-- Operations for the performance query extension

with Interfaces.C.Strings;
with Vulkan.Core;
with Vulkan.C_INTEL;
with Vulkan.Exceptions;
with Vulkan.Utilities;

package body Vulkan.Extensions.INTEL_Performance_Query is
    -- Loaded extension functions.
    type vkInitializePerformanceApiINTEL_Access is
        access function
            (Device: in Vulkan.Device;
             Initialize_Info: in C_INTEL.Initialize_Performance_API_Info_C)
        return Result
        with Convention => C;

    vkInitializePerformanceApiINTEL: vkInitializePerformanceApiINTEL_Access;

    type vkUninitializePerformanceApiINTEL_Access is
        access procedure(Device: in Vulkan.Device)
        with Convention => C;

    vkUninitializePerformanceApiINTEL: vkUninitializePerformanceApiINTEL_Access;

    type vkCmdSetPerformanceMarkerINTEL_Access is
        access function(Command_Buffer: in Vulkan.Command_Buffer;
                        Marker_Info: in C_INTEL.Performance_Marker_Info_C)
        return Result
        with Convention => C;

    vkCmdSetPerformanceMarkerINTEL: vkCmdSetPerformanceMarkerINTEL_Access;

    type vkCmdSetPerformanceStreamMarkerINTEL_Access is
        access function
            (Command_Buffer: in Vulkan.Command_Buffer;
             Marker_Info: in C_INTEL.Performance_Stream_Marker_Info_C)
        return Result
        with Convention => C;

    vkCmdSetPerformanceStreamMarkerINTEL:
        vkCmdSetPerformanceStreamMarkerINTEL_Access;

    type vkCmdSetPerformanceOverrideINTEL_Access is
        access function
            (Command_Buffer: in Vulkan.Command_Buffer;
             Marker_Info: in C_INTEL.Performance_Override_Info_C)
        return Result
        with Convention => C;

    vkCmdSetPerformanceOverrideINTEL: vkCmdSetPerformanceOverrideINTEL_Access;

    type vkAcquirePerformanceConfigurationINTEL_Access is
        access function
            (Device: in Vulkan.Device;
             Acquire_Info: in C_INTEL.Performance_Configuration_Acquire_Info_C;
             Configuration: out INTEL.Performance_Configuration)
        return Result
        with Convention => C;

    vkAcquirePerformanceConfigurationINTEL:
        vkAcquirePerformanceConfigurationINTEL_Access;

    type vkReleasePerformanceConfigurationINTEL_Access is
        access function(Device: in Vulkan.Device;
                        Configuration: in INTEL.Performance_Configuration)
        return Result
        with Convention => C;

    vkReleasePerformanceConfigurationINTEL:
        vkReleasePerformanceConfigurationINTEL_Access;

    type vkQueueSetPerformanceConfigurationINTEL_Access is
        access function(Queue: in Vulkan.Queue;
                        Configuration: in INTEL.Performance_Configuration)
        return Result
        with Convention => C;

    vkQueueSetPerformanceConfigurationINTEL:
        vkQueueSetPerformanceConfigurationINTEL_Access;

    type vkGetPerformanceParameterINTEL_Access is
        access function(Device: in Vulkan.Device;
                        Parameter: in INTEL.Performance_Parameter_Type;
                        Value: out C_INTEL.Performance_Value_C)
        return Result
        with Convention => C;

    vkGetPerformanceParameterINTEL: vkGetPerformanceParameterINTEL_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is
            new Load_Pointer(vkInitializePerformanceApiINTEL_Access);
        procedure Load is
            new Load_Pointer(vkUninitializePerformanceApiINTEL_Access);
        procedure Load is
            new Load_Pointer(vkCmdSetPerformanceMarkerINTEL_Access);
        procedure Load is
            new Load_Pointer(vkCmdSetPerformanceStreamMarkerINTEL_Access);
        procedure Load is
            new Load_Pointer(vkCmdSetPerformanceOverrideINTEL_Access);
        procedure Load is
            new Load_Pointer(vkAcquirePerformanceConfigurationINTEL_Access);
        procedure Load is
            new Load_Pointer(vkReleasePerformanceConfigurationINTEL_Access);
        procedure Load is
            new Load_Pointer(vkQueueSetPerformanceConfigurationINTEL_Access);
        procedure Load is
            new Load_Pointer(vkGetPerformanceParameterINTEL_Access);
    begin
        Load(vkInitializePerformanceApiINTEL, 
             "vkInitializePerformanceApiINTEL");
        Load(vkUninitializePerformanceApiINTEL,
             "vkUninitializePerformanceApiINTEL");
        Load(vkCmdSetPerformanceMarkerINTEL, "vkCmdSetPerformanceMarkerINTEL");
        Load(vkCmdSetPerformanceStreamMarkerINTEL,
             "vkCmdSetPerformanceStreamMarkerINTEL");
        Load(vkCmdSetPerformanceOverrideINTEL,
             "vkCmdSetPerformanceOverrideINTEL");
        Load(vkAcquirePerformanceConfigurationINTEL,
             "vkAcquirePerformanceConfigurationINTEL");
        Load(vkReleasePerformanceConfigurationINTEL,
             "vkReleasePerformanceConfigurationINTEL");
        Load(vkQueueSetPerformanceConfigurationINTEL,
             "vkQueueSetPerformanceConfigurationINTEL");
        Load(vkGetPerformanceParameterINTEL, "vkGetPerformanceParameterINTEL");
    end Load_Extension;

    function Initialize_Performance_API
        (Device: in Vulkan.Device;
         Initialize_Info: in INTEL.Initialize_Performance_API_Info)
        return Result is
        C_Info: C_INTEL.Initialize_Performance_API_Info_C :=
            C_INTEL.To_C(Initialize_Info);
        Result: Vulkan.Result;
    begin
        Result := vkInitializePerformanceApiINTEL(Device, C_Info);
        C_INTEL.Free(C_Info);

        return Result;
    end Initialize_Performance_API;

    procedure Initialize_Performance_API
        (Device: in Vulkan.Device;
         Initialize_Info: in INTEL.Initialize_Performance_API_Info) is
    begin
        Exceptions.Check(Initialize_Performance_API(Device, Initialize_Info));
    end Initialize_Performance_API;

    procedure Uninitialize_Performance_API(Device: in Vulkan.Device) is
    begin
        vkUninitializePerformanceApiINTEL(Device);
    end Uninitialize_Performance_API;

    function Set_Performance_Marker
        (Command_Buffer: in Vulkan.Command_Buffer;
         Marker_Info: in INTEL.Performance_Marker_Info) return Result is
        C_Info: C_INTEL.Performance_Marker_Info_C := C_INTEL.To_C(Marker_Info);
        Result: Vulkan.Result;
    begin
        Result := vkCmdSetPerformanceMarkerINTEL(Command_Buffer, C_Info);
        C_INTEL.Free(C_Info);

        return Result;
    end Set_Performance_Marker;

    procedure Set_Performance_Marker
        (Command_Buffer: in Vulkan.Command_Buffer;
         Marker_Info: in INTEL.Performance_Marker_Info) is
    begin
        Exceptions.Check(Set_Performance_Marker(Command_Buffer, Marker_Info));
    end Set_Performance_Marker;

    function Set_Performance_Stream_Marker
        (Command_Buffer: in Vulkan.Command_Buffer;
         Marker_Info: in INTEL.Performance_Stream_Marker_Info) return Result is
        C_Info: C_INTEL.Performance_Stream_Marker_Info_C :=
            C_INTEL.To_C(Marker_Info);
        Result: Vulkan.Result;
    begin
        Result := vkCmdSetPerformanceStreamMarkerINTEL(Command_Buffer, C_Info);
        C_INTEL.Free(C_Info);

        return Result;
    end Set_Performance_Stream_Marker;

    procedure Set_Performance_Stream_Marker
        (Command_Buffer: in Vulkan.Command_Buffer;
         Marker_Info: in INTEL.Performance_Stream_Marker_Info) is
    begin
        Exceptions.Check(Set_Performance_Stream_Marker(Command_Buffer,
                                                       Marker_Info));
    end Set_Performance_Stream_Marker;

    function Set_Performance_Override
        (Command_Buffer: in Vulkan.Command_Buffer;
         Marker_Info: in INTEL.Performance_Override_Info) return Result is
        C_Info: C_INTEL.Performance_Override_Info_C :=
            C_INTEL.To_C(Marker_Info);
        Result: Vulkan.Result;
    begin
        Result := vkCmdSetPerformanceOverrideINTEL(Command_Buffer, C_Info);
        C_INTEL.Free(C_Info);

        return Result;
    end Set_Performance_Override;

    procedure Set_Performance_Override
        (Command_Buffer: in Vulkan.Command_Buffer;
         Marker_Info: in INTEL.Performance_Override_Info) is
    begin
        Exceptions.Check(Set_Performance_Override(Command_Buffer, Marker_Info));
    end Set_Performance_Override;

    function Acquire_Performance_Configuration
        (Device: in Vulkan.Device;
         Acquire_Info: in INTEL.Performance_Configuration_Acquire_Info;
         Configuration: out INTEL.Performance_Configuration) return Result is
        C_Info: C_INTEL.Performance_Configuration_Acquire_Info_C :=
            C_INTEL.To_C(Acquire_Info);
        Result: Vulkan.Result;
    begin
        Result := vkAcquirePerformanceConfigurationINTEL(Device,
                                                         C_Info,
                                                         Configuration);
        C_INTEL.Free(C_Info);

        return Result;
    end Acquire_Performance_Configuration;

    function Acquire_Performance_Configuration
        (Device: in Vulkan.Device;
         Acquire_Info: in INTEL.Performance_Configuration_Acquire_Info)
        return INTEL.Performance_Configuration is
        Configuration: INTEL.Performance_Configuration;
    begin
        Exceptions.Check(Acquire_Performance_Configuration(Device,
                                                           Acquire_Info,
                                                           Configuration));

        return Configuration;
    end Acquire_Performance_Configuration;

    function Release_Performance_Configuration
        (Device: in Vulkan.Device;
         Configuration: in out INTEL.Performance_Configuration) return Result is
        Result: Vulkan.Result;
    begin
        Result := vkReleasePerformanceConfigurationINTEL(Device, Configuration);
        
        if Result = Success then
            Configuration := INTEL.No_Performance_Configuration;
        end if;

        return Result;
    end Release_Performance_Configuration;

    procedure Release_Performance_Configuration
        (Device: in Vulkan.Device;
         Configuration: in out INTEL.Performance_Configuration) is
    begin
        Exceptions.Check(Release_Performance_Configuration(Device,
                                                           Configuration));
    end Release_Performance_Configuration;

    function Queue_Set_Performance_Configuration
        (Queue: in Vulkan.Queue;
         Configuration: in INTEL.Performance_Configuration) return Result is
    begin
        return vkQueueSetPerformanceConfigurationINTEL(Queue, Configuration);
    end Queue_Set_Performance_Configuration;

    procedure Queue_Set_Performance_Configuration
        (Queue: in Vulkan.Queue;
         Configuration: in INTEL.Performance_Configuration) is
    begin
        Exceptions.Check(Queue_Set_Performance_Configuration(Queue,
                                                             Configuration));
    end Queue_Set_Performance_Configuration;

    function Get_Performance_Parameter
        (Device: in Vulkan.Device;
         Parameter: in INTEL.Performance_Parameter_Type)
        return INTEL.Performance_Value is
        C_Value: C_INTEL.Performance_Value_C;
    begin
        Exceptions.Check(vkGetPerformanceParameterINTEL(Device,
                                                        Parameter,
                                                        C_Value));

        declare
            Value: INTEL.Performance_Value(C_Value.Data_Type);
        begin
            case Value.Value_Type is
                when INTEL.Performance_Value_Type_UInt32 =>
                    Value.Value_32 := C_Value.Data.Value_32;
                when INTEL.Performance_Value_Type_UInt64 =>
                    Value.Value_64 := C_Value.Data.Value_64;
                when INTEL.Performance_Value_Type_Float =>
                    Value.Value_Float := C_Value.Data.Value_Float;
                when INTEL.Performance_Value_Type_Bool =>
                    Value.Value_Bool :=
                        Utilities.To_Ada(C_Value.Data.Value_Bool);
                when INTEL.Performance_Value_Type_String =>
                    Ada.Strings.Unbounded.Set_Unbounded_String
                        (Value.Value_String,
                         Interfaces.C.Strings.Value(C_Value.Data.Value_String));
            end case;

            return Value;
        end;
    end Get_Performance_Parameter;
end Vulkan.Extensions.INTEL_Performance_Query;

