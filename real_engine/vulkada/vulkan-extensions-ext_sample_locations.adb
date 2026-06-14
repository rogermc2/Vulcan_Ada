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

with Vulkan.Core;
with Vulkan.C_EXT;
with Vulkan.Extension_Records;

package body Vulkan.Extensions.EXT_Sample_Locations is
    -- Loaded extension functions.
    type vkCmdSetSampleLocationsEXT_Access is
        access procedure
            (Command_Buffer: in Vulkan.Command_Buffer;
             Sample_Locations_Info: in C_EXT.Sample_Locations_Info_C)
        with Convention => C;

    vkCmdSetSampleLocationsEXT: vkCmdSetSampleLocationsEXT_Access;

    type vkGetPhysicalDeviceMultisamplePropertiesEXT_Access is
        access procedure
            (Physical_Device: in Vulkan.Physical_Device;
             Samples: in Sample_Count_Flags;
             Multisample_Properties: in C_EXT.Multisample_Properties_C)
        with Convention => C;

    vkGetPhysicalDeviceMultisamplePropertiesEXT:
        vkGetPhysicalDeviceMultisamplePropertiesEXT_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkCmdSetSampleLocationsEXT_Access);
        procedure Load is new Load_Pointer
            (vkGetPhysicalDeviceMultisamplePropertiesEXT_Access);
    begin
        Load(vkCmdSetSampleLocationsEXT, "vkCmdSetSampleLocationsEXT");
        Load(vkGetPhysicalDeviceMultisamplePropertiesEXT,
             "vkGetPhysicalDeviceMultisamplePropertiesEXT");
    end Load_Extension;

    procedure Set_Sample_Locations
        (Command_Buffer: in Vulkan.Command_Buffer;
         Sample_Locations_Info: in EXT.Sample_Locations_Info) is
        Info_C: C_EXT.Sample_Locations_Info_C :=
            C_EXT.To_C(Sample_Locations_Info);
    begin
        vkCmdSetSampleLocationsEXT(Command_Buffer, Info_C);
        C_EXT.Free(Info_C);
    end Set_Sample_Locations;

    procedure Get_Physical_Device_Multisample_Properties
        (Physical_Device: in Vulkan.Physical_Device;
         Samples: in Sample_Count_Flags;
         Multisample_Properties: in out EXT.Multisample_Properties) is
        C_Properties: C_EXT.Multisample_Properties_C;
    begin
        C_Properties.Next :=
            Extension_Records.To_C(Multisample_Properties.Next);
        vkGetPhysicalDeviceMultisamplePropertiesEXT(Physical_Device,
                                                    Samples,
                                                    C_Properties);
        C_EXT.To_Ada(Multisample_Properties, C_Properties);
        Extension_Records.Free(C_Properties.Next);
    end Get_Physical_Device_Multisample_Properties;

    function Get_Physical_Device_Multisample_Properties
        (Physical_Device: in Vulkan.Physical_Device;
         Samples: in Sample_Count_Flags) return EXT.Multisample_Properties is
        Properties: EXT.Multisample_Properties;
    begin
        Get_Physical_Device_Multisample_Properties(Physical_Device,
                                                   Samples,
                                                   Properties);

        return Properties;
    end Get_Physical_Device_Multisample_Properties;
end Vulkan.Extensions.EXT_Sample_Locations;

