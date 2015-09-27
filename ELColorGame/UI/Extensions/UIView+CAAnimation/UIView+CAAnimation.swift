//
//  UIView+CAAnimation.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 27/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

public extension UIView {

    func addIncreaseSizeAnimation() {
        let keyFrame: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        keyFrame.values = [1.2]
        keyFrame.keyTimes = [1]
        keyFrame.removedOnCompletion = false
        keyFrame.fillMode = kCAFillModeForwards
        keyFrame.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
        self.layer.addAnimation(keyFrame, forKey: "transform.scale")
    }
    
    func addBounceAnimation() {
        let keyFrame: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        keyFrame.values = [0.25, 0.4, 1.3, 1.0]
        keyFrame.keyTimes = [0, 0.3, 0.75, 1]
        keyFrame.duration = 0.3
        keyFrame.removedOnCompletion = false
        keyFrame.fillMode = kCAFillModeForwards
        keyFrame.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
        self.layer.addAnimation(keyFrame, forKey: "transform.scale")
    }
    
    func addAppearAnimation() {
        let keyFrame: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        keyFrame.values = [0.0, 0.2, 0.5, 1.4, 1.0]
        keyFrame.keyTimes = [0, 0.3, 0.5, 0.75, 1]
        keyFrame.duration = 0.4
        keyFrame.removedOnCompletion = false
        keyFrame.fillMode = kCAFillModeForwards
        keyFrame.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
        self.layer.addAnimation(keyFrame, forKey: "transform.scale")
    }
}
