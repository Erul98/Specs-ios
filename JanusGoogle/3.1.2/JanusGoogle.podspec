Pod::Spec.new do |s|
    s.name             = 'JanusGoogle'
    s.version          = '3.1.2'
    s.summary          = 'Janus Google auth SDK'
  
    s.description      = <<-DESC
  TODO: Add long description of the pod here.
                         DESC
  
    s.homepage         = 'https://github.com/teko-vn/Specs-ios.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { '$(git config user.name)' => '$(git config user.email)' }
    s.source           = {
                           :http => 'https://api.github.com/repos/teko-vn/Specs-ios/releases/assets/34298517',
                           :type => 'zip',
                           :headers => [
                             'Authorization: token ' + ENV['GITHUB_USER_TOKEN'],
                             'Accept: application/octet-stream'
                           ]
                         }
  
    s.ios.deployment_target = '10.0'
  
    s.pod_target_xcconfig = {
      'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
    }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    
    s.vendored_frameworks = 'JanusGoogle.framework'
  
    s.public_header_files = 'JanusGoogle.framework/Headers/*.h'
    s.source_files = 'JanusGoogle.framework/Headers/*.{h, m, swift}'
  
    s.dependency 'GoogleSignIn', '~> 5.0.2'
    s.dependency 'Janus', '~> 3.1.2'
    
  end
