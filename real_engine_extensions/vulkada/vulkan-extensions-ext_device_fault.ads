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

-- Operations for the device fault extension

with Vulkan.Extensions.EXT;

package Vulkan.Extensions.EXT_Device_Fault is
    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkGetDeviceFaultInfoEXT
    function Get_Fault_Counts(Device: in Vulkan.Device)
        return EXT.Device_Fault_Counts
        with Pre => Device /= No_Device;

    function Get_Device_Fault_Info(Device: in Vulkan.Device;
                                   Fault_Counts: in out EXT.Device_Fault_Counts;
                                   Fault_Info: in out EXT.Device_Fault_Info)
        return Result
        with Pre => Device /= No_Device,
             Post => Get_Device_Fault_Info'Result in Success |
                                                     Incomplete |
                                                     Out_Of_Host_Memory |
                                                     Unknown |
                                                     Validation_Failed;

    procedure Get_Device_Fault_Info
        (Device: in Vulkan.Device;
         Fault_Counts: in out EXT.Device_Fault_Counts;
         Fault_Info: in out EXT.Device_Fault_Info)
        with Inline,
             Pre => Device /= No_Device;
end Vulkan.Extensions.EXT_Device_Fault;

