vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO BlurringShadow/stdsharp
    REF 0.1.0
    SHA512 51b71452f7c58f7b74f7f867c4cff7b04699cb0a4754552a41dbfde318bead31ce101ee82ff05cc314e98982f6243f2947fe0a0e5c12431e302e3131e8d32238
    HEAD_REF main
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/.github")

vcpkg_find_acquire_program(GIT)
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
