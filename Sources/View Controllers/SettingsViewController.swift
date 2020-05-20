import UIKit



public class SettingsViewController: UIViewController, UITableViewDelegate {
    
    var appLabels = [
        "General",
        "Mail, Contacts, Calendar",
        "Phone",
        "Text",
        "Calendar",
        "Photos",
        "Camera",
        "YouTube",
        "Stocks",
        "Maps",
        "Weather",
        "Clock",
        "Calculator",
        "Notes",
        "Safari",
        "iPod"
        
    ]
    
    
    var appIcons = [
        UIImage(named: "Assets/Home_Screen/settings.png"),
        UIImage(named: "Assets/Home_Screen/mail.png"),
        UIImage(named: "Assets/Home_Screen/phone.png"),
        UIImage(named: "Assets/Home_Screen/text.png"),
        UIImage(named: "Assets/Home_Screen/calendar_BUILD.png"),
        UIImage(named: "Assets/Home_Screen/photos.png"),
        UIImage(named: "Assets/Home_Screen/camera.png"),
        UIImage(named: "Assets/Home_Screen/youtube.png"),
        UIImage(named: "Assets/Home_Screen/stocks.png"),
        UIImage(named: "Assets/Home_Screen/maps.png"),
        UIImage(named: "Assets/Home_Screen/weather.png"),
        UIImage(named: "Assets/Home_Screen/clock.png"),
        UIImage(named: "Assets/Home_Screen/calculator.png"),
        UIImage(named: "Assets/Home_Screen/notes.png"),
        UIImage(named: "Assets/Home_Screen/safari.png"),
        UIImage(named: "Assets/Home_Screen/iPod.png")
    ]
    
    
    
    
    
    let topBar = ClassicNavigationBar(title: "Settings")
    
    
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
        //set up the basic view rectangle
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        view.backgroundColor = UIColor(hex: "#cad0d8ff")
        self.view = view
        
        let scrollView: UIScrollView = {
            let v = UIScrollView()
            v.translatesAutoresizingMaskIntoConstraints = false
            v.backgroundColor = UIColor(hex: "#cad0d8ff")
            return v
        }()
        
        self.view.addSubview(scrollView)
        
        let bottomLabel: UILabel = {
            let label = UILabel()
            label.text = "Made by Patrick Cui in Swift"
            label.font = UIFont(name: "Helvetica-Light", size: 12)
            label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 68).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        
        scrollView.addSubview(bottomLabel)
        
        
        bottomLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 85).isActive = true
        
        
        bottomLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 750).isActive = true
        
        
        bottomLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -16.0).isActive = true
        bottomLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16.0).isActive = true
        //make container view
        
        let containerView:UIView = UIView(frame:CGRect(x: 10, y: 20, width: 300, height: 700))
        let settingsTable = UITableView(frame: containerView.bounds)
        
        containerView.backgroundColor = .clear
        
        //decalre tableView
        
        settingsTable.layer.cornerRadius = 10
        settingsTable.layer.masksToBounds = true
        containerView.addSubview(settingsTable)
        scrollView.addSubview(containerView)
        
        
        settingsTable.backgroundColor = .white
        settingsTable.register(Cell.self, forCellReuseIdentifier: "settingsCell")
        
        //declare delgates
        settingsTable.delegate = self
        
        settingsTable.dataSource = self
        
        settingsTable.isScrollEnabled = false
        
        settingsTable.allowsSelection = false
        
        //add navigation bar
        
        self.view.addSubview(topBar)
        view.bringSubviewToFront(topBar)
        
        //add status bar
        
        self.view.addSubview(StatusBar(isWhite: false))
        
        
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.view.transform = CGAffineTransform.identity
        })
    }
    
    
}

extension SettingsViewController: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return appLabels.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! Cell
        
        cell.appText = appLabels[indexPath.row]
        cell.appImage = appIcons[indexPath.row]!
        
        return cell
    }
    
}


public class Cell: UITableViewCell {
    
    static var identifier: String = "Cell"
    
    var appText: String? {
        didSet {
            itemText.text = appText
        }
    }
    var appImage: UIImage? {
        didSet {
            iconView.image = appImage
        }
    }
    
    let iconView = UIImageView()
    let itemText = UILabel()
    
    
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        
        
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconView.frame = CGRect(x: 8, y: 8, width: 30, height: 30)
        itemText.frame = CGRect(x: 45, y: 13, width: 200, height: 20)
        itemText.textColor = .black
        itemText.font = UIFont(name: "Helvetica-Bold", size: 13)
        iconView.contentMode = .scaleAspectFill
        
        self.contentView.addSubview(iconView)
        self.contentView.addSubview(itemText)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}






