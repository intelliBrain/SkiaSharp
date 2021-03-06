
include jni/skia_prebuilt.mk

include $(CLEAR_VARS)

cmd-strip = $(PRIVATE_STRIP) --strip-all $(call host-path,$1)

LOCAL_WHOLE_STATIC_LIBRARIES := libskia_core

LOCAL_STATIC_LIBRARIES := libcpu_features \
                          libskia_ports \
                          libskia_effects \
                          libskia_skgpu \
                          libsksl \
                          libskia_codec \
                          libskia_opts \
                          libskia_opts_avx \
                          libskia_opts_ssse3 \
                          libskia_opts_sse41 \
                          libskia_opts_neon \
                          libskia_opts_crc32 \
                          libskia_opts_sse42 \
                          libskia_opts_hsw \
                          libskia_pdf \
                          libskia_svg \
                          libskia_xml \
                          libskia_utils \
                          libskia_images \
                          libskia_sfnt \
                          libraw_codec \
                          libfreetype_static \
                          libSkKTX \
                          libpiex \
                          libdng_sdk \
                          libpng_static \
                          libpng_static_neon \
                          libjpeg-turbo \
                          libwebp_enc \
                          libwebp_dec \
                          libwebp_dsp \
                          libwebp_utils \
                          libwebp_demux \
                          libwebp_dsp_enc \
                          libwebp_dsp_neon \
                          libzlib \
                          libexpat_static \
                          libetc1 \
                          libskia_core 

LOCAL_LDLIBS           := -llog -lEGL -lGLESv2

LOCAL_LDFLAGS          := -s -Wl,--gc-sections

LOCAL_MODULE           := SkiaSharp

LOCAL_C_INCLUDES       := ../../externals/skia/src/c           \
                          ../../externals/skia/include/c       \
                          ../../externals/skia/include/core    \
                          ../../externals/skia/include/codec   \
                          ../../externals/skia/include/effects \
                          ../../externals/skia/include/pathops \
                          ../../externals/skia/include/gpu     \
                          ../../externals/skia/include/config  \
                          ../../externals/skia/include/xml     \
                          ../../externals/skia/include/svg     \
                          ../../externals/skia/include/utils   \
                          ../../externals/skia/include/images

LOCAL_CFLAGS           := -DSK_INTERNAL -DSK_GAMMA_APPLY_TO_A8                                   \
                          -DSK_ALLOW_STATIC_GLOBAL_INITIALIZERS=0 -DSK_SUPPORT_GPU=1             \
                          -DSK_SUPPORT_OPENCL=0 -DSK_FORCE_DISTANCE_FIELD_TEXT=0                 \
                          -DSK_BUILD_FOR_ANDROID -DSK_GAMMA_EXPONENT=1.4 -DSK_GAMMA_CONTRAST=0.0 \
                          -DSKIA_C_DLL -DSKIA_IMPLEMENTATION=1                                   \
                          -DSK_SUPPORT_LEGACY_CLIPTOLAYERFLAG -DNDEBUG

LOCAL_CFLAGS           += -fPIC -g -fno-exceptions -fstrict-aliasing -Wall -Wextra               \
                          -Winit-self -Wpointer-arith -Wsign-compare -Wno-unused-parameter       \
                          -Werror -fuse-ld=gold                                                  \
                          -Os -ffunction-sections -fdata-sections -fno-rtti

LOCAL_CPPFLAGS         := -std=c++11 -fno-rtti -fno-threadsafe-statics -Wnon-virtual-dtor        \
                          -Os -ffunction-sections -fdata-sections

LOCAL_SRC_FILES        := ../../src/sk_xamarin.cpp               \
                          ../../src/SkiaKeeper.c                 \
                          ../../src/sk_managedstream.cpp         \
                          ../../src/SkManagedStream.cpp

include $(BUILD_SHARED_LIBRARY)



