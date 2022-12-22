set(ver 0.4.4)

vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  BlurringShadow/stdsharp
  REF
  ${ver}
  SHA512
  483bc722823857464894496b44dd16e08f63baf2b7a848768751f6dcb6507564ef307ae9baf454672d9b46c94260ff4fdfc3ec79d80775a2a1ba65a91aa0de90
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
