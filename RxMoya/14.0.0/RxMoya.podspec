Pod::Spec.new do |s|
	s.name                   = 'RxMoya'
	s.version                = '14.0.0'
	s.summary                = 'RxMoya.framework'
	s.homepage               = 'https://github.com/teko-vn/Specs-ios.git'
	s.license                = { :type => 'MIT', :file => 'LICENSE' }

	s.source                 = { :http => 'https://github.com/teko-vn/Specs-ios/releases/download/RxMoya-v14.0.0/RxMoya.framework.zip' }
	s.vendored_frameworks    = 'RxMoya.framework'
	s.public_header_files    = 'RxMoya.framework/Headers/*.h'
	s.source_files           = 'RxMoya.framework/Headers/*.{h,m,swift}'

	s.author                 = {'Mobile Lab' => 'mobile.lab@teko.vn'}
end