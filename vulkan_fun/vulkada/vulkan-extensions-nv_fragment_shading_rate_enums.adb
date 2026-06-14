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

-- Operations for the fragment shading rate enums extension

with Vulkan.Core;

package body Vulkan.Extensions.NV_Fragment_Shading_Rate_Enums is
    -- Loaded extension functions.
    type vkCmdSetFragmentShadingRateEnumNV_Access is
        access procedure
            (Command_Buffer: in Vulkan.Command_Buffer;
             Shading_Rate: in NV.Fragment_Shading_Rate;
             Combiner_Ops: in KHR.Fragment_Shading_Rate_Combiner_Op_Array)
        with Convention => C;

    vkCmdSetFragmentShadingRateEnumNV: vkCmdSetFragmentShadingRateEnumNV_Access;

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
            new Load_Pointer(vkCmdSetFragmentShadingRateEnumNV_Access);
    begin
        Load(vkCmdSetFragmentShadingRateEnumNV,
             "vkCmdSetFragmentShadingRateEnumNV");
    end Load_Extension;

    procedure Set_Fragment_Shading_Rate_Enum
        (Command_Buffer: in Vulkan.Command_Buffer;
         Shading_Rate: in NV.Fragment_Shading_Rate;
         Combiner_Ops: in KHR.Fragment_Shading_Rate_Combiner_Op_Array) is
    begin
        vkCmdSetFragmentShadingRateEnumNV(Command_Buffer,
                                          Shading_Rate,
                                          Combiner_Ops);
    end Set_Fragment_Shading_Rate_Enum;
end Vulkan.Extensions.NV_Fragment_Shading_Rate_Enums;

