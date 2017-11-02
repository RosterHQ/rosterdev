#
# Be sure to run `pod lib lint rosterdev.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'rosterdev'
  s.version          = '0.1.0'
  s.summary          = 'A developer dashboard, along with test injection facilities.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
You can shake your app, when it's built for development (using a DEBUG flag) and bring up a development dashboard. This can be useful to change network API environments. A default option you can get is a list of tests you can inject-- e.g., to inject artificial errors, for hard to test edge cases, into your running program.
                       DESC

  s.homepage         = 'https://github.com/RosterHQ/rosterdev'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'crspybits' => 'chris.prince@withroster.com' }
  s.source           = { :git => 'https://github.com/RosterHQ/rosterdev.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'rosterdev/Classes/**/*'
  s.resources = ['rosterdev/Assets/**/*.storyboard']
end
