set(ver 0.4.2)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO BlurringShadow/stdsharp
    REF ${ver}
    SHA512 affe58aec5b94c1e20a8d86c2ebffdbe8ad03bba5eb59423ef2f8036dcf4a3f4430f4690c3f795ed52c7eeb283e603d05c56f3f57f3569757bcdbab707508244
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
