set(ver 0.6.0)

vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  BlurringShadow/stdsharp
  REF
  ${ver}
  SHA512
  41dc5f1686a0bb1d566ff1a8a79ddc3dde34d1903cb2cc8864c9e6a7beb0dc7b531d9b6f6060ced2562b37f14f2255cb549fcdb3cf039c756e1cee408188651a
  HEAD_REF
  main)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}" OPTIONS -DSTDSHARP_BUILD_TEST=OFF
  -DSTDSHARP_INCLUDE_AS_SYSTEM=OFF)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/stdsharp-${ver})

file(REMOVE_RECURSE
     # interface only
     "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

# Handle copyright
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
