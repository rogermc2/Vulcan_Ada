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

with Vulkan.Extensions.INTEL;

package Vulkan.Extensions.INTEL_Performance_Query is
    use type INTEL.Performance_Configuration;

    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkInitializePerformanceApiINTEL
    function Initialize_Performance_API
        (Device: in Vulkan.Device;
         Initialize_Info: in INTEL.Initialize_Performance_API_Info)
        return Result
        with Pre => Device /= No_Device,
             Post => Initialize_Performance_API'Result in Success |
                                                          Out_Of_Host_Memory |
                                                          Too_Many_Objects |
                                                          Unknown |
                                                          Validation_Failed;

    procedure Initialize_Performance_API
        (Device: in Vulkan.Device;
         Initialize_Info: in INTEL.Initialize_Performance_API_Info)
        with Inline,
             Pre => Device /= No_Device;

    -- vkUninitializePerformanceApiINTEL
    procedure Uninitialize_Performance_API(Device: in Vulkan.Device)
        with Inline,
             Pre => Device /= No_Device;

    -- vkCmdSetPerformanceMarkerINTEL
    function Set_Performance_Marker
        (Command_Buffer: in Vulkan.Command_Buffer;
         Marker_Info: in INTEL.Performance_Marker_Info) return Result
        with Pre => Command_Buffer /= No_Command_Buffer,
             Post => Set_Performance_Marker'Result in Success |
                                                      Out_Of_Host_Memory |
                                                      Too_Many_Objects |
                                                      Unknown |
                                                      Validation_Failed;

    procedure Set_Performance_Marker
        (Command_Buffer: in Vulkan.Command_Buffer;
         Marker_Info: in INTEL.Performance_Marker_Info)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer;

    -- vkCmdSetPerformanceStreamMarkerINTEL
    function Set_Performance_Stream_Marker
        (Command_Buffer: in Vulkan.Command_Buffer;
         Marker_Info: in INTEL.Performance_Stream_Marker_Info) return Result
        with Pre => Command_Buffer /= No_Command_Buffer,
             Post => Set_Performance_Stream_Marker'Result in
                Success |
                Out_Of_Host_Memory |
                Too_Many_Objects |
                Unknown |
                Validation_Failed;

    procedure Set_Performance_Stream_Marker
        (Command_Buffer: in Vulkan.Command_Buffer;
         Marker_Info: in INTEL.Performance_Stream_Marker_Info)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer;

    -- vkCmdSetPerformanceOverrideINTEL
    function Set_Performance_Override
        (Command_Buffer: in Vulkan.Command_Buffer;
         Marker_Info: in INTEL.Performance_Override_Info) return Result
        with Pre => Command_Buffer /= No_Command_Buffer,
             Post => Set_Performance_Override'Result in Success |
                                                        Out_Of_Host_Memory |
                                                        Too_Many_Objects |
                                                        Unknown |
                                                        Validation_Failed;

    procedure Set_Performance_Override
        (Command_Buffer: in Vulkan.Command_Buffer;
         Marker_Info: in INTEL.Performance_Override_Info)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer;

    -- vkAcquirePerformanceConfigurationINTEL
    function Acquire_Performance_Configuration
        (Device: in Vulkan.Device;
         Acquire_Info: in INTEL.Performance_Configuration_Acquire_Info;
         Configuration: out INTEL.Performance_Configuration) return Result
        with Pre => Device /= No_Device,
             Post => Acquire_Performance_Configuration'Result in
                Success |
                Out_Of_Host_Memory |
                Too_Many_Objects |
                Unknown |
                Validation_Failed and
                (if Acquire_Performance_Configuration'Result = Success then
                    Configuration /= INTEL.No_Performance_Configuration);

    function Acquire_Performance_Configuration
        (Device: in Vulkan.Device;
         Acquire_Info: in INTEL.Performance_Configuration_Acquire_Info)
        return INTEL.Performance_Configuration
        with Pre => Device /= No_Device,
             Post => Acquire_Performance_Configuration'Result /=
                     INTEL.No_Performance_Configuration;

    -- vkReleasePerformanceConfigurationINTEL
    function Release_Performance_Configuration
        (Device: in Vulkan.Device;
         Configuration: in out INTEL.Performance_Configuration) return Result
        with Pre => Device /= No_Device,
             Post => Release_Performance_Configuration'Result in
                Success |
                Out_Of_Host_Memory |
                Too_Many_Objects |
                Unknown |
                Validation_Failed and
                (if Release_Performance_Configuration'Result = Success then
                    Configuration = INTEL.No_Performance_Configuration);

    procedure Release_Performance_Configuration
        (Device: in Vulkan.Device;
         Configuration: in out INTEL.Performance_Configuration)
        with Inline,
             Pre => Device /= No_Device,
             Post => Configuration = INTEL.No_Performance_Configuration;

    -- vkQueueSetPerformanceConfigurationINTEL
    function Queue_Set_Performance_Configuration
        (Queue: in Vulkan.Queue;
         Configuration: in INTEL.Performance_Configuration) return Result
        with Inline,
             Pre => Queue /= No_Queue and
                    Configuration /= INTEL.No_Performance_Configuration,
             Post => Queue_Set_Performance_Configuration'Result in
                Success |
                Out_Of_Host_Memory |
                Too_Many_Objects |
                Unknown |
                Validation_Failed;

    procedure Queue_Set_Performance_Configuration
        (Queue: in Vulkan.Queue;
         Configuration: in INTEL.Performance_Configuration)
        with Inline,
             Pre => Queue /= No_Queue and
                    Configuration /= INTEL.No_Performance_Configuration;

    -- vkGetPerformanceParameterINTEL
    function Get_Performance_Parameter
        (Device: in Vulkan.Device;
         Parameter: in INTEL.Performance_Parameter_Type)
        return INTEL.Performance_Value
        with Pre => Device /= No_Device;
end Vulkan.Extensions.INTEL_Performance_Query;

