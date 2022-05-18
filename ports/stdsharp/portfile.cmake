set(ver 0.2.5)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO BlurringShadow/stdsharp
    REF ${ver}
    SHA512 e8ac62020fb20bd2d58db3f10d0627b859d23f8ff697993d9c2fb677de1bbb5c77bca683b49a43692ba434e07fb611a26cefa5b18dc843eb8e5226238b1a9436
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
