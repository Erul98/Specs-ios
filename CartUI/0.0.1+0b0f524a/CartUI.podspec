#
# Be sure to run `pod lib lint CartUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CartUI'
  s.version          = '0.0.1+0b0f524a'
  s.summary          = 'CartUI SDK'
  s.description      = 'Cart UI SDK for integrating into app'
  s.homepage         = 'https://github.com/teko-vn/Specs-ios'
  s.author           = { 'Cart' => 'cart-platform@teko.vn' }
  s.source           = {
                         :http => 'https://api.github.com/repos/teko-vn/Specs-ios/releases/assets/53325824',
                         :type => 'zip',
                         :headers => [
                           'Authorization: token ' + ENV['GITHUB_USER_TOKEN'],
                           'Accept: application/octet-stream'
                          ]
                        }

  s.ios.deployment_target = '10.0'

  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.vendored_frameworks = 'CartUI.xcframework'

  # dependency
  # core
  s.dependency 'CartCore', '0.0.1+0b0f524a'

  # Terra
  s.dependency 'Terra', '~> 3.0'
  s.dependency 'TerraInstancesManager', '~> 2.1'

  # Tracker
  s.dependency 'TekoTracker', '~> 1.2'

  # Apollo
  s.dependency 'Apollo', '~> 2.0'
  s.dependency 'ApolloTheme' , '~> 1.0'

  # ui
  s.dependency 'Nuke', '~> 8.0'
  s.dependency 'UIColor_Hex_Swift', '~> 4.0.2'
  s.dependency 'Toast-Swift', '~> 5.0.1'
  s.dependency 'MBProgressHUD'
  s.dependency 'FittedSheets', '~> 1.4'
  s.dependency 'SkeletonView', '~> 1.21'
  s.dependency 'IQKeyboardManagerSwift', '6.5.0'
  s.dependency 'SnapKit', '~> 5.0.1'
  s.dependency 'Nantes'

  # rx
  s.dependency 'RxCocoa', '~> 5'
  s.dependency 'RxRelay', '~> 5'
  s.dependency 'RxSwift', '~> 5'

end