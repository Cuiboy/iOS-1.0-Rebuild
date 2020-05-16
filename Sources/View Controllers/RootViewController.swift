import UIKit

public class RootController: UIViewController {
    
    @objc public func buttonAction() {
        let vc = MySecondViewController()
        vc.modalPresentationStyle = .automatic
        self.present(vc, animated: false, completion: nil)
    }
    
   public var controller = LockScreenViewController()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
               let view = UIView()
               view.frame = CGRect(x: 0, y: 0, width: 450, height: 800)
               view.backgroundColor = .white
               self.view = view
       controller.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        controller.view.center = self.view.center
       // controller.view.autoresizingMask = [.flexibleHeight, .flexibleHeight]
         addChild(controller)
        controller.didMove(toParent: self)
        self.view.addSubview(controller.view)
    
        let originaliPhoneView = UIImageView()
        originaliPhoneView.frame = CGRect(x: -1.75, y: 0, width: 450, height: 800)
        let iPhoneImage = UIImage(named: "Assets/Frame/iPhone_Frame_Transparent.png")
        originaliPhoneView.image = iPhoneImage
        view.addSubview(originaliPhoneView)
        view.bringSubviewToFront(originaliPhoneView)
        
        let homeButtonShape = UIView()
        homeButtonShape.frame = CGRect(x: 185, y: 645, width: 75, height: 75)
        homeButtonShape.backgroundColor = .clear
        homeButtonShape.layer.cornerRadius = CGFloat(37.5)
        view.addSubview(homeButtonShape)
        view.bringSubviewToFront(homeButtonShape)
        
        let homeButtonGesture = UITapGestureRecognizer()
        homeButtonGesture.addTarget(self, action: #selector(homeTapped))
        homeButtonShape.addGestureRecognizer(homeButtonGesture)
        
    }
    @objc public func homeTapped() {
        print("home button")
    }
}

