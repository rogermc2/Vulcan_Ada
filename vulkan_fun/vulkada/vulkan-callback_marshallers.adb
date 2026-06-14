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

-- Generic callback mappings

package body Vulkan.Callback_Marshallers is
    protected body Marshallers is
        procedure Register(Object: in Object_Type;
                           Callback: in not null Marshaller_Access) is
        begin
            if Callbacks.Contains(Object) then
                Callbacks(Object).Append(Callback);
            else
                Callbacks.Insert
                    (Object, Marshaller_Access_Vectors.To_Vector(Callback, 1));
            end if;
        end Register;

        procedure Remove(Object: in Object_Type) is
        begin
            if Callbacks.Contains(Object) then
                for Callback of Callbacks(Object) loop
                    Free(Callback);
                end loop;

                Callbacks.Delete(Object);
            end if;
        end Remove;
    end Marshallers;
end Vulkan.Callback_Marshallers;

