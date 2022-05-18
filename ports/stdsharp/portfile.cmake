set(ver 0.2.3)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO BlurringShadow/stdsharp
    REF ${ver}
    SHA512 09da7ac43655af72df666231ba62a6cb83c1cc1189b77c92c3d1cba53ff4fba64ef37505e6237508097fca0f6fb0167d158a2785f51888e6ebfdef55080c9a59
    HEAD_REF main
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/.github")

vcpkg_find_acquire_program(GIT)
get_filename_component(GIT_DIR "${GIT}" DIRECTORY)
vcpkg_add_to_path("${GIT_DIR}")

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" PREFER_NINJA OPTIONS "-DSTDSHARP_BUILD_TEST=OFF")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/stdsharp-${ver})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
	INSTALL "${SOURCE_PATH}/LICENSE"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
	RENAME copyright
)
