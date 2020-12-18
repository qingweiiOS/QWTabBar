#
#  Be sure to run `pod spec lint QWTabBar.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
s.name             = 'QWTabBar'
s.version          = '1.3'
s.summary          = '自定义TabBar'
s.description      = <<-DESC
TODO: Add long description of the pod here.
DESC
s.homepage         = 'https://github.com/qingweiiOS'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Mr.Q' => '772053795@qq.com' }
s.source           = { :git => 'https://github.com/qingweiiOS/QWTabBar.git', :tag => s.version.to_s }
s.ios.deployment_target = '9.0'
s.source_files = 'Class/'
s.dependency 'Masonry'
end
