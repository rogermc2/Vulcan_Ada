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

-- Operations for the external memory host extension

with Vulkan.Extensions.EXT;

package Vulkan.Extensions.EXT_External_Memory_Host is
    use type System.Address;

    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkGetMemoryHostPointerPropertiesEXT
    function Get_Memory_Host_Pointer_Properties
        (Device: in Vulkan.Device;
         Handle_Type: in External_Memory_Handle_Type_Flags;
         Host_Pointer: in Interfaces.C.Extensions.void_ptr;
         Memory_Host_Pointer_Properties:
            in out EXT.Memory_Host_Pointer_Properties)
        return Result
        with Pre => Device /= No_Device and
                    Handle_Type in
                External_Memory_Handle_Type_Host_Allocation_Bit |
                External_Memory_Handle_Type_Host_Mapped_Foreign_Memory_Bit and
                    Host_Pointer /= System.Null_Address,
             Post => Get_Memory_Host_Pointer_Properties'Result in
                Success |
                Invalid_External_Handle |
                Out_Of_Host_Memory |
                Unknown |
                Validation_Failed;

    function Get_Memory_Host_Pointer_Properties
        (Device: in Vulkan.Device;
         Handle_Type: in External_Memory_Handle_Type_Flags;
         Host_Pointer: in Interfaces.C.Extensions.void_ptr)
         return EXT.Memory_Host_Pointer_Properties
        with Pre => Device /= No_Device and
                    Handle_Type in
                External_Memory_Handle_Type_Host_Allocation_Bit |
                External_Memory_Handle_Type_Host_Mapped_Foreign_Memory_Bit and
                    Host_Pointer /= System.Null_Address;
end Vulkan.Extensions.EXT_External_Memory_Host;

