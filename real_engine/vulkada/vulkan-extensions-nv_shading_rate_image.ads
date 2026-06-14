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

-- Operations for the shading rate image extension

with Vulkan.Extensions.NV;

package Vulkan.Extensions.NV_Shading_Rate_Image is
    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkCmdBindShadingRateImageNV
    procedure Bind(Command_Buffer: in Vulkan.Command_Buffer;
                   Image_View: in Vulkan.Image_View;
                   Image_Layout: in Vulkan.Image_Layout)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer and
                    (if Image_View /= No_Image_View then
                      Image_Layout in Fragment_Shading_Rate_Attachment_Optimal |
                                      General);

    -- vkCmdSetViewportShadingRatePaletteNV
    procedure Set_Viewport_Shading_Rate_Palette
        (Command_Buffer: in Vulkan.Command_Buffer;
         First_Viewport: in Interfaces.Unsigned_32;
         Shading_Rate_Palettes: in NV.Shading_Rate_Palette_Vectors.Vector)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    not Shading_Rate_Palettes.Is_Empty;

    procedure Set_Viewport_Shading_Rate_Palette
        (Command_Buffer: in Vulkan.Command_Buffer;
         First_Viewport: in Interfaces.Unsigned_32;
         Shading_Rate_Palette: in NV.Shading_Rate_Palette)
        with Pre => Command_Buffer /= No_Command_Buffer;

    -- vkCmdSetCoarseSampleOrderNV
    procedure Set_Coarse_Sample_Order
        (Command_Buffer: in Vulkan.Command_Buffer;
         Sampler_Order_Type: in NV.Coarse_Sample_Order_Type;
         Custom_Sample_Orders: in NV.Coarse_Sample_Order_Custom_Vectors.Vector)
        with Pre => Command_Buffer /= No_Command_Buffer and
                    not Custom_Sample_Orders.Is_Empty;

    procedure Set_Coarse_Sample_Order
        (Command_Buffer: in Vulkan.Command_Buffer;
         Sampler_Order_Type: in NV.Coarse_Sample_Order_Type;
         Custom_Sample_Order: in NV.Coarse_Sample_Order_Custom)
        with Pre => Command_Buffer /= No_Command_Buffer;

    procedure Set_Coarse_Sample_Order
        (Command_Buffer: in Vulkan.Command_Buffer;
         Sampler_Order_Type: in NV.Coarse_Sample_Order_Type)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer;                  
end Vulkan.Extensions.NV_Shading_Rate_Image;

