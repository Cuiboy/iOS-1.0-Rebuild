import UIKit


public class ClassicTabBar: UIView {
    
    var buttonTitles: [String]
    var buttonImages: [String]
    var width = CGFloat()
    var icons = [UIView]()
    
    var selectedIndex = 0
    
    
    public init(titles: [String], images: [String]) {
        self.buttonTitles = titles
        self.buttonImages = images
        super.init(frame: CGRect(x: 0, y: 431, width: 320, height: 49))
        setUpView()
    }
    
    @objc func updateTap(_ notification: NSNotification) {
        if let index = notification.userInfo?["index"] as? Int {
            selectedIndex = index
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "tapReceived"), object: nil, userInfo: ["index" : selectedIndex])
            
        } else {
            print("failed")
        }
    }
    
    func setUpView() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTap), name: NSNotification.Name(rawValue: "tabPressed"), object: nil)
        
        width = CGFloat(320 / buttonTitles.count)
        
        var upperBackground: UIView {
            let v = UIView()
            v.frame = CGRect(x: 0, y: 2, width: 320, height: 23.5)
            v.backgroundColor = UIColor(hex: "#232323ff")
            return v
        }
        
        var lowerBackground: UIView {
            let v = UIView()
            v.frame = CGRect(x: 0, y: 25.5, width: 320, height: 23.5)
            v.backgroundColor = .black
            return v
        }
        
        var upperBorder: UIView {
            let v = UIView()
            v.frame = CGRect(x: 0, y: 0, width: 320, height: 1)
            v.backgroundColor = .black
            return v
        }
        
        var lowerBorder: UIView {
            let v = UIView()
            v.frame = CGRect(x: 0, y: 1, width: 320, height: 1)
            v.backgroundColor = UIColor(hex: "#434343ff")
            return v
        }
        
        
        self.addSubview(upperBorder)
        self.addSubview(lowerBorder)
        self.addSubview(upperBackground)
        self.addSubview(lowerBackground)
        
        
        
        
        for i in 0..<buttonTitles.count {
            
            icons.append(ClassicTabBarIcon(iconName: buttonImages[i], text: buttonTitles[i], width: width, position: CGFloat(i) * width, currentIndex: i, selectedIndex: 0))
            
        }
        
        for i in 0 ..< icons.count {
            self.addSubview(icons[i])
        }
        
        
    }
    
    
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

public class ClassicTabBarIcon: UIView {
    
    var iconName: String
    var textInput: String
    var width: CGFloat
    var position: CGFloat
    var currentIndex: Int
    var selectedIndex: Int
    
    var selected = false
    let gestureReconizer = UITapGestureRecognizer()
    var indexDict = [String: Int]()
    
    public init(iconName: String, text: String, width: CGFloat, position: CGFloat, currentIndex: Int, selectedIndex: Int) {
        self.iconName = iconName
        self.textInput = text
        self.width = width
        self.position = position
        self.currentIndex = currentIndex
        self.selectedIndex = selectedIndex
        
        super.init(frame: CGRect(x: position, y: 0, width: self.width, height: 48))
        
        setUpView()
    }
    
    let gradient = UIView()
    
    var iconLabel = UILabel()
    
    let selectedBackground = UIView()
    
    
    @objc func tapped() {
        
        
        NotificationCenter.default.post(name: NSNotification.Name("tabPressed"), object: nil, userInfo: indexDict)
        
    }
    
    @objc func tapReceived(_ notification: NSNotification) {
        
        selectedIndex = (notification.userInfo?["index"])! as! Int
        
        if currentIndex == selectedIndex {
            let backgroundLayer = Colors(firstColor: UIColor(hex: "#ADC7EAff")!.cgColor, secondColor: UIColor(hex: "#33ABF9ff")!.cgColor, locations: [0.0, 1.0]).gl
            backgroundLayer.frame = gradient.bounds
            gradient.layer.sublayers?.first?.removeFromSuperlayer()
            gradient.layer.insertSublayer(backgroundLayer, at: 0)
            iconLabel.textColor = .white
            selectedBackground.isHidden = false
        } else {
            let backgroundLayer = Colors(firstColor: UIColor(hex: "#a4a4a3ff")!.cgColor, secondColor: UIColor(hex: "#5d5e5eff")!.cgColor, locations: [0.0, 1.0]).gl
            //
            backgroundLayer.frame = gradient.bounds
            gradient.layer.sublayers?.first?.removeFromSuperlayer()
            gradient.layer.insertSublayer(backgroundLayer, at: 0)
            iconLabel.textColor = .gray
            selectedBackground.isHidden = true
        }
        
    }
    
    
    func setUpView() {
        
        
        indexDict = ["index" : currentIndex]
        
        NotificationCenter.default.addObserver(self, selector: #selector(tapReceived), name: NSNotification.Name(rawValue: "tapReceived"), object: nil)
        
        gestureReconizer.addTarget(self, action: #selector(tapped))
        self.addGestureRecognizer(gestureReconizer)
        
        selectedBackground.frame = CGRect(x: 1
            , y: 3, width: self.width - 4, height: 44)
        selectedBackground.backgroundColor = UIColor(hex: "#252525ff")
        selectedBackground.layer.cornerRadius = 4
        selectedBackground.clipsToBounds = true
        
        var selectedHighlight: UIView {
            let v = UIView()
            v.frame = CGRect(x: 0, y: 0, width: self.width - 4, height: 22)
            v.backgroundColor = UIColor(hex: "#444444ff")
            return v
        }
        
        selectedBackground.addSubview(selectedHighlight)
        selectedBackground.isHidden = true
        
        self.addSubview(selectedBackground)
        
        let imageView = UIImageView()
        
        imageView.frame = CGRect(x: 0, y: 1, width: width, height: 30)
        
        var image = UIImage()
        
        if iconName.contains(".png") {
            imageView.frame = CGRect(x: 0, y: 3, width: width, height: 28)
            image = UIImage(named: iconName)!
        } else {
            image = UIImage(systemName: iconName)!
        }
        
        imageView.contentMode = .scaleAspectFit
        
        imageView.image = image
        
        
        
        
        gradient.frame = CGRect(x: 0, y: 2, width: width, height: 32)
        
        var backgroundLayer = Colors(firstColor: UIColor(hex: "#a4a4a3ff")!.cgColor, secondColor: UIColor(hex: "#5d5e5eff")!.cgColor, locations: [0.0, 1.0]).gl
        
        
        
        iconLabel.frame = CGRect(x: 0, y: 35, width: width, height: 11)
        iconLabel.text = textInput
        iconLabel.font = UIFont(name: "Helvetica-Bold", size: 9)
        iconLabel.textColor = .gray
        iconLabel.textAlignment = .center
        
        
        if currentIndex == selectedIndex {
            backgroundLayer = Colors(firstColor: UIColor(hex: "#ADC7EAff")!.cgColor, secondColor: UIColor(hex: "#33ABF9ff")!.cgColor, locations: [0.0, 1.0]).gl
            iconLabel.textColor = .white
            selectedBackground.isHidden = false
        }
        
        
        
        backgroundLayer.frame = gradient.bounds
        gradient.layer.insertSublayer(backgroundLayer, at: 0)
        
        
        self.addSubview(gradient)
        self.addSubview(imageView)
        
        gradient.mask = imageView
        
        
        
        
        self.addSubview(iconLabel)
        
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
}
