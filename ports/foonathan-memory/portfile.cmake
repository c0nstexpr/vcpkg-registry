vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  foonathan/memory
  REF
  "v0.7-2"
  SHA512
  e84a567a832138f477997d7b4cbd827a82dfd5d9de8dc0d2833995366253501155663c7d73407ac43a7fd58d42774ddb3582c557ca12800316a732ac7ccab823
  HEAD_REF
  main)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}" OPTIONS -DFOONATHAN_MEMORY_BUILD_EXAMPLES=OFF
  -DFOONATHAN_MEMORY_BUILD_TESTS=OFF)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME foonathan_memory CONFIG_PATH
                         lib/foonathan_memory/cmake)

vcpkg_copy_pdbs()

vcpkg_copy_tools(TOOL_NAMES nodesize_dbg AUTO_CLEAN)

# Clean out unneeded directories and files
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib/foonathan_memory")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib/foonathan_memory")

# Correct headers path
file(COPY "${CURRENT_PACKAGES_DIR}/include/foonathan_memory/foonathan"
     DESTINATION "${CURRENT_PACKAGES_DIR}/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/foonathan_memory")

# Handle copyright
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
