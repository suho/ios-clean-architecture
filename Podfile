# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

inhibit_all_warnings!

def rx_swift
  pod 'RxSwift'
end

def rx_cocoa
    pod 'RxCocoa'
end

def network_pods
  pod 'RxAlamofire'
end

def database_pods
  pod 'RxRealm'
  pod 'RealmSwift'
  pod 'Realm'
end

def dev_pods
  pod 'SwiftLint'
end

def test_pods
  pod 'RxTest'
  pod 'RxBlocking'
end

def util_pods
    pod 'SVProgressHUD'
end

target 'CleanArchitecture' do
  use_frameworks!
  rx_swift
  rx_cocoa
  network_pods
  database_pods
  dev_pods
  util_pods

  target 'CleanArchitectureTests' do
    inherit! :search_paths
    rx_swift
    dev_pods
    test_pods
  end
end
