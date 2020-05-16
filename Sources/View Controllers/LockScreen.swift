import UIKit

public class LockScreenViewController: UIViewController {
    
       override public func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        view.backgroundColor = .white
        self.view = view
               
        let lockScreenImageView = UIImageView()
        lockScreenImageView.frame = self.view.frame
        lockScreenImageView.image = UIImage(named: "Assets/Wallpaper/wallpaper.jpg")
        lockScreenImageView.contentMode = .scaleAspectFill
        self.view.addSubview(lockScreenImageView)
        
        
       
            
              
    }
    
}

