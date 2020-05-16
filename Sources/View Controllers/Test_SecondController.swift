import UIKit


public class MySecondViewController : UIViewController {
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.view.transform = CGAffineTransform.identity
        })
    }
    
    @objc func buttonAction()
    {
        
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.0001)
            }, completion: { _ in
                self.dismiss(animated: false, completion: nil)
                
        })
        
    }
    
    public override func viewDidLoad() {
            super.viewDidLoad()
                   let view = UIView()
                   view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
    view.backgroundColor = .red
                   self.view = view
                   
                   let button = UIButton()
                   button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
                   
                   button.setTitle("Button", for: .normal)
                   button.setTitleColor(.white, for: .normal)
                   button.center = self.view.center
                   button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
                   view.addSubview(button)
                    
        }
    }

