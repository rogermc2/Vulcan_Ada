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

-- Operations for the vertex input dynamic state extension

with Vulkan.Core;
with Vulkan.C_EXT;
with Vulkan.Extension_Records;

package body Vulkan.Extensions.EXT_Vertex_Input_Dynamic_State is
    -- Loaded extension functions.
    type vkCmdSetVertexInputEXT_Access is
        access procedure
            (Command_Buffer: in Vulkan.Command_Buffer;
             Vertex_Binding_Description_Count: in Interfaces.Unsigned_32;
             Vertex_Binding_Descriptions:
                access constant C_EXT.Vertex_Input_Binding_Description_2_C;
             Vertex_Attribute_Description_Count: in Interfaces.Unsigned_32;
             Vertex_Attribute_Descriptions:
                access constant C_EXT.Vertex_Input_Attribute_Description_2_C)
        with Convention => C;

    vkCmdSetVertexInputEXT: vkCmdSetVertexInputEXT_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkCmdSetVertexInputEXT_Access);
    begin
        Load(vkCmdSetVertexInputEXT, "vkCmdSetVertexInputEXT");
    end Load_Extension;

    procedure Set_Vertex_Input
        (Command_Buffer: in Vulkan.Command_Buffer;
         Vertex_Binding_Descriptions: in
            EXT.Vertex_Input_Binding_Description_2_Vectors.Vector;
         Vertex_Attribute_Descriptions: in
            EXT.Vertex_Input_Attribute_Description_2_Vectors.Vector :=
                EXT.Vertex_Input_Attribute_Description_2_Vectors.Empty_Vector)
        is
        C_Bindings: array (1 .. Natural(Vertex_Binding_Descriptions.Length)) of
            aliased C_EXT.Vertex_Input_Binding_Description_2_C
            with Convention => C;
        C_Binding_First:
            access constant C_EXT.Vertex_Input_Binding_Description_2_C
            with Convention => C;
        C_Attributes:
            array (1 .. Natural(Vertex_Attribute_Descriptions.Length)) of
            aliased C_EXT.Vertex_Input_Attribute_Description_2_C
            with Convention => C;
        C_Attribute_First:
            access constant C_EXT.Vertex_Input_Attribute_Description_2_C
            with Convention => C;
    begin
        if not Vertex_Binding_Descriptions.Is_Empty then
            for X in C_Bindings'Range loop
                C_Bindings(X).Next :=
                    Extension_Records.To_C(Vertex_Binding_Descriptions(X).Next);
                C_Bindings(X).Binding := Vertex_Binding_Descriptions(X).Binding;
                C_Bindings(X).Stride := Vertex_Binding_Descriptions(X).Stride;
                C_Bindings(X).Input_Rate :=
                    Vertex_Binding_Descriptions(X).Input_Rate;
                C_Bindings(X).Divisor := Vertex_Binding_Descriptions(X).Divisor;
            end loop;

            C_Binding_First := C_Bindings(1)'Access;
        end if;

        if not Vertex_Attribute_Descriptions.Is_Empty then
            for X in C_Attributes'Range loop
                C_Attributes(X).Next :=
                    Extension_Records.To_C
                        (Vertex_Attribute_Descriptions(X).Next);
                C_Attributes(X).Location :=
                    Vertex_Attribute_Descriptions(X).Location;
                C_Attributes(X).Binding :=
                    Vertex_Attribute_Descriptions(X).Binding;
                C_Attributes(X).Format :=
                    Vertex_Attribute_Descriptions(X).Format;
                C_Attributes(X).Offset :=
                    Vertex_Attribute_Descriptions(X).Offset;
            end loop;

            C_Attribute_First := C_Attributes(1)'Access;
        end if;

        vkCmdSetVertexInputEXT(Command_Buffer,
                               C_Bindings'Length,
                               C_Binding_First,
                               C_Attributes'Length,
                               C_Attribute_First);

        for Binding of C_Bindings loop
            Extension_Records.Free(Binding.Next);
        end loop;

        for Attribute of C_Attributes loop
            Extension_Records.Free(Attribute.Next);
        end loop;
    end Set_Vertex_Input;

    procedure Set_Vertex_Input(Command_Buffer: in Vulkan.Command_Buffer) is
    begin
        vkCmdSetVertexInputEXT(Command_Buffer, 0, null, 0, null);
    end Set_Vertex_Input;

    procedure Set_Vertex_Input
        (Command_Buffer: in Vulkan.Command_Buffer;
         Vertex_Attribute_Descriptions: in
            EXT.Vertex_Input_Attribute_Description_2_Vectors.Vector) is
    begin
        Set_Vertex_Input
            (Command_Buffer,
             EXT.Vertex_Input_Binding_Description_2_Vectors.Empty_Vector,
             Vertex_Attribute_Descriptions);
    end Set_Vertex_Input;

    procedure Set_Vertex_Input
        (Command_Buffer: in Vulkan.Command_Buffer;
         Vertex_Binding_Description: in EXT.Vertex_Input_Binding_Description_2;
         Vertex_Attribute_Description: in
             EXT.Vertex_Input_Attribute_Description_2) is
    begin
        Set_Vertex_Input
            (Command_Buffer,
             EXT.Vertex_Input_Binding_Description_2_Vectors.To_Vector
                (Vertex_Binding_Description, 1),
             EXT.Vertex_Input_Attribute_Description_2_Vectors.To_Vector
                (Vertex_Attribute_Description, 1));
    end Set_Vertex_Input;

    procedure Set_Vertex_Input
        (Command_Buffer: in Vulkan.Command_Buffer;
         Vertex_Binding_Description: in EXT.Vertex_Input_Binding_Description_2)
        is
    begin
        Set_Vertex_Input
            (Command_Buffer,
             EXT.Vertex_Input_Binding_Description_2_Vectors.To_Vector
                (Vertex_Binding_Description, 1),
             EXT.Vertex_Input_Attribute_Description_2_Vectors.Empty_Vector);
    end Set_Vertex_Input;

    procedure Set_Vertex_Input
        (Command_Buffer: in Vulkan.Command_Buffer;
         Vertex_Attribute_Description: in
             EXT.Vertex_Input_Attribute_Description_2) is
    begin
         Set_Vertex_Input
            (Command_Buffer,
             EXT.Vertex_Input_Binding_Description_2_Vectors.Empty_Vector,
             EXT.Vertex_Input_Attribute_Description_2_Vectors.To_Vector
                (Vertex_Attribute_Description, 1));
    end Set_Vertex_Input;
end Vulkan.Extensions.EXT_Vertex_Input_Dynamic_State;

