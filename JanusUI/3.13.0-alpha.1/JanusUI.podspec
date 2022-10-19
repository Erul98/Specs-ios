Pod::Spec.new do |s|
    s.name             = 'JanusUI'
    s.version          = '3.13.0-alpha.1'
    s.summary          = 'Teko AuthUI SDK'
  
    s.description      = <<-DESC
  TODO: Add long description of the pod here.
                         DESC
  
    s.homepage         = 'https://github.com/teko-vn/Specs-ios.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { '$(git config user.name)' => '$(git config user.email)' }
    s.source           = {
                           :http => 'https://api.github.com/repos/teko-vn/Specs-ios/releases/assets/78523619',
                           :type => 'zip',
                           :headers => [
                             'Authorization: token ' + ENV['GITHUB_USER_TOKEN'],
                             'Accept: application/octet-stream'
                           ]
                         }
  
    s.ios.deployment_target = '10.0'
  
    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    
    s.vendored_frameworks = 'JanusUI.xcframework'
  
    s.dependency 'Janus', '~> 3.7.0-alpha.1'
    s.dependency 'JanusFacebook', '~> 4.0'
    s.dependency 'JanusGoogle', '~> 3.5'
    s.dependency 'JanusApple', '~> 3.5'
    s.dependency 'Apollo', '~> 2.0'
    s.dependency 'TekoTracker', '~> 1.1'
    s.dependency 'TekLocalize', '~> 0.1'
    
  end