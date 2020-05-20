import UIKit




public class CalculatorViewController: UIViewController {
    
    let textArray = [
        "mc",
        "m+",
        "m-",
        "mr",
        "C",
        "( - )",
        "/",
        "x",
        "7",
        "8",
        "9",
        "—",
        "4",
        "5",
        "6",
        "+",
        "1",
        "2",
        "3",
        ".",
    ]
    func buildButton(at x: CGFloat, y: CGFloat, withColors firstColor: UIColor, secondColor: UIColor, textCount: Int) -> UIView {
        
        let regButton = UIView()
        regButton.frame = CGRect(x: x, y: y, width: 64, height: 40)
        let backgroundLayer = Colors(firstColor: firstColor.cgColor, secondColor: secondColor.cgColor, locations: [0.0, 0.6]).gl
        // let backgroundLayer = Colors(firstColor: UIColor(hex: "#696969ff")!.cgColor, secondColor: UIColor.black.cgColor, locations: [0.1, 0.9]).gl
        backgroundLayer.frame = regButton.bounds
        regButton.layer.insertSublayer(backgroundLayer, at: 0)
        
        regButton.layer.cornerRadius = 8
        regButton.clipsToBounds = true
        
        let textLabel = UILabel()
        textLabel.frame = CGRect(x: 0, y: 0, width: 64, height: 40)
        textLabel.textAlignment = .center
        textLabel.font = UIFont(name: "Helvetica-Bold", size: 20)
        textLabel.text = textArray[textCount]
        textLabel.textColor = .white
        regButton.addSubview(textLabel)
        
        
        return regButton
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
        NotificationCenter.default.addObserver(self, selector: #selector(buttonAction), name: NSNotification.Name("homePressed"), object: nil)
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        view.backgroundColor = UIColor(hex: "#1f1f21ff")
        self.view = view
        
        view.addSubview(StatusBar(isWhite: true))
        
        let result = UIView()
        result.frame = CGRect(x: 0, y: 24, width: 320, height: 80)
        // result.backgroundColor = UIColor(hex: "#d7d8b4ff")
        let backgroundLayer = Colors(firstColor: UIColor(hex: "#e7ebd6ff")!.cgColor, secondColor: UIColor(hex: "#d7d8b4ff")!.cgColor, locations: [0.2, 0.8]).gl
        backgroundLayer.frame = result.bounds
        result.layer.insertSublayer(backgroundLayer, at: 0)
        view.addSubview(result)
        
        var firstTextCount = 0
        var secondTextCount = 16
        
        
        for i in 0...3 {
            for j in 0...3 {
                switch i {
                case 0:
                    view.addSubview(buildButton(at: CGFloat(10 + j * 78), y: CGFloat(120 + i * 60), withColors: UIColor(hex: "#a3a3a5ff")!, secondColor: UIColor(hex: "#575C60ff")!, textCount: firstTextCount))
                case 1:
                    view.addSubview(buildButton(at: CGFloat(10 + j * 78), y: CGFloat(120 + i * 60), withColors: UIColor(hex: "#bcb8b5ff")!, secondColor: UIColor(hex: "#65554aff")!, textCount: firstTextCount))
                case 2, 3:
                    if j < 3 {
                        view.addSubview(buildButton(at: CGFloat(10 + j * 78), y: CGFloat(120 + i * 60), withColors: UIColor(hex: "#696969ff")!, secondColor: .black, textCount: firstTextCount))
                    } else {
                        view.addSubview(buildButton(at: CGFloat(10 + j * 78), y: CGFloat(120 + i * 60), withColors: UIColor(hex: "#bcb8b5ff")!, secondColor: UIColor(hex: "#65554aff")!, textCount: firstTextCount))
                    }
                default: break
                }
                firstTextCount += 1
            }
        }
        
        for k in 0...2 {
            view.addSubview(buildButton(at: CGFloat(10 + k * 78), y: CGFloat(360), withColors: UIColor(hex: "#696969ff")!, secondColor: .black, textCount: secondTextCount))
            secondTextCount += 1
        }
        
        view.addSubview(buildButton(at: CGFloat(166), y: CGFloat(420), withColors: UIColor(hex: "#696969ff")!, secondColor: .black, textCount: 19))
        
        let zeroButton = UIView()
        zeroButton.frame = CGRect(x: 10, y: 420, width: 142, height: 40)
        
        let zeroLayer = Colors(firstColor: UIColor(hex: "#696969ff")!.cgColor, secondColor: UIColor.black.cgColor, locations: [0.0, 0.6]).gl
        // let backgroundLayer = Colors(firstColor: UIColor(hex: "#696969ff")!.cgColor, secondColor: UIColor.black.cgColor, locations: [0.1, 0.9]).gl
        zeroLayer.frame = zeroButton.bounds
        zeroButton.layer.insertSublayer(zeroLayer, at: 0)
        
        zeroButton.layer.cornerRadius = 8
        zeroButton.clipsToBounds = true
        
        let zeroLabel = UILabel()
        zeroLabel.frame = CGRect(x: 0, y: 0, width: 64, height: 40)
        zeroLabel.textAlignment = .center
        zeroLabel.font = UIFont(name: "Helvetica-Bold", size: 20)
        zeroLabel.text = "0"
        zeroLabel.textColor = .white
        zeroButton.addSubview(zeroLabel)
        
        
        view.addSubview(zeroButton)
        
        let equalButton = UIView()
        equalButton.frame = CGRect(x: 244, y: 360, width: 64, height: 100)
        
        let equalLayer = Colors(firstColor: UIColor(hex: "#fcbb8cff")!.cgColor, secondColor: UIColor(hex: "#f77f21ff")!.cgColor, locations: [0.0, 0.6]).gl
        // let backgroundLayer = Colors(firstColor: UIColor(hex: "#696969ff")!.cgColor, secondColor: UIColor.black.cgColor, locations: [0.1, 0.9]).gl
        equalLayer.frame = equalButton.bounds
        equalButton.layer.insertSublayer(equalLayer, at: 0)
        
        equalButton.layer.cornerRadius = 8
        equalButton.clipsToBounds = true
        let equalLabel = UILabel()
        equalLabel.frame = CGRect(x: 0, y: 70, width: 64, height: 30)
        equalLabel.textAlignment = .center
        equalLabel.font = UIFont(name: "Helvetica-Bold", size: 20)
        equalLabel.text = "="
        equalLabel.textColor = .white
        equalButton.addSubview(equalLabel)
        
        view.addSubview(equalButton)
        
    }
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.view.transform = CGAffineTransform.identity
        })
    }
    
    
}














