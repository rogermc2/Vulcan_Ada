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

-- Operations for the depth bias control extension

with Vulkan.Core;
with Vulkan.C_EXT;

package body Vulkan.Extensions.EXT_Depth_Bias_Control is
    -- Loaded extension functions.
    type vkCmdSetDepthBias2EXT_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Depth_Bias_Info: in C_EXT.Depth_Bias_Info_C)
        with Convention => C;

    vkCmdSetDepthBias2EXT: vkCmdSetDepthBias2EXT_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkCmdSetDepthBias2EXT_Access);
    begin
        Load(vkCmdSetDepthBias2EXT, "vkCmdSetDepthBias2EXT");
    end Load_Extension;

    procedure Set_Depth_Bias(Command_Buffer: in Vulkan.Command_Buffer;
                             Depth_Bias_Info: in EXT.Depth_Bias_Info) is
        Info_C: C_EXT.Depth_Bias_Info_C := C_EXT.To_C(Depth_Bias_Info);
    begin
        vkCmdSetDepthBias2EXT(Command_Buffer, Info_C);
        C_EXT.Free(Info_C);
    end Set_Depth_Bias;
end Vulkan.Extensions.EXT_Depth_Bias_Control;

