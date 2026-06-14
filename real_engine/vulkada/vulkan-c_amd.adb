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

-- C interface for AMD records

with Ada.Unchecked_Conversion;
with Vulkan.Extension_Records;
with Vulkan.Utilities;

package body Vulkan.C_AMD is
    function To_C(Struct: in Extensions.AMD.Attachment_Sample_Count_Info)
        return Attachment_Sample_Count_Info_C is
        procedure To_C_Array is new Utilities.To_C_Array
            (Sample_Count_Flags_Arrays,
             Extensions.AMD.Sample_Count_Flags_Vectors);

        ASCIC: Attachment_Sample_Count_Info_C;
    begin
        ASCIC.Next := Extension_Records.To_C(Struct.Next);
        To_C_Array(ASCIC.Color_Attachment_Count,
                   Struct.Color_Attachment_Samples,
                   ASCIC.Color_Attachment_Samples);
        ASCIC.Depth_Stencil_Attachment_Samples :=
            Struct.Depth_Stencil_Attachment_Samples;

        return ASCIC;
    end To_C;

    procedure Free(Struct: in out Attachment_Sample_Count_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
        Sample_Count_Flags_Arrays.Free(Struct.Color_Attachment_Samples);
    end Free;

    function To_C
        (Struct:
            in Extensions.AMD.Pipeline_Rasterization_State_Rasterization_Order)
        return Pipeline_Rasterization_State_Rasterization_Order_C is
        PRSROC: Pipeline_Rasterization_State_Rasterization_Order_C;
    begin
        PRSROC.Next := Extension_Records.To_C(Struct.Next);
        PRSROC.Rasterization_Order := Struct.Rasterization_Order;

        return PRSROC;
    end To_C;

    procedure Free
        (Struct: in out Pipeline_Rasterization_State_Rasterization_Order_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out Extensions.AMD.Texture_LOD_Gather_Format_Properties;
         C_Struct: in Texture_LOD_Gather_Format_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Supports_Texture_Gather_LOD_Bias :=
            Utilities.To_Ada(C_Struct.Supports_Texture_Gather_LOD_Bias);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.AMD.Physical_Device_Shader_Core_Properties;
         C_Struct: in Physical_Device_Shader_Core_Properties_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Shader_Engine_Count := C_Struct.Shader_Engine_Count;
        Ada_Struct.Shader_Arrays_Per_Engine_Count :=
            C_Struct.Shader_Arrays_Per_Engine_Count;
        Ada_Struct.Compute_Units_Per_Shader_Array :=
            C_Struct.Compute_Units_Per_Shader_Array;
        Ada_Struct.SIMD_Per_Compute_Unit := C_Struct.SIMD_Per_Compute_Unit;
        Ada_Struct.Wave_Fronts_Per_SIMD := C_Struct.Wave_Fronts_Per_SIMD;
        Ada_Struct.Wave_Front_Size := C_Struct.Wave_Front_Size;
        Ada_Struct.SGPRs_Per_SIMD := C_Struct.SGPRs_Per_SIMD;
        Ada_Struct.Min_SGPR_Allocation := C_Struct.Min_SGPR_Allocation;
        Ada_Struct.Max_SGPR_Allocation := C_Struct.Max_SGPR_Allocation;
        Ada_Struct.SGPR_Allocation_Granularity :=
            C_Struct.SGPR_Allocation_Granularity;
        Ada_Struct.VGPRs_Per_SIMD := C_Struct.VGPRs_Per_SIMD;
        Ada_Struct.Min_VGPR_Allocation := C_Struct.Min_VGPR_Allocation;
        Ada_Struct.Max_VGPR_Allocation := C_Struct.Max_VGPR_Allocation;
        Ada_Struct.VGPR_Allocation_Granularity :=
            C_Struct.VGPR_Allocation_Granularity;
    end To_Ada;

    function To_C
        (Struct: in Extensions.AMD.Device_Memory_Overallocation_Create_Info)
        return Device_Memory_Overallocation_Create_Info_C is
        DMOCIC: Device_Memory_Overallocation_Create_Info_C;
    begin
        DMOCIC.Next := Extension_Records.To_C(Struct.Next);
        DMOCIC.Overallocation_Behavior := Struct.Overallocation_Behavior;

        return DMOCIC;
    end To_C;

    procedure Free(Struct: in out Device_Memory_Overallocation_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.AMD.Display_Native_HDR_Surface_Capabilities;
         C_Struct: in Display_Native_HDR_Surface_Capabilities_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Local_Dimming_Support :=
            Utilities.To_Ada(C_Struct.Local_Dimming_Support);
    end To_Ada;

    function To_C
        (Struct: in Extensions.AMD.Swapchain_Display_Native_HDR_Create_Info)
        return Swapchain_Display_Native_HDR_Create_Info_C is
        SDNHCIC: Swapchain_Display_Native_HDR_Create_Info_C;
    begin
        SDNHCIC.Next := Extension_Records.To_C(Struct.Next);
        SDNHCIC.Local_Dimming_Enable :=
            Utilities.To_C(Struct.Local_Dimming_Enable);

        return SDNHCIC;
    end To_C;

    procedure Free(Struct: in out Swapchain_Display_Native_HDR_Create_Info_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.AMD.Physical_Device_Shader_Core_Properties_2;
         C_Struct: in Physical_Device_Shader_Core_Properties_2_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Shader_Core_Features := C_Struct.Shader_Core_Features;
        Ada_Struct.Active_Compute_Unit_Count :=
            C_Struct.Active_Compute_Unit_Count;
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
            Extensions.AMD.Physical_Device_Coherent_Memory_Features;
         C_Struct: in Physical_Device_Coherent_Memory_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Device_Coherent_Memory :=
            Utilities.To_Ada(C_Struct.Device_Coherent_Memory);
    end To_Ada;

    procedure To_Ada
        (Ada_Struct: in out
   Extensions.AMD.Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features;
         C_Struct: in
            Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_C) is
    begin
        Extension_Records.To_Ada(Ada_Struct.Next, C_Struct.Next);
        Ada_Struct.Shader_Early_And_Late_Fragment_Tests :=
            Utilities.To_Ada(C_Struct.Shader_Early_And_Late_Fragment_Tests);
    end To_Ada;

    function To_C(Next: in In_Structure_Access)
        return C.In_Structure_C_Access is
    begin
        if Next = null then
            return null;
        end if;

        case In_Structure(Next.Record_Type) is
            when Attachment_Sample_Count_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (Extensions.AMD.Attachment_Sample_Count_Info,
                         Attachment_Sample_Count_Info_C,
                         Attachment_Sample_Count_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Pipeline_Rasterization_State_Rasterization_Order_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
               (Extensions.AMD.Pipeline_Rasterization_State_Rasterization_Order,
                Pipeline_Rasterization_State_Rasterization_Order_C,
                Pipeline_Rasterization_State_Rasterization_Order_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Device_Memory_Overallocation_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                       (Extensions.AMD.Device_Memory_Overallocation_Create_Info,
                        Device_Memory_Overallocation_Create_Info_C,
                        Device_Memory_Overallocation_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Swapchain_Display_Native_HDR_Create_Info_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                       (Extensions.AMD.Swapchain_Display_Native_HDR_Create_Info,
                        Swapchain_Display_Native_HDR_Create_Info_C,
                        Swapchain_Display_Native_HDR_Create_Info_C_Access);
                begin
                    return Make_Struct(Next);
                end;
        end case;
    end To_C;

    function To_C(Next: in Out_Structure_Access)
        return C.Out_Structure_C_Access is
    begin
        if Next = null then
            return null;
        end if;

        case Out_Structure(Next.Record_Type) is
            when Texture_LOD_Gather_Format_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.AMD.Texture_LOD_Gather_Format_Properties,
                         Texture_LOD_Gather_Format_Properties_C,
                         Texture_LOD_Gather_Format_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Shader_Core_Properties_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.AMD.Physical_Device_Shader_Core_Properties,
                         Physical_Device_Shader_Core_Properties_C,
                         Physical_Device_Shader_Core_Properties_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Display_Native_HDR_Surface_Capabilities_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                        (Extensions.AMD.Display_Native_HDR_Surface_Capabilities,
                         Display_Native_HDR_Surface_Capabilities_C,
                         Display_Native_HDR_Surface_Capabilities_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Shader_Core_Properties_2_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                       (Extensions.AMD.Physical_Device_Shader_Core_Properties_2,
                        Physical_Device_Shader_Core_Properties_2_C,
                        Physical_Device_Shader_Core_Properties_2_C_Access);
                begin
                    return Make_Struct(Next);
                end;
            when Physical_Device_Coherent_Memory_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
                       (Extensions.AMD.Physical_Device_Coherent_Memory_Features,
                        Physical_Device_Coherent_Memory_Features_C,
                        Physical_Device_Coherent_Memory_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
      when Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_Type =>
                declare
                    function Make_Struct is new Utilities.Make_Out_Struct
  (Extensions.AMD.Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features,
   Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_C,
   Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_C_Access);
                begin
                    return Make_Struct(Next);
                end;
        end case;
    end To_C;

    procedure To_Ada(Ada_Struct: in out Vulkan.Out_Structure'Class;
                     Next: in C.Out_Structure_C_Access) is
    begin
        case Out_Structure(Ada_Struct.Record_Type) is
            when Texture_LOD_Gather_Format_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Texture_LOD_Gather_Format_Properties_C_Access);
                begin
                    To_Ada(Extensions.AMD.Texture_LOD_Gather_Format_Properties
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Physical_Device_Shader_Core_Properties_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Shader_Core_Properties_C_Access);
                begin
                    To_Ada(Extensions.AMD.Physical_Device_Shader_Core_Properties
                            (Ada_Struct),
                           To_Access(Next).all);
                end;
            when Display_Native_HDR_Surface_Capabilities_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Display_Native_HDR_Surface_Capabilities_C_Access);
                begin
                   To_Ada(Extensions.AMD.Display_Native_HDR_Surface_Capabilities
                            (Ada_Struct),
                          To_Access(Next).all);
                end;
            when Physical_Device_Shader_Core_Properties_2_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Shader_Core_Properties_2_C_Access);
                begin
                  To_Ada(Extensions.AMD.Physical_Device_Shader_Core_Properties_2
                           (Ada_Struct),
                         To_Access(Next).all);
                end;
            when Physical_Device_Coherent_Memory_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
                        (C.Out_Structure_C_Access,
                         Physical_Device_Coherent_Memory_Features_C_Access);
                begin
                  To_Ada(Extensions.AMD.Physical_Device_Coherent_Memory_Features
                           (Ada_Struct),
                         To_Access(Next).all);
                end;
      when Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_Type =>
                declare
                    function To_Access is new Ada.Unchecked_Conversion
       (C.Out_Structure_C_Access,
        Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_C_Access);
                begin
                  To_Ada
   (Extensions.AMD.Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features
       (Ada_Struct),
    To_Access(Next).all);
                end;
        end case;
    end To_Ada;

    procedure Free(Next: in out C.In_Structure_C_Access) is
        use type C.In_Structure_C_Access;
    begin
        if Next = null then
            return;
        end if;

        case In_Structure(Next.Record_Type) is
            when Attachment_Sample_Count_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Attachment_Sample_Count_Info_C,
                         Attachment_Sample_Count_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Pipeline_Rasterization_State_Rasterization_Order_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                    (Pipeline_Rasterization_State_Rasterization_Order_C,
                     Pipeline_Rasterization_State_Rasterization_Order_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Device_Memory_Overallocation_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Device_Memory_Overallocation_Create_Info_C,
                         Device_Memory_Overallocation_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Swapchain_Display_Native_HDR_Create_Info_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Swapchain_Display_Native_HDR_Create_Info_C,
                         Swapchain_Display_Native_HDR_Create_Info_C_Access);
                begin
                    Free_Struct(Next);
                end;
        end case;
    end Free;

    procedure Free(Next: in out C.Out_Structure_C_Access) is
        use type C.Out_Structure_C_Access;
    begin
        if Next = null then
            return;
        end if;

        case Out_Structure(Next.Record_Type) is
            when Texture_LOD_Gather_Format_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Texture_LOD_Gather_Format_Properties_C,
                         Texture_LOD_Gather_Format_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Shader_Core_Properties_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Shader_Core_Properties_C,
                         Physical_Device_Shader_Core_Properties_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Display_Native_HDR_Surface_Capabilities_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Display_Native_HDR_Surface_Capabilities_C,
                         Display_Native_HDR_Surface_Capabilities_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Shader_Core_Properties_2_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Shader_Core_Properties_2_C,
                         Physical_Device_Shader_Core_Properties_2_C_Access);
                begin
                    Free_Struct(Next);
                end;
            when Physical_Device_Coherent_Memory_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
                        (Physical_Device_Coherent_Memory_Features_C,
                         Physical_Device_Coherent_Memory_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
      when Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_Out_Struct
       (Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_C,
        Physical_Device_Shader_Early_And_Late_Fragment_Tests_Features_C_Access);
                begin
                    Free_Struct(Next);
                end;
        end case;
    end Free;
end Vulkan.C_AMD;

