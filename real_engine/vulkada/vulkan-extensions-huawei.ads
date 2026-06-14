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

-- Huawei extensions root package

package Vulkan.Extensions.HUAWEI is
    -- Records.
    type Subpass_Shading_Pipeline_Create_Info is new Out_Structure
        (Subpass_Shading_Pipeline_Create_Info_Type) with
    record
        Render_Pass: Vulkan.Render_Pass;
        Subpass: Interfaces.Unsigned_32;
    end record;

    type Physical_Device_Subpass_Shading_Features is new Out_Structure
        (Physical_Device_Subpass_Shading_Features_Type) with
    record
        Subpass_Shading: Boolean;
    end record;

    type Physical_Device_Subpass_Shading_Properties is new Out_Structure
        (Physical_Device_Subpass_Shading_Properties_Type) with
    record
        Max_Subpass_Shading_Workgroup_Size_Aspect_Ratio: Interfaces.Unsigned_32;
    end record;

    type Physical_Device_Invocation_Mask_Features is new Out_Structure
        (Physical_Device_Invocation_Mask_Features_Type) with
    record
        Invocation_Mask: Boolean;
    end record;
end Vulkan.Extensions.HUAWEI;

