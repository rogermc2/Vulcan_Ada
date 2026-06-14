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

-- Operations for the device fault extension

with Vulkan.Core;
with Vulkan.C_EXT;
with Vulkan.Exceptions;
with Vulkan.Extension_Records;

package body Vulkan.Extensions.EXT_Device_Fault is
    -- Loaded extension functions.
    type vkGetDeviceFaultInfoEXT_Access is
        access function(Device: in Vulkan.Device;
                        Fault_Counts: in out C_EXT.Device_Fault_Counts_C;
                        Fault_Info: access C_EXT.Device_Fault_Info_C)
        return Result
        with Convention => C;

    vkGetDeviceFaultInfoEXT: vkGetDeviceFaultInfoEXT_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkGetDeviceFaultInfoEXT_Access);
    begin
        Load(vkGetDeviceFaultInfoEXT, "vkGetDeviceFaultInfoEXT");
    end Load_Extension;

    function Get_Fault_Counts(Device: in Vulkan.Device)
        return EXT.Device_Fault_Counts is
        C_Counts: aliased C_EXT.Device_Fault_Counts_C;
        Counts: EXT.Device_Fault_Counts;
    begin
        Exceptions.Check(vkGetDeviceFaultInfoEXT(Device, C_Counts, null));
        C_EXT.To_Ada(Counts, C_Counts);

        return Counts;
    end Get_Fault_Counts;

    function Get_Device_Fault_Info(Device: in Vulkan.Device;
                                   Fault_Counts: in out EXT.Device_Fault_Counts;
                                   Fault_Info: in out EXT.Device_Fault_Info)
        return Result is
        use type Interfaces.Unsigned_32;

        C_Counts: C_EXT.Device_Fault_Counts_C;
        C_Info: aliased C_EXT.Device_Fault_Info_C;
        Result: Vulkan.Result;
        Address_Infos: array (1 .. Natural(Fault_Counts.Address_Info_Count))
            of aliased EXT.Device_Fault_Address_Info
            with Convention => C;
        Vendor_Infos: array (1 .. Natural(Fault_Counts.Vendor_Info_Count))
            of aliased C_EXT.Device_Fault_Vendor_Info_C
            with Convention => C;
    begin
        C_Counts.Next := Extension_Records.To_C(Fault_Counts.Next);
        C_Counts.Address_Info_Count := Fault_Counts.Address_Info_Count;
        C_Counts.Vendor_Info_Count := Fault_Counts.Vendor_Info_Count;
        C_Counts.Vendor_Binary_Size := Fault_Counts.Vendor_Binary_Size;

        C_Info.Next := Extension_Records.To_C(Fault_Info.Next);

        if Fault_Counts.Address_Info_Count /= 0 then
            C_Info.Address_Infos := Address_Infos(1)'Unchecked_Access;
        end if;

        if Fault_Counts.Vendor_Info_Count /= 0 then
            C_Info.Vendor_Infos := Vendor_Infos(1)'Unchecked_Access;
        end if;

        C_Info.Vendor_Binary_Data := Fault_Info.Vendor_Binary_Data;

        Result := vkGetDeviceFaultInfoEXT(Device, C_Counts, C_Info'Access);

        if Result in Success | Incomplete then
            C_EXT.To_Ada(Fault_Counts, C_Counts);
            C_EXT.TO_Ada(Fault_Info, C_Info);

            Fault_Info.Address_Infos.Clear;

            for X in 1 .. Natural(C_Counts.Address_Info_Count) loop
                Fault_Info.Address_Infos.Append(Address_Infos(X));
            end loop;

            Fault_Info.Vendor_Infos.Clear;

            for X in 1 .. Natural(C_Counts.Vendor_Info_Count) loop
                declare
                    Vendor_Info: EXT.Device_Fault_Vendor_Info;
                begin
                    C_EXT.To_Ada(Vendor_Info, Vendor_Infos(X));
                    Fault_Info.Vendor_Infos.Append(Vendor_Info);
                end;
            end loop;
        end if;

        Extension_Records.Free(C_Counts.Next);
        Extension_Records.Free(C_Info.Next);

        return Result;
    end Get_Device_Fault_Info;

    procedure Get_Device_Fault_Info
        (Device: in Vulkan.Device;
         Fault_Counts: in out EXT.Device_Fault_Counts;
         Fault_Info: in out EXT.Device_Fault_Info) is
    begin
        Exceptions.Check(Get_Device_Fault_Info(Device,
                                               Fault_Counts,
                                               Fault_Info));
    end Get_Device_Fault_Info;
end Vulkan.Extensions.EXT_Device_Fault;

