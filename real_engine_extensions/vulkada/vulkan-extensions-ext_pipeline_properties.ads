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

-- Operations for the pipeline properties extension

with Vulkan.Extensions.KHR;

package Vulkan.Extensions.EXT_Pipeline_Properties is
    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkGetPipelinePropertiesEXT
    function Get_Pipeline_Properties
        (Device: in Vulkan.Device;
         Pipeline_Info: in KHR.Pipeline_Info;
         Pipeline_Properties: in out Out_Structure'Class) return Result
        with Pre => Device /= No_Device,
             Post => Get_Pipeline_Properties'Result in Success |
                                                       Out_Of_Host_Memory |
                                                       Validation_Failed;

    procedure Get_Pipeline_Properties
        (Device: in Vulkan.Device;
         Pipeline_Info: in KHR.Pipeline_Info;
         Pipeline_Properties: in out Out_Structure'Class)
        with Inline,
             Pre => Device /= No_Device;
end Vulkan.Extensions.EXT_Pipeline_Properties;

