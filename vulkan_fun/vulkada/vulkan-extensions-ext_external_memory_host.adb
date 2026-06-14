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

with Vulkan.Core;
with Vulkan.C_EXT;
with Vulkan.Extension_Records;
with Vulkan.Exceptions;

package body Vulkan.Extensions.EXT_External_Memory_Host is
    -- Loaded extension functions.
    type vkGetMemoryHostPointerPropertiesEXT_Access is
        access function
            (Device: in Vulkan.Device;
             Handle_Type: in External_Memory_Handle_Type_Flags;
             Host_Pointer: in Interfaces.C.Extensions.void_ptr;
             Memory_Host_Pointer_Properties:
                out C_EXT.Memory_Host_Pointer_Properties_C) return Result
        with Convention => C;

    vkGetMemoryHostPointerPropertiesEXT:
        vkGetMemoryHostPointerPropertiesEXT_Access;

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
            new Load_Pointer(vkGetMemoryHostPointerPropertiesEXT_Access);
    begin
        Load(vkGetMemoryHostPointerPropertiesEXT,
             "vkGetMemoryHostPointerPropertiesEXT");
    end Load_Extension;

    function Get_Memory_Host_Pointer_Properties
        (Device: in Vulkan.Device;
         Handle_Type: in External_Memory_Handle_Type_Flags;
         Host_Pointer: in Interfaces.C.Extensions.void_ptr;
         Memory_Host_Pointer_Properties:
            in out EXT.Memory_Host_Pointer_Properties)
        return Result is
        Properties_C: C_EXT.Memory_Host_Pointer_Properties_C;
        Result: Vulkan.Result;
    begin
        Properties_C.Next :=
            Extension_Records.To_C(Memory_Host_Pointer_Properties.Next);
        Result := vkGetMemoryHostPointerPropertiesEXT(Device,
                                                      Handle_Type,
                                                      Host_Pointer,
                                                      Properties_C);
        Extension_Records.Free(Properties_C.Next);

        return Result;
    end Get_Memory_Host_Pointer_Properties;

    function Get_Memory_Host_Pointer_Properties
        (Device: in Vulkan.Device;
         Handle_Type: in External_Memory_Handle_Type_Flags;
         Host_Pointer: in Interfaces.C.Extensions.void_ptr)
         return EXT.Memory_Host_Pointer_Properties is
        Properties: EXT.Memory_Host_Pointer_Properties;
    begin
        Exceptions.Check(Get_Memory_Host_Pointer_Properties(Device,
                                                            Handle_Type,
                                                            Host_Pointer,
                                                            Properties));

        return Properties;
    end Get_Memory_Host_Pointer_Properties;
end Vulkan.Extensions.EXT_External_Memory_Host;

