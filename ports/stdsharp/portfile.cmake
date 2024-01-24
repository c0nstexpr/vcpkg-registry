set(ver 0.8.7)

set(repo_name stdsharp)

vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  c0nstexpr/${repo_name}
  REF
  ${ver}
  SHA512
  2392BA273FE6B64E7B64CFC1F0532FF3E65D26CD6BDF159411EEE92A56D353A48E19B8CF4F2E36C9BB183A89902E8AF4F186BDC349DB24ED340349689C7E0555
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
