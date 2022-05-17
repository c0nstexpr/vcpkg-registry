vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO BlurringShadow/stdsharp
    REF 0.2.1
    SHA512 63443c508a794c2d835122cd39c3cc3e491dd036c2c3c100c7a148488c9ec48f7cae1f245fabbe05f324ab7815d9c70769cccdd6b058eab25dd97b13516d5bad
    HEAD_REF main
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/.github")

foreach(path IN $ENV{PATH})
    vcpkg_add_to_path("${path}")
endforeach()

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" PREFER_NINJA OPTIONS)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
	INSTALL "${SOURCE_PATH}/LICENSE"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
	RENAME copyright
)
