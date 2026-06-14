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

-- Operations for the cooperative matrix extension

with Vulkan.Extensions.NV;

package Vulkan.Extensions.NV_Cooperative_Matrix is
    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
    function Properties_Count(Physical_Device: in Vulkan.Physical_Device)
        return Interfaces.Unsigned_32
        with Pre => Physical_Device /= No_Physical_Device;

    function Get_Physical_Device_Cooperative_Matrix_Properties
        (Physical_Device: in Vulkan.Physical_Device;
         Properties: in out NV.Cooperative_Matrix_Properties_Vectors.Vector)
        return Result
        with Pre => Physical_Device /= No_Physical_Device,
             Post => Get_Physical_Device_Cooperative_Matrix_Properties'Result in
                Success |
                Incomplete |
                Out_Of_Device_Memory |
                Out_Of_Host_Memory |
                Unknown |
                Validation_Failed;

    function Get_Physical_Device_Cooperative_Matrix_Properties
        (Physical_Device: in Vulkan.Physical_Device)
        return NV.Cooperative_Matrix_Properties_Vectors.Vector
        with Pre => Physical_Device /= No_Physical_Device;
end Vulkan.Extensions.NV_Cooperative_Matrix;

