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

-- Operations for the device diagnostic checkpoints extension

with Vulkan.Core;
with Vulkan.C_NV;

package body Vulkan.Extensions.NV_Device_Diagnostic_Checkpoints is
    -- Loaded extension functions.
    type vkCmdSetCheckpointNV_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Checkpoint_Marker: in Interfaces.C.Extensions.void_ptr)
        with Convention => C;

    vkCmdSetCheckpointNV: vkCmdSetCheckpointNV_Access;

    type vkGetQueueCheckpointDataNV_Access is
        access procedure(Queue: in Vulkan.Queue;
                         Checkpoint_Data_Count: in out Interfaces.Unsigned_32;
                         Checkpoint_Data: access C_NV.Checkpoint_Data_C)
        with Convention => C;

    vkGetQueueCheckpointDataNV: vkGetQueueCheckpointDataNV_Access;

    type vkGetQueueCheckpointData2NV_Access is
        access procedure(Queue: in Vulkan.Queue;
                         Checkpoint_Data_Count: in out Interfaces.Unsigned_32;
                         Checkpoint_Data: access C_NV.Checkpoint_Data_2_C)
        with Convention => C;

    vkGetQueueCheckpointData2NV: vkGetQueueCheckpointData2NV_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkCmdSetCheckpointNV_Access);
        procedure Load is new Load_Pointer(vkGetQueueCheckpointDataNV_Access);
        procedure Load is new Load_Pointer(vkGetQueueCheckpointData2NV_Access);
    begin
        Load(vkCmdSetCheckpointNV, "vkCmdSetCheckpointNV");
        Load(vkGetQueueCheckpointDataNV, "vkGetQueueCheckpointDataNV");
        Load(vkGetQueueCheckpointData2NV, "vkGetQueueCheckpointData2NV");
    end Load_Extension;

    procedure Set_Checkpoint
        (Command_Buffer: in Vulkan.Command_Buffer;
         Checkpoint_Marker: in Interfaces.C.Extensions.void_ptr) is
    begin
        vkCmdSetCheckpointNV(Command_Buffer, Checkpoint_Marker);
    end Set_Checkpoint;
    
    function Get_Queue_Checkpoint_Data(Queue: in Vulkan.Queue)
        return NV.Checkpoint_Data_Vectors.Vector is
        use type Interfaces.Unsigned_32;

        Count: Interfaces.Unsigned_32 := 0;
    begin
        vkGetQueueCheckpointDataNV(Queue, Count, null);

        if Count = 0 then
            return NV.Checkpoint_Data_Vectors.Empty_Vector;
        end if;

        declare
            C_Data: array (1 .. Count) of aliased C_NV.Checkpoint_Data_C
                with Convention => C;
            Results: NV.Checkpoint_Data_Vectors.Vector;
        begin
            vkGetQueueCheckpointDataNV(Queue, Count, C_Data(1)'Access);
            Results.Reserve_Capacity(Ada.Containers.Count_Type(Count));

            for Data of C_Data loop
                declare
                    Ada_Data: NV.Checkpoint_Data;
                begin
                    C_NV.To_Ada(Ada_Data, Data);
                    Results.Append(Ada_Data);
                end;
            end loop;

            return Results;
        end;
    end Get_Queue_Checkpoint_Data;

    function Get_Queue_Checkpoint_Data(Queue: in Vulkan.Queue)
        return NV.Checkpoint_Data_2_Vectors.Vector is
        use type Interfaces.Unsigned_32;

        Count: Interfaces.Unsigned_32 := 0;
    begin
        vkGetQueueCheckpointData2NV(Queue, Count, null);

        if Count = 0 then
            return NV.Checkpoint_Data_2_Vectors.Empty_Vector;
        end if;

        declare
            C_Data: array (1 .. Count) of aliased C_NV.Checkpoint_Data_2_C
                with Convention => C;
            Results: NV.Checkpoint_Data_2_Vectors.Vector;
        begin
            vkGetQueueCheckpointData2NV(Queue, Count, C_Data(1)'Access);
            Results.Reserve_Capacity(Ada.Containers.Count_Type(Count));

            for Data of C_Data loop
                declare
                    Ada_Data: NV.Checkpoint_Data_2;
                begin
                    C_NV.To_Ada(Ada_Data, Data);
                    Results.Append(Ada_Data);
                end;
            end loop;

            return Results;
        end;
    end Get_Queue_Checkpoint_Data;
end Vulkan.Extensions.NV_Device_Diagnostic_Checkpoints;

