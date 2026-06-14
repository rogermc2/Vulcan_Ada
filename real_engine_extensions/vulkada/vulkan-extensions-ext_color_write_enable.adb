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

-- Operations for the color write enable extension

with Vulkan.Core;
with Vulkan.Utilities;

package body Vulkan.Extensions.EXT_Color_Write_Enable is
    -- Loaded extension functions.
    type vkCmdSetColorWriteEnableEXT_Access is
        access procedure
            (Command_Buffer: in Vulkan.Command_Buffer;
             Attachment_Count: in Interfaces.Unsigned_32;
             Color_Write_Enables: access constant Interfaces.Unsigned_32)
        with Convention => C;

    vkCmdSetColorWriteEnableEXT: vkCmdSetColorWriteEnableEXT_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkCmdSetColorWriteEnableEXT_Access);
    begin
        Load(vkCmdSetColorWriteEnableEXT, "vkCmdSetColorWriteEnableEXT");
    end Load_Extension;

    procedure Set_Color_Write_Enable
        (Command_Buffer: in Vulkan.Command_Buffer;
         Color_Write_Enables: in Boolean_Vectors.Vector) is
        C_Enables: array (1 .. Positive(Color_Write_Enables.Length)) of
            aliased Interfaces.Unsigned_32
            with Convention => C;
    begin
        for X in C_Enables'Range loop
            C_Enables(X) := Utilities.To_C(Color_Write_Enables(X));
        end loop;

        vkCmdSetColorWriteEnableEXT(Command_Buffer,
                                    C_Enables'Length,
                                    C_Enables(1)'Access);
    end Set_Color_Write_Enable;

    procedure Set_Color_Write_Enable(Command_Buffer: in Vulkan.Command_Buffer;
                                     Color_Write_Enable: in Boolean) is
        C_Enable: aliased Interfaces.Unsigned_32 :=
            Utilities.To_C(Color_Write_Enable);
    begin
        vkCmdSetColorWriteEnableEXT(Command_Buffer, 1, C_Enable'Access);
    end Set_Color_Write_Enable;
end Vulkan.Extensions.EXT_Color_Write_Enable;

