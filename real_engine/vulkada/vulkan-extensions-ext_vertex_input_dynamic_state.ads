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

with Vulkan.Extensions.EXT;

package Vulkan.Extensions.EXT_Vertex_Input_Dynamic_State is
    -- Load the extension functions.
    procedure Load_Extension(Instance: in Vulkan.Instance)
        with Pre => Instance /= No_Instance;

    -- vkCmdSetVertexInputEXT
    procedure Set_Vertex_Input
        (Command_Buffer: in Vulkan.Command_Buffer;
         Vertex_Binding_Descriptions: in
            EXT.Vertex_Input_Binding_Description_2_Vectors.Vector;
         Vertex_Attribute_Descriptions: in
            EXT.Vertex_Input_Attribute_Description_2_Vectors.Vector :=
                EXT.Vertex_Input_Attribute_Description_2_Vectors.Empty_Vector)
        with Pre => Command_Buffer /= No_Command_Buffer;

    procedure Set_Vertex_Input(Command_Buffer: in Vulkan.Command_Buffer)
        with Inline,
             Pre => Command_Buffer /= No_Command_Buffer;

    procedure Set_Vertex_Input
        (Command_Buffer: in Vulkan.Command_Buffer;
         Vertex_Attribute_Descriptions: in
            EXT.Vertex_Input_Attribute_Description_2_Vectors.Vector)
        with Pre => Command_Buffer /= No_Command_Buffer;

    procedure Set_Vertex_Input
        (Command_Buffer: in Vulkan.Command_Buffer;
         Vertex_Binding_Description: in EXT.Vertex_Input_Binding_Description_2;
         Vertex_Attribute_Description: in
             EXT.Vertex_Input_Attribute_Description_2)
        with Pre => Command_Buffer /= No_Command_Buffer;

    procedure Set_Vertex_Input
        (Command_Buffer: in Vulkan.Command_Buffer;
         Vertex_Binding_Description: in EXT.Vertex_Input_Binding_Description_2)
        with Pre => Command_Buffer /= No_Command_Buffer;

    procedure Set_Vertex_Input
        (Command_Buffer: in Vulkan.Command_Buffer;
         Vertex_Attribute_Description: in
             EXT.Vertex_Input_Attribute_Description_2)
        with Pre => Command_Buffer /= No_Command_Buffer;
end Vulkan.Extensions.EXT_Vertex_Input_Dynamic_State;

