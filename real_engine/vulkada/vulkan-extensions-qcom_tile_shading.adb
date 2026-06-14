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

-- Operations for the tile shading extension

with Vulkan.Core;
with Vulkan.C_QCOM;

package body Vulkan.Extensions.QCOM_Tile_Shading is
    -- Loaded extension functions.
    type vkCmdDispatchTileQCOM_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer)
        with Convention => C;

    vkCmdDispatchTileQCOM: vkCmdDispatchTileQCOM_Access;

    type vkCmdBeginPerTileExecutionQCOM_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Per_Tile_Begin_Info: in C_QCOM.Per_Tile_Begin_Info_C)
        with Convention => C;

    vkCmdBeginPerTileExecutionQCOM: vkCmdBeginPerTileExecutionQCOM_Access;

    type vkCmdEndPerTileExecutionQCOM_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Per_Tile_End_Info: in C_QCOM.Per_Tile_End_Info_C)
        with Convention => C;

    vkCmdEndPerTileExecutionQCOM: vkCmdEndPerTileExecutionQCOM_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkCmdDispatchTileQCOM_Access);
        procedure Load is
            new Load_Pointer(vkCmdBeginPerTileExecutionQCOM_Access);
        procedure Load is new Load_Pointer(vkCmdEndPerTileExecutionQCOM_Access);
    begin
        Load(vkCmdDispatchTileQCOM, "vkCmdDispatchTileQCOM");
        Load(vkCmdBeginPerTileExecutionQCOM, "vkCmdBeginPerTileExecutionQCOM");
        Load(vkCmdEndPerTileExecutionQCOM, "vkCmdEndPerTileExecutionQCOM");
    end Load_Extension;

    procedure Dispatch_Tile(Command_Buffer: in Vulkan.Command_Buffer) is
    begin
        vkCmdDispatchTileQCOM(Command_Buffer);
    end Dispatch_Tile;

    procedure Begin_Per_Tile_Execution
        (Command_Buffer: in Vulkan.Command_Buffer;
         Per_Tile_Begin_Info: in QCOM.Per_Tile_Begin_Info) is
        C_Info: C_QCOM.Per_Tile_Begin_Info_C :=
            C_QCOM.To_C(Per_Tile_Begin_Info);
    begin
        vkCmdBeginPerTileExecutionQCOM(Command_Buffer, C_Info);
        C_QCOM.Free(C_Info);
    end Begin_Per_Tile_Execution;
 
    procedure End_Per_Tile_Execution
        (Command_Buffer: in Vulkan.Command_Buffer;
         Per_Tile_End_Info: in QCOM.Per_Tile_End_Info) is
        C_Info: C_QCOM.Per_Tile_End_Info_C := C_QCOM.To_C(Per_Tile_End_Info);
    begin
        vkCmdEndPerTileExecutionQCOM(Command_Buffer, C_Info);
        C_QCOM.Free(C_Info);
    end End_Per_Tile_Execution;
end Vulkan.Extensions.QCOM_Tile_Shading;

