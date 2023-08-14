# pod post_install_hook

post_install do |installer|
  installer.target_installation_results.pod_target_installation_results.each do |pod_name, target_installation_result|
    target_installation_result.native_target.build_configurations.each do |config|
      # Fix building failures on M1
      config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
    end
  end
end