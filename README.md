#KoombeaLoader

KoombeaLoader is a clean and easy-to-us HUD for you to use with your custom animation using images sequences develop in Swift.

##Installation

###CocoaPods
[CocoaPods](https://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like ```KoombeaLoader``` in your projects. 

First, add the following line to your [Podfile](http://guides.cocoapods.org/using/using-cocoapods.html):

```
pod 'KoombeaLoader'
```

This pulls from the master branch directly.

Second, install ```KoombeaLoader``` into your project:

```
pod install
```

###Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. 

To integrate ```KoombeaLoader``` into your Xcode project using Carthage, specify it in your Cartfile:

```
github "koombea/KoombeaLoader"
```

###Manually
* Download this project.
* Compile the framework.
* Import the KoombeaLoader framework to your project.

##Usage

###Import 
Import the KoombeaLoader framework to your view controller:

```
import KoombeaLoader
```

###Show
Show the HUD using the following line:

```
KoombeaLoader.shareInstance.showLoader()
```


###Hide
Hide the HUD using the following line:

```
KoombeaLoader.shareInstance.hideLoader()
```

##Customization
KoombeaLoader can be customized via the following methods:

```
///Pass your custom images sequence and copy text
public func setupBasicLoader(images: [UIImage], copy: String)

///Add your custom images sequence
public func setupImages(images: [UIImage])

///Add you custom copy text
public func setupLoadingCopy(copy: String)

///Setup imageView size
public func setupLoaderImageSize(width: CGFloat, height: CGFloat)

///Setup LoaderView background color
public func setupLoaderBackgroundColor(color: UIColor)

///Setup copy text color
public func setupCopyColor(color: UIColor)

///Setup copy text font and size
public func setupCopyFont(font: UIFont)

///Setup animation time interval
public func setupTimeInterval(timeInterval: Double)

```

##Contributing to this project
If you have feature requests or bug reports, feel free to help out by sending pull requests or by [creating new issues](https://github.com/koombea/KoombeaLoader/issues/new).

##License

##Credits
KoombeaLoader is brought to you by [Koombea](https://www.koombea.com) and the Mobile Team.
