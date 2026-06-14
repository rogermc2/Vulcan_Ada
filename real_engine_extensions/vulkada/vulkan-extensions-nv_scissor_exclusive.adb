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

-- Operations for the scissor exclusive extension

with Vulkan.Core;
with Vulkan.Utilities;

package body Vulkan.Extensions.NV_Scissor_Exclusive is
    -- Loaded extension functions.
    type vkCmdSetExclusiveScissorEnableNV_Access is
        access procedure
            (Command_Buffer: in Vulkan.Command_Buffer;
             First_Exclusive_Scissor,
             Exclusive_Scissor_Count: in Interfaces.Unsigned_32;
             Exclusive_Scissor_Enables: access constant Interfaces.Unsigned_32)
        with Convention => C;

    vkCmdSetExclusiveScissorEnableNV: vkCmdSetExclusiveScissorEnableNV_Access;

    type vkCmdSetExclusiveScissorNV_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         First_Exclusive_Scissor,
                         Exclusive_Scissor_Count: in Interfaces.Unsigned_32;
                         Exclusive_Scissors: access constant Rect_2D)
        with Convention => C;

    vkCmdSetExclusiveScissorNV: vkCmdSetExclusiveScissorNV_Access;

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
            new Load_Pointer(vkCmdSetExclusiveScissorEnableNV_Access);
        procedure Load is new Load_Pointer(vkCmdSetExclusiveScissorNV_Access);
    begin
        Load(vkCmdSetExclusiveScissorEnableNV,
             "vkCmdSetExclusiveScissorEnableNV");
        Load(vkCmdSetExclusiveScissorNV, "vkCmdSetExclusiveScissorNV");
    end Load_Extension;

    procedure Set_Exclusive_Scissor_Enable
        (Command_Buffer: in Vulkan.Command_Buffer;
         First_Exclusive_Scissor: in Interfaces.Unsigned_32;
         Exclusive_Scissor_Enables: in Boolean_Vectors.Vector) is
        C_Enables: array (1 .. Positive(Exclusive_Scissor_Enables.Length)) of
            aliased Interfaces.Unsigned_32;
    begin
        for X in C_Enables'Range loop
            C_Enables(X) := Utilities.To_C(Exclusive_Scissor_Enables(X));
        end loop;

        vkCmdSetExclusiveScissorEnableNV(Command_Buffer,
                                         First_Exclusive_Scissor,
                                         C_Enables'Length,
                                         C_Enables(1)'Access);
    end Set_Exclusive_Scissor_Enable;

    procedure Set_Exclusive_Scissor_Enable
        (Command_Buffer: in Vulkan.Command_Buffer;
         First_Exclusive_Scissor: in Interfaces.Unsigned_32;
         Exclusive_Scissor_Enable: in Boolean) is
    begin
        Set_Exclusive_Scissor_Enable
            (Command_Buffer,
             First_Exclusive_Scissor,
             Boolean_Vectors.To_Vector(Exclusive_Scissor_Enable, 1));
    end Set_Exclusive_Scissor_Enable;

    procedure Set_Exclusive_Scissor
        (Command_Buffer: in Vulkan.Command_Buffer;
         First_Exclusive_Scissor: in Interfaces.Unsigned_32;
         Exclusive_Scissors: in Rect_2D_Vectors.Vector) is
        C_Scissors: array (1 .. Positive(Exclusive_Scissors.Length)) of
            aliased Rect_2D;
    begin
        for X in C_Scissors'Range loop
            C_Scissors(X) := Exclusive_Scissors(X);
        end loop;

        vkCmdSetExclusiveScissorNV(Command_Buffer,
                                   First_Exclusive_Scissor,
                                   C_Scissors'Length,
                                   C_Scissors(1)'Access);
    end Set_Exclusive_Scissor;

    procedure Set_Exclusive_Scissor
        (Command_Buffer: in Vulkan.Command_Buffer;
         First_Exclusive_Scissor: in Interfaces.Unsigned_32;
         Exclusive_Scissor: in Rect_2D) is
    begin
        Set_Exclusive_Scissor
            (Command_Buffer,
             First_Exclusive_Scissor,
             Rect_2D_Vectors.To_Vector(Exclusive_Scissor, 1));
    end Set_Exclusive_Scissor;
end Vulkan.Extensions.NV_Scissor_Exclusive;

