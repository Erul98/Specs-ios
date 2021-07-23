Pod::Spec.new do |s|
    s.name             = 'JanusFacebook'
    s.version          = '3.4.0'
    s.summary          = 'Janus Facebook Auth SDK'
  
    s.description      = <<-DESC
  TODO: Add long description of the pod here.
                         DESC
  
    s.homepage         = 'https://github.com/teko-vn/Specs-ios.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { '$(git config user.name)' => '$(git config user.email)' }
    s.source           = {
                           :http => 'https://api.github.com/repos/teko-vn/Specs-ios/releases/assets/40861932',
                           :type => 'zip',
                           :headers => [
                             'Authorization: token ' + ENV['GITHUB_USER_TOKEN'],
                             'Accept: application/octet-stream'
                           ]
                         }
  
    s.ios.deployment_target = '10.0'

    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    
    s.vendored_frameworks = 'JanusFacebook.xcframework'

    s.dependency 'SwiftyJSON', '~> 4.0'
    s.dependency 'FacebookCore', '~> 0.9.0'
    s.dependency 'FacebookLogin', '~> 0.9.0'
    s.dependency 'FacebookShare', '~> 0.9.0'
    s.dependency 'Janus', '~> 3.4.2'
    
  end