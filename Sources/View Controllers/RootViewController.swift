import UIKit


public class RootViewController: UIViewController {
    
  
    
   public var controller = LockScreenViewController()
    
   
    
    override public func viewDidLoad() {
        super.viewDidLoad()
               let view = UIView()
               view.frame = CGRect(x: 0, y: 0, width: 450, height: 800)
               view.backgroundColor = .white
               self.view = view
        
      
       controller.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        controller.view.center = self.view.center
        print(controller.view.frame)
       // controller.view.autoresizingMask = [.flexibleHeight, .flexibleHeight]
         addChild(controller)
        controller.didMove(toParent: self)
       
    

        
        let originaliPhoneView = UIImageView()
        originaliPhoneView.frame = CGRect(x: -1.75, y: 0, width: 450, height: 800)
        let iPhoneImage = UIImage(named: "Assets/Frame/iPhone_Frame_Transparent.png")
        originaliPhoneView.image = iPhoneImage
        view.addSubview(originaliPhoneView)
        view.sendSubviewToBack(originaliPhoneView)
   
        
        
        let homeButtonShape = UIView()
        homeButtonShape.frame = CGRect(x: 185, y: 645, width: 75, height: 75)
        homeButtonShape.backgroundColor = .clear
        homeButtonShape.layer.cornerRadius = CGFloat(37.5)
        view.addSubview(homeButtonShape)
        view.bringSubviewToFront(homeButtonShape)
        
        let homeButtonGesture = UITapGestureRecognizer()
        homeButtonGesture.addTarget(self, action: #selector(homeTapped))
        homeButtonShape.addGestureRecognizer(homeButtonGesture)
        
        
           let maskView = UIView()
                 maskView.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
                 maskView.backgroundColor = .yellow
                 view.addSubview(maskView)
           controller.view.mask = maskView
            self.view.addSubview(controller.view)
        
    }
    @objc public func homeTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("homePressed"), object: nil)
        print("First")
        print(self.children.count)
        print("Second")
        for child in self.children {
            print(child.children.count)
        }
        
    }
}

