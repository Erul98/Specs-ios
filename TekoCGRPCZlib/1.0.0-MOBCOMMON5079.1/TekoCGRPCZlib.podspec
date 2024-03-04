Pod::Spec.new do |s|

    s.name = 'TekoCGRPCZlib'
    s.module_name = 'CGRPCZlib'
    s.version = '1.0.0-MOBCOMMON5079.1'
    s.license = { :type => 'Apache 2.0', :file => 'LICENSE' }
    s.summary = 'Compression library that provides in-memory compression and decompression functions'
    s.homepage = 'https://www.grpc.io'
    s.authors  = { 'The gRPC contributors' => 'grpc-packages@google.com' }

    s.swift_version = '5.2'
    s.ios.deployment_target = '10.0'
    s.osx.deployment_target = '10.12'
    s.source = { :git => 'https://' + ENV['GITHUB_USER_TOKEN'] + '@github.com/teko-vn/grpc-swift.git', :tag => s.version }

    s.source_files = 'Sources/CGRPCZlib/**/*.{swift,c,h}'

end