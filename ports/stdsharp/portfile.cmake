vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO BlurringShadow/stdsharp
    REF v0.1.0
    HEAD_REF main
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/.github")

vcpkg_configure_cmake(SOURCE_PATH "${SOURCE_PATH}" PREFER_NINJA)
vcpkg_install_cmake()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
	INSTALL "${SOURCE_PATH}/LICENSE"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
	RENAME copyright
)
