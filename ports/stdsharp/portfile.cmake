set(ver 0.4.2)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO BlurringShadow/stdsharp
    REF ${ver}
    SHA512 afcfa302ffa9d74682e14f849cb7c6b35260140e9acc8eed294026ff522f516b467fbf41c09e8c40a72a00bb916878b80c30a2672c322c6c46204c236bc89892
    HEAD_REF main
)

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
