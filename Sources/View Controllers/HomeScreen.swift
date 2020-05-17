import UIKit


public class HomeScreenViewController: UIViewController {

    weak var collectionView: UICollectionView!
    weak var dockView: UICollectionView!

    
    var appLabels = [
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
        "Settings"
    ]
    
    var dockLabels = [
        "Phone",
        "Mail",
        "Safari",
        "iPod"
    ]

    
    var appIcons = [
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
        UIImage(named: "Assets/Home_Screen/settings.png")
    ]
    
    var dockIcons =  [
     UIImage(named: "Assets/Home_Screen/phone.png"),
     UIImage(named: "Assets/Home_Screen/mail.png"),
     UIImage(named: "Assets/Home_Screen/safari.png"),
     UIImage(named: "Assets/Home_Screen/iPod.png")
    ]
    
    
    
    override public func loadView() {
        super.loadView()
       let view = UIView()
       view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
       view.backgroundColor = .white
       self.view = view
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height * 0.7), collectionViewLayout: UICollectionViewFlowLayout())
          let dockView = UICollectionView(frame: CGRect(x: 0, y: self.view.frame.height - 78, width: self.view.frame.width, height: 78), collectionViewLayout: UICollectionViewFlowLayout())
          
        self.view.addSubview(collectionView)
        self.view.addSubview(dockView)
        self.collectionView = collectionView
        self.dockView = dockView
        
       
        
    }

    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
            self.collectionView.register(Calendar.self, forCellWithReuseIdentifier: Calendar.identifier)
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.backgroundColor = .black
        self.dockView.dataSource = self
            self.dockView.dataSource = self
                   self.dockView.delegate = self
                   self.dockView.register(DockCell.self, forCellWithReuseIdentifier: DockCell.identifier)
                   self.dockView.alwaysBounceVertical = true
                   self.dockView.backgroundColor = .clear
        
        let dock = UIImageView()
        dock.frame = CGRect(x: 0, y: self.view.frame.height - 88, width: self.view.frame.width, height: 78)
        dock.image = UIImage(named: "Assets/Home_Screen/bottom_dock.png")
        
        view.addSubview(dock)
        
        let dockShadow = UIView()
        dockShadow.frame = CGRect(x: 0, y: self.view.frame.height - 82, width: self.view.frame.width, height: 10)
        
        dockShadow.backgroundColor = .black
        dockShadow.alpha = 0.25
       // view.addSubview(dockShadow)
        
        let bottomBar = UIView()
               bottomBar.frame = CGRect(x: 0, y: self.view.frame.height - 14, width: self.view.frame.width, height: 14)
               
               bottomBar.backgroundColor = UIColor(hex: "#81868cff")
        view.bringSubviewToFront(bottomBar)
               view.addSubview(bottomBar)
        
       
        
        view.bringSubviewToFront(dockView)
        
        let statusBarView = UIImageView()
        
               statusBarView.frame = CGRect(x: 0, y: 3, width: self.view.frame.width, height: 24)
               statusBarView.image = UIImage(named: "Assets/Lock_Screen/statusBar_white.png")
               statusBarView.contentMode = .scaleAspectFit
               view.bringSubviewToFront(statusBarView)
               view.addSubview(statusBarView)
        
        let statusBarTime = UILabel()
               
                      statusBarTime.frame = CGRect(x: 0, y: 3, width: self.view.frame.width, height: 24)
        
        let statusFormatter = DateFormatter()
        statusFormatter.dateFormat = "h:mm a"
        
        
        statusBarTime.text = statusFormatter.string(from: Date())
        statusBarTime.textColor = .white
        statusBarTime.font = UIFont(name: "Helvetica-Bold", size: 12)
        statusBarTime.textAlignment = .center
        
                      view.bringSubviewToFront(statusBarTime)
                      view.addSubview(statusBarTime)
        
        
    }
}

extension HomeScreenViewController: UICollectionViewDataSource {

    public func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if collectionView == dockView {
            return dockLabels.count
        } else {
            return appLabels.count
        }
    }

    public func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 
        if collectionView == dockView {
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DockCell.identifier, for: indexPath) as! DockCell
                   cell.textLabel.text = dockLabels[indexPath.item]
                                           cell.imageView.image = dockIcons[indexPath.item]
            cell.textLabel.textColor = UIColor.white
                   return cell
               } else {
            if indexPath.item == 1 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Calendar.identifier, for: indexPath) as! Calendar
                          cell.textLabel.text = appLabels[indexPath.item]
                          cell.imageView.image = appIcons[indexPath.item]
                               cell.textLabel.textColor = UIColor.white
                                      return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
                          cell.textLabel.text = appLabels[indexPath.item]
                          cell.imageView.image = appIcons[indexPath.item]
                               cell.textLabel.textColor = UIColor.white
                                      return cell
            }
                 
               }
       
       
    }
}
/*
 if collectionView == collectionView {
     
 } else {
     
 }
 **/
