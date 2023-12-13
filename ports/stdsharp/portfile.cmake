set(ver 0.8.5)

set(repo_name stdsharp)

vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  BlurringShadow/${repo_name}
  REF
  ${ver}
  SHA512
  d22583e1262a908996bdedea6af8735c5e9c302ebad6ee39bcb537d0ace245c13a8c623384bc1beee9ebb5cf674ead33017da8bf1bec06023e257f5ea1955fd2
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
