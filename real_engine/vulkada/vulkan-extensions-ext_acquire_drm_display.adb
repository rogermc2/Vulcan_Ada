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

-- Operations for the acquire DRM display extension

with Vulkan.Core;
with Vulkan.Exceptions;

package body Vulkan.Extensions.EXT_Acquire_DRM_Display is
    -- Loaded extension functions.
    type vkAcquireDrmDisplayEXT_Access is
        access function(Physical_Device: in Vulkan.Physical_Device;
                        DRM_FD: in Interfaces.Integer_32;
                        Display: in KHR.Display) return Result
        with Convention => C;

    vkAcquireDrmDisplayEXT: vkAcquireDrmDisplayEXT_Access;

    type vkGetDrmDisplayEXT_Access is
        access function(Physical_Device: in Vulkan.Physical_Device;
                        DRM_FD: in Interfaces.Integer_32;
                        Connector_ID: in Interfaces.Unsigned_32;
                        Display: out KHR.Display) return Result
        with Convention => C;

    vkGetDrmDisplayEXT: vkGetDrmDisplayEXT_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkAcquireDrmDisplayEXT_Access);
        procedure Load is new Load_Pointer(vkGetDrmDisplayEXT_Access);
    begin
        Load(vkAcquireDrmDisplayEXT, "vkAcquireDrmDisplayEXT");
        Load(vkGetDrmDisplayEXT, "vkGetDrmDisplayEXT");
    end Load_Extension;

    function Acquire_DRM_Display(Physical_Device: in Vulkan.Physical_Device;
                                 DRM_FD: in Interfaces.Integer_32;
                                 Display: in KHR.Display) return Result is
    begin
        return vkAcquireDrmDisplayEXT(Physical_Device, DRM_FD, Display);
    end Acquire_DRM_Display;

    procedure Acquire_DRM_Display(Physical_Device: in Vulkan.Physical_Device;
                                  DRM_FD: in Interfaces.Integer_32;
                                  Display: in KHR.Display) is
    begin
        Exceptions.Check(Acquire_DRM_Display(Physical_Device, DRM_FD, Display));
    end Acquire_DRM_Display;

    function Get_DRM_Display(Physical_Device: in Vulkan.Physical_Device;
                             DRM_FD: in Interfaces.Integer_32;
                             Connector_ID: in Interfaces.Unsigned_32;
                             Display: out KHR.Display) return Result is
    begin
        return vkGetDrmDisplayEXT(Physical_Device,
                                  DRM_FD,
                                  Connector_ID,
                                  Display);
    end Get_DRM_Display;

    function Get_DRM_Display(Physical_Device: in Vulkan.Physical_Device;
                             DRM_FD: in Interfaces.Integer_32;
                             Connector_ID: in Interfaces.Unsigned_32)
        return KHR.Display is
        Display: KHR.Display;
    begin
        Exceptions.Check(vkGetDrmDisplayEXT(Physical_Device,
                                            DRM_FD,
                                            Connector_ID,
                                            Display));

        return Display;
    end Get_DRM_Display;
end Vulkan.Extensions.EXT_Acquire_DRM_Display;

