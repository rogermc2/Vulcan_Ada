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

with Vulkan.Core;
with Vulkan.C_NV;
with Vulkan.Exceptions;

package body Vulkan.Extensions.NV_External_Memory_RDMA is
    -- Loaded extension functions.
    type vkGetMemoryRemoteAddressNV_Access is
        access function(Device: in Vulkan.Device;
                        Memory_Get_Remote_Address_Info:
                            in C_NV.Memory_Get_Remote_Address_Info_C;
                        Address: out NV.Remote_Address) return Result
        with Convention => C;

    vkGetMemoryRemoteAddressNV: vkGetMemoryRemoteAddressNV_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkGetMemoryRemoteAddressNV_Access);
    begin
        Load(vkGetMemoryRemoteAddressNV, "vkGetMemoryRemoteAddressNV");
    end Load_Extension;

    function Get_Memory_Remote_Address
        (Device: in Vulkan.Device;
         Memory_Get_Remote_Address_Info: in NV.Memory_Get_Remote_Address_Info;
         Address: out NV.Remote_Address) return Result is
        C_Info: C_NV.Memory_Get_Remote_Address_Info_C :=
            C_NV.To_C(Memory_Get_Remote_Address_Info);
        Result: Vulkan.Result;
    begin
        Result := vkGetMemoryRemoteAddressNV(Device, C_Info, Address);
        C_NV.Free(C_Info);

        return Result;
    end Get_Memory_Remote_Address;

    function Get_Memory_Remote_Address
        (Device: in Vulkan.Device;
         Memory_Get_Remote_Address_Info: in NV.Memory_Get_Remote_Address_Info)
        return NV.Remote_Address is
        Address: NV.Remote_Address;
    begin
        Exceptions.Check(Get_Memory_Remote_Address
                            (Device,
                             Memory_Get_Remote_Address_Info,
                             Address));

        return Address;
    end Get_Memory_Remote_Address;
end Vulkan.Extensions.NV_External_Memory_RDMA;

