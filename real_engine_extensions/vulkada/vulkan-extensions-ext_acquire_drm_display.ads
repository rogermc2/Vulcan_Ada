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

-- Operations for the acquire DRM display extension

with Vulkan.Extensions.KHR;

package Vulkan.Extensions.EXT_Acquire_DRM_Display is
    use type KHR.Display;

    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkAcquireDrmDisplayEXT
    function Acquire_DRM_Display(Physical_Device: in Vulkan.Physical_Device;
                                 DRM_FD: in Interfaces.Integer_32;
                                 Display: in KHR.Display) return Result
        with Inline,
             Pre => Physical_Device /= No_Physical_Device and
                    Display /= KHR.No_Display,
             Post => Acquire_DRM_Display'Result in Success |
                                                   Initialization_Failed |
                                                   Unknown |
                                                   Validation_Failed;

    procedure Acquire_DRM_Display(Physical_Device: in Vulkan.Physical_Device;
                                  DRM_FD: in Interfaces.Integer_32;
                                  Display: in KHR.Display)
        with Inline,
             Pre => Physical_Device /= No_Physical_Device and
                    Display /= KHR.No_Display;

    -- vkGetDrmDisplayEXT
    function Get_DRM_Display(Physical_Device: in Vulkan.Physical_Device;
                             DRM_FD: in Interfaces.Integer_32;
                             Connector_ID: in Interfaces.Unsigned_32;
                             Display: out KHR.Display) return Result
        with Inline,
             Pre => Physical_Device /= No_Physical_Device,
             Post => Get_DRM_Display'Result in Success |
                                               Initialization_Failed |
                                               Out_Of_Host_Memory |
                                               Unknown |
                                               Validation_Failed and
                     (if Get_DRM_Display'Result = Success then
                        Display /= KHR.No_Display);

    function Get_DRM_Display(Physical_Device: in Vulkan.Physical_Device;
                             DRM_FD: in Interfaces.Integer_32;
                             Connector_ID: in Interfaces.Unsigned_32)
        return KHR.Display
        with Inline,
             Pre => Physical_Device /= No_Physical_Device,
             Post => Get_DRM_Display'Result /= KHR.No_Display;
end Vulkan.Extensions.EXT_Acquire_DRM_Display;

