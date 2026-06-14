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

-- Operations for the pipeline properties extension

with Vulkan.Core;
with Vulkan.C_KHR;
with Vulkan.C;
with Vulkan.Extension_Records;
with Vulkan.Exceptions;

package body Vulkan.Extensions.EXT_Pipeline_Properties is
    -- Loaded extension functions.
    type vkGetPipelinePropertiesEXT_Access is
        access function
            (Device: in Vulkan.Device;
             Pipeline_Info: in C_KHR.Pipeline_Info_C;
             Pipeline_Properties: in C.Out_Structure_C_Access)
        return Result
        with Convention => C;

    vkGetPipelinePropertiesEXT: vkGetPipelinePropertiesEXT_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkGetPipelinePropertiesEXT_Access);
    begin
        Load(vkGetPipelinePropertiesEXT, "vkGetPipelinePropertiesEXT");
    end Load_Extension;

    function Get_Pipeline_Properties
        (Device: in Vulkan.Device;
         Pipeline_Info: in KHR.Pipeline_Info;
         Pipeline_Properties: in out Out_Structure'Class) return Result is
        C_Info: C_KHR.Pipeline_Info_C := C_KHR.To_C(Pipeline_Info);
        C_Properties: C.Out_Structure_C_Access :=
            Extension_Records.To_C(Pipeline_Properties'Unchecked_Access);
        Result: Vulkan.Result;
    begin
        Result := vkGetPipelinePropertiesEXT(Device, C_Info, C_Properties);

        Extension_Records.To_Ada(Pipeline_Properties'Unchecked_Access,
                                 C_Properties);
        Extension_Records.Free(C_Properties);
        C_KHR.Free(C_Info);

        return Result;
    end Get_Pipeline_Properties;

    procedure Get_Pipeline_Properties
        (Device: in Vulkan.Device;
         Pipeline_Info: in KHR.Pipeline_Info;
         Pipeline_Properties: in out Out_Structure'Class) is
    begin
        Exceptions.Check(Get_Pipeline_Properties(Device,
                                                 Pipeline_Info,
                                                 Pipeline_Properties));
    end Get_Pipeline_Properties;
end Vulkan.Extensions.EXT_Pipeline_Properties;

