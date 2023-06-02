set(ver 0.6.4)

set(repo_name stdsharp)

vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  BlurringShadow/${repo_name}
  REF
  ${ver}
  SHA512
  fb66f87d68fed47cb49045ccde0b7f24cea5bc2ccd36c167d5d47352bc25076db63a8063fda688c91cb14ee50877bb8c9e2a37c8d29e582813307d8239dbd984
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
