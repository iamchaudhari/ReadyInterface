//
//  ViewUtils.swift
//  ReadyInterface
//
//  Created by Dhyanesh Chaudhari on 2017-11-16.
//  Copyright © 2017 iamchaudhari. All rights reserved.
//

import UIKit

class ViewUtils {
    
    init() {
    }
    
    static func drawShadowFor(view: UIView, size: CGFloat, color: UIColor, radius: CGFloat) {
        let shadowPath = UIBezierPath(rect: CGRect(x: -size / 2,
                                                   y: -size / 2,
                                                   width: view.frame.size.width + size,
                                                   height: view.frame.size.height + size))
        view.layer.masksToBounds = false
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view.layer.shadowOpacity = 1.0
        view.layer.shadowPath = shadowPath.cgPath
    }

}
