import Foundation
import UIKit


public class PresentationController: UIPresentationController {
    
    override init(presentedViewController: UIViewController,
         presenting presentingViewController: UIViewController?) {

      super.init(presentedViewController: presentedViewController,
                 presenting: presentingViewController)
    }
    
    override public func size(forChildContentContainer container: UIContentContainer,
                       withParentContainerSize parentSize: CGSize) -> CGSize {
      
        return CGSize(width: 320, height: 467.5)
      
    }
    
    override public var frameOfPresentedViewInContainerView: CGRect {
      //1
      var frame: CGRect = .zero
      frame.size = size(forChildContentContainer: presentedViewController,
                        withParentContainerSize: containerView!.bounds.size)

      //2
        frame.origin = CGPoint(x: 65, y: 168.5)
        
        return frame
    }
    
}
