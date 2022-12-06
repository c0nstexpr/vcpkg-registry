set(ver 0.7-2)

vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  foonathan/memory
  REF
  ${ver}
  SHA512
  e84a567a832138f477997d7b4cbd827a82dfd5d9de8dc0d2833995366253501155663c7d73407ac43a7fd58d42774ddb3582c557ca12800316a732ac7ccab823
  HEAD_REF
  main)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}" OPTIONS -DFOONATHAN_MEMORY_BUILD_EXAMPLES=OFF
  -DFOONATHAN_MEMORY_BUILD_TESTS=OFF)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/foonathan-memory-${ver})

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
