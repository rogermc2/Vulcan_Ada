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

-- Operations for the sample locations extension

with Vulkan.Extensions.EXT;

package Vulkan.Extensions.EXT_Sample_Locations is
    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkCmdSetSampleLocationsEXT
    procedure Set_Sample_Locations
        (Command_Buffer: in Vulkan.Command_Buffer;
         Sample_Locations_Info: in EXT.Sample_Locations_Info)
        with Pre => Command_Buffer /= No_Command_Buffer;

    -- vkGetPhysicalDeviceMultisamplePropertiesEXT
    procedure Get_Physical_Device_Multisample_Properties
        (Physical_Device: in Vulkan.Physical_Device;
         Samples: in Sample_Count_Flags;
         Multisample_Properties: in out EXT.Multisample_Properties)
        with Pre => Physical_Device /= No_Physical_Device;

    function Get_Physical_Device_Multisample_Properties
        (Physical_Device: in Vulkan.Physical_Device;
         Samples: in Sample_Count_Flags) return EXT.Multisample_Properties
        with Pre => Physical_Device /= No_Physical_Device;
end Vulkan.Extensions.EXT_Sample_Locations;

