//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport




/*:
 
 # iOS 1.0 (2007)

 When I was about 8 years old (that was back in 2009), I got my first iPhone as a gift from my dad. It was the first generation iPhone, and I've never seen anything like it before. I was fascinated and I could not put it down for more than 15 minutes.
 
 Getting my first ever iPhone began my obsession with technology. I became curious of how the phone worked and how the software and hardware interacted so seemlessly with one another. Because of this first iPhone, I became passionate about building software, apps, and creating beautiful user interface. In high school, I launched 2 apps on the App Store, both of which received thousands of downloads. And, a few weeks ago, I received acceptance to study Electrical Engineering and Computer Science at UC Berkeley.
 
 So, with this project, I attempted to re-created the first iPhone and iPhone OS 1. This phone inspired me to become who I am today, and I would like to rebuild it using my knowledge in Swift. However, I realized the work was so much more than I imagined. I could only finish writing the basic structures of the Settings app and the Calculator app with the time given. However, I am planning to continue this project. If you would like to check out the more updated versions of this playground, please visit the GitHub repo below.
 
 
  [GitHub Repo](https://github.com/Cuiboy/iOS-1.0-Rebuild)
 
 And, if you would like to know more about me.
    
  [Personal Website](https://cuipatrick.com)
 
  You can still interact with the phone, (almost) all the buttons work!  Have fun!
*/



let rootViewController = RootViewController()
rootViewController.preferredContentSize = CGSize(width: 450, height: 800)
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = rootViewController
