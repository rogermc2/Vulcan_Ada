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

-- Operations for the multi draw extension

with Vulkan.Core;

package body Vulkan.Extensions.EXT_Multi_Draw is
    -- Loaded extension functions.
    type vkCmdDrawMultiEXT_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Draw_Count: in Interfaces.Unsigned_32;
                         Vertex_Info: access constant EXT.Multi_Draw_Info;
                         Instance_Count,
                         First_Instance,
                         Stride: in Interfaces.Unsigned_32)
        with Convention => C;

    vkCmdDrawMultiEXT: vkCmdDrawMultiEXT_Access;

    type vkCmdDrawMultiIndexedEXT_Access is
        access procedure
            (Command_Buffer: in Vulkan.Command_Buffer;
             Draw_Count: in Interfaces.Unsigned_32;
             Index_Info: access constant EXT.Multi_Draw_Indexed_Info;
             Instance_Count, First_Instance, Stride: in Interfaces.Unsigned_32;
             Vertex_Offset: access constant Interfaces.Integer_32)
        with Convention => C;

    vkCmdDrawMultiIndexedEXT: vkCmdDrawMultiIndexedEXT_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is                    
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkCmdDrawMultiEXT_Access);
        procedure Load is new Load_Pointer(vkCmdDrawMultiIndexedEXT_Access);
    begin
        Load(vkCmdDrawMultiEXT, "vkCmdDrawMultiEXT");
        Load(vkCmdDrawMultiIndexedEXT, "vkCmdDrawMultiIndexedEXT");
    end Load_Extension;

    procedure Draw(Command_Buffer: in Vulkan.Command_Buffer;
                   Vertex_Info: in EXT.Multi_Draw_Info_Vectors.Vector;
                   Instance_Count,
                   First_Instance,
                   Stride: in Interfaces.Unsigned_32) is
        C_Info: array (1 .. Natural(Vertex_Info.Length)) of
            aliased EXT.Multi_Draw_Info
            with Convention => C;
    begin
        if Vertex_Info.Is_Empty then
            vkCmdDrawMultiEXT(Command_Buffer,
                              0,
                              null,
                              Instance_Count,
                              First_Instance,
                              Stride);
        else
            for X in C_Info'Range loop
                C_Info(X) := Vertex_Info(X);
            end loop;

            vkCmdDrawMultiEXT(Command_Buffer,
                              C_Info'Length,
                              C_Info(1)'Access,
                              Instance_Count,
                              First_Instance,
                              Stride);
        end if;
    end Draw;

    procedure Draw(Command_Buffer: in Vulkan.Command_Buffer;
                   Vertex_Info: in EXT.Multi_Draw_Info;
                   Instance_Count,
                   First_Instance,
                   Stride: in Interfaces.Unsigned_32) is
    begin
        Draw(Command_Buffer,
             EXT.Multi_Draw_Info_Vectors.To_Vector(Vertex_Info, 1),
             Instance_Count,
             First_Instance,
             Stride);
    end Draw;

    procedure Draw_Indexed
        (Command_Buffer: in Vulkan.Command_Buffer;
         Index_Info: in EXT.Multi_Draw_Indexed_Info_Vectors.Vector;
         Instance_Count, First_Instance, Stride: in Interfaces.Unsigned_32;
         Vertex_Offset: in Interfaces.Integer_32) is
        C_Info: array (1 .. Natural(Index_Info.Length)) of
            aliased EXT.Multi_Draw_Indexed_Info
            with Convention => C;
        Offset: aliased Interfaces.Integer_32 := Vertex_Offset;
    begin
        if Index_Info.Is_Empty then
            vkCmdDrawMultiIndexedEXT(Command_Buffer,
                                     0,
                                     null,
                                     Instance_Count,
                                     First_Instance,
                                     Stride,
                                     Offset'Access);
        else
            for X in C_Info'Range loop
                C_Info(X) := Index_Info(X);
            end loop;

            vkCmdDrawMultiIndexedEXT(Command_Buffer,
                                     C_Info'Length,
                                     C_Info(1)'Access,
                                     Instance_Count,
                                     First_Instance,
                                     Stride,
                                     Offset'Access);
        end if;
    end Draw_Indexed;

    procedure Draw_Indexed
        (Command_Buffer: in Vulkan.Command_Buffer;
         Index_Info: in EXT.Multi_Draw_Indexed_Info;
         Instance_Count, First_Instance, Stride: in Interfaces.Unsigned_32;
         Vertex_Offset: in Interfaces.Integer_32) is
    begin
        Draw_Indexed(Command_Buffer,
                     EXT.Multi_Draw_Indexed_Info_Vectors.To_Vector
                         (Index_Info, 1),
                     Instance_Count,
                     First_Instance,
                     Stride,
                     Vertex_Offset);
    end Draw_Indexed;

    procedure Draw_Indexed
        (Command_Buffer: in Vulkan.Command_Buffer;
         Index_Info: in EXT.Multi_Draw_Indexed_Info_Vectors.Vector;
         Instance_Count, First_Instance, Stride: in Interfaces.Unsigned_32) is
        C_Info: array (1 .. Natural(Index_Info.Length)) of
            aliased EXT.Multi_Draw_Indexed_Info
            with Convention => C;
    begin
        if Index_Info.Is_Empty then
            vkCmdDrawMultiIndexedEXT(Command_Buffer,
                                     0,
                                     null,
                                     Instance_Count,
                                     First_Instance,
                                     Stride,
                                     null);
        else
            for X in C_Info'Range loop
                C_Info(X) := Index_Info(X);
            end loop;

            vkCmdDrawMultiIndexedEXT(Command_Buffer,
                                     C_Info'Length,
                                     C_Info(1)'Access,
                                     Instance_Count,
                                     First_Instance,
                                     Stride,
                                     null);
        end if;
    end Draw_Indexed;

    procedure Draw_Indexed
        (Command_Buffer: in Vulkan.Command_Buffer;
         Index_Info: in EXT.Multi_Draw_Indexed_Info;
         Instance_Count, First_Instance, Stride: in Interfaces.Unsigned_32) is
    begin
        Draw_Indexed(Command_Buffer,
                     EXT.Multi_Draw_Indexed_Info_Vectors.To_Vector
                         (Index_Info, 1),
                     Instance_Count,
                     First_Instance,
                     Stride);
    end Draw_Indexed;
end Vulkan.Extensions.EXT_Multi_Draw;

