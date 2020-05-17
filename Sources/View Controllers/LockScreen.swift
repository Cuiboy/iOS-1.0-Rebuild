import UIKit
import PlaygroundSupport


public class LockScreenViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var timer = Timer()
    let unlockDent = UIView()
        let lockScreenImageViewMask = UIImageView()
        let unlockDentMask = UIView()
    let timeLabel = UILabel()
     let dateLabel = UILabel()
     let slideToUnlock = UILabel()
     let sliderView = UIView()
     let lockView = UIImageView()
     let lowerBorder = UIView()
     let unlockBackgroundLight = UIView()
    var timeFormatter = DateFormatter()
    var dateFormatter = DateFormatter()
    var gestureRecognizer = UIPanGestureRecognizer()
    var sliderCenter = CGPoint()
    var sliderEndCenter = CGPoint()
     let mainBackgroundLight = UIView()
     let unlockBackgroundDark = UIView()
      let lockScreenImageView = UIImageView()
    let statusBarBackground = UIView()
     let statusBarView = UIImageView()
     let mainBackgroundDark = UIView()
      let upperBorder = UIView()
     lazy var transitionDelegate = PresentationManager()
    
    var hasUserTouched = false
            
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        timeFormatter.dateFormat = "h:mm"
        dateFormatter.dateFormat = "EEEE, MMM d"
        dateLabel.text = dateFormatter.string(from: Date())
        timeLabel.text = timeFormatter.string(from: Date())
    }
    
       override public func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        view.backgroundColor = .white
        self.view = view
               
      
        lockScreenImageView.frame = self.view.frame
        lockScreenImageView.image = UIImage(named: "Assets/Wallpaper/wallpaper.jpg")
        lockScreenImageView.contentMode = .scaleAspectFill
        self.view.addSubview(lockScreenImageView)
        
        
        statusBarBackground.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 24)
        statusBarBackground.backgroundColor = .black
        statusBarBackground.alpha = 0.5
        view.bringSubviewToFront(statusBarBackground)
        view.addSubview(statusBarBackground)
        
       
        statusBarView.frame = CGRect(x: 0, y: 3, width: self.view.frame.width, height: 24)
        statusBarView.image = UIImage(named: "Assets/Lock_Screen/statusBar_white.png")
        statusBarView.contentMode = .scaleAspectFit
        view.bringSubviewToFront(statusBarView)
        view.addSubview(statusBarView)
        
       
        lockView.frame = CGRect(x: 0, y: 3, width: self.view.frame.width, height: 24)
        lockView.image = UIImage(named: "Assets/Lock_Screen/lock.png")
        lockView.contentMode = .scaleAspectFit
        view.bringSubviewToFront(lockView)
        view.addSubview(lockView)
        
       
        mainBackgroundLight.frame = CGRect(x: 0, y: 24, width: self.view.frame.width, height: 56)
        mainBackgroundLight.backgroundColor = .darkGray
        mainBackgroundLight.alpha = 0.5
        view.bringSubviewToFront(mainBackgroundLight)
        view.addSubview(mainBackgroundLight)
        
       
            mainBackgroundDark.frame = CGRect(x: 0, y: 80, width: self.view.frame.width, height: 56)
            mainBackgroundDark.backgroundColor = .black
            mainBackgroundDark.alpha = 0.4
            view.bringSubviewToFront(mainBackgroundDark)
            view.addSubview(mainBackgroundDark)
    
      
        upperBorder.frame = CGRect(x: 0, y: 136, width: self.view.frame.width, height: 1.5)
                  upperBorder.backgroundColor = .black
        upperBorder.alpha = 0.75
                  view.bringSubviewToFront(upperBorder)
                  view.addSubview(upperBorder)
              
        
        timeFormatter.dateFormat = "h:mm"
        
        
       
        timeLabel.text = timeFormatter.string(from: Date())
        timeLabel.shadowColor = .black
        timeLabel.textColor = .white
        timeLabel.font = UIFont(name: "Helvetica-Light", size: 94)
      //  timeLabel.backgroundColor = .white
        timeLabel.frame = CGRect(x: 0, y: 36, width: 320, height: 74)
        view.addSubview(timeLabel)
         view.bringSubviewToFront(timeLabel)
        timeLabel.textAlignment = .center
        
            
        dateFormatter.dateFormat = "EEEE, MMM d"
        dateLabel.text = dateFormatter.string(from: Date())
          dateLabel.textColor = .white
          dateLabel.font = UIFont(name: "Helvetica-Light", size: 17)
         //timeLabel.backgroundColor = .white
          dateLabel.frame = CGRect(x: 0, y: 110, width: 320, height: 26)
          view.addSubview(dateLabel)
          view.bringSubviewToFront(dateLabel)
          dateLabel.textAlignment = .center
        
       
        lowerBorder.frame = CGRect(x: 0, y: self.view.frame.height - 58 * 2, width: self.view.frame.width, height: 1.5)
        lowerBorder.backgroundColor = .black
        lowerBorder.alpha = 0.75
        view.bringSubviewToFront(lowerBorder)
        view.addSubview(lowerBorder)
                     
        
       
        unlockBackgroundLight.frame = CGRect(x: 0, y: self.view.frame.height - 58 * 2, width: self.view.frame.width, height: 58)
               unlockBackgroundLight.backgroundColor = .darkGray
               unlockBackgroundLight.alpha = 0.5
               
               view.bringSubviewToFront(unlockBackgroundLight)
               view.addSubview(unlockBackgroundLight)
               
       
        unlockBackgroundDark.frame = CGRect(x: 0, y: self.view.frame.height - 58, width: self.view.frame.width, height: 58)
        unlockBackgroundDark.backgroundColor = .black
        unlockBackgroundDark.alpha = 0.4
        view.bringSubviewToFront(unlockBackgroundDark)
        view.addSubview(unlockBackgroundDark)
        
      
               lockScreenImageViewMask.frame = self.view.frame
               lockScreenImageViewMask.image = UIImage(named: "Assets/Wallpaper/wallpaper.jpg")
               lockScreenImageViewMask.contentMode = .scaleAspectFill
              
        
      
       unlockDentMask.backgroundColor = .black
       unlockDentMask.frame = CGRect(x: 21, y: self.view.frame.height - 85, width: 278, height: 52)
        
        unlockDentMask.layer.cornerRadius = 12.0
        view.bringSubviewToFront(unlockDentMask)
      //  lockScreenImageViewMask.mask = unlockDentMask
      //   self.view.addSubview(lockScreenImageViewMask)
       
        
      
          unlockDent.frame = CGRect(x: 21, y: self.view.frame.height - 85, width: 278, height: 52)
        unlockDent.backgroundColor = .clear
        
        let backgroundLayer = Colors(firstColor: UIColor.black.withAlphaComponent(0.95).cgColor, secondColor: UIColor.black.withAlphaComponent(0.65).cgColor, locations: [0.0, 1.0]).gl
        backgroundLayer.frame = unlockDent.bounds
        unlockDent.layer.cornerRadius = 12.0
        unlockDent.layer.borderWidth = 1.5
        unlockDent.layer.borderColor = UIColor.gray.withAlphaComponent(0.75).cgColor
        unlockDent.clipsToBounds = true
              unlockDent.alpha = 0.9
        unlockDent.layer.insertSublayer(backgroundLayer, at: 0)
        view.addSubview(unlockDent)
        view.bringSubviewToFront(unlockDent)
        
        //67 by 42 rectangle
        
       
        
        sliderView.frame = CGRect(x: 25.5, y: self.view.frame.height - 80, width: 67, height: 42.75)
        sliderEndCenter = CGPoint(x: 262, y: 421.375)
        sliderCenter = sliderView.center
        sliderView.isUserInteractionEnabled = true
        sliderView.clipsToBounds = true
        sliderView.layer.cornerRadius = 11.0
        sliderView.backgroundColor = .clear
        
        let sliderBackground = Colors(firstColor: UIColor(hex: "#fafafaff")!.cgColor, secondColor: UIColor(hex: "#e8e6e5ff")!.cgColor, locations: [0.45, 0.55]).gl
        
        sliderBackground.frame = sliderView.bounds
        
        sliderView.layer.insertSublayer(sliderBackground, at: 0)
        
        view.addSubview(sliderView)
        
        let arrowView = UIImageView()
        arrowView.image = UIImage(named: "Assets/Lock_Screen/arrow_unlock.png")
        arrowView.frame = CGRect(x: 18, y: 8, width: 32, height: 25)
        arrowView.contentMode = .scaleAspectFit
        sliderView.addSubview(arrowView)
        
       
        slideToUnlock.frame = CGRect(x: 115, y: self.view.frame.height - 85, width: 278, height: 52)
        slideToUnlock.text = "slide to unlock"
        slideToUnlock.font = UIFont(name: "Helvetica", size: 24)
        slideToUnlock.textColor = UIColor.white
        slideToUnlock.alpha = 0.5
        
        view.addSubview(slideToUnlock)
        
        gestureRecognizer.addTarget(self, action: #selector(handlePan))
        sliderView.addGestureRecognizer(gestureRecognizer)
        
        
    }
    
   @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        
        
        let translation = gesture.translation(in: view).x
        
        guard let gestureView = gesture.view else {return}
    if gestureView.center.x < sliderEndCenter.x {
        if gestureView.center.x >= sliderCenter.x {
               if gestureView.center.x == sliderCenter.x {
                   if translation >= 0 {
                        gestureView.center = CGPoint(x: gestureView.center.x + translation, y: gestureView.center.y)
                   }
               } else if gestureView.center.x > sliderCenter.x {
                    gestureView.center = CGPoint(x: gestureView.center.x + translation, y: gestureView.center.y)
                   
                   slideToUnlock.alpha = (160 - gestureView.center.x) / 200
                   
                   if gestureView.center == sliderEndCenter {
                       
                   }
                   
                   if gesture.state == UIGestureRecognizer.State.ended {
                        if gestureView.center != sliderCenter {
                           UIView.animate(withDuration: 0.35) {
                               gestureView.center = self.sliderCenter
                               
                           }
                           UIView.animate(withDuration: 0.35, delay: 0.3, options: [], animations: {
                               self.slideToUnlock.alpha = 0.5
                           }, completion: nil)
                       }
                   }
                   
                   
               }
               
        } else {
            
                gestureView.center = self.sliderCenter
            
        }
    } else if gestureView.center.x == sliderEndCenter.x {
        
        
        unlock()
        
        
    } else {
        gestureView.center = sliderEndCenter
    }
   
    
    
     gesture.setTranslation(.zero, in: view)
    
    }
    
    
    func unlock() {
        view.bringSubviewToFront(statusBarBackground)
         view.bringSubviewToFront(statusBarView)
         view.bringSubviewToFront(lockView)
        
        
         UIView.animate(withDuration: 0.25, animations: {
              self.lockView.alpha = 0
                        self.statusBarBackground.alpha = 1
             self.view.backgroundColor = .black
         })
        UIView.animate(withDuration: 0.5, animations: {
                self.timeLabel.center = CGPoint(x: self.timeLabel.center.x, y: self.timeLabel.center.y - 25 )
                self.dateLabel.center = CGPoint(x: self.dateLabel.center.x, y: self.dateLabel.center.y - 25 )
               self.mainBackgroundDark.center = CGPoint(x: self.mainBackgroundDark.center.x, y: self.mainBackgroundDark.center.y - 25 )
                   self.mainBackgroundLight.center = CGPoint(x: self.mainBackgroundLight.center.x, y: self.mainBackgroundLight.center.y - 25 )
                self.upperBorder.center = CGPoint(x: self.upperBorder.center.x, y: self.upperBorder.center.y - 25 )
                
                 self.unlockBackgroundDark.center = CGPoint(x: self.unlockBackgroundDark.center.x, y: self.unlockBackgroundDark.center.y + 25 )
                 self.unlockBackgroundLight.center = CGPoint(x: self.unlockBackgroundLight.center.x, y: self.unlockBackgroundLight.center.y + 25 )
                self.slideToUnlock.center = CGPoint(x: self.slideToUnlock.center.x, y: self.slideToUnlock.center.y + 25 )
                self.unlockDent.center = CGPoint(x: self.unlockDent.center.x, y: self.unlockDent.center.y + 25 )
                self.lowerBorder.center = CGPoint(x: self.lowerBorder.center.x, y: self.lowerBorder.center.y + 25 )
               self.sliderView.center = CGPoint(x: self.sliderView.center.x, y: self.sliderView.center.y + 25 )
                self.lockScreenImageView.alpha = 0
               
               
        }, completion: { (_) in
            let vc = MySecondViewController()
            vc.transitioningDelegate = self.transitionDelegate
            vc.modalPresentationStyle = .custom
            self.present(vc, animated: false)
            })
    }
    
    
}
