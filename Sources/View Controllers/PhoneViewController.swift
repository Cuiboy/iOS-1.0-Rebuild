import UIKit

//public class PhoneViewController: UIViewController {
//
//    @objc func buttonAction()
//       {
//
//           UIView.animate(withDuration: 0.5, animations: { [weak self] in
//               self?.view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.0001)
//               }, completion: { _ in
//                   self.dismiss(animated: false, completion: nil)
//
//           })
//
//       }
//
//    override public func viewDidLoad() {
//        super.viewDidLoad()
//
//        let view = UIView()
//        view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
//        view.backgroundColor = .white
//        self.view = view
//
//        NotificationCenter.default.addObserver(self, selector: #selector(buttonAction), name: NSNotification.Name("homePressed"), object: nil)
//
//        view.addSubview(ClassicTabBar(titles: ["Favorites", "Recents", "Contacts", "Keypad", "Voicemail"], images: ["star.fill", "clock", "Assets/Elements/contacts.png", "Assets/Elements/keypad.png", "Assets/Elements/voicemail.png"]))
//
//
//
//    }
//    public override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
//        UIView.animate(withDuration: 0.5, animations: { [weak self] in
//            self?.view.transform = CGAffineTransform.identity
//        })
//    }
//}

public class PhoneViewController: UIViewController {
    
    let blueView = UIView()
    let redView = UIView()
    var switcher = false
    
    let favoritesView = UIView()
    let recentsView = UIView()
    let contactsView = UIView()
    let keypadView = UIView()
    let voiceMailView = UIView()
    
    @objc func pageChanged(_ notification: NSNotification) {
        
        if let infoIndex = notification.userInfo?["index"] as? Int {
            
            switch infoIndex {
            case 0: self.view.bringSubviewToFront(favoritesView)
            case 1: self.view.bringSubviewToFront(recentsView)
            case 2: self.view.bringSubviewToFront(contactsView)
            case 3: self.view.bringSubviewToFront(keypadView)
            case 4: self.view.bringSubviewToFront(voiceMailView)
            default: self.view.bringSubviewToFront(favoritesView)
            }
        }
        
    }
    
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
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(pageChanged), name: NSNotification.Name(rawValue: "tabPressed"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(buttonAction), name: NSNotification.Name("homePressed"), object: nil)
        
        favoritesView.frame = CGRect(x: 0, y: 24, width: 320, height: 407)
        favoritesView.backgroundColor = .red
        self.view.addSubview(favoritesView)
        
        
        recentsView.frame = CGRect(x: 0, y: 24, width: 320, height: 407)
        recentsView.backgroundColor = .blue
        self.view.addSubview(recentsView)
        
        
        contactsView.frame = CGRect(x: 0, y: 24, width: 320, height: 407)
        contactsView.backgroundColor = .green
        self.view.addSubview(contactsView)
        
        
        keypadView.frame = CGRect(x: 0, y: 24, width: 320, height: 407)
        keypadView.backgroundColor = .gray
        self.view.addSubview(keypadView)
        
        
        voiceMailView.frame = CGRect(x: 0, y: 24, width: 320, height: 407)
        voiceMailView.backgroundColor = .yellow
        self.view.addSubview(voiceMailView)
        
        self.view.bringSubviewToFront(favoritesView)
        
        
        self.view.addSubview(StatusBar(isWhite: false))
        
        
        self.view.addSubview(ClassicTabBar(titles: ["Favorites", "Recents", "Contacts", "Keypad", "Voicemail"], images: ["star.fill", "clock", "Assets/Elements/contacts.png", "Assets/Elements/keypad.png", "Assets/Elements/voicemail.png"]))
        
        
    }
    
      public override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
            UIView.animate(withDuration: 0.5, animations: { [weak self] in
                self?.view.transform = CGAffineTransform.identity
            })
        }
    
    
    
    
    
    
}
