# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'UL-Test' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'JGProgressHUD'
  pod 'UL-BackendService', :git => "https://github.com/kerembalaban/UL-BackendService.git", :tag => "1.0.0"

  # Pods for UL-Test
  target 'UL-TestTests' do
    inherit! :search_paths
    pod 'UL-BackendService', :git => "https://github.com/kerembalaban/UL-BackendService.git", :tag => "1.0.0"
    # Pods for testing
  end

  target 'UL-TestUITests' do
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end
