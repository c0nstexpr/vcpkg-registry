vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO BlurringShadow/stdsharp
    REF 0.2.0
    SHA512 338c12aae8feea637785ed3611246f70e4d2f33ed296b85e4eae1443946fa7d8a2f847e67a728d502c1653f817600d2935394e2a9c0f83a700c1fd7fbd1b43e8
    HEAD_REF main
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/.github")

foreach(path IN $ENV{PATH})
    vcpkg_add_to_path("${path}")
endforeach()

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" PREFER_NINJA)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
	INSTALL "${SOURCE_PATH}/LICENSE"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
	RENAME copyright
)
