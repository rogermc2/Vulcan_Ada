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

-- Operations for the buffer marker extension

package Vulkan.Extensions.AMD_Buffer_Marker is
    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkCmdWriteBufferMarkerAMD
    procedure Write_Buffer_Marker(Command_Buffer: in Vulkan.Command_Buffer;
                                  Pipeline_Stage: in Pipeline_Stage_Flags;
                                  Dst_Buffer: in Buffer;
                                  Dst_Offset: in Device_Size;
                                  Marker: in Interfaces.Unsigned_32)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer and
                    Dst_Buffer /= No_Buffer;

    -- vkCmdWriteBufferMarker2AMD
    procedure Write_Buffer_Marker(Command_Buffer: in Vulkan.Command_Buffer;
                                  Pipeline_Stage: in Pipeline_Stage_Flags_2;
                                  Dst_Buffer: in Buffer;
                                  Dst_Offset: in Device_Size;
                                  Marker: in Interfaces.Unsigned_32)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer and
                    Dst_Buffer /= No_Buffer;
end Vulkan.Extensions.AMD_Buffer_Marker;

