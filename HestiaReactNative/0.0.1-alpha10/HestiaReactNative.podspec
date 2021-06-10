Pod::Spec.new do |s|
    s.name             = 'HestiaReactNative'
    s.version          = '0.0.1-alpha10'
    s.summary          = 'HestiaReactNative'

    s.description      = <<-DESC
  TODO: Add long description of the pod here.
                         DESC
    s.homepage         = 'https://github.com/teko-vn/Specs-ios.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { '$(git config user.name)' => '$(git config user.email)' }
    s.source           = {
                           :http => 'https://api.github.com/repos/teko-vn/Specs-ios/releases/assets/38361111',
                           :type => 'zip',
                           :headers => [
                             'Authorization: token ' + ENV['GITHUB_USER_TOKEN'],
                             'Accept: application/octet-stream'
                           ]
                         }
  
    s.ios.deployment_target = '10.0'
  
    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

    s.vendored_frameworks = 'HestiaReactNative.framework'
  
    s.public_header_files = 'HestiaReactNative.framework/Headers/*.h'
    s.source_files = 'HestiaReactNative.framework/Headers/*.{h,m,swift,xib}'
  
    # dependency terra
    s.dependency 'TekPolicyService'
    s.dependency 'TekListingService'
    s.dependency 'TekSearchService'
    s.dependency 'TekDiscoveryEvent'
    s.dependency 'PromiseKit', '~> 6.8'
    s.dependency 'Alamofire', '5.3.0'
  
    s.dependency 'Terra', '~> 2.5.3'
    s.dependency 'Janus', '~> 3.2.1'
    
  end
