vcpkg_from_git(
	OUT_SOURCE_PATH SOURCE_PATH
	URL https://github.com/BlurringShadow/stdsharp
	REF fe528c72c23fc81550fc690369869d8309104068
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/.github")

vcpkg_configure_cmake(SOURCE_PATH "${SOURCE_PATH}" PREFER_NINJA)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

file(
	INSTALL "${SOURCE_PATH}/LICENSE"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
	RENAME copyright
)
