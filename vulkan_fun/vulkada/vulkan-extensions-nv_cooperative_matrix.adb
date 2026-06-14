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

with Vulkan.Core;
with Vulkan.C_NV;
with Vulkan.Extension_Records;
with Vulkan.Exceptions;

package body Vulkan.Extensions.NV_Cooperative_Matrix is
    -- Loaded extension functions.
    type vkGetPhysicalDeviceCooperativeMatrixPropertiesNV_Access is
        access function(Physical_Device: in Vulkan.Physical_Device;
                        Property_Count: in out Interfaces.Unsigned_32;
                        Properties: access C_NV.Cooperative_Matrix_Properties_C)
        return Result
        with Convention => C;

    vkGetPhysicalDeviceCooperativeMatrixPropertiesNV:
        vkGetPhysicalDeviceCooperativeMatrixPropertiesNV_Access;

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
            new Load_Pointer
                (vkGetPhysicalDeviceCooperativeMatrixPropertiesNV_Access);
    begin
        Load(vkGetPhysicalDeviceCooperativeMatrixPropertiesNV,
             "vkGetPhysicalDeviceCooperativeMatrixPropertiesNV");
    end Load_Extension;

    function Properties_Count(Physical_Device: in Vulkan.Physical_Device)
        return Interfaces.Unsigned_32 is
        Count: Interfaces.Unsigned_32 := 0;
    begin
        Exceptions.Check(vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
                            (Physical_Device, Count, null));
        
        return Count;
    end Properties_Count;

    function Get_Physical_Device_Cooperative_Matrix_Properties
        (Physical_Device: in Vulkan.Physical_Device;
         Properties: in out NV.Cooperative_Matrix_Properties_Vectors.Vector)
        return Result is
        C_Properties: array (1 .. Positive(Properties.Length)) of
            aliased C_NV.Cooperative_Matrix_Properties_C;
        Count: Interfaces.Unsigned_32 := C_Properties'Length;
        Result: Vulkan.Result;
    begin
        for X in C_Properties'Range loop
            C_Properties(X).Next := Extension_Records.To_C(Properties(X).Next);
        end loop;

        Result := vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
                    (Physical_Device, Count, C_Properties(1)'Access);

        for X in C_Properties'Range loop
            C_NV.To_Ada(Properties(X), C_Properties(X));
            Extension_Records.Free(C_Properties(X).Next);
        end loop;

        return Result;
    end Get_Physical_Device_Cooperative_Matrix_Properties;

    function Get_Physical_Device_Cooperative_Matrix_Properties
        (Physical_Device: in Vulkan.Physical_Device)
        return NV.Cooperative_Matrix_Properties_Vectors.Vector is
        Properties: NV.Cooperative_Matrix_Properties_Vectors.Vector;
        Property: NV.Cooperative_Matrix_Properties;
    begin
        Properties :=
            NV.Cooperative_Matrix_Properties_Vectors.To_Vector
                (Property, Ada.Containers.Count_Type
                    (Properties_Count(Physical_Device)));
        Exceptions.Check(Get_Physical_Device_Cooperative_Matrix_Properties
            (Physical_Device, Properties));

        return Properties;
    end Get_Physical_Device_Cooperative_Matrix_Properties;
end Vulkan.Extensions.NV_Cooperative_Matrix;

