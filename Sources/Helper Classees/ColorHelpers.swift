import UIKit

public class Colors {
    var gl: CAGradientLayer
    var firstColor: CGColor
    var secondColor: CGColor
    var locations: [CGFloat]

    public init(firstColor: CGColor, secondColor: CGColor, locations: [CGFloat]) {
        
        self.firstColor = firstColor
        self.secondColor = secondColor
        self.locations = locations
        let colorTop = firstColor
        let colorBottom = secondColor

        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = locations as [NSNumber]
        
    }
}

public extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
