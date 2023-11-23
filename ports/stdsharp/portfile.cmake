set(ver 0.8.0)

set(repo_name stdsharp)

vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  BlurringShadow/${repo_name}
  REF
  ${ver}
  SHA512
  8d7f6f1e8c5669f8664bd08137cd8ca6356e2446021e3699848f51178e8362659e054f5b19b09c8533627c1a6af7eea406e42ec16eb7c2e522d75989830eec16
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
