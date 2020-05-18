import UIKit


class ClassicNavigationBar: UIView {
    
    var title: String
    let background = UIView()
    
    
    init(title: String) {
        self.title = title
        super.init(frame: CGRect(x: 0, y: 24, width: 320, height: 46))
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
        background.frame = CGRect(x: 0, y: 0, width: 320, height: 46)
        
        let backgroundLayer = Colors(firstColor: UIColor(hex: "#b0bccaff")!.cgColor, secondColor: UIColor(hex: "#7c90abff")!.cgColor, locations: [0.2, 0.8]).gl
        backgroundLayer.frame = background.bounds
        background.layer.insertSublayer(backgroundLayer, at: 0)
        
        self.addSubview(background)
 
        let upperBorder = UIView()
        upperBorder.frame = CGRect(x: 0, y: 0, width: 320, height: 1)
        upperBorder.backgroundColor = .black
        background.addSubview(upperBorder)
        
        let lowerBorder = UIView()
        lowerBorder.frame = CGRect(x: 0, y: 46, width: 320, height: 1)
        lowerBorder.backgroundColor = .black
        background.addSubview(lowerBorder)
        
        let barTitle = UILabel()
        barTitle.text = title
        barTitle.textColor = .white
        barTitle.font = UIFont(name: "Helvetica-Bold", size: 20)
        barTitle.textAlignment = .center
        barTitle.frame = background.frame
        barTitle.center = background.center
        barTitle.shadowColor = .black
        self.addSubview(barTitle)
    }
    
    
}

