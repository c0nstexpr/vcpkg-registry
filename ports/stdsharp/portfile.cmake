set(ver 0.7.0)

set(repo_name stdsharp)

vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  BlurringShadow/${repo_name}
  REF
  ${ver}
  SHA512
  d309b032655e7c3b2380e63fb06f9664a8c838987597484c6445bf74fc90d5c500dcba92a6a3f38e22d7a654ba92bf0e582753a4d4f3e5a0ce662a234c2a14c2
  HEAD_REF
  main)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}" OPTIONS -D${repo_name}_BUILD_TEST=OFF
  -D${repo_name}_INCLUDE_AS_SYSTEM=OFF)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${repo_name}-${ver})

file(REMOVE_RECURSE
     # interface only
     "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

# Handle copyright
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
