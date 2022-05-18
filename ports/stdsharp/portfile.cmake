set(ver 0.2.4)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO BlurringShadow/stdsharp
    REF ${ver}
    SHA512 ff88a4476f0a462123138eca8c561480a575a4a98cb7b96f6792868d259a6fbc77f8b6fec2e28459a2f6111f3b9cb3c0b0cc74ffb30ecd2cd8b822ed60ce2e58
    HEAD_REF main
)

vcpkg_find_acquire_program(GIT)
get_filename_component(GIT_DIR "${GIT}" DIRECTORY)
vcpkg_add_to_path("${GIT_DIR}")

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" OPTIONS "-DSTDSHARP_BUILD_TEST=OFF")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/stdsharp-${ver})

file(
    REMOVE_RECURSE
        # interface only
        "${CURRENT_PACKAGES_DIR}/debug"
        "${CURRENT_PACKAGES_DIR}/lib"
)

file(
	INSTALL "${SOURCE_PATH}/LICENSE"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
	RENAME copyright
)
