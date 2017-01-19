//
//  uiview.swift
//  KoombeaLoader
//
//  Created by Carlos Riascos on 1/16/17.
//  Copyright © 2017 Nelson Bolívar. All rights reserved.
//

import UIKit

extension UIView {
    
    func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = duration
        if let delegate = completionDelegate as! CAAnimationDelegate? {
            rotateAnimation.delegate = delegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
    
}
