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

with Vulkan.Core;

package body Vulkan.Extensions.AMD_Buffer_Marker is
    -- Loaded extension functions.
    type vkCmdWriteBufferMarkerAMD_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Pipeline_Stage: in Pipeline_Stage_Flags;
                         Dst_Buffer: in Buffer;
                         Dst_Offset: in Device_Size;
                         Marker: in Interfaces.Unsigned_32)
        with Convention => C;

    vkCmdWriteBufferMarkerAMD: vkCmdWriteBufferMarkerAMD_Access;

    type vkCmdWriteBufferMarker2AMD_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Stage: in Pipeline_Stage_Flags_2;
                         Dst_Buffer: in Buffer;
                         Dst_Offset: in Device_Size;
                         Marker: in Interfaces.Unsigned_32)
        with Convention => C;

    vkCmdWriteBufferMarker2AMD: vkCmdWriteBufferMarker2AMD_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkCmdWriteBufferMarkerAMD_Access);
        procedure Load is new Load_Pointer(vkCmdWriteBufferMarker2AMD_Access);
    begin
        Load(vkCmdWriteBufferMarkerAMD, "vkCmdWriteBufferMarkerAMD");
        Load(vkCmdWriteBufferMarker2AMD, "vkCmdWriteBufferMarker2AMD");
    end Load_Extension;

    procedure Write_Buffer_Marker(Command_Buffer: in Vulkan.Command_Buffer;
                                  Pipeline_Stage: in Pipeline_Stage_Flags;
                                  Dst_Buffer: in Buffer;
                                  Dst_Offset: in Device_Size;
                                  Marker: in Interfaces.Unsigned_32) is
    begin
        vkCmdWriteBufferMarkerAMD(Command_Buffer,
                                  Pipeline_Stage,
                                  Dst_Buffer,
                                  Dst_Offset,
                                  Marker);
    end Write_Buffer_Marker;
    
    procedure Write_Buffer_Marker(Command_Buffer: in Vulkan.Command_Buffer;
                                  Pipeline_Stage: in Pipeline_Stage_Flags_2;
                                  Dst_Buffer: in Buffer;
                                  Dst_Offset: in Device_Size;
                                  Marker: in Interfaces.Unsigned_32) is
    begin
        vkCmdWriteBufferMarker2AMD(Command_Buffer,
                                   Pipeline_Stage,
                                   Dst_Buffer,
                                   Dst_Offset,
                                   Marker);
    end Write_Buffer_Marker;
end Vulkan.Extensions.AMD_Buffer_Marker;

