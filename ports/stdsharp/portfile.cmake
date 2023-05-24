set(ver 0.6.0)

vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  BlurringShadow/stdsharp
  REF
  ${ver}
  SHA512
  BA877D7D9842CF3DF3DB5C4A2AFA67543DD7BCDD05D062268EE45A2F5EE2D44BA86F09A3164499F2B39D80CCCDB1611EE0B0DD1FFFF3E0F434DCAC94290371FA
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
