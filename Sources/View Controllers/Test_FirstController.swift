import UIKit

public class FirstController: UIViewController {
    
    lazy var transitionDelegate = PresentationManager()
    
    @objc func buttonAction() {
      //  let vc = MySecondViewController()
      //  vc.transitioningDelegate = transitionDelegate
      //  vc.modalPresentationStyle = .custom/
     //   present(vc, animated: false)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
               let view = UIView()
               view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
               view.backgroundColor = .yellow
               self.view = view
               
               let button = UIButton()
               button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
               
               button.setTitle("Button", for: .normal)
               button.setTitleColor(.blue, for: .normal)
               button.center = self.view.center
               button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
               view.addSubview(button)
    }
}


