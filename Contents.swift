//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


let rootViewController = RootController()
rootViewController.preferredContentSize = CGSize(width: 450, height: 800)
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = rootViewController
