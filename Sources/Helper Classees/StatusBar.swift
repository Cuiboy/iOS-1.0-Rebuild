import UIKit

public class StatusBar: UIView {
    
    var isWhite: Bool
    var timer = Timer()
    let statusBarView = UIImageView()
    let timeView = UILabel()
    var color = UIColor()
    let formatter = DateFormatter()
    
    public init(isWhite: Bool) {
        
        self.isWhite = isWhite
        super.init(frame: CGRect(x: 0, y: 0, width: 320, height: 24))
        setUpView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startTimer(){
            timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        }
    
    @objc func update() {
            
            formatter.dateFormat = "h:mm a"
            timeView.text = formatter.string(from: Date())
        
        }
        
    
    func setUpView() {
       
        formatter.dateFormat = "h:mm a"
        statusBarView.frame = self.bounds
        timeView.frame = self.bounds
        
        if isWhite {
            color = .white
             statusBarView.image = UIImage(named: "Assets/Lock_Screen/statusBar_white.png")
        } else {
            color = .black
             statusBarView.image = UIImage(named: "Assets/Lock_Screen/statusBar_black.png")
        }
        
        statusBarView.contentMode = .scaleAspectFit
        timeView.text = formatter.string(from: Date())
        timeView.font = UIFont(name: "Helvetica-Bold", size: 12)
        timeView.textColor = color
        timeView.textAlignment = .center
        
        self.addSubview(timeView)
        self.addSubview(statusBarView)
       
         startTimer()

    }


    

    
    
}

