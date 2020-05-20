import UIKit

public class PhoneViewController: UIViewController {
    
    @objc func buttonAction()
       {
           
           UIView.animate(withDuration: 0.5, animations: { [weak self] in
               self?.view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.0001)
               }, completion: { _ in
                   self.dismiss(animated: false, completion: nil)
                   
           })
           
       }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        view.backgroundColor = .white
        self.view = view
        
        NotificationCenter.default.addObserver(self, selector: #selector(buttonAction), name: NSNotification.Name("homePressed"), object: nil)
        
        view.addSubview(ClassicTabBar(titles: ["Favorites", "Recents", "Contacts", "Keypad", "Voicemail"], images: ["star.fill", "clock", "Assets/Elements/contacts.png", "Assets/Elements/keypad.png", "Assets/Elements/voicemail.png"]))
        
        
        
    }
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.view.transform = CGAffineTransform.identity
        })
    }
}
