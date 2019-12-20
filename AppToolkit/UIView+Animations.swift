//
//  UIView+Animations.swift
//  AppToolkit
//
//  Created by Ilya Kuznetsov on 12/20/19.
//  Copyright © 2019 Ilya Kuznetsov. All rights reserved.
//

import UIKit

@objc public extension UIView {
    
    var imageRepresentation: UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func addFadeTransition() {
        addFadeTransition(duration: 0.15)
    }
    
    func addFadeTransition(duration: Double) {
        if layer.animation(forKey: "fade") != nil {
            return
        }
        let transition = CATransition()
        transition.type = .fade
        transition.duration = duration
        transition.fillMode = .both
        layer.add(transition, forKey: "fade")
    }
    
    func addPushTransition() {
        let transition = CATransition()
        transition.type = .push
        transition.subtype = .fromRight
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0, 0, 1)
        layer.add(transition, forKey: "transition")
    }
    
    func addPopTransition() {
        let transition = CATransition()
        transition.type = .push
        transition.subtype = .fromLeft
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0, 0, 1)
        layer.add(transition, forKey: "transition")
    }
    
    func addMoveOutTransition() {
        let transition = CATransition()
        transition.type = .moveIn
        transition.subtype = .fromLeft
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0, 0, 1)
        layer.add(transition, forKey: "transition")
    }
    
    func addPresentTransition() {
        let transition = CATransition()
        transition.type = .moveIn
        transition.subtype = .fromTop
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0, 0, 1)
        layer.add(transition, forKey: "transition")
    }
    
    func addDismissTransition() {
        let transition = CATransition()
        transition.type = .moveIn
        transition.subtype = .fromBottom
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0, 0, 1)
        layer.add(transition, forKey: "transition")
    }
}
