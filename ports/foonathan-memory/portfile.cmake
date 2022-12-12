vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  foonathan/memory
  REF
  62a41ddcf919d7066436a2e86cd3567337458e8b
  SHA512
  ba2aceacb8d6637d967b2431180a8cd0e13f5ca846df0ef9a33332a65947a8ab239f94a2dc12cc2b6523a786759a203a3c656ffe365c82e378ba81a4ffc06d54
  HEAD_REF
  main)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}" OPTIONS -DFOONATHAN_MEMORY_BUILD_EXAMPLES=OFF
  -DFOONATHAN_MEMORY_BUILD_TESTS=OFF)

vcpkg_cmake_install()
if(EXISTS ${CURRENT_PACKAGES_DIR}/lib/foonathan_memory/cmake)
  vcpkg_cmake_config_fixup(PACKAGE_NAME foonathan_memory CONFIG_PATH
                           lib/foonathan_memory/cmake)
else()
  vcpkg_cmake_config_fixup(PACKAGE_NAME foonathan_memory CONFIG_PATH
                           share/foonathan_memory/cmake)
endif()

vcpkg_copy_pdbs()

vcpkg_copy_tools(TOOL_NAMES nodesize_dbg AUTO_CLEAN)

# Correct headers path
file(COPY "${CURRENT_PACKAGES_DIR}/include/foonathan_memory/foonathan"
     DESTINATION "${CURRENT_PACKAGES_DIR}/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/foonathan_memory")

# Handle copyright
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

# Clean out unneeded directories and files
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

if(EXISTS ${CURRENT_PACKAGES_DIR}/debug/lib/foonathan_memory)
  file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib/foonathan_memory")
endif()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

if(EXISTS ${CURRENT_PACKAGES_DIR}/lib/foonathan_memory)
  file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib/foonathan_memory")
endif()
