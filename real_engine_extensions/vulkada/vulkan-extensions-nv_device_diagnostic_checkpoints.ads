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

with Vulkan.Extensions.NV;

package Vulkan.Extensions.NV_Device_Diagnostic_Checkpoints is
    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkCmdSetCheckpointNV
    procedure Set_Checkpoint
        (Command_Buffer: in Vulkan.Command_Buffer;
         Checkpoint_Marker: in Interfaces.C.Extensions.void_ptr)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer;

    -- vkGetQueueCheckpointDataNV
    function Get_Queue_Checkpoint_Data(Queue: in Vulkan.Queue)
        return NV.Checkpoint_Data_Vectors.Vector
        with Pre => Queue /= No_Queue;

    -- vkGetQueueCheckpointData2NV
    function Get_Queue_Checkpoint_Data(Queue: in Vulkan.Queue)
        return NV.Checkpoint_Data_2_Vectors.Vector
        with Pre => Queue /= No_Queue;
end Vulkan.Extensions.NV_Device_Diagnostic_Checkpoints;

