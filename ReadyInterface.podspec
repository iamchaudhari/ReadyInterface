#
# Be sure to run `pod lib lint ReadyInterface.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ReadyInterface'
  s.version          = '0.1.0'
  s.summary          = 'UI/UX framework for iOS.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
User interface framework for some common components.
                       DESC

  s.homepage         = 'https://github.com/iamchaudhari/ReadyInterface'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'iamchaudhari' => 'support@iamchaudhari.com' }
  s.source           = { :git => 'https://github.com/iamchaudhari/ReadyInterface.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/iamchaudhari'

  s.ios.deployment_target = '10.0'
  s.requires_arc = true


  s.subspec "Common" do |common|
    common.source_files = "Sources/#{common.base_name}/*.swift"

    common.ios.dependency 'Kingfisher', '~> 4.0'
  end

  s.subspec "ActionCard" do |actionCard|
    actionCard.source_files = "Sources/Modules/#{actionCard.base_name}/*.swift"
    actionCard.resources = ["Sources/Modules/#{actionCard.base_name}/*.{xib}"]

    actionCard.dependency "ReadyInterface/Common"
  end
 
end
