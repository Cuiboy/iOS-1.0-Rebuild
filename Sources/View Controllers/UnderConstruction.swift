import UIKit



public class UnderConstructionViewController : UIViewController {
    
   
    
      let textLabel = UILabel()
   
   
    
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.view.transform = CGAffineTransform.identity
        })
    }
    
    /*
     public override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
            UIView.animate(withDuration: 0.5, animations: { [weak self] in
                self?.view.transform = CGAffineTransform.identity
            })
        }
     */
    
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
                   view.frame = CGRect(x: 0, y: 50, width: 320, height: 480)
                    view.backgroundColor = UIColor(hex: "#d4dae8ff")
                   self.view = view
                    
                    NotificationCenter.default.addObserver(self, selector: #selector(buttonAction), name: NSNotification.Name("homePressed"), object: nil)
        textLabel.text = "This app is still under construction"
        textLabel.textColor = .gray
        textLabel.font = UIFont(name: "Helvetica-Bold", size: 14)
        textLabel.frame = CGRect(x: 0, y: 250, width: self.view.frame.width, height: 40)
        textLabel.textAlignment = .center
        view.addSubview(textLabel)
        
        let constructionImageView = UIImageView()
        
        constructionImageView.frame = CGRect(x: 85, y: 100, width: 150, height: 150)
        constructionImageView.alpha = 0.5
        constructionImageView.image = UIImage(named: "Assets/UnderConstruction.png")
        
        constructionImageView.contentMode = .scaleAspectFit
        
        self.view.addSubview(constructionImageView)
        
        self.view.addSubview(StatusBar(isWhite: false))
        
                    
        }
    }