extension HomeScreenViewController: UICollectionViewDelegate {

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            if collectionView == dockView {
                
            } else {
                
            }
    }
    
    
    
}

extension HomeScreenViewController: UICollectionViewDelegateFlowLayout {

    public func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == dockView {
              return CGSize(width: 60, height: 80)
        } else {
              return CGSize(width: 60, height: 74)
        }
      
    }

    
        
    public func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == dockView {
             return UIEdgeInsets(top: 0, left: 16, bottom: 10, right: 16)
        } else {
             return UIEdgeInsets(top: 40, left: 16, bottom: 0, right: 16)
        }
       
    }

    public func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }

    public func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == dockView {
            print("this case")
             return 0
        } else {
            print("else case")
             return 20
        }
       
    }
}

class Cell: UICollectionViewCell {

    static var identifier: String = "Cell"

    weak var textLabel: UILabel!
    weak var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        let iconView = UIImageView()
        iconView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
       
        iconView.contentMode = .scaleAspectFill
        
        let text = UILabel()
        text.frame = CGRect(x: 0, y: 60, width: self.contentView.frame.width, height: 17)
        text.textColor = .white
        text.font = UIFont(name: "Helvetica-Bold", size: 11)
      
        self.imageView = iconView
       
        self.textLabel = text
          self.contentView.addSubview(imageView)
        self.contentView.addSubview(textLabel)
        self.reset()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }

    func reset() {
        self.textLabel.textAlignment = .center
    }
}

class DockCell: UICollectionViewCell {

    static var identifier: String = "DockCell"

    weak var textLabel: UILabel!
    weak var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        let iconView = UIImageView()
        iconView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
       
        iconView.contentMode = .scaleAspectFill
        
        let text = UILabel()
        text.frame = CGRect(x: 0, y: 60, width: self.contentView.frame.width, height: 20)
        text.textColor = .white
        text.font = UIFont(name: "Helvetica-Bold", size: 11)
      
        self.imageView = iconView
       
        self.textLabel = text
          self.contentView.addSubview(imageView)
        self.contentView.addSubview(textLabel)
        self.reset()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }

    func reset() {
        self.textLabel.textAlignment = .center
    }
}

class Calendar: UICollectionViewCell {

    static var identifier: String = "Calendar"

    weak var textLabel: UILabel!
    weak var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let iconView = UIImageView()
        iconView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
       
        iconView.contentMode = .scaleAspectFill
        
        let weekdayLabel = UILabel()
        weekdayLabel.frame = CGRect(x: 0, y: 0, width: iconView.frame.width, height: 15)
        
        let weekFormatter = DateFormatter()
        weekFormatter.dateFormat = "EEEE"
        weekdayLabel.textAlignment = .center
        weekdayLabel.text = weekFormatter.string(from: Date())
        weekdayLabel.textColor = .white
       // weekdayLabel.shadowColor = .black
        weekdayLabel.font = UIFont(name: "Helvetica-Bold", size: 9)
        
        weekdayLabel.adjustsFontSizeToFitWidth = true
        weekdayLabel.minimumScaleFactor = 0.4
        
        let dayFormatter = DateFormatter()
            dayFormatter.dateFormat = "d"
        
        let dayLabel = UILabel()
        dayLabel.frame = CGRect(x: 0, y: 21, width: iconView.frame.width, height: 30)
        dayLabel.text = dayFormatter.string(from: Date())
        dayLabel.textColor = .black
        dayLabel.font = UIFont(name: "Helvetica-Bold", size: 40)
        dayLabel.textAlignment = .center
        iconView.addSubview(dayLabel)
        
        
        
        iconView.addSubview(weekdayLabel)
        
        let text = UILabel()
        text.frame = CGRect(x: 0, y: 60, width: self.contentView.frame.width, height: 17)
        text.textColor = .white
        text.font = UIFont(name: "Helvetica-Bold", size: 11)
      
        self.imageView = iconView
       
        self.textLabel = text
          self.contentView.addSubview(imageView)
        self.contentView.addSubview(textLabel)
        self.reset()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }

    func reset() {
        self.textLabel.textAlignment = .center
    }
}
