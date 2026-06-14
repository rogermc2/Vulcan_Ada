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

-- Constant extension names

package Vulkan.Extensions is
    Surface: constant String := "VK_KHR_surface";
    Swapchain: constant String := "VK_KHR_swapchain";
    Display: constant String := "VK_KHR_display";
    Display_Swapchain: constant String := "VK_KHR_display_swapchain";
    Video_Queue: constant String := "VK_KHR_video_queue";
    Video_Codec_H264_Encode: constant String :=
        "VK_STD_vulkan_video_codec_h264_encode";
    Video_Codec_H265_Encode: constant String :=
        "VK_STD_vulkan_video_codec_h265_encode";
    Video_Encode_H264: constant String := "VK_KHR_video_encode_h264";
    Video_Encode_H265: constant String := "VK_KHR_video_encode_h265";
    Video_Decode_Queue: constant String := "VK_KHR_video_decode_queue";
    Video_Codec_H264_Decode: constant String :=
        "VK_STD_vulkan_video_codec_h264_decode";
    Video_Decode_H264: constant String := "VK_KHR_video_decode_h264";
    External_Memory_FD: constant String := "VK_KHR_external_memory_fd";
    External_Semaphore_FD: constant String := "VK_KHR_external_semaphore_fd";
    Incremental_Present: constant String := "VK_KHR_incremental_present";
    Shared_Presentable_Image: constant String :=
        "VK_KHR_shared_presentable_image";
    External_Fence_FD: constant String := "VK_KHR_external_fence_fd";
    Performance_Query: constant String := "VK_KHR_performance_query";
    Get_Surface_Capabilities_2: constant String :=
        "VK_KHR_get_surface_capabilities2";
    Get_Display_Properties_2: constant String :=
        "VK_KHR_get_display_properties2";
    Shader_Clock: constant String := "VK_KHR_shader_clock";
    Video_Codec_H265_Decode: constant String :=
        "VK_STD_vulkan_video_codec_h265_decode";
    Video_Decode_H265: constant String := "VK_KHR_video_decode_h265";
    Swapchain_Mutable_Format: constant String :=
        "VK_KHR_swapchain_mutable_format";
    Fragment_Shading_Rate: constant String := "VK_KHR_fragment_shading_rate";
    Shader_Quad_Control: constant String := "VK_KHR_shader_quad_control";
    Surface_Protected_Capabilities: constant String :=
        "VK_KHR_surface_protected_capabilities";
    Present_Wait: constant String := "VK_KHR_present_wait";
    Deferred_Host_Operations: constant String :=
        "VK_KHR_deferred_host_operations";
    Pipeline_Executable_Properties: constant String :=
        "VK_KHR_pipeline_executable_properties";
    Pipeline_Library: constant String := "VK_KHR_pipeline_library";
    Present_ID: constant String := "VK_KHR_present_id";
    Video_Encode_Queue: constant String := "VK_KHR_video_encode_queue";
    Fragment_Shader_Barycentric: constant String :=
        "VK_KHR_fragment_shader_barycentric";
    Shader_Subgroup_Uniform_Control_Flow: constant String :=
        "VK_KHR_shader_subgroup_uniform_control_flow";
    Workgroup_Memory_Explicit_Layout: constant String :=
        "VK_KHR_workgroup_memory_explicit_layout";
    Ray_Tracing_Maintenance_1: constant String :=
        "VK_KHR_ray_tracing_maintenance1";
    Portability_Enumeration: constant String :=
        "VK_KHR_portability_enumeration";
    Shader_Maximal_Reconvergence: constant String :=
        "VK_KHR_shader_maximal_reconvergence";
    Ray_Tracing_Position_Fetch: constant String :=
        "VK_KHR_ray_tracing_position_fetch";
    Pipeline_Binary: constant String := "VK_KHR_pipeline_binary";
    Cooperative_Matrix: constant String := "VK_KHR_cooperative_matrix";
    Compute_Shader_Derivatives: constant String :=
        "VK_KHR_compute_shader_derivatives";
    Codec_AV1_Decode: constant String := "VK_STD_vulkan_video_codec_av1_decode";
    Video_Decode_AV1: constant String := "VK_KHR_video_decode_av1";
    Codec_AV1_Encode: constant String := "VK_STD_vulkan_video_codec_av1_encode";
    Video_Encode_AV1: constant String := "VK_KHR_video_encode_av1";
    Video_Maintenance_1: constant String := "VK_KHR_video_maintenance1";
    Calibrated_Timestamps: constant String := "VK_KHR_calibrated_timestamps";
    Video_Encode_Quantization_Map: constant String :=
        "VK_KHR_video_encode_quantization_map";
    Shader_Relaxed_Extended_Instruction: constant String :=
        "VK_KHR_shader_relaxed_extended_instruction";
    Maintenance_7: constant String := "VK_KHR_maintenance7";
    Maintenance_8: constant String := "VK_KHR_maintenance8";
    Video_Maintenance_2: constant String := "VK_KHR_video_maintenance2";
    Depth_Clamp_Zero_One: constant String := "VK_KHR_depth_clamp_zero_one";
    Depth_Range_Unrestricted: constant String :=
        "VK_EXT_depth_range_unrestricted";
    Filter_Cubic: constant String := "VK_IMG_filter_cubic";
    Rasterization_Order: constant String := "VK_AMD_rasterization_order";
    Shader_Trinary_Minmax: constant String := "VK_AMD_shader_trinary_minmax";
    Shader_Explicit_Vertex_Parameter: constant String :=
        "VK_AMD_shader_explicit_vertex_parameter";
    GCN_Shader: constant String := "VK_AMD_gcn_shader";
    Transform_Feedback: constant String := "VK_EXT_transform_feedback";
    Binary_Import: constant String := "VK_NVX_binary_import";
    Image_View_Handle: constant String := "VK_NVX_image_view_handle";
    Shader_Ballot: constant String := "VK_AMD_shader_ballot";
    Texture_Gather_Bias_LOD: constant String :=
        "VK_AMD_texture_gather_bias_lod";
    Shader_Info: constant String := "VK_AMD_shader_info";
    Shader_Image_Load_Store_LOD: constant String :=
        "VK_AMD_shader_image_load_store_lod";
    Corner_Sampled_Image: constant String := "VK_NV_corner_sampled_image";
    ASTC_Decode_Mode: constant String := "VK_EXT_astc_decode_mode";
    Conditional_Rendering: constant String := "VK_EXT_conditional_rendering";
    Clip_Space_W_Scaling: constant String := "VK_NV_clip_space_w_scaling";
    Direct_Mode_Display: constant String := "VK_EXT_direct_mode_display";
    Display_Surface_Counter: constant String :=
        "VK_EXT_display_surface_counter";
    Display_Control: constant String := "VK_EXT_display_control";
    Display_Timing: constant String := "VK_GOOGLE_display_timing";
    Sample_Mask_Override_Coverage: constant String :=
        "VK_NV_sample_mask_override_coverage";
    Geometry_Shader_Passthrough: constant String :=
        "VK_NV_geometry_shader_passthrough";
    Viewporit_Array_2: constant String := "VK_NV_viewport_array2";
    Multiview_Per_View_Attributes: constant String :=
        "VK_NVX_multiview_per_view_attributes";
    Viewport_Swizzle: constant String := "VK_NV_viewport_swizzle";
    Discard_Rectangles: constant String := "VK_EXT_discard_rectangles";
    Conservative_Rasterization: constant String :=
        "VK_EXT_conservative_rasterization";
    Depth_Clip_Enable: constant String := "VK_EXT_depth_clip_enable";
    Swapchain_Colorspace: constant String := "VK_EXT_swapchain_colorspace";
    HDR_Metadata: constant String := "VK_EXT_hdr_metadata";
    Relaxed_Line_Rasterization: constant String :=
        "VK_IMG_relaxed_line_rasterization";
    External_Memory_DMA_Buf: constant String :=
        "VK_EXT_external_memory_dma_buf";
    Queue_Family_Foreign: constant String := "VK_EXT_queue_family_foreign";
    Debug_Utils: constant String := "VK_EXT_debug_utils";
    Mixed_Attachment_Samples: constant String :=
        "VK_AMD_mixed_attachment_samples";
    Shader_Fragment_Mask: constant String := "VK_AMD_shader_fragment_mask";
    Shader_Stencil_Export: constant String := "VK_EXT_shader_stencil_export";
    Sample_Locations: constant String := "VK_EXT_sample_locations";
    Blend_Operation_Advanced: constant String :=
        "VK_EXT_blend_operation_advanced";
    Fragment_Coverage_To_Color: constant String :=
        "VK_NV_fragment_coverage_to_color";
    Framebuffer_Mixed_Samples: constant String :=
        "VK_NV_framebuffer_mixed_samples";
    Fill_Rectangle: constant String := "VK_NV_fill_rectangle";
    Shader_SM_Builtins: constant String := "VK_NV_shader_sm_builtins";
    Post_Depth_Coverage: constant String := "VK_EXT_post_depth_coverage";
    Image_DRM_Format_Modifier: constant String :=
        "VK_EXT_image_drm_format_modifier";
    Validation_Cache: constant String := "VK_EXT_validation_cache";
    Shading_Rate_Image: constant String := "VK_NV_shading_rate_image";
    Representative_Fragment_Test: constant String :=
        "VK_NV_representative_fragment_test";
    Filter_Cubic_EXT: constant String := "VK_EXT_filter_cubic";
    Render_Pass_Shader_Resolve: constant String :=
        "VK_QCOM_render_pass_shader_resolve";
    External_Memory_Host: constant String := "VK_EXT_external_memory_host";
    Buffer_Marker: constant String := "VK_AMD_buffer_marker";
    Shader_Core_Properties: constant String := "VK_AMD_shader_core_properties";
    Memory_Overallocation_Behavior: constant String :=
        "VK_AMD_memory_overallocation_behavior";
    Shader_Subgroup_Partitioned: constant String :=
        "VK_NV_shader_subgroup_partitioned";
    Mesh_Shader: constant String := "VK_NV_mesh_shader";
    Shader_Image_Footprint: constant String := "VK_NV_shader_image_footprint";
    Scissor_Exclusive: constant String := "VK_NV_scissor_exclusive";
    Device_Diagnostics_Checkpoints: constant String :=
        "VK_NV_device_diagnostic_checkpoints";
    Shader_Integer_Functions_2: constant String :=
        "VK_INTEL_shader_integer_functions2";
    Performance_Query_INTEL: constant String := "VK_INTEL_performance_query";
    PCI_Bus_Info: constant String := "VK_EXT_pci_bus_info";
    Display_Native_HDR: constant String := "VK_AMD_display_native_hdr";
    Fragment_Density_Map: constant String := "VK_EXT_fragment_density_map";
    HLSL_Functionality_1: constant String := "VK_GOOGLE_hlsl_functionality1";
    Decorate_String: constant String := "VK_GOOGLE_decorate_string";
    Shader_Core_Properties_2: constant String :=
        "VK_AMD_shader_core_properties2";
    Device_Coherent_Memory: constant String := "VK_AMD_device_coherent_memory";
    Shader_Image_Atomic_Int64: constant String :=
        "VK_EXT_shader_image_atomic_int64";
    Memory_Budget: constant String := "VK_EXT_memory_budget";
    Memory_Priority: constant String := "VK_EXT_memory_priority";
    Dedicated_Allocation_Image_Aliasing: constant String :=
        "VK_NV_dedicated_allocation_image_aliasing";
    Cooperative_Matrix_NV: constant String := "VK_NV_cooperative_matrix";
    Coverage_Reduction_Mode: constant String := "VK_NV_coverage_reduction_mode";
    Fragment_Shader_Interlock: constant String :=
        "VK_EXT_fragment_shader_interlock";
    YCbCr_Image_Arrays: constant String := "VK_EXT_ycbcr_image_arrays";
    Provoking_Vertex: constant String := "VK_EXT_provoking_vertex";
    Headless_Surface: constant String := "VK_EXT_headless_surface";
    Shader_Atomic_Float: constant String := "VK_EXT_shader_atomic_float";
    Map_Memory_Placed: constant String := "VK_EXT_map_memory_placed";
    Shader_Atomic_Float_2: constant String := "VK_EXT_shader_atomic_float2";
    Device_Generated_Commands: constant String :=
        "VK_NV_device_generated_commands";
    Inherited_Viewport_Scissor: constant String :=
        "VK_NV_inherited_viewport_scissor";
    Render_Pass_Transform: constant String := "VK_QCOM_render_pass_transform";
    Depth_Bias_Control: constant String := "VK_EXT_depth_bias_control";
    Device_Memory_Report: constant String := "VK_EXT_device_memory_report";
    Acquire_DRM_Display: constant String := "VK_EXT_acquire_drm_display";
    Custom_Border_Color: constant String := "VK_EXT_custom_border_color";
    User_Type: constant String := "VK_GOOGLE_user_type";
    Present_Barrier: constant String := "VK_NV_present_barrier";
    Device_Diagnostics_Config: constant String :=
        "VK_NV_device_diagnostics_config";
    Render_Pass_Store_Ops: constant String := "VK_QCOM_render_pass_store_ops";
    CUDA_Kernal_Launch: constant String := "VK_NV_cuda_kernel_launch";
    Tile_Shading: constant String := "VK_QCOM_tile_shading";
    Low_Latency: constant String := "VK_NV_low_latency";
    Descriptor_Buffer: constant String := "VK_EXT_descriptor_buffer";
    Graphics_Pipeline_Library: constant String :=
        "VK_EXT_graphics_pipeline_library";
    Shader_Early_And_Late_Fragment_Tests: constant String :=
        "VK_AMD_shader_early_and_late_fragment_tests";
    Fragment_Shading_Rate_Enums: constant String :=
        "VK_NV_fragment_shading_rate_enums";
    Ray_Tracing_Motion_Blur: constant String := "VK_NV_ray_tracing_motion_blur";
    Fragment_Density_Map_2: constant String := "VK_EXT_fragment_density_map2";
    Rotated_Copy_Commands: constant String := "VK_QCOM_rotated_copy_commands";
    Image_Compression_Control: constant String :=
        "VK_EXT_image_compression_control";
    Attachment_Feedback_Loop_Layout: constant String :=
        "VK_EXT_attachment_feedback_loop_layout";
    Device_Fault: constant String := "VK_EXT_device_fault";
    RGBA_10x6_Formats: constant String := "VK_EXT_rgab10x6_formats";
    Vertex_Input_Dynamic_State: constant String :=
        "VK_EXT_vertex_input_dynamic_state";
    Device_Address_Binding_Report: constant String :=
        "VK_EXT_device_address_binding_report";
    Physical_Device_DMR: constant String := "VK_EXT_physical_device_drm";
    Depth_Clip_Control: constant String := "VK_EXT_depth_clip_control";
    Primitive_Topology_List_Restart: constant String :=
        "VK_EXT_primitive_topology_list_restart";
    Subpass_Shading: constant String := "VK_HUAWEI_subpass_shading";
    Invocation_Mask: constant String := "VK_HUAWEI_invocation_mask";
    External_Memory_RDMA: constant String := "VK_NV_external_memory_rdma";
    Pipeline_Properties: constant String := "VK_EXT_pipeline_properties";
    Frame_Boundary: constant String := "VK_EXT_frame_boundary";
    Multisampled_Render_To_Single_Sampled: constant String :=
        "VK_EXT_multisampled_render_to_single_sampled";
    Color_Write_Enable: constant String := "VK_EXT_color_write_enable";
    Primitives_Generated_Query: constant String :=
        "VK_EXT_primitives_generated_query";
    Image_View_Min_LOD: constant String := "VK_EXT_image_view_min_lod";
    Multi_Draw: constant String := "VK_EXT_multi_draw";
    Image_2D_View_Of_3D: constant String := "VK_EXT_image_2d_view_of_3d";
    Shader_Tile_Image: constant String := "VK_EXT_shader_tile_image";
    Opacity_Micromap: constant String := "VK_EXT_opacity_micromap";
    -- Platform specific extensions.
    Xlib_Surface: constant String := "VK_KHR_xlib_surface";
    Xcb_Surface: constant String := "VK_KHR_xcb_surface";
    Wayland_Surface: constant String := "VK_KHR_wayland_surface";
    Android_Surface: constant String := "VK_KHR_android_surface";
    Win32_Surface: constant String := "VK_KHR_win32_surface";
    Metal_Surface: constant String := "VK_EXT_metal_surface";
end Vulkan.Extensions;

