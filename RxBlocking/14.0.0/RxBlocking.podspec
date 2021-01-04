Pod::Spec.new do |s|
	s.name                   = 'RxBlocking'
	s.version                = '14.0.0'
	s.summary                = 'RxBlocking.framework'
	s.homepage               = 'https://github.com/teko-vn/Specs-ios.git'
	s.license                = { :type => 'MIT', :file => 'LICENSE' }

	s.source                 = {
	                             :http => 'https://api.github.com/repos/teko-vn/Specs-ios/releases/assets/28269008',
	                             :type => 'zip',
	                             :headers => [
	                               'Authorization => token ' + ENV['GITHUB_USER_TOKEN'],
	                               'Accept => application/octet-stream'
	                             ]
	                           }
	s.vendored_frameworks    = 'RxBlocking.framework'
	s.public_header_files    = 'RxBlocking.framework/Headers/*.h'
	s.source_files           = 'RxBlocking.framework/Headers/*.{h,m,swift}'

	s.author                 = {'Mobile Lab' => 'mobile.lab@teko.vn'}
end