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

-- Operations for the external memory RDMA extension

with Vulkan.Extensions.NV;

package Vulkan.Extensions.NV_External_Memory_RDMA is
    use type NV.Remote_Address;

    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkGetMemoryRemoteAddressNV
    function Get_Memory_Remote_Address
        (Device: in Vulkan.Device;
         Memory_Get_Remote_Address_Info: in NV.Memory_Get_Remote_Address_Info;
         Address: out NV.Remote_Address) return Result
        with Pre => Device /= No_Device and
                    Memory_Get_Remote_Address_Info.Memory /= No_Device_Memory,
             Post => Get_Memory_Remote_Address'Result in 
                Success |
                Invalid_External_Handle |
                Unknown |
                Validation_Failed and
                    (if Get_Memory_Remote_Address'Result = Success then
                        Address /= NV.No_Remote_Address);

    function Get_Memory_Remote_Address
        (Device: in Vulkan.Device;
         Memory_Get_Remote_Address_Info: in NV.Memory_Get_Remote_Address_Info)
        return NV.Remote_Address
        with Inline,
             Pre => Device /= No_Device and
                    Memory_Get_Remote_Address_Info.Memory /= No_Device_Memory,
             Post => Get_Memory_Remote_Address'Result /= NV.No_Remote_Address;
end Vulkan.Extensions.NV_External_Memory_RDMA;

