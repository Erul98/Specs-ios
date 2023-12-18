Pod::Spec.new do |s|
    s.name             = 'UserFlutterBridge'
    s.version          = '0.2.1-MOBCOMMON5485.1'
    s.summary          = 'UserFlutterBridge'

    s.description      = <<-DESC
  TODO: Add long description of the pod here.
                         DESC
    s.homepage         = 'https://github.com/teko-vn/Specs-ios.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { '$(git config user.name)' => '$(git config user.email)' }
    s.source           = {
                           :http => 'https://api.github.com/repos/teko-vn/Specs-ios/releases/assets/141256068',
                           :type => 'zip',
                           :headers => [
                             'Authorization: token ' + ENV['GITHUB_USER_TOKEN'],
                             'Accept: application/octet-stream'
                           ]
                         }
  
    s.ios.deployment_target = '11.0'
  
    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

    s.vendored_frameworks = 'UserFlutterBridge.xcframework'
  
    s.dependency 'TerraInstancesManager', '~> 2.1'
    s.dependency 'TekLocalize', '~> 0.1'
    s.dependency 'TekoTracker', '~> 1.10'
  end
