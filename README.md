# rosterdev

[![CI Status](http://img.shields.io/travis/crspybits/rosterdev.svg?style=flat)](https://travis-ci.org/crspybits/rosterdev)
[![Version](https://img.shields.io/cocoapods/v/rosterdev.svg?style=flat)](http://cocoapods.org/pods/rosterdev)
[![License](https://img.shields.io/cocoapods/l/rosterdev.svg?style=flat)](http://cocoapods.org/pods/rosterdev)
[![Platform](https://img.shields.io/cocoapods/p/rosterdev.svg?style=flat)](http://cocoapods.org/pods/rosterdev)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

rosterdev is available through [CocoaPods](http://cocoapods.org). To install
it, add the following line to your Podfile:

```ruby
pod 'rosterdev'
```

The intent is that these developer functions will only be available in debug builds of your app. To accomplish this in Swift, [create a `DEBUG` `OTHER_SWIFT_FLAGS` for your debug build](./docs/debugFlag.png).

You will also need to enable the debug dashboard to be displayed. One way to do this is via a shake gesture. [See the example here](Example/rosterdev/AppDelegate.swift).

And, if you are doing test injection, you will need:

```
#if DEBUG
    TestCases.setup()
#endif
```

in your AppDelegate. [See the example here](Example/rosterdev/AppDelegate.swift).

## Author

crspybits, chris.prince@withroster.com

## License

rosterdev is available under the MIT license. See the LICENSE file for more info.
