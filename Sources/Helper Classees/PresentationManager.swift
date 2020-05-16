import Foundation
import UIKit

public class PresentationManager: NSObject {
    
}


extension PresentationManager: UIViewControllerTransitioningDelegate {
    public func presentationController(
      forPresented presented: UIViewController,
      presenting: UIViewController?,
      source: UIViewController
    ) -> UIPresentationController? {
      let presentationController = PresentationController(
        presentedViewController: presented,
        presenting: presenting)
      return presentationController
    }
}
