set(ver 0.2.6)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO BlurringShadow/stdsharp
    REF ${ver}
    SHA512 ea54b93938c8047774917c41678280e5be96351670a7449fd5ab6b50e19696113ca8dc88eae9f19395e8b6074e05fb8386f60bce5d717fb9a346ad8957e456ea
    HEAD_REF main
)

vcpkg_find_acquire_program(GIT)
get_filename_component(GIT_DIR "${GIT}" DIRECTORY)
vcpkg_add_to_path("${GIT_DIR}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DSTDSHARP_BUILD_TEST=OFF
        -DSTDSHARP_INCLUDE_AS_SYSTEM=OFF
)
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
