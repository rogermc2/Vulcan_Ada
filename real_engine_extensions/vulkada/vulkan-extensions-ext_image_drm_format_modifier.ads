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

-- Operations for the image DRM format modifier extension

with Vulkan.Extensions.EXT;

package Vulkan.Extensions.EXT_Image_DRM_Format_Modifier is
    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkGetImageDrmFormatModifierPropertiesEXT
    function Get_Image_DRM_Format_Modifier_Properties
        (Device: in Vulkan.Device;
         Image: in Vulkan.Image;
         Properties: in out EXT.Image_DRM_Format_Modifier_Properties)
        return Result
        with Pre => Device /= No_Device and Image /= No_Image,
             Post => Get_Image_DRM_Format_Modifier_Properties'Result in
                        Success |
                        Out_Of_Host_Memory |
                        Unknown |
                        Validation_Failed;

    function Get_Image_DRM_Format_Modifier_Properties(Device: in Vulkan.Device;
                                                      Image: in Vulkan.Image)
        return EXT.Image_DRM_Format_Modifier_Properties
        with Pre => Device /= No_Device and Image /= No_Image;
end Vulkan.Extensions.EXT_Image_DRM_Format_Modifier;

