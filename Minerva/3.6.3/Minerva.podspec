#
# Be sure to run `pod lib lint Tekit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'Minerva'
    s.version          = '3.6.3'
    s.summary          = 'PaymentSDK v2. Update with payment service v2 and firebase firestore v2'
  
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  
    s.description      = <<-DESC
  TODO: Add long description of the pod here.
                         DESC
    s.homepage         = 'https://github.com/teko-vn/Specs-ios.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { '$(git config user.name)' => '$(git config user.email)' }
    s.source           = {
                           :http => 'https://api.github.com/repos/teko-vn/Specs-ios/releases/assets/34080568',
                           :type => 'zip',
                           :headers => [
                             'Authorization: token ' + ENV['GITHUB_USER_TOKEN'],
                             'Accept: application/octet-stream'
                           ]
                         }

    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
    s.ios.deployment_target = '10.0'
  
    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

    s.vendored_frameworks = 'Minerva.framework'
  
    s.public_header_files = 'Minerva.framework/Headers/*.h'
    s.source_files = 'Minerva.framework/Headers/*.{h, m, swift}'
  
    # dependency
    s.dependency 'TekCoreService', '~> 1.2.10'
    s.dependency 'TerraInstancesManager', '~> 1.2.12'

    s.dependency 'SVProgressHUD'
    s.dependency 'SnapKit'
    s.dependency 'FirebaseFirestore'
    s.dependency 'FirebaseCore', '~> 6.7.0'
    s.dependency 'BerTlv'
    s.dependency 'Toast-Swift', '~> 5.0.0'
    s.dependency 'SwiftyJSON', '~> 4.0'
    s.dependency 'Kingfisher', '~> 6.0'
    s.dependency 'TekBankingService'
    s.dependency 'VnpayWalletSDK'

  end
