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

-- Operations for the shading rate image extension

with Vulkan.Core;
with Vulkan.C_NV;

package body Vulkan.Extensions.NV_Shading_Rate_Image is
    -- Loaded extension functions.
    type vkCmdBindShadingRateImageNV_Access is
        access procedure(Command_Buffer: in Vulkan.Command_Buffer;
                         Image_View: in Vulkan.Image_View;
                         Image_Layout: in Vulkan.Image_Layout)
            with Convention => C;

    vkCmdBindShadingRateImageNV: vkCmdBindShadingRateImageNV_Access;

    type vkCmdSetViewportShadingRatePaletteNV_Access is
        access procedure
            (Command_Buffer: in Vulkan.Command_Buffer;
             First_Viewport, Viewport_Count: in Interfaces.Unsigned_32;
             Shading_Rate_Palettes: access constant NV.Shading_Rate_Palette)
        with Convention => C;

    vkCmdSetViewportShadingRatePaletteNV:
        vkCmdSetViewportShadingRatePaletteNV_Access;

    type vkCmdSetCoarseSampleOrderNV_Access is
        access procedure
            (Command_Buffer: in Vulkan.Command_Buffer;
             Sample_Order_Type: in NV.Coarse_Sample_Order_Type;
             Custom_Sample_Order_Count: in Interfaces.Unsigned_32;
             Custom_Sample_Orders: 
                access constant C_NV.Coarse_Sample_Order_Custom_C)
        with Convention => C;

    vkCmdSetCoarseSampleOrderNV: vkCmdSetCoarseSampleOrderNV_Access;

    procedure Load_Extension(Instance: in Vulkan.Instance) is
        generic
            type Pointer(<>) is private;
        procedure Load_Pointer(P: out Pointer; Name: in String);

        procedure Load_Pointer(P: out Pointer; Name: in String) is
            function Get_Pointer is new Core.Get_Proc_Addr(Pointer);
        begin
            P := Get_Pointer(Instance, Name);
        end Load_Pointer;

        procedure Load is new Load_Pointer(vkCmdBindShadingRateImageNV_Access);
        procedure Load is
            new Load_Pointer(vkCmdSetViewportShadingRatePaletteNV_Access);
        procedure Load is new Load_Pointer(vkCmdSetCoarseSampleOrderNV_Access);
    begin
        Load(vkCmdBindShadingRateImageNV, "vkCmdBindShadingRateImageNV");
        Load(vkCmdSetViewportShadingRatePaletteNV,
             "vkCmdSetViewportShadingRatePaletteNV");
        Load(vkCmdSetCoarseSampleOrderNV, "vkCmdSetCoarseSampleOrderNV");
    end Load_Extension;

    procedure Bind(Command_Buffer: in Vulkan.Command_Buffer;
                   Image_View: in Vulkan.Image_View;
                   Image_Layout: in Vulkan.Image_Layout) is
    begin
        vkCmdBindShadingRateImageNV(Command_Buffer, Image_View, Image_Layout);
    end Bind;

    procedure Set_Viewport_Shading_Rate_Palette
        (Command_Buffer: in Vulkan.Command_Buffer;
         First_Viewport: in Interfaces.Unsigned_32;
         Shading_Rate_Palettes: in NV.Shading_Rate_Palette_Vectors.Vector) is
         C_Palettes: array (1 .. Positive(Shading_Rate_Palettes.Length)) of
            aliased NV.Shading_Rate_Palette
            with Convention => C;
    begin
        for X in C_Palettes'Range loop
            C_Palettes(X) := Shading_Rate_Palettes(X);
        end loop;

        vkCmdSetViewportShadingRatePaletteNV(Command_Buffer,
                                             First_Viewport,
                                             C_Palettes'Length,
                                             C_Palettes(1)'Access);
    end Set_Viewport_Shading_Rate_Palette;

    procedure Set_Viewport_Shading_Rate_Palette
        (Command_Buffer: in Vulkan.Command_Buffer;
         First_Viewport: in Interfaces.Unsigned_32;
         Shading_Rate_Palette: in NV.Shading_Rate_Palette) is
    begin
        Set_Viewport_Shading_Rate_Palette
            (Command_Buffer,
             First_Viewport,
             NV.Shading_Rate_Palette_Vectors.To_Vector
                 (Shading_Rate_Palette, 1));
    end Set_Viewport_Shading_Rate_Palette;

    procedure Set_Coarse_Sample_Order
        (Command_Buffer: in Vulkan.Command_Buffer;
         Sampler_Order_Type: in NV.Coarse_Sample_Order_Type;
         Custom_Sample_Orders: in
            NV.Coarse_Sample_Order_Custom_Vectors.Vector) is
        C_Samples: array (1 .. Positive(Custom_Sample_Orders.Length)) of
            aliased C_NV.Coarse_Sample_Order_Custom_C;
    begin
        for X in C_Samples'Range loop
            C_Samples(X) := C_NV.To_C(Custom_Sample_Orders(X));
        end loop;

        vkCmdSetCoarseSampleOrderNV(Command_Buffer,
                                    Sampler_Order_Type,
                                    C_Samples'Length,
                                    C_Samples(1)'Access);

        for Sample of C_Samples loop
            C_NV.Free(Sample);
        end loop;
    end Set_Coarse_Sample_Order;

    procedure Set_Coarse_Sample_Order
        (Command_Buffer: in Vulkan.Command_Buffer;
         Sampler_Order_Type: in NV.Coarse_Sample_Order_Type;
         Custom_Sample_Order: in NV.Coarse_Sample_Order_Custom) is
    begin
        Set_Coarse_Sample_Order
            (Command_Buffer,
             Sampler_Order_Type,
             NV.Coarse_Sample_Order_Custom_Vectors.To_Vector
                 (Custom_Sample_Order, 1));
    end Set_Coarse_Sample_Order;

    procedure Set_Coarse_Sample_Order
        (Command_Buffer: in Vulkan.Command_Buffer;
         Sampler_Order_Type: in NV.Coarse_Sample_Order_Type) is
    begin
        vkCmdSetCoarseSampleOrderNV(Command_Buffer,
                                    Sampler_Order_Type,
                                    0,
                                    null);
    end Set_Coarse_Sample_Order;
end Vulkan.Extensions.NV_Shading_Rate_Image;

