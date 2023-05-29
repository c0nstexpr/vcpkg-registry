set(ver 0.6.3)

vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  BlurringShadow/stdsharp
  REF
  ${ver}
  SHA512
  0b91879269014b03bd3b79616c5399e9ac32c71d9be6d64e233b8c4807b270c279365daef4c02bf76a1d04131c0838010a3d64b6efc021d8bdbaca7a3d9fb6a4
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
