firebase_firestore_version = '10.18.0'

Pod::Spec.new do |s|
  s.name                   = 'TekoFirebaseFirestore'
  s.module_name            = 'FirebaseFirestore'
  s.version                = firebase_firestore_version
  s.summary                = 'A replica Firebase Firestore podspec.'
  s.description            = 'A replica Firebase Firestore podspec that provides pre-compiled binaries/frameworks instead'
  s.homepage               = 'http://invertase.io'
  s.license                = 'Apache-2.0'
  s.source                 = { :git => 'https://github.com/invertase/firestore-ios-sdk-frameworks.git', :tag => firebase_firestore_version }
  s.cocoapods_version      = '>= 1.10.0'
  s.authors                = 'Invertase Limited'
  s.pod_target_xcconfig    = { 'OTHER_LDFLAGS' => '-lObjC' }
  s.static_framework       = true

  # These frameworks, minimums, and the c++ library are here from, and copied specifically to match, the upstream podspec:
  # https://github.com/firebase/firebase-ios-sdk/blob/34c4bdbce23f5c6e739bda83b71ba592d6400cd5/FirebaseFirestore.podspec#L103
  # They may need updating periodically.
  s.ios.frameworks         = 'SystemConfiguration', 'UIKit'
  s.osx.frameworks         = 'SystemConfiguration'
  s.tvos.frameworks        = 'SystemConfiguration', 'UIKit'
  s.library                = 'c++'
  s.ios.deployment_target  = '11.0'
  s.osx.deployment_target  = '10.13'
  s.tvos.deployment_target = '11.0'

  s.default_subspecs       = "AutodetectLeveldb"

  # Skip leveldb framework if Firebase Database is included in any form
  # Skip FirebaseFirestoreSwift if project is FlutterFire or React Native Firebase project. See:
  # https://github.com/invertase/firestore-ios-sdk-frameworks/issues/62
  current_target_definition = Pod::Config.instance.podfile.send(:current_target_definition)
  current_definition_string = current_target_definition.to_hash.to_s

  hasCloudFirestore = current_definition_string.include?('cloud_firestore')
  hasRNFBFirestore = current_definition_string.include?('RNFBFirestore')

  # Base Pod gets everything except leveldb, which if included here may collide with inclusions elsewhere
  s.subspec 'Base' do |base|
    frameworksBase = Dir.glob("FirebaseFirestore/*.xcframework").select do |name|
      if name.include?('leveldb')
        false
      elsif hasCloudFirestore && name.include?('FirebaseFirestoreSwift')
        false
      elsif hasRNFBFirestore && name.include?('FirebaseFirestoreSwift')
        false
      elsif ENV["SKIP_FIREBASE_FIRESTORE_SWIFT"] && name.include?('FirebaseFirestoreSwift')
        false
      else
        true
      end
    end

    base.vendored_frameworks  = frameworksBase
    base.preserve_paths       = frameworksBase
    base.resource             = 'FirebaseFirestore/Resources/*.bundle'
  end

  # AutoLeveldb Pod attempts to determine if it should include leveldb automatically. Flaky in some instances.
  s.subspec 'AutodetectLeveldb' do |autodb|
    autodb.dependency 'TekoFirebaseFirestore/Base'


    skip_leveldb = false

    if defined?($FirebaseFirestoreExcludeLeveldb)
      Pod::UI.puts "#{autodb.name}: FirebaseFirestoreExcludeLeveldb set to #{$FirebaseFirestoreExcludeLeveldb} in Podfile."
      Pod::UI.puts "#{autodb.name}: This variable is deprecated. Use the FirebaseFirestore/WithoutLeveldb subspec if needed."
      skip_leveldb = $FirebaseFirestoreExcludeLeveldb
    end

    # FlutterFire
    if !skip_leveldb && current_definition_string.include?('firebase_database')
      Pod::UI.puts "#{autodb.name}: Detected firebase_database module. Would not include leveldb."
      skip_leveldb = true
    # React native Firebase
    elsif !skip_leveldb && current_definition_string.include?('RNFBDatabase')
      Pod::UI.puts "#{autodb.name}: Detected RNFBDatabase module. Would not include leveldb."
      skip_leveldb = true
    # Pod spec used directly
    elsif !skip_leveldb && current_definition_string.include?('FirebaseDatabase')
      Pod::UI.puts "#{autodb.name}: Detected FirebaseDatabase module. Would not include leveldb."
      skip_leveldb = true
    # Umbrella pod spec
    elsif !skip_leveldb && current_definition_string.include?('Firebase/Database')
      Pod::UI.puts "#{autodb.name}: Detected Firebase/Database module. Would not include leveldb."
      skip_leveldb = true
    end

    if !skip_leveldb
      Pod::UI.puts "#{autodb.name}: subspec would include leveldb if used directly or by default."
      autodb.dependency 'TekoFirebaseFirestore/WithLeveldb'
    end
  end

  # NoLeveldb Pod deterministically gets all of FirebaseFirestore *except* leveldb, to ensure no symbol collisions
  s.subspec 'WithoutLeveldb' do |nodb|
    nodb.dependency 'TekoFirebaseFirestore/Base'
  end

  # WithLeveldb Pod deterministically gets all of FirebaseFirestore *and* leveldb
  s.subspec 'WithLeveldb' do |withdb|
    withdb.dependency            'TekoFirebaseFirestore/Base'
    withdb.vendored_frameworks = "FirebaseFirestore/*leveldb*"
    withdb.preserve_paths      = "FirebaseFirestore/*leveldb*"
  end
end