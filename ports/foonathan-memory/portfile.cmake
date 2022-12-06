set(ver v0.7-2)

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

vcpkg_cmake_config_fixup(CONFIG_PATH lib/foonathan_memory/cmake)

vcpkg_copy_pdbs()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include
     ${CURRENT_PACKAGES_DIR}/debug/share)

file(REMOVE ${CURRENT_PACKAGES_DIR}/debug/LICENSE
     ${CURRENT_PACKAGES_DIR}/debug/README.md ${CURRENT_PACKAGES_DIR}/LICENSE
     ${CURRENT_PACKAGES_DIR}/README.md)

if(NOT VCPKG_CMAKE_SYSTEM_NAME OR VCPKG_CMAKE_SYSTEM_NAME STREQUAL
                                  "WindowsStore")
  set(EXECUTABLE_SUFFIX ".exe")
else()
  set(EXECUTABLE_SUFFIX "")
endif()

if(EXISTS ${CURRENT_PACKAGES_DIR}/bin/nodesize_dbg${EXECUTABLE_SUFFIX})
  file(COPY ${CURRENT_PACKAGES_DIR}/bin/nodesize_dbg${EXECUTABLE_SUFFIX}
       DESTINATION ${CURRENT_PACKAGES_DIR}/tools/${PORT})
  vcpkg_copy_tool_dependencies(${CURRENT_PACKAGES_DIR}/tools/${PORT})

  if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin
         ${CURRENT_PACKAGES_DIR}/debug/bin)
  else()
    file(REMOVE ${CURRENT_PACKAGES_DIR}/bin/nodesize_dbg${EXECUTABLE_SUFFIX}
         ${CURRENT_PACKAGES_DIR}/debug/bin/nodesize_dbg${EXECUTABLE_SUFFIX})
  endif()
endif()

# Handle copyright
configure_file(${SOURCE_PATH}/LICENSE
               ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)
