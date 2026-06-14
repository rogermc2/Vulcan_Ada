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

with Vulkan.Core;
with Vulkan.C_EXT;
with Vulkan.Extension_Records;
with Vulkan.Exceptions;

package body Vulkan.Extensions.EXT_Image_DRM_Format_Modifier is
    -- Loaded extension functions.
    type vkGetImageDrmFormatModifierPropertiesEXT_Access is
        access function
            (Device: in Vulkan.Device;
             Image: in Vulkan.Image;
             Properties: out C_EXT.Image_DRM_Format_Modifier_Properties_C)
        return Result
        with Convention => C;

    vkGetImageDrmFormatModifierPropertiesEXT:
        vkGetImageDrmFormatModifierPropertiesEXT_Access;

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
            new Load_Pointer(vkGetImageDrmFormatModifierPropertiesEXT_Access);
    begin
        Load(vkGetImageDrmFormatModifierPropertiesEXT,
             "vkGetImageDrmFormatModifierPropertiesEXT");
    end Load_Extension;

    function Get_Image_DRM_Format_Modifier_Properties
        (Device: in Vulkan.Device;
         Image: in Vulkan.Image;
         Properties: in out EXT.Image_DRM_Format_Modifier_Properties)
        return Result is
        C_Properties: C_EXT.Image_DRM_Format_Modifier_Properties_C;
        Result: Vulkan.Result;
    begin
        C_Properties.Next := Extension_Records.To_C(Properties.Next);
        Result := vkGetImageDrmFormatModifierPropertiesEXT(Device,
                                                           Image,
                                                           C_Properties);

        if Result = Success then
            C_EXT.To_Ada(Properties, C_Properties);
        end if;

        Extension_Records.Free(C_Properties.Next);

        return Result;
    end Get_Image_DRM_Format_Modifier_Properties;

    function Get_Image_DRM_Format_Modifier_Properties(Device: in Vulkan.Device;
                                                      Image: in Vulkan.Image)
        return EXT.Image_DRM_Format_Modifier_Properties is
        Properties: EXT.Image_DRM_Format_Modifier_Properties;
    begin
        Exceptions.Check(Get_Image_DRM_Format_Modifier_Properties(Device,
                                                                  Image,
                                                                  Properties));

        return Properties;
    end Get_Image_DRM_Format_Modifier_Properties;
end Vulkan.Extensions.EXT_Image_DRM_Format_Modifier;

