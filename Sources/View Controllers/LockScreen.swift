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
        
        let statusBarBackground = UIView()
        statusBarBackground.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 24)
        statusBarBackground.backgroundColor = .black
        statusBarBackground.alpha = 0.5
        view.bringSubviewToFront(statusBarBackground)
        view.addSubview(statusBarBackground)
        
        let statusBarView = UIImageView()
        statusBarView.frame = CGRect(x: 0, y: 3, width: self.view.frame.width, height: 24)
        statusBarView.image = UIImage(named: "Assets/Lock_Screen/statusBar_white.png")
        statusBarView.contentMode = .scaleAspectFit
        view.bringSubviewToFront(statusBarView)
        view.addSubview(statusBarView)
        
        
        let mainBackgroundLight = UIView()
        mainBackgroundLight.frame = CGRect(x: 0, y: 24, width: self.view.frame.width, height: 56)
        mainBackgroundLight.backgroundColor = .gray
        mainBackgroundLight.alpha = 0.5
        view.bringSubviewToFront(mainBackgroundLight)
        view.addSubview(mainBackgroundLight)
        
        let mainBackgroundDark = UIView()
            mainBackgroundDark.frame = CGRect(x: 0, y: 80, width: self.view.frame.width, height: 56)
            mainBackgroundDark.backgroundColor = .black
            mainBackgroundDark.alpha = 0.4
            view.bringSubviewToFront(mainBackgroundDark)
            view.addSubview(mainBackgroundDark)
        
          
    }
    
}
