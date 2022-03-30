//
//  UIView+Extension.swift
//  EazyMart
//
//  Created by Mohammed Rishan on 28/03/22.
//

import Foundation
import UIKit

//Mark:- Extension used to add cornerRadius single side
extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    enum VerticalLocation: String {
        case bottom
        case top
    }
}
