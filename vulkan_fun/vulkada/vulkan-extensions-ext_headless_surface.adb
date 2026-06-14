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

-- Operations for the headless surface extension

with Vulkan.Core;
with Vulkan.C_EXT;
with Vulkan.Exceptions;

package body Vulkan.Extensions.EXT_Headless_Surface is
    -- Loaded extension functions.
    type vkCreateHeadlessSurfaceEXT_Access is
        access function(Instance: in Vulkan.Instance;
                        Create_Info: in C_EXT.Headless_Surface_Create_Info_C;
                        Allocation: access constant Allocation_Callbacks;
                        Surface: out KHR.Surface) return Result
        with Convention => C;

    vkCreateHeadlessSurfaceEXT: vkCreateHeadlessSurfaceEXT_Access;
    
    -- Common create function.
    function Create(Instance: in Vulkan.Instance;
                    Create_Info: in EXT.Headless_Surface_Create_Info;
                    Allocator: access constant Allocation_Callbacks;
                    Surface: out KHR.Surface) return Result;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkCreateHeadlessSurfaceEXT_Access);
    begin
        Load(vkCreateHeadlessSurfaceEXT, "vkCreateHeadlessSurfaceEXT");
    end Load_Extension;

    function Create(Instance: in Vulkan.Instance;
                    Create_Info: in EXT.Headless_Surface_Create_Info;
                    Allocator: aliased in Allocation_Callbacks;
                    Surface: out KHR.Surface) return Result is
    begin
        return Create(Instance, Create_Info, Allocator'Access, Surface);
    end Create;

    function Create(Instance: in Vulkan.Instance;
                    Create_Info: in EXT.Headless_Surface_Create_Info;
                    Allocator: aliased in Allocation_Callbacks)
        return KHR.Surface is
        Surface: KHR.Surface;
    begin
        Exceptions.Check(Create(Instance,
                                Create_Info,
                                Allocator'Access,
                                Surface));

        return Surface;
    end Create;

    function Create(Instance: in Vulkan.Instance;
                    Create_Info: in EXT.Headless_Surface_Create_Info;
                    Surface: out KHR.Surface) return Result is
    begin
        return Create(Instance, Create_Info, null, Surface);
    end Create;

    function Create(Instance: in Vulkan.Instance;
                    Create_Info: in EXT.Headless_Surface_Create_Info)
        return KHR.Surface is
        Surface: KHR.Surface;
    begin
        Exceptions.Check(Create(Instance, Create_Info, null, Surface));

        return Surface;
    end Create;
    
    function Create(Instance: in Vulkan.Instance;
                    Create_Info: in EXT.Headless_Surface_Create_Info;
                    Allocator: access constant Allocation_Callbacks;
                    Surface: out KHR.Surface) return Result is
        C_Info: C_EXT.Headless_Surface_Create_Info_C := C_EXT.To_C(Create_Info);
        Result: Vulkan.Result;
    begin
        Result := vkCreateHeadlessSurfaceEXT(Instance,
                                             C_Info,
                                             Allocator,
                                             Surface);
        C_EXT.Free(C_Info);

        return Result;
    end Create;
end Vulkan.Extensions.EXT_Headless_Surface;

